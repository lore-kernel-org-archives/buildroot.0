From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 19:33:51 +0200
Subject: [Buildroot] [PATCH v2 3/3] rpi-userland: Fix vcfiled startup
In-Reply-To: <1407332350-27220-3-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407332350-27220-3-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140806173351.GF3891@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benoit, All,

On 2014-08-06 15:39 +0200, Beno?t Th?baudeau spake thusly:
> The VideoCore file server daemon startup script installed from this package is
> not compatible with BuildRoot (because of its naming and other Debian
> dependencies), which prevented vcfiled from starting. Hence, prevent this
> package from installing its vcfiled startup script, and install a vcfiled SysV
> init script suitable for BuildRoot.

I'm not sure I would be happy that the GPU is allowed uncontrolled
access to the filesystem.

Please, make this an option, defaulting to 'n', so the user can
willingly choose to install it or not.

Otherwise, see below...

> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
[--SNIP--]
> diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
> new file mode 100755
> index 0000000..25a0fcd
> --- /dev/null
> +++ b/package/rpi-userland/S94vcfiled
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +
> +NAME=vcfiled
> +DESC="VideoCore file server daemon $NAME"
> +DAEMON="/usr/sbin/$NAME"
> +DAEMON_ARGS=""
> +CFGFILE="/etc/default/$NAME"
> +PIDFILE="/var/run/$NAME/$NAME"

Are you sure about the path to the PID file?
What about:
    PIDFILE="/var/run/$NAME.pid"

Othwerwise, looks good after a casual look. Ditto your previous patches,
I'll try to find some time tonight to test it.

Regards,
Yann E. MORIN.

> +# Read configuration variable file if it is present
> +[ -r "$CFGFILE" ] && . "$CFGFILE"
> +
> +do_start()
> +{
> +	echo -n "Starting $DESC: "
> +	start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS &&
> +			echo "done" || echo "failed"
> +}
> +
> +do_stop()
> +{
> +	echo -n "Stopping $DESC: "
> +	if start-stop-daemon -K -q -R TERM/30/KILL/5 -p "$PIDFILE" -n "$NAME"; then
> +		# This daemon does not remove its PID file when it exits.
> +		rm -f "$PIDFILE"
> +		echo "done"
> +	else
> +		echo "failed"
> +	fi
> +}
> +
> +case "$1" in
> +	start)
> +		do_start
> +		;;
> +	stop)
> +		do_stop
> +		;;
> +	restart|reload)
> +		do_stop
> +		do_start
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}" >&2
> +		exit 1
> +		;;
> +esac
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 81ed95c..0d29f24 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -13,7 +13,15 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
>  
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>  
> +define RPI_USERLAND_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/rpi-userland/S94vcfiled \
> +			$(TARGET_DIR)/etc/init.d/S94vcfiled
> +endef
> +
>  define RPI_USERLAND_POST_TARGET_CLEANUP
> +	rm -f $(TARGET_DIR)/etc/init.d/vcfiled
> +	rm -f $(TARGET_DIR)/usr/share/install/vcfiled
> +	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/install
>  	rm -Rf $(TARGET_DIR)/usr/src
>  endef
>  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
