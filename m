From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:36:21 +0100
Subject: [Buildroot] [git commit] libiio: new package
Message-ID: <20141221213804.3063F80474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cc32673849460a44eca935db85b32869d21d1c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libiio is a library to ease the development of software interfacing
Linux Industrial I/O (IIO) devices.

http://wiki.analog.com/resources/tools-software/linux-software/libiio

[Thomas:
 - Remove changelog from the commit log.
 - Rename init script to S99iiod instead of S99iiod.sh
 - Remove "status" command from init script, and implement "restart"
   instead.
 - Add dependency on thread support in toolchain.
 - Fixup indentation in the .mk file.
 - Fixup wrapping in the Config.in help text.]

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libiio/Config.in   |   47 +++++++++++++++++++++++++++++++++++++++++
 package/libiio/S99iiod     |   30 ++++++++++++++++++++++++++
 package/libiio/libiio.hash |    2 +
 package/libiio/libiio.mk   |   50 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5a7616b..808ecd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -710,6 +710,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libhid/Config.in"
+	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
 	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
new file mode 100644
index 0000000..292ca5a
--- /dev/null
+++ b/package/libiio/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_LIBIIO
+	bool "libiio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	help
+	  Libiio is a library to ease the development of software
+	  interfacing Linux Industrial I/O (IIO) devices.
+
+	  http://wiki.analog.com/resources/tools-software/linux-software/libiio
+
+if BR2_PACKAGE_LIBIIO
+
+config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	bool "Local backend"
+	default y
+	help
+	  Enable the local backend of the library.
+
+config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	bool "Network backend"
+	select BR2_PACKAGE_LIBXML2
+	default y
+	help
+	  Enable the network backend of the library.
+
+config BR2_PACKAGE_LIBIIO_IIOD
+	bool "IIO Daemon"
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	default y
+	help
+	  Install the IIO Daemon.
+
+comment "IIO Daemon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBIIO_TESTS
+	bool "Install test programs"
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	help
+	  Install the test programs (iio_info, iio_genxml, iio_readdev).
+
+endif
+
+comment "libiio needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libiio/S99iiod b/package/libiio/S99iiod
new file mode 100644
index 0000000..df2f763
--- /dev/null
+++ b/package/libiio/S99iiod
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+# Server-side demuxing by default
+IIOD_OPTS=-D
+
+[ -r /etc/default/iiod ] && . /etc/default/iiod
+
+case "$1" in
+	start)
+		echo "Starting IIO Server Daemon"
+		start-stop-daemon -S -b -q -m -p /var/run/iiod.pid -x /usr/sbin/iiod -- $IIOD_OPTS
+		exit $?
+		;;
+
+	stop)
+		echo "Stopping IIO Server Daemon"
+		start-stop-daemon -K -q -p /var/run/iiod.pid 2>/dev/null
+		exit $?
+		;;
+
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
new file mode 100644
index 0000000..bbca4c8
--- /dev/null
+++ b/package/libiio/libiio.hash
@@ -0,0 +1,2 @@
+# From https://github.com/analogdevicesinc/libiio/archive/v0.3/
+sha256	a3571bbf7e80b9e0a8d6bd4b39a5bcd18f80a3d36c4a6f2092dfeefc98e20e07	libiio-v0.3.tar.gz
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
new file mode 100644
index 0000000..abcddba
--- /dev/null
+++ b/package/libiio/libiio.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# libiio
+#
+################################################################################
+
+LIBIIO_VERSION = v0.3
+LIBIIO_SITE = $(call github,analogdevicesinc,libiio,$(LIBIIO_VERSION))
+LIBIIO_INSTALL_STAGING = YES
+LIBIIO_LICENSE = LGPLv2.1+
+LIBIIO_LICENSE_FILES = COPYING
+
+LIBIIO_CONF_OPTS = -DENABLE_IPV6=$(if $(BR2_INET_IPV6),ON,OFF) \
+	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
+	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF)
+
+ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
+LIBIIO_DEPENDENCIES += libxml2
+LIBIIO_CONF_OPTS += -DWITH_NETWORK_BACKEND=ON
+else
+LIBIIO_CONF_OPTS += -DWITH_NETWORK_BACKEND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
+LIBIIO_DEPENDENCIES += host-flex host-bison
+LIBIIO_CONF_OPTS += -DWITH_IIOD=ON
+else
+LIBIIO_CONF_OPTS += -DWITH_IIOD=OFF
+endif
+
+# Avahi support in libiio requires avahi-client, which needs avahi-daemon
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
+LIBIIO_DEPENDENCIES += avahi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
+define LIBIIO_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/libiio/S99iiod \
+		$(TARGET_DIR)/etc/init.d/S99iiod
+endef
+define LIBIIO_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	$(INSTALL) -D -m 0644 $(@D)/debian/iiod.service \
+		$(TARGET_DIR)/lib/systemd/system/iiod.service
+	ln -fs /lib/systemd/system/iiod.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/iiod.service
+endef
+endif
+
+$(eval $(cmake-package))
