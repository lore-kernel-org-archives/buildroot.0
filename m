From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Apr 2015 22:33:15 +0200
Subject: [Buildroot] [PATCH] package: add mosquitto
Message-ID: <1428697995-13315-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |  1 +
 package/mosquitto/Config.in      | 19 +++++++++
 package/mosquitto/S50mosquitto   | 35 ++++++++++++++++
 package/mosquitto/mosquitto.hash |  2 +
 package/mosquitto/mosquitto.mk   | 91 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 package/mosquitto/Config.in
 create mode 100644 package/mosquitto/S50mosquitto
 create mode 100644 package/mosquitto/mosquitto.hash
 create mode 100644 package/mosquitto/mosquitto.mk

diff --git a/package/Config.in b/package/Config.in
index de8e856..370a43e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1177,6 +1177,7 @@ endif
 	source "package/modem-manager/Config.in"
 	source "package/mongoose/Config.in"
 	source "package/mongrel2/Config.in"
+	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
new file mode 100644
index 0000000..8f579f8
--- /dev/null
+++ b/package/mosquitto/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MOSQUITTO
+	bool "mosquitto"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INET_IPV6
+	depends on !BR2_STATIC_LIBS # builds .so
+	help
+	  Mosquitto is an open source message broker that implements
+	  the MQ Telemetry Transport protocol versions 3.1 and
+	  3.1.1. MQTT provides a lightweight method of carrying out
+	  messaging using a publish/subscribe model. This makes it
+	  suitable for "machine to machine" messaging such as with low
+	  power sensors or mobile devices such as phones, embedded
+	  computers or microcontrollers like the Arduino.
+
+	  http://mosquitto.org/
+
+comment "mosquitto needs a toolchain w/ IPv6, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6 || BR2_STATIC_LIBS
diff --git a/package/mosquitto/S50mosquitto b/package/mosquitto/S50mosquitto
new file mode 100644
index 0000000..9f10cce
--- /dev/null
+++ b/package/mosquitto/S50mosquitto
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+start() {
+	echo -n "Starting mosquitto: "
+	start-stop-daemon -S -q -m -b -p /var/run/mosquitto.pid \
+		--exec /usr/sbin/mosquitto \
+		-- -c /etc/mosquitto/mosquitto.conf
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping mosquitto: "
+	start-stop-daemon -K -q -p /var/run/mosquitto.pid
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
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
new file mode 100644
index 0000000..2f38bdb
--- /dev/null
+++ b/package/mosquitto/mosquitto.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	75a8b051c7859a2426ffc15bf45b44f79c8288395a325d791ba54e5df9af58a8  mosquitto-1.4.1.tar.gz
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
new file mode 100644
index 0000000..59a25f3
--- /dev/null
+++ b/package/mosquitto/mosquitto.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# mosquitto
+#
+################################################################################
+
+MOSQUITTO_VERSION = 1.4.1
+MOSQUITTO_SITE = http://mosquitto.org/files/source
+MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
+MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
+MOSQUITTO_INSTALL_STAGING = YES
+
+MOSQUITTO_MAKE_OPTS = \
+	UNAME=Linux \
+	STRIP=true \
+	prefix=/usr \
+	WITH_WRAP=no \
+	WITH_DOCS=no
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MOSQUITTO_DEPENDENCIES += openssl
+MOSQUITTO_MAKE_OPTS += WITH_TLS=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_TLS=no
+endif
+
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+MOSQUITTO_DEPENDENCIES += c-ares
+MOSQUITTO_MAKE_OPTS += WITH_SRV=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_SRV=no
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+MOSQUITTO_DEPENDENCIES += util-linux
+MOSQUITTO_MAKE_OPTS += WITH_UUID=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_UUID=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+MOSQUITTO_DEPENDENCIES += libwebsockets
+MOSQUITTO_MAKE_OPTS += WITH_WEBSOCKETS=yes
+else
+MOSQUITTO_MAKE_OPTS += WITH_WEBSOCKETS=no
+endif
+
+# C++ support is only used to create a wrapper library
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+define MOSQUITTO_DISABLE_CPP
+	$(SED) '/-C cpp/d' $(@D)/lib/Makefile
+endef
+
+MOSQUITTO_POST_PATCH_HOOKS += MOSQUITTO_DISABLE_CPP
+endif
+
+define MOSQUITTO_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(MOSQUITTO_MAKE_OPTS)
+endef
+
+define MOSQUITTO_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+endef
+
+define MOSQUITTO_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(MOSQUITTO_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	rm -f $(TARGET_DIR)/etc/mosquitto/*.example
+	$(INSTALL) -D -m 0644 $(@D)/mosquitto.conf \
+		$(TARGET_DIR)/etc/mosquitto/mosquitto.conf
+endef
+
+define MOSQUITTO_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/mosquitto/S50mosquitto \
+		$(TARGET_DIR)/etc/init.d/S50mosquitto
+endef
+
+define MOSQUITTO_USERS
+	mosquitto -1 nogroup -1 * - - - Mosquitto user
+endef
+
+$(eval $(generic-package))
+
-- 
2.1.3
