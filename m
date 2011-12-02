From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Dec 2011 12:45:14 +0100
Subject: [Buildroot] [PATCH] Add package for Gnome NetworkManager
In-Reply-To: <1322824479-32767-1-git-send-email-zonque@gmail.com>
References: <1322824479-32767-1-git-send-email-zonque@gmail.com>
Message-ID: <CAAXf6LXtmLzOwzJybChwqK7Wj0Mg2M3RSXFjB4x2GePUBULgjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 2, 2011 at 12:14 PM, Daniel Mack <zonque@gmail.com> wrote:
> Even though it's most commonly used on Desktops, this piece of software
> also works well on embedded devices.
>
> The package file only resolved mandatory dependencies. Things like
> iptables and dnsmasq are only required if 'shared' connections are used,
> and have hence not been made hard prerequisites.
>
> There are probably too many i18n related files installed to the target.
> That might need some more tweaking.
>
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
> ?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/network-manager/Config.in ? ? ? ? ?| ? 22 +++++++++++++
> ?package/network-manager/S45network-manager | ? 46 ++++++++++++++++++++++++++++
> ?package/network-manager/network-manager.mk | ? 42 +++++++++++++++++++++++++
> ?4 files changed, 111 insertions(+), 0 deletions(-)
> ?create mode 100644 package/network-manager/Config.in
> ?create mode 100755 package/network-manager/S45network-manager
> ?create mode 100644 package/network-manager/network-manager.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 4b5e5d8..a781870 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -442,6 +442,7 @@ endif
> ?source "package/netplug/Config.in"
> ?source "package/netsnmp/Config.in"
> ?source "package/netstat-nat/Config.in"
> +source "package/network-manager/Config.in"
> ?source "package/noip/Config.in"
> ?source "package/nfs-utils/Config.in"
> ?source "package/ngircd/Config.in"
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> new file mode 100644
> index 0000000..c08d417
> --- /dev/null
> +++ b/package/network-manager/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_NETWORK_MANAGER
> + ? ? ? bool "NetworkManager"
> + ? ? ? depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_UDEV_ALL_EXTRAS && BR2_PACKAGE_WIRELESS_TOOLS_LIB
> + ? ? ? select BR2_PACKAGE_DBUS_GLIB
> + ? ? ? select BR2_PACKAGE_LIBNL
> + ? ? ? select BR2_PACKAGE_GNUTLS
> + ? ? ? select BR2_PACKAGE_LIBNL
> + ? ? ? select BR2_PACKAGE_UTIL_LINUX
> + ? ? ? select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> + ? ? ? help
> + ? ? ? ? NetworkManager is a set of co-operative tools that make networking
> + ? ? ? ? simple and straightforward. Whether WiFi, wired, 3G, or Bluetooth,
> + ? ? ? ? NetworkManager allows you to quickly move from one network to
> + ? ? ? ? another: once a network has been configured and joined once, it
> + ? ? ? ? can be detected and re-joined automatically the next time it's
> + ? ? ? ? available.
> +
> + ? ? ? ? http://projects.gnome.org/NetworkManager/
> +
> +comment "NetworkManager not available (need DBus, UDEV_ALL_EXTRAS and WIRELESS_TOOLS_LIB)"
> + ? ? ? depends on !BR2_PACKAGE_DBUS || !BR2_PACKAGE_UDEV_ALL_EXTRAS || !BR2_PACKAGE_WIRELESS_TOOLS_LIB
> +
> diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
> new file mode 100755
> index 0000000..112aa66
> --- /dev/null
> +++ b/package/network-manager/S45network-manager
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +
> +prefix=/usr
> +exec_prefix=/usr
> +sbindir=${exec_prefix}/sbin
> +
> +NETWORKMANAGER_BIN=${sbindir}/NetworkManager
> +
> +[ -x $NETWORKMANAGER_BIN ] || exit 0
> +
> +PID=`pidof -o %PPID NetworkManager`
> +case "$1" in
> + ? ? ? start)
> + ? ? ? ? ? ? ? echo -n "Starting NetworkManager ... "
> + ? ? ? ? ? ? ? [ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
> + ? ? ? ? ? ? ? if [ -z "$PID" ]; then
> + ? ? ? ? ? ? ? ? ? ? ? $NETWORKMANAGER_BIN
> + ? ? ? ? ? ? ? fi
> + ? ? ? ? ? ? ? if [ ! -z "$PID" -o $? -gt 0 ]; then
> + ? ? ? ? ? ? ? ? ? ? ? echo "failed!"
> + ? ? ? ? ? ? ? else
> + ? ? ? ? ? ? ? ? ? ? ? echo "done."
> + ? ? ? ? ? ? ? fi

Wouldn't it be more general if you test for non-equality instead of
for greater-than? You are now assuming that faulty return codes are
always positive, which may not be true on all platforms. Although this
code will probably work fine in all cases where buildroot is used, in
my opinion -ne 0 would be better.

> + ? ? ? ? ? ? ? ;;
> + ? ? ? stop)
> + ? ? ? ? ? ? ? echo -n "Stopping NetworkManager ... "
> + ? ? ? ? ? ? ? ? ? ? ? [ ! -z "$PID" ] && kill $PID &> /dev/null
> + ? ? ? ? ? ? ? if [ $? -gt 0 ]; then

