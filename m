From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:41:39 +0200
Subject: [Buildroot] [git commit] domoticz: new package
Message-ID: <20160611144150.05F7E80794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cae3a44b05bbe2e8c41bcbd8878cc81d83877887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Domoticz is a Home Automation System that lets you monitor and
configure various devices like: Lights, Switches, various
sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
and much more. Notifications/Alerts can be sent to any mobile device.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                 |  1 +
 package/domoticz/Config.in        | 33 ++++++++++++++++++
 package/domoticz/S99domoticz      | 38 +++++++++++++++++++++
 package/domoticz/domoticz.hash    |  2 ++
 package/domoticz/domoticz.mk      | 70 +++++++++++++++++++++++++++++++++++++++
 package/domoticz/domoticz.service | 10 ++++++
 6 files changed, 154 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index bfad543..f1bc86d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1346,6 +1346,7 @@ menu "Miscellaneous"
 	source "package/bc/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
+	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
new file mode 100644
index 0000000..e6d2571
--- /dev/null
+++ b/package/domoticz/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_DOMOTICZ
+	bool "domoticz"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
+	depends on BR2_USE_MMU # mosquitto
+	depends on !BR2_STATIC_LIBS # mosquitto
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_MOSQUITTO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	help
+	  Domoticz is a Home Automation System that lets you monitor
+	  and configure various devices like: Lights, Switches,
+	  various sensors/meters like Temperature, Rain, Wind, UV,
+	  Electra, Gas, Water and much more. Notifications/Alerts can
+	  be sent to any mobile device.
+
+	  http://domoticz.com
+
+comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
diff --git a/package/domoticz/S99domoticz b/package/domoticz/S99domoticz
new file mode 100644
index 0000000..a16caca
--- /dev/null
+++ b/package/domoticz/S99domoticz
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+NAME=domoticz
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/opt/domoticz/$NAME
+DAEMON_ARGS="-daemon -www 8080 -sslwww 443"
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
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
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
new file mode 100644
index 0000000..9180a9b
--- /dev/null
+++ b/package/domoticz/domoticz.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	02b4cdde8e376258aeae3d5621edf8bb6b3563c34282e50194db343fcec9c0f5	domoticz-3.4834.tar.gz
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
new file mode 100644
index 0000000..f39c075
--- /dev/null
+++ b/package/domoticz/domoticz.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# domoticz
+#
+################################################################################
+
+DOMOTICZ_VERSION = 3.4834
+DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
+DOMOTICZ_LICENSE = GPLv3
+DOMOTICZ_LICENSE_FILES = License.txt
+DOMOTICZ_DEPENDENCIES = boost host-pkgconf libcurl lua mosquitto openssl \
+        sqlite zlib
+
+# Due to the dependency on mosquitto, domoticz depends on
+# !BR2_STATIC_LIBS so set USE_STATIC_BOOST to OFF
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
+
+# Do not use any built-in libraries which are enabled by default for
+# lua, sqlite and mqtt
+DOMOTICZ_CONF_OPTS += \
+	-DUSE_BUILTIN_LUA=OFF \
+	-DUSE_BUILTIN_SQLITE=OFF \
+	-DUSE_BUILTIN_MQTT=OFF
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+DOMOTICZ_DEPENDENCIES += libusb
+endif
+
+ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
+DOMOTICZ_DEPENDENCIES += openzwave
+
+# Due to the dependency on mosquitto, domoticz depends on
+# !BR2_STATIC_LIBS so set USE_STATIC_OPENZWAVE to OFF otherwise
+# domoticz will not find the openzwave library as it searches by
+# default a static library.
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
+endif
+
+# Install domoticz in a dedicated directory (/opt/domoticz) as
+# domoticz expects by default that all its subdirectories (www,
+# Config, scripts, ...) are in the binary directory.
+DOMOTICZ_TARGET_DIR = /opt/domoticz
+DOMOTICZ_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(DOMOTICZ_TARGET_DIR)
+
+# Delete License.txt and updatedomo files installed by domoticz in target
+# directory
+# Do not delete History.txt as it is used in source code
+define DOMOTICZ_REMOVE_UNNEEDED_FILES
+	$(RM) $(TARGET_DIR)/$(DOMOTICZ_TARGET_DIR)/License.txt
+	$(RM) $(TARGET_DIR)/$(DOMOTICZ_TARGET_DIR)/updatedomo
+endef
+
+DOMOTICZ_POST_INSTALL_TARGET_HOOKS += DOMOTICZ_REMOVE_UNNEEDED_FILES
+
+# Use dedicated init scripts for systemV and systemd instead of using
+# domoticz.sh as it is not compatible with buildroot init system
+define DOMOTICZ_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/domoticz/S99domoticz \
+		$(TARGET_DIR)/etc/init.d/S99domoticz
+endef
+
+define DOMOTICZ_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/domoticz/domoticz.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/domoticz.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/domoticz.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/domoticz.service
+endef
+
+$(eval $(cmake-package))
diff --git a/package/domoticz/domoticz.service b/package/domoticz/domoticz.service
new file mode 100644
index 0000000..446b41a
--- /dev/null
+++ b/package/domoticz/domoticz.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Domoticz Home Automation System
+After=network.target
+
+[Service]
+ExecStart=/opt/domoticz/domoticz -daemon -www 8080 -sslwww 443
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
