From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 18 Jul 2016 23:44:46 +0200
Subject: [Buildroot] [PATCH v2] igd2-for-linux: new package
In-Reply-To: <1468855834-18053-1-git-send-email-fabrice.fontaine@orange.com>
References: <1468855834-18053-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <95a6b897-ea3e-9da2-115f-3beb5712f7d9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Thanks for this new version.

Le 18/07/2016 ? 17:30, Fabrice Fontaine a ?crit :
> This is The Linux UPnP Internet Gateway Device 2. It is
> modified from the original Linux UPnP Internet Gateway Device
> [http://linux-igd.sourceforge.net/] according to UPnP
> InternetGatewayDevice:2 specifications.
> 
> It implements the UPnP Internet Gateway Device version 2
> specification (IGDv2) and allows UPnP aware clients, such as
> MSN Messenger, Azureus or Miranda to work properly from behind
> a NAT firewall.
> 
> Please edit /etc/upnpd.conf before using upnpd!
> 
> https://github.com/ffontaine/igd2-for-linux
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v1 -> v2 (after review of Romain Naour):
>  - Do not use HAVE_LIBIPTC as it doesn't work with musl toolchain due to
>    mixed userspace and kernel headers and some undeclared
>    IPPROTO_TCP/IPPROTO_UDP variables. libiptc is not a public and stable
>    API for iptables: 
>    http://www.netfilter.org/documentation/FAQ/netfilter-faq-4.html

Indeed, the build for musl toolchain is "fixed".

> 
>  package/Config.in                          |  1 +
>  package/igd2-for-linux/Config.in           | 25 ++++++++++++++
>  package/igd2-for-linux/S99upnpd            | 42 +++++++++++++++++++++++
>  package/igd2-for-linux/igd2-for-linux.hash |  2 ++
>  package/igd2-for-linux/igd2-for-linux.mk   | 53 ++++++++++++++++++++++++++++++
>  package/igd2-for-linux/upnpd.service       | 12 +++++++
>  6 files changed, 135 insertions(+)
>  create mode 100644 package/igd2-for-linux/Config.in
>  create mode 100644 package/igd2-for-linux/S99upnpd
>  create mode 100644 package/igd2-for-linux/igd2-for-linux.hash
>  create mode 100644 package/igd2-for-linux/igd2-for-linux.mk
>  create mode 100644 package/igd2-for-linux/upnpd.service
> 
> diff --git a/package/Config.in b/package/Config.in
> index f86e1ef..8062437 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1443,6 +1443,7 @@ menu "Networking applications"
>  	source "package/ifplugd/Config.in"
>  	source "package/iftop/Config.in"
>  	source "package/ifupdown/Config.in"
> +	source "package/igd2-for-linux/Config.in"
>  	source "package/igh-ethercat/Config.in"
>  	source "package/igmpproxy/Config.in"
>  	source "package/inadyn/Config.in"
> diff --git a/package/igd2-for-linux/Config.in b/package/igd2-for-linux/Config.in
> new file mode 100644
> index 0000000..9022536
> --- /dev/null
> +++ b/package/igd2-for-linux/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_IGD2_FOR_LINUX
> +	bool "igd2-for-linux"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_IPTABLES # runtime
> +	select BR2_PACKAGE_LIBUPNP
> +	help
> +	  This is The Linux UPnP Internet Gateway Device 2. It is
> +	  modified from the original Linux UPnP Internet Gateway Device
> +	  [http://linux-igd.sourceforge.net/] according to UPnP
> +	  InternetGatewayDevice:2 specifications.
> +
> +	  It implements the UPnP Internet Gateway Device version 2
> +	  specification (IGDv2) and allows UPnP aware clients, such as
> +	  MSN Messenger, Azureus or Miranda to work properly from behind
> +	  a NAT firewall.
> +
> +	  Please edit /etc/upnpd.conf before using upnpd!
> +
> +	  https://github.com/ffontaine/igd2-for-linux
> +
> +comment "igd2-for-linux needs a toolchain w/ threads and wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> diff --git a/package/igd2-for-linux/S99upnpd b/package/igd2-for-linux/S99upnpd
> new file mode 100644
> index 0000000..3a5b20a
> --- /dev/null
> +++ b/package/igd2-for-linux/S99upnpd
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +NAME=upnpd
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON=/usr/sbin/$NAME
> +LAN=eth0
> +WAN=eth0
> +DAEMON_ARGS="-f $WAN $LAN"
> +
> +start() {
> +	printf "Starting $NAME: "
> +	route add -net 239.0.0.0 netmask 255.0.0.0 $LAN
> +	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
> +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +stop() {
> +	printf "Stopping $NAME: "
> +	start-stop-daemon -K -q -p $PIDFILE
> +	route del -net 239.0.0.0 netmask 255.0.0.0 $LAN
> +	[ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +restart() {
> +	stop
> +	start
> +}
> +
> +case "$1" in
> +  start)
> +	start
> +	;;
> +  stop)
> +	stop
> +	;;
> +  restart|reload)
> +	restart
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart|reload}"
> +	exit 1
> +esac
> +
> +exit $?
> diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
> new file mode 100644
> index 0000000..a46fe5f
> --- /dev/null
> +++ b/package/igd2-for-linux/igd2-for-linux.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	a8edc4c14aa104dcffa79d1f3057b8b9c5cef0f8f43901f61e306120a4efe01f	igd2-for-linux-v1.1.tar.gz
> diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
> new file mode 100644
> index 0000000..2e4d987
> --- /dev/null
> +++ b/package/igd2-for-linux/igd2-for-linux.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# igd2-for-linux
> +#
> +################################################################################
> +
> +IGD2_FOR_LINUX_VERSION = v1.1
> +IGD2_FOR_LINUX_SITE = \
> +	$(call github,ffontaine,igd2-for-linux,$(IGD2_FOR_LINUX_VERSION))
> +
> +IGD2_FOR_LINUX_LICENSE = GPLv2
> +IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE
> +
> +IGD2_FOR_LINUX_DEPENDENCIES = iptables libupnp

Since iptables is a runtime dependency, it should be removed from
IGD2_FOR_LINUX_DEPENDENCIES

> +
> +IGD2_FOR_LINUX_BUILD_DIR = $(@D)/linuxigd2
> +
> +define IGD2_FOR_LINUX_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(IGD2_FOR_LINUX_BUILD_DIR) \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	BINDIR="/usr/sbin" \
> +	MANDIR="/usr/man" \

It seems you missed some comments on the previous review.
http://lists.busybox.net/pipermail/buildroot/2016-July/167777.html

> +	LIBUPNP_PREFIX="$(STAGING_DIR)/usr" \
> +	all
> +endef
> +
> +define IGD2_FOR_LINUX_INSTALL_TARGET_CMDS
> +        $(INSTALL) -m 0755 $(IGD2_FOR_LINUX_BUILD_DIR)/bin/upnpd \
> +		$(TARGET_DIR)/usr/sbin/

same here

Best regards,
Romain


> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/linuxigd
> +	$(INSTALL) -m 0644 $(IGD2_FOR_LINUX_BUILD_DIR)/configs/*.png \
> +		$(TARGET_DIR)/etc/linuxigd/
> +	$(INSTALL) -m 0644 $(IGD2_FOR_LINUX_BUILD_DIR)/configs/*.xml \
> +		$(TARGET_DIR)/etc/linuxigd/
> +	$(INSTALL) -m 0644 $(IGD2_FOR_LINUX_BUILD_DIR)/configs/upnpd.conf \
> +		$(TARGET_DIR)/etc/
> +endef
> +
> +define IGD2_FOR_LINUX_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/igd2-for-linux/S99upnpd \
> +		$(TARGET_DIR)/etc/init.d/S99upnpd
> +endef
> +
> +define IGD2_FOR_LINUX_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 package/domoticz/upnpd.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/upnpd.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -sf ../../../../usr/lib/systemd/system/upnpd.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upnpd.service
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/igd2-for-linux/upnpd.service b/package/igd2-for-linux/upnpd.service
> new file mode 100644
> index 0000000..479f5b2
> --- /dev/null
> +++ b/package/igd2-for-linux/upnpd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=UPnP Internet Gateway Device version 2 daemon
> +After=network.target
> +
> +[Service]
> +ExecStartPre=/sbin/route add -net 239.0.0.0 netmask 255.0.0.0 eth0
> +ExecStart=/usr/sbin/upnpd -f eth0 eth0
> +Restart=always
> +ExecStopPost=/sbin/route del -net 239.0.0.0 netmask 255.0.0.0 eth0
> +
> +[Install]
> +WantedBy=multi-user.target
> 
