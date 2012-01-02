From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 14:53:38 +0100
Subject: [Buildroot] [git commit] Add package for Gnome NetworkManager
Message-ID: <20120102135754.A11098FDD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e991961d4ef6282f5ace22eade80edc75a9c100b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though it's most commonly used on desktops, this piece of software
also works well on embedded devices.

The package file only resolved mandatory dependencies. Things like
iptables and dnsmasq are only required if 'shared' connections are used,
and have hence not been made hard prerequisites.

There are probably too many i18n related files installed to the target.
That might need some more tweaking.

[Peter: fix Kconfig dependencies, add execinfo patch, fix libgcrypt-config
        path, uClibc build fix]
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/network-manager/Config.in                  |   30 ++++++++++++
 package/network-manager/S45network-manager         |   46 ++++++++++++++++++
 .../network-manager/network-manager-execinfo.patch |   31 ++++++++++++
 package/network-manager/network-manager.mk         |   50 ++++++++++++++++++++
 5 files changed, 158 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b6df18a..dc12ad5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
+source "package/network-manager/Config.in"
 source "package/noip/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ngircd/Config.in"
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
new file mode 100644
index 0000000..6e51f53
--- /dev/null
+++ b/package/network-manager/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_NETWORK_MANAGER
+	bool "NetworkManager"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE # acl
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_UDEV
+	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_WIRELESS_TOOLS
+	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	help
+	  NetworkManager is a set of co-operative tools that make networking
+	  simple and straightforward. Whether WiFi, wired, 3G, or Bluetooth,
+	  NetworkManager allows you to quickly move from one network to
+	  another: once a network has been configured and joined once, it
+	  can be detected and re-joined automatically the next time it's
+	  available.
+
+	  http://projects.gnome.org/NetworkManager/
+
+comment "NetworkManager requires DBus and a toolchain with IPV6, LARGEFILE and WCHAR support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_PACKAGE_DBUS
+
diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
new file mode 100755
index 0000000..112aa66
--- /dev/null
+++ b/package/network-manager/S45network-manager
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+prefix=/usr
+exec_prefix=/usr
+sbindir=${exec_prefix}/sbin
+
+NETWORKMANAGER_BIN=${sbindir}/NetworkManager
+
+[ -x $NETWORKMANAGER_BIN ] || exit 0
+
+PID=`pidof -o %PPID NetworkManager`
+case "$1" in
+	start)
+		echo -n "Starting NetworkManager ... "
+		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
+		if [ -z "$PID" ]; then
+			$NETWORKMANAGER_BIN
+		fi
+		if [ ! -z "$PID" -o $? -gt 0 ]; then
+			echo "failed!"
+		else
+			echo "done."
+		fi
+		;;
+	stop)
+		echo -n "Stopping NetworkManager ... "
+			[ ! -z "$PID" ] && kill $PID &> /dev/null
+		if [ $? -gt 0 ]; then
+			echo "failed!"
+		else
+			echo "done."
+		fi
+		;;
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart|sleep|wake}"
+		;;
+esac
+exit 0
+
+
+
diff --git a/package/network-manager/network-manager-execinfo.patch b/package/network-manager/network-manager-execinfo.patch
new file mode 100644
index 0000000..8dc83f0
--- /dev/null
+++ b/package/network-manager/network-manager-execinfo.patch
@@ -0,0 +1,31 @@
+From ff9471b7d83545614100a270e2d85b7b272abe97 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 2 Jan 2012 14:45:16 +0100
+Subject: [PATCH] [PATCH] only include execinfo.h if crashtrace support is
+ enabled
+
+On systems without backtrace suport (E.G. uClibc depending on config),
+execinfo.h might not be available, breaking the build.
+
+Fix it by only including it if enabled.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/logging/nm-logging.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/src/logging/nm-logging.c b/src/logging/nm-logging.c
+index ca6a709..26c8670 100644
+--- a/src/logging/nm-logging.c
++++ b/src/logging/nm-logging.c
+@@ -23,7 +23,6 @@
+ 
+ #include <dlfcn.h>
+ #include <syslog.h>
+-#include <execinfo.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+-- 
+1.7.7.1
+
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
new file mode 100644
index 0000000..cfcf32c
--- /dev/null
+++ b/package/network-manager/network-manager.mk
@@ -0,0 +1,50 @@
+#############################################################
+#
+# NetworkManager
+#
+#############################################################
+NETWORK_MANAGER_VERSION = 0.9.2.0
+NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
+NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.9/
+NETWORK_MANAGER_INSTALL_STAGING = YES
+NETWORK_MANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl wireless_tools gnutls util-linux
+
+NETWORK_MANAGER_CONF_ENV = \
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+
+NETWORK_MANAGER_CONF_OPT = \
+		--mandir=$(STAGING_DIR)/usr/man/ \
+		--with-dbus-user=dbus \
+		--disable-tests \
+		--disable-more-warnings \
+		--without-docs \
+		--disable-gtk-doc \
+		--disable-asserts \
+		--enable-abstract-sockets \
+		--disable-selinux \
+		--disable-xml-docs \
+		--disable-doxygen-docs \
+		--disable-static \
+		--enable-dnotify \
+		--localstatedir=/var \
+		--with-crypto=gnutls \
+		--with-distro=arch \
+		--disable-ppp \
+		--with-iptables=/usr/sbin/iptables
+
+# uClibc by default doesn't have backtrace support, so don't use it
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+NETWORK_MANAGER_CONF_OPT += --disable-crashtrace
+endif
+
+# The target was built for the archlinux distribution, so we need
+# to move around things after installation
+define NETWORK_MANAGER_INSTALL_INITSCRIPT
+	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
+	rm -f $(TARGET_DIR)/etc/rc.d/networkmanager
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/rc.d
+endef
+
+NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_INSTALL_INITSCRIPT
+
+$(eval $(call AUTOTARGETS))
