From: David Lechner <david@lechnology.com>
Date: Fri, 22 Feb 2019 19:04:53 -0600
Subject: [Buildroot] [PATCH 1/2] package/brickd: new package
Message-ID: <20190223010454.7335-1-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a new package for brickd. Brickd is system management daemon
for the LEGO MINDSTORMS EV3 programmable brick.

Signed-off-by: David Lechner <david@lechnology.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/brickd/Config.in   | 17 +++++++++++++++++
 package/brickd/S70brickd   | 37 +++++++++++++++++++++++++++++++++++++
 package/brickd/brickd.hash |  5 +++++
 package/brickd/brickd.mk   | 22 ++++++++++++++++++++++
 6 files changed, 83 insertions(+)
 create mode 100644 package/brickd/Config.in
 create mode 100644 package/brickd/S70brickd
 create mode 100644 package/brickd/brickd.hash
 create mode 100644 package/brickd/brickd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7dd996decc..5c7dbb060e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -602,6 +602,7 @@ N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
 F:	configs/lego_ev3_defconfig
 F:	linux/linux-ext-ev3dev-linux-drivers.mk
+F:	package/brickd/
 F:	package/ev3dev-linux-drivers/
 
 N:	Davide Viti <zinosat@tiscali.it>
diff --git a/package/Config.in b/package/Config.in
index cc232b9fba..8961ed3500 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/brickd/Config.in"
 	source "package/brltty/Config.in"
 	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
diff --git a/package/brickd/Config.in b/package/brickd/Config.in
new file mode 100644
index 0000000000..bd62e15122
--- /dev/null
+++ b/package/brickd/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_BRICKD
+	bool "brickd"
+	depends on BR2_PACKAGE_HAS_UDEV # gudev
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGUDEV
+	help
+	  Brick daemon for LEGO MINDSTORMS EV3 (and other LEGO-
+	  compatible devices). This performs tasks like battery
+	  management and controls device-specific hardware.
+
+	  https://github.com/ev3dev/brickd
+
+comment "brickd needs udev /dev management, a toolchain w/ threads, wchar"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/brickd/S70brickd b/package/brickd/S70brickd
new file mode 100644
index 0000000000..063ad875ad
--- /dev/null
+++ b/package/brickd/S70brickd
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+NAME=brickd
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/sbin/$NAME
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
new file mode 100644
index 0000000000..8de57a9b82
--- /dev/null
+++ b/package/brickd/brickd.hash
@@ -0,0 +1,5 @@
+# Locally computed hash
+sha256 0b79f1ccd6fa644d7ecb2e17b19f9ffbf6374702ae9ac536b2c4a0b8b2cfe160 brickd-ev3dev-stretch_1.2.1.tar.gz
+
+# Hashes for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.txt
diff --git a/package/brickd/brickd.mk b/package/brickd/brickd.mk
new file mode 100644
index 0000000000..7fe28daf78
--- /dev/null
+++ b/package/brickd/brickd.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# brickd
+#
+################################################################################
+
+BRICKD_VERSION = ev3dev-stretch/1.2.1
+BRICKD_SITE = https://github.com/ev3dev/brickd
+BRICKD_SITE_METHOD = git
+BRICKD_GIT_SUBMODULES = YES
+
+BRICKD_LICENSE = GPL-2.0
+BRICKD_LICENSE_FILES = LICENSE.txt
+
+BRICKD_INSTALL_STAGING = YES
+BRICKD_DEPENDENCIES = host-pkgconf host-vala libglib2 libgudev
+
+define BRICKD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/brickd/S70brickd $(TARGET_DIR)/etc/init.d/S70brickd
+endef
+
+$(eval $(cmake-package))
-- 
2.17.1
