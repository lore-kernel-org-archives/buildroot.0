From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 15:57:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add
 sysv init script
In-Reply-To: <20170429205643.24646-1-bernd.kuhls@t-online.de>
References: <20170429205643.24646-1-bernd.kuhls@t-online.de>
Message-ID: <a5a51608-dccb-64bb-fe7d-ba38f61bfee3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-04-17 22:56, Bernd Kuhls wrote:
> We need ":0.0 vt01" to make sure Xorg finds the correct terminal.
> 
> Quoting https://www.x.org/archive/X11R6.8.0/doc/Xorg.1.html
> 
> -allowMouseOpenFail
>     Allow the server to start up even if the mouse device can't be
>     opened or initialised.
> 
> We need this option in case BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE was
> not enabled.
> 
> -noreset
>     prevents a server reset when the last client connection is closed.
> 
> We need this option to prevent auto-close of Xorg.
> 
> Tested with a qemu image and Kodi.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master with a few comments in the script, thanks.

 Regards,
 Arnout

> ---
>  package/x11r7/xserver_xorg-server/S40xorg          | 39 ++++++++++++++++++++++
>  .../xserver_xorg-server/xserver_xorg-server.mk     |  5 +++
>  2 files changed, 44 insertions(+)
>  create mode 100755 package/x11r7/xserver_xorg-server/S40xorg
> 
> diff --git a/package/x11r7/xserver_xorg-server/S40xorg b/package/x11r7/xserver_xorg-server/S40xorg
> new file mode 100755
> index 000000000..4299ed4cd
> --- /dev/null
> +++ b/package/x11r7/xserver_xorg-server/S40xorg
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +#
> +# Starts Xorg
> +#
> +
> +BIN=/usr/bin/Xorg
> +XORG_ARGS=":0.0 vt01 -s 0 -noreset -allowMouseOpenFail"
> +PIDFILE=/var/run/xorg.pid
> +
> +start() {
> +	printf "Starting Xorg: "
> +	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XORG_ARGS
> +	[ $? = 0 ] && sleep 3 && echo "OK" || echo "FAIL"
> +}
> +stop() {
> +	printf "Stopping Xorg: "
> +	start-stop-daemon -K -q -p $PIDFILE
> +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +restart() {
> +	stop
> +	sleep 2
> +	start
> +}
> +
> +case "$1" in
> +	start)
> +		start
> +	;;
> +	stop)
> +		stop
> +	;;
> +	restart|reload)
> +		restart
> +	;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart}"
> +	exit 1
> +esac
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index 306e9d03e..072819cb9 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -258,4 +258,9 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
>  XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
>  endif
>  
> +define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
> +		$(TARGET_DIR)/etc/init.d/S40xorg
> +endef
> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
