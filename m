From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Aug 2014 00:03:51 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-userland: Fix vcfiled startup
In-Reply-To: <1407176456-13473-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176456-13473-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140804220351.GB6638@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benoit, All,

On 2014-08-04 20:20 +0200, Beno?t Th?baudeau spake thusly:
> The VideoCore file server daemon SysV startup script installed from this package
> is not compatible with BuildRoot (because of its naming and other Debian
> dependencies), which prevented vcfiled from starting. Hence, prevent this
> package from installing its vcfiled startup script, and install a vcfiled SysV
> startup script suitable for BuildRoot.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

In addition to Thomas' comments, here are mines:

> diff --git a/package/rpi-userland/S97vcfiled b/package/rpi-userland/S97vcfiled
> new file mode 100755
> index 0000000..87c4e76
> --- /dev/null
> +++ b/package/rpi-userland/S97vcfiled
> @@ -0,0 +1,100 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides:          vcfiled
> +# Required-Start:    udev
> +# Required-Stop:     udev
> +# Short-Description: VideoCore file server daemon
> +### END INIT INFO
> +
> +DESC="VideoCore file server daemon"
> +NAME=vcfiled
> +VCROOT=/usr
> +DAEMON=$VCROOT/sbin/$NAME
> +DAEMON_ARGS=""
> +PIDFILE=/var/run/$NAME/$NAME
> +SCRIPTNAME="$0"
> +
> +# Exit if the package is not installed
> +[ -x "$DAEMON" ] || exit 0
> +
> +# Read configuration variable file if it is present
> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
> +
> +#
> +# Function that starts the daemon/service
> +#
> +do_start()
> +{
> +	# Return
> +	#   0 if daemon has been started
> +	#   1 if daemon was already running
> +	#   2 if daemon could not be started
> +	start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON --test > /dev/null \
> +		&& return 1
> +	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
> +		$DAEMON_ARGS \
> +		|| return 2
> +}
> +
> +#
> +# Function that stops the daemon/service
> +#
> +do_stop()
> +{
> +	# Return
> +	#   0 if daemon has been stopped
> +	#   1 if daemon was already stopped
> +	#   2 if daemon could not be stopped
> +	#   other if a failure occurred
> +	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
> +	RETVAL="$?"
> +	[ "$RETVAL" = 2 ] && return 2
> +	start-stop-daemon --stop --quiet --oknodo --retry=0/30/KILL/5 --exec $DAEMON
> +	[ "$?" = 2 ] && return 2
> +	# Many daemons don't delete their pidfiles when they exit.
> +	rm -f $PIDFILE
> +	return "$RETVAL"
> +}
> +
> +case "$1" in
> +  start)
> +	echo -n "Starting $DESC $NAME: "
> +	do_start
> +	case "$?" in
> +		0|1) echo done ;;
> +		2) echo failed ;;
> +	esac
> +	;;
> +  stop)
> +	echo -n "Stopping $DESC $NAME: "
> +	do_stop
> +	case "$?" in
> +		0|1) echo done ;;
> +		2) echo failed ;;
> +	esac
> +	;;
> +  restart|force-reload)
> +	echo -n "Restarting $DESC $NAME: "
> +	do_stop
> +	case "$?" in
> +	  0|1)
> +		do_start
> +		case "$?" in
> +			0) echo done ;;
> +			1) echo stop ignored ;; # Old process is still running
> +			*) echo start failed ;; # Failed to start
> +		esac
> +		;;
> +	  *)
> +		# Failed to stop
> +		echo stop failed
> +		;;
> +	esac
> +	;;
> +  *)
> +	echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
> +	exit 3
> +	;;
> +esac
> +
> +:

Last line uneeded.

Also, I'd like to see a simpler script. There is no need to handle the
already-running case. There is nothing that will try to re-run the
daemon in the standard init scripts. For development, it's the user's
responsibility to stop-and-start the daemon.

Also, no need to handle the fail-to-stop case, we're gonna halt/reboot
anyway.

See for example: package/xbmc/S50xbmc

> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 717eab1..bdf4e91 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -13,7 +13,15 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
>  
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>  
> +define RPI_USERLAND_INSTALL_INIT_SYSV
> +    $(INSTALL) -m 0755 -D package/rpi-userland/S97vcfiled \

Lines should be tab-prefixed.

> +		$(TARGET_DIR)/etc/init.d/S97vcfiled
> +endef
> +
>  define RPI_USERLAND_POST_TARGET_CLEANUP
> +    rm -f $(TARGET_DIR)/etc/init.d/vcfiled
> +    rm -f $(TARGET_DIR)/usr/share/install/vcfiled
> +    rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/install

Ditto, tab-prefixed.

I'm not a fan of 'rmdir' (I got burnt by it long ago, and it still
hurts). But OK.

Regards,
Yann E. MORIN.

>      rm -Rf $(TARGET_DIR)/usr/src
>  endef
>  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
