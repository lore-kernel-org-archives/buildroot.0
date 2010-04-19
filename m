From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 19 Apr 2010 13:58:32 +0200
Subject: [Buildroot] [PATCH] transmission: convert to autotools
	infrastructure
In-Reply-To: <1271671416-756-1-git-send-email-keguang.zhang@gmail.com>
References: <1271671416-756-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <r2ve7c6a05e1004190458u531e7305p55ac3694a562c1ee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 19, 2010 at 12:03 PM,  <keguang.zhang@gmail.com> wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
> ?package/Config.in ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/transmission/Config.in ? ? ? | ? 23 +++++++++
> ?package/transmission/S92transmission | ? 88 ++++++++++++++++++++++++++++++++++
> ?package/transmission/transmission.mk | ? 22 ++++++++
> ?4 files changed, 134 insertions(+), 0 deletions(-)
> ?create mode 100755 package/transmission/Config.in
> ?create mode 100755 package/transmission/S92transmission
> ?create mode 100644 package/transmission/transmission.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 6104903..5fa3b26 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -413,6 +413,7 @@ source "package/thttpd/Config.in"
> ?source "package/tinyhttpd/Config.in"
> ?endif
> ?source "package/tn5250/Config.in"
> +source "package/transmission/Config.in"
> ?source "package/ttcp/Config.in"
> ?source "package/udpcast/Config.in"
> ?source "package/vpnc/Config.in"
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> new file mode 100755
> index 0000000..f42c79d
> --- /dev/null
> +++ b/package/transmission/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_TRANSMISSION
> + ? ? ? bool "transmission"
> + ? ? ? select BR2_PACKAGE_ZLIB
> + ? ? ? select BR2_PACKAGE_OPENSSL
> + ? ? ? select BR2_PACKAGE_LIBCURL
> + ? ? ? select BR2_PACKAGE_LIBEVENT
> + ? ? ? default n
> + ? ? ? help
> + ? ? ? ? transmission - Transmission BitTorrent Client
> +
> +config BR2_PACKAGE_TRANSMISSION_CLI
> + ? ? ? bool "transmissioncli"
> + ? ? ? depends on BR2_PACKAGE_TRANSMISSION
> + ? ? ? default no
> + ? ? ? help
> + ? ? ? ? Install transmission command line interface.
> +
> +config BR2_PACKAGE_TRANSMISSION_REMOTE
> + ? ? ? bool "transmission-remote"
> + ? ? ? depends on BR2_PACKAGE_TRANSMISSION
> + ? ? ? default no
> + ? ? ? help
> + ? ? ? ? Install transmission remote management tool.
> diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
> new file mode 100755
> index 0000000..9c15aae
> --- /dev/null
> +++ b/package/transmission/S92transmission
> @@ -0,0 +1,88 @@
> +#!/bin/sh
> +if [ ! -z "$2" ]; then
> + ? ? ? TRANSMISSION_ARGS="$2"
> +else
> + ? ? ? TRANSMISSION_ARGS=""
> +fi
> +
> +if [ ! -z "$3" ]; then
> + ? ? ? NET_INTERFACE="$3"
> +else
> + ? ? ? NET_INTERFACE=""
> +fi
> +
> +DESC="bittorrent client"
> +NAME=transmission-daemon
> +DAEMON=$(which $NAME)
> +SCRIPTNAME=/etc/init.d/$0
> +
> +[ -x "$DAEMON" ] || exit 0
> +
> +do_start()
> +{
> + ? ? ? if [ ! -z "$NET_INTERFACE" ]; then
> + ? ? ? ? ? ? ? # poll network interface
> + ? ? ? ? ? ? ? IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
> + ? ? ? ? ? ? ? IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
> + ? ? ? ? ? ? ? while [ -z "$IP_ADDR" ]
> + ? ? ? ? ? ? ? do
> + ? ? ? ? ? ? ? ? ? ? ? sleep 5
> + ? ? ? ? ? ? ? ? ? ? ? IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
> + ? ? ? ? ? ? ? ? ? ? ? IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
> + ? ? ? ? ? ? ? done
> + ? ? ? fi
> + ? ? ? if [ -z "$TRANSMISSION_ARGS" ]; then
> + ? ? ? ? ? ? ? start-stop-daemon -S -b -x ${DAEMON}
> + ? ? ? else
> + ? ? ? ? ? ? ? start-stop-daemon -S -b -x ${DAEMON} -- ${TRANSMISSION_ARGS}
> + ? ? ? fi
> + ? ? ? return $?
> +}
> +
> +do_stop()
> +{
> + ? ? ? start-stop-daemon -K -b -x ${DAEMON}
> + ? ? ? return $?
> +}
> +
> +case "$1" in
> + ? ? ? start)
> + ? ? ? ? ? ? ? echo "Starting $DESC" "$NAME..."
> + ? ? ? ? ? ? ? do_start
> + ? ? ? ? ? ? ? case "$?" in
> + ? ? ? ? ? ? ? ? ? ? ? 0) echo " ? Start $DESC $NAME: SUCCESS" ;;
> + ? ? ? ? ? ? ? ? ? ? ? *)
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? echo " ? Start $DESC $NAME: FAILED"
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? exit 3
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ;;
> + ? ? ? ? ? ? ? esac
> + ? ? ? ? ? ? ? ;;
> + ? ? ? stop)
> + ? ? ? ? ? ? ? echo "Stopping $DESC $NAME..."
> + ? ? ? ? ? ? ? do_stop
> + ? ? ? ? ? ? ? case "$?" in
> + ? ? ? ? ? ? ? ? ? ? ? 0) echo " ? Stop $DESC $NAME: SUCCESS" ;;
> + ? ? ? ? ? ? ? ? ? ? ? *)
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? echo " ? Stop $DESC $NAME: FAILED"
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? exit 3
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ;;
> + ? ? ? ? ? ? ? esac
> + ? ? ? ? ? ? ? ;;
> + ? ? ? restart|force-reload)
> + ? ? ? ? ? ? ? echo "Restarting $DESC $NAME..."
> + ? ? ? ? ? ? ? do_stop
> + ? ? ? ? ? ? ? sleep 2
> + ? ? ? ? ? ? ? do_start
> + ? ? ? ? ? ? ? case "$?" in
> + ? ? ? ? ? ? ? ? ? ? ? 0) echo " ? Restart $DESC $NAME: SUCCESS" ;;
> + ? ? ? ? ? ? ? ? ? ? ? *)
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? echo " ? Restart $DESC $NAME: FAILED: couldn't start $NAME"
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? exit 3
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ;;
> + ? ? ? ? ? ? ? esac
> + ? ? ? ? ? ? ? ;;
> + ? ? ? *)
> + ? ? ? ? ? ? ? echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
> + ? ? ? ? ? ? ? exit 3
> + ? ? ? ? ? ? ? ;;
> +esac
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> new file mode 100644
> index 0000000..2dc0d04
> --- /dev/null
> +++ b/package/transmission/transmission.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# transmission
> +#
> +#############################################################
> +TRANSMISSION_VERSION:=1.92
> +TRANSMISSION_SOURCE:=transmission-$(TRANSMISSION_VERSION).tar.bz2
> +TRANSMISSION_SITE:=http://mirrors.m0k.org/transmission/files/
> +TRANSMISSION_LIBTOOL_PATCH=NO
> +TRANSMISSION_DEPENDENCIES:= host-pkg-config host-intltool zlib openssl libcurl libevent
> +
> +TRANSMISSION_CONF_OPT = --prefix=/usr \
> + ? ? ? ? ? ? ? ? ? ? ? --localstatedir=/var \
> + ? ? ? ? ? ? ? ? ? ? ? --disable-gtk \
> + ? ? ? ? ? ? ? ? ? ? ? --disable-libnotify \
> + ? ? ? ? ? ? ? ? ? ? ? --enable-cli \
> + ? ? ? ? ? ? ? ? ? ? ? --enable-daemon \
> + ? ? ? ? ? ? ? ? ? ? ? --with-zlib=$(STAGING_DIR) \
> + ? ? ? ? ? ? ? ? ? ? ? $(DISABLE_NLS) \
> + ? ? ? ? ? ? ? ? ? ? ? $(DISABLE_LARGEFILE)
> +
> +$(eval $(call AUTOTARGETS,package,transmission))

Extend for copying init script to /etc/init.d:

+$(TRANSMISSION_HOOK_POST_INSTALL):
+	 $(call MESSAGE,"Post installing")
+
+	# install start/stop script
+	@if [ ! -f $(TARGET_DIR)/etc/init.d/S92transmission ]; then \
+		$(INSTALL) -m 0755 -D package/transmission/S92transmission
$(TARGET_DIR)/etc/init.d/S92transmission; \
+	fi
+	$(Q)touch $@

> --
> 1.6.3.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
