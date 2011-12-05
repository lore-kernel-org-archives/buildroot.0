From: Daniel Mack <zonque@gmail.com>
Date: Tue,  6 Dec 2011 00:27:01 +0100
Subject: [Buildroot] [PATCH v4] Add package connman
In-Reply-To: <877h2asivx.fsf@macbook.be.48ers.dk>
References: <877h2asivx.fsf@macbook.be.48ers.dk>
Message-ID: <1323127621-10775-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
Changelog:
v4: 
	* add init script
	* drop 'default y' for BR2_PACKAGE_CONNMAN_WIFI
	* set CONNMAN_INSTALL_STAGING
	* add a comment on CONNMAN_AUTORECONF
v3: bump to v0.78, drop --sysconfdir
v2: replace ifeq-blocks with $(if $(BR2_PACKAGE_CONNMAN_FOO),--enable-foo,--disable-foo) constructs
v1: initial

 package/Config.in          |    1 +
 package/connman/Config.in  |   46 ++++++++++++++++++++++++++++++++++++++++++++
 package/connman/S45connman |   45 +++++++++++++++++++++++++++++++++++++++++++
 package/connman/connman.mk |   30 ++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+), 0 deletions(-)
 create mode 100644 package/connman/Config.in
 create mode 100755 package/connman/S45connman
 create mode 100644 package/connman/connman.mk

diff --git a/package/Config.in b/package/Config.in
index a781870..c94bcc0 100644
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
index 0000000..f996775
--- /dev/null
+++ b/package/connman/Config.in
@@ -0,0 +1,46 @@
+menuconfig BR2_PACKAGE_CONNMAN
+	bool "connman"
+	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_IPTABLES
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
+comment "connman needs DBus enabled"
+	depends on !BR2_PACKAGE_DBUS
diff --git a/package/connman/S45connman b/package/connman/S45connman
new file mode 100755
index 0000000..0c8f740
--- /dev/null
+++ b/package/connman/S45connman
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+prefix=/usr
+exec_prefix=/usr
+sbindir=${exec_prefix}/sbin
+
+CONNMAN_BIN=${sbindir}/connmand
+
+[ -x $CONNMAN_BIN ] || exit 0
+
+PID=`pidof -o %PPID connmand`
+case "$1" in
+	start)
+		echo -n "Starting connman ... "
+		if [ -z "$PID" ]; then
+			$CONNMAN_BIN
+		fi
+		if [ ! -z "$PID" -o $? -gt 0 ]; then
+			echo "failed!"
+		else
+			echo "done."
+		fi
+		;;
+	stop)
+		echo -n "Stopping connman ..."
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
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
new file mode 100644
index 0000000..d6891da
--- /dev/null
+++ b/package/connman/connman.mk
@@ -0,0 +1,30 @@
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
+	$(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)			\
+	$(if $(BR2_PACKAGE_CONNMAN_CLIENT),--enable-client,--disable-client)
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
+$(eval $(call AUTOTARGETS))
-- 
1.7.7.3
