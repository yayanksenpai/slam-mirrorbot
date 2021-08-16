if [[ -n $CONFIG_URL ]]; then
	wget -q $CONFIG_URL -O /usr/src/app/config.env
fi

gunicorn wserver:start_server --bind 0.0.0.0:$PORT --worker-class aiohttp.GunicornWebWorker & qbittorrent-nox -d --webui-port=8090 & python3 alive.py & ./aria.sh; python3 -m bot 
