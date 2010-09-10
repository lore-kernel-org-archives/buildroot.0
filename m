From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 10 Sep 2010 07:07:36 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <1284064132-21384-2-git-send-email-marcus.osdoba@googlemail.com>
References: <1284064132-21384-1-git-send-email-marcus.osdoba@googlemail.com>
	<1284064132-21384-2-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <AANLkTinKvq=qae=abuVaRh_hAnENe4RA_U0Ti+BupCwO@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be honest I post patch for transmission 4 months ago and also
splashy package month ago
and the're still not in the release. Why?

On Thu, Sep 9, 2010 at 10:28 PM, Marcus Osdoba
<marcus.osdoba@googlemail.com> wrote:
> introduces version 2.04 of transmission,
> it has an excellent web interface which runs on port 9091 per default,
> the patch provides two options, enable cli and/or remote component
>
> the work is based on the patch from Kelvin Cheung
>
> Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
> ---
> ?fs/skeleton/var/transmission ? ? ? ? | ? ?1 +
> ?package/Config.in ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/transmission/Config.in ? ? ? | ? 23 +++++++++
> ?package/transmission/S92transmission | ? 88 ++++++++++++++++++++++++++++++++++
> ?package/transmission/transmission.mk | ? 32 ++++++++++++
> ?5 files changed, 145 insertions(+), 0 deletions(-)
> ?create mode 120000 fs/skeleton/var/transmission
> ?create mode 100755 package/transmission/Config.in
> ?create mode 100755 package/transmission/S92transmission
> ?create mode 100644 package/transmission/transmission.mk
>
> diff --git a/fs/skeleton/var/transmission b/fs/skeleton/var/transmission
> new file mode 120000
> index 0000000..1431b0e
> --- /dev/null
> +++ b/fs/skeleton/var/transmission
> @@ -0,0 +1 @@
> +../tmp
> \ No newline at end of file
> diff --git a/package/Config.in b/package/Config.in
> index d60d8ef..17386ad 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -427,6 +427,7 @@ source "package/thttpd/Config.in"
> ?source "package/tinyhttpd/Config.in"
> ?endif
> ?source "package/tn5250/Config.in"
> +source "package/transmission/Config.in"
> ?source "package/ttcp/Config.in"
> ?source "package/udpcast/Config.in"
> ?source "package/vpnc/Config.in"
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> new file mode 100755
> index 0000000..49f618f
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
> + ? ? ? default yes
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
> index 0000000..71d4b43
> --- /dev/null
> +++ b/package/transmission/transmission.mk
> @@ -0,0 +1,32 @@
> +#############################################################
> +#
> +# transmission
> +#
> +#############################################################
> +#
> +#
> +TRANSMISSION_VERSION=2.04
> +TRANSMISSION_SOURCE=transmission-$(TRANSMISSION_VERSION).tar.bz2
> +TRANSMISSION_SITE=http://mirrors.m0k.org/transmission/files/
> +TRANSMISSION_LIBTOOL_PATCH=NO
> +TRANSMISSION_DEPENDENCIES= host-pkg-config host-intltool zlib openssl libcurl libevent
> +
> +TRANSMISSION_CONF_OPT = --prefix=/usr \
> + ? ? ? ? ? ? ? ? ? ? ? --localstatedir=/var/transmission \
> + ? ? ? ? ? ? ? ? ? ? ? --disable-gtk \
> + ? ? ? ? ? ? ? ? ? ? ? --disable-libnotify \
> + ? ? ? ? ? ? ? ? ? ? ? --enable-daemon \
> + ? ? ? ? ? ? ? ? ? ? ? --with-zlib=$(STAGING_DIR) \
> + ? ? ? ? ? ? ? ? ? ? ? $(DISABLE_NLS) \
> + ? ? ? ? ? ? ? ? ? ? ? $(DISABLE_LARGEFILE)
> +
> +ifneq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
> +TRANSMISSION_CONF_OPT += --disable-cli
> +endif
> +
> +ifneq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
> +TRANSMISSION_CONF_OPT += --disable-remote
> +endif
> +
> +
> +$(eval $(call AUTOTARGETS,package,transmission))
> --
> 1.7.1
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
