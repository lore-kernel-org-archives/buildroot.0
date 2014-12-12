From: Paul Cercueil <paul.cercueil@analog.com>
Date: Fri, 12 Dec 2014 18:07:41 +0100
Subject: [Buildroot] [PATCH v3] libiio: new package
Message-ID: <1418404061-11473-1-git-send-email-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libiio is a library to ease the development of software interfacing
Linux Industrial I/O (IIO) devices.

http://wiki.analog.com/resources/tools-software/linux-software/libiio

v2: Simplify greatly the patch (upstream now uses CMake)
v3: Add support for IPv6 and allow installation of systemd service file

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 package/Config.in         |  1 +
 package/libiio/Config.in  | 43 ++++++++++++++++++++++++++++++++++++++
 package/libiio/S99iiod.sh | 42 +++++++++++++++++++++++++++++++++++++
 package/libiio/libiio.mk  | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 package/libiio/Config.in
 create mode 100644 package/libiio/S99iiod.sh
 create mode 100644 package/libiio/libiio.mk

diff --git a/package/Config.in b/package/Config.in
index 48be2df..3ce5260 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libhid/Config.in"
+	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
 	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
new file mode 100644
index 0000000..4bded41
--- /dev/null
+++ b/package/libiio/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_LIBIIO
+	bool "libiio"
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	help
+	  Libiio is a library to ease the development of software interfacing
+	  Linux Industrial I/O (IIO) devices.
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
diff --git a/package/libiio/S99iiod.sh b/package/libiio/S99iiod.sh
new file mode 100644
index 0000000..f900999
--- /dev/null
+++ b/package/libiio/S99iiod.sh
@@ -0,0 +1,42 @@
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
+	status)
+		RET=1
+		if [ -f /var/run/iiod.pid ] ; then
+			kill -0 `cat /var/run/iiod.pid` >/dev/null 2>&1
+			RET=$?
+		fi
+
+		if [ $RET -eq 0 ] ; then
+			echo "iiod is running"
+		else
+			echo "iiod is NOT running"
+		fi
+
+		return $RET
+		;;
+
+	*)
+		echo "Usage: $0 {start|stop|status}"
+		exit 1
+esac
+
+exit 0
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
new file mode 100644
index 0000000..5553cc7
--- /dev/null
+++ b/package/libiio/libiio.mk
@@ -0,0 +1,53 @@
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
+# Avahi support in libiio requires avahi-client, which needs avahi-daemon
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
+LIBIIO_DEPENDENCIES += avahi
+endif
+
+ifneq ($(BR2_INET_IPV6),y)
+LIBIIO_CONF_OPTS += -DENABLE_IPV6=OFF
+endif
+
+ifneq ($(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),y)
+LIBIIO_CONF_OPTS += -DWITH_LOCAL_BACKEND=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
+LIBIIO_DEPENDENCIES += libxml2
+else
+LIBIIO_CONF_OPTS += -DWITH_NETWORK_BACKEND=OFF
+endif
+
+ifneq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
+LIBIIO_CONF_OPTS += -DWITH_IIOD=OFF
+else
+LIBIIO_DEPENDENCIES += host-flex host-bison
+define LIBIIO_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/libiio/S99iiod.sh \
+		$(TARGET_DIR)/etc/init.d/S99iiod.sh
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
+ifneq ($(BR2_PACKAGE_LIBIIO_TESTS),y)
+LIBIIO_CONF_OPTS += -DWITH_TESTS=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.1.3
