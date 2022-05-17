#!/usr/bin/env bash
## INFO: https://docs.docker.com/engine/install/ubuntu/

set -euf -o pipefail

DOCKER_USER=ubuntu

# Install dependencies : 패키지 인덱스를 업데이트하고 apt패키지를 설치
sudo apt-get update && sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add Docker’s official GPG key : Docker의 공식 GPG 키 추가 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository : 저장소 설정
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker CE : 도커 엔진 설치 (apt 패키지 인덱스를 업데이트 하고 최신 버전의 Docker Engine, containerd를 설치)
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Use Docker without root
sudo usermod -aG docker $DOCKER_USER
