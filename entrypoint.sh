if [ "$VER = "latest" ]; then
  cd /v2raybin
  ADD https://storage.googleapis.com/v2ray-docker/v2ray /v2raybin
  ADD https://storage.googleapis.com/v2ray-docker/v2ctl /v2raybin
  ADD https://storage.googleapis.com/v2ray-docker/geoip.dat /v2raybin
  ADD https://storage.googleapis.com/v2ray-docker/geosite.dat /v2raybin
else
  wget -O v2ray.zip http://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
  unzip v2ray.zip 
  cd /v2raybin/v2ray-v$VER-linux-64
fi
chmod +x v2ray
chmod +x v2ctl

echo -e -n "$CONFIG_JSON1" > config.json
echo -e -n "$PORT" >> config.json
echo -e -n "$CONFIG_JSON2" >> config.json
echo -e -n "$UUID" >> config.json
echo -e -n "$CONFIG_JSON3" >> config.json

./v2ray