Same here.

> + ? ? ? ? ? ? ? ? ? ? ? echo "failed!"
> + ? ? ? ? ? ? ? else
> + ? ? ? ? ? ? ? ? ? ? ? echo "done."
> + ? ? ? ? ? ? ? fi
> + ? ? ? ? ? ? ? ;;
> + ? ? ? restart)
> + ? ? ? ? ? ? ? $0 stop
> + ? ? ? ? ? ? ? sleep 1
> + ? ? ? ? ? ? ? $0 start
> + ? ? ? ? ? ? ? ;;
> + ? ? ? *)
> + ? ? ? ? ? ? ? echo "usage: $0 {start|stop|restart|sleep|wake}"
> + ? ? ? ? ? ? ? ;;
> +esac
> +exit 0
> +
> +
> +
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> new file mode 100644
> index 0000000..9fe6759
> --- /dev/null
> +++ b/package/network-manager/network-manager.mk
> @@ -0,0 +1,42 @@
> +#############################################################
> +#
> +# NetworkManager
> +#
> +#############################################################
> +NETWORK_MANAGER_VERSION = 0.9.2.0
> +NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
> +NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.9/
> +NETWORK_MANAGER_INSTALL_STAGING = YES
> +NETWORK_MANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl wireless_tools gnutls util-linux
> +
> +NETWORK_MANAGER_CONF_OPT = --program-prefix="" \
> + ? ? ? ? ? ? ? --mandir=$(STAGING_DIR)/usr/man/ \
> + ? ? ? ? ? ? ? --with-dbus-user=dbus \
> + ? ? ? ? ? ? ? --disable-tests \
> + ? ? ? ? ? ? ? --disable-more-warnings \
> + ? ? ? ? ? ? ? --without-docs \
> + ? ? ? ? ? ? ? --disable-gtk-doc \
> + ? ? ? ? ? ? ? --disable-asserts \
> + ? ? ? ? ? ? ? --enable-abstract-sockets \
> + ? ? ? ? ? ? ? --disable-selinux \
> + ? ? ? ? ? ? ? --disable-xml-docs \
> + ? ? ? ? ? ? ? --disable-doxygen-docs \
> + ? ? ? ? ? ? ? --disable-static \
> + ? ? ? ? ? ? ? --enable-dnotify \
> + ? ? ? ? ? ? ? --localstatedir=/var \
> + ? ? ? ? ? ? ? --with-crypto=gnutls \
> + ? ? ? ? ? ? ? --with-distro=arch \
> + ? ? ? ? ? ? ? --disable-ppp \
> + ? ? ? ? ? ? ? --with-iptables=/usr/sbin/iptables
> +
> +# The target was built for the archlinux distribution, so we need
> +# to move around things after installation
> +define NETWORK_MANAGER_INSTALL_INITSCRIPT
> + ? ? ? $(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
> + ? ? ? rm -f $(TARGET_DIR)/etc/rc.d/networkmanager
> + ? ? ? test -z "`ls -A $(TARGET_DIR)/etc/rc.d`" && rmdir $(TARGET_DIR)/etc/rc.d || echo ""

Why not simply attempt:
rmdir $(TARGET_DIR)/etc/rc.d 2>/dev/null

If the directory is empty, it will be removed.
If not empty, rmdir will not do anything.

On my rmdir, there is even an option: --ignore-fail-on-non-empty
If that is generic, you could do:
rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/rc.d

> +endef
> +
> +NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_INSTALL_INITSCRIPT
> +
> +$(eval $(call AUTOTARGETS,package,network-manager))

Since 2011.11, the extra arguments package,network-manager are no
longer needed and should be removed, thus:
$(eval $(call AUTOTARGETS))

Best regards,
Thomas
