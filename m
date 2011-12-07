From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Dec 2011 16:52:30 +0100
Subject: [Buildroot] [git commit] Add package connman
Message-ID: <20111207193831.D40EA8F76A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96c8f0b2165b476feac7d8598002dd27759207fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ConnMan project provides a daemon for managing internet connections
within embedded devices running the Linux operating system. The
Connection Manager is designed to be slim and to use as few resources as
possible, so it can be easily integrated. It is a fully modular system
that can be extended, through plug-ins, to support all kinds of wired or
wireless technologies. Also, configuration methods, like DHCP and domain
name resolving, are implemented using plug-ins. The plug-in approach
allows for easy adaption and modification for various use cases.

The location for released tarballs is still unavailable due to the
recent kernel.org outage, hence the package obtains the sources from git
for now.

[Peter: Ensure it can only be selected with workable toolchains,
	use start-stop-daemon in initscript, and install cm if selected]
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/connman/Config.in  |   47 ++++++++++++++++++++++++++++++++++++++++++++
 package/connman/S45connman |   22 ++++++++++++++++++++
 package/connman/connman.mk |   39 ++++++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cc26f20..e949649 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
+source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cifs-utils/Config.in"
 source "package/cups/Config.in"
diff --git a/package/connman/Config.in b/package/connman/Config.in
new file mode 100644
index 0000000..237c30e
--- /dev/null
+++ b/package/connman/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_CONNMAN
+	bool "connman"
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IPTABLES
+	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc
+	help
+	  The Connection Manager (ConnMan) project provides a daemon for
+	  managing internet connections within embedded devices running
+	  the Linux operating system.
+
+	  For more information, see http://connman.net/
+
+if BR2_PACKAGE_CONNMAN
+
+config BR2_PACKAGE_CONNMAN_THREADS
+	bool "enable threading support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	default y
+
+config BR2_PACKAGE_CONNMAN_ETHERNET
+	bool "enable Ethernet support"
+	default y
+
+config BR2_PACKAGE_CONNMAN_WIFI
+	bool "enable WiFi support"
+	select BR2_PACKAGE_WPA_SUPPLICANT
+
+config BR2_PACKAGE_CONNMAN_BLUETOOTH
+	bool "enable Bluetooth support"
+
+config BR2_PACKAGE_CONNMAN_LOOPBACK
+	bool "enable loopback support"
+
+config BR2_PACKAGE_CONNMAN_NTPD
+	bool "enable ntpd support"
+
+config BR2_PACKAGE_CONNMAN_DEBUG
+	bool "enable compiling with debugging information"
+
+config BR2_PACKAGE_CONNMAN_CLIENT
+	bool "enable command line client"
+
+endif # BR2_PACKAGE_CONNMAN
+
+comment "connman needs DBus enabled and a toolchain with resolver support"
+	depends on !BR2_PACKAGE_DBUS || !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_eglibc)
diff --git a/package/connman/S45connman b/package/connman/S45connman
new file mode 100755
index 0000000..a8afd68
--- /dev/null
+++ b/package/connman/S45connman
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting connman ... "
+		start-stop-daemon -S -q -m -b -p /var/run/connmand.pid --exec /usr/sbin/connmand -- -n
+		echo "done."
+		;;
+	stop)
+		echo -n "Stopping connman ..."
+		start-stop-daemon -K -q -p /var/run/connmand.pid
+		echo "done."
+		;;
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
new file mode 100644
index 0000000..6b9bbe6
--- /dev/null
+++ b/package/connman/connman.mk
@@ -0,0 +1,39 @@
+#######################################################
+#
+# connman - open source connection manager
+#
+#######################################################
+
+CONNMAN_VERSION = 0.78
+CONNMAN_SITE = git://git.kernel.org/pub/scm/network/connman/connman.git
+CONNMAN_DEPENDENCIES = libglib2 dbus iptables
+CONNMAN_INSTALL_STAGING = YES
+CONNMAN_CONF_OPT += --localstatedir=/var \
+	$(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)		\
+	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
+	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
+	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
+	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
+	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
+	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)
+
+# as long as sources are obtained from git, we need to generate the autofoo stuff
+CONNMAN_AUTORECONF = YES
+
+define CONNMAN_INSTALL_INITSCRIPT
+	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
+endef
+
+CONNMAN_POST_INSTALL_TARGET_HOOKS = CONNMAN_INSTALL_INITSCRIPT
+
+ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
+CONNMAN_CONF_OPT += --enable-client
+
+define CONNMAN_INSTALL_CM
+	$(INSTALL) -m 0755 -D $(@D)/client/cm $(TARGET_DIR)/usr/bin/cm
+endef
+
+CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
+endif
+
+$(eval $(call AUTOTARGETS))
