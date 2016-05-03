From: fabrice.fontaine at orange.com <fabrice.fontaine@orange.com>
Date: Tue, 3 May 2016 10:14:09 +0200
Subject: [Buildroot] [PATCH v5] domoticz: new package
Message-ID: <30357_1462263258_57285DDA_30357_1304_1_d5a28a6b-c41a-4918-a007-feff96280fbe@OPEXCLILM6D.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Domoticz is a Home Automation System that lets you monitor andi
configure various devices like: Lights, Switches, various
sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
and much more. Notifications/Alerts can be sent to any mobile device.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v4 -> v5 (after review of Julien Boibessot):
 - Add dedicated init scripts for systemV and systemd instead of using
   domoticz.sh as it is not compatible with buildroot init system

Changes v3 -> v4 (after review of Julien Boibessot):
 - Remove unneeded files (License and updatedomo) from target directory.
   Do not remove History.txt as it is used in source code
 - Install domoticz binary and all its files in /opt/domoticz instead of
   /usr by overriding CMAKE_INSTALL_PREFIX
 - Modify and install domoticz.sh if systemV is enabled by defining
   DOMOTICZ_INSTALL_INIT_SYSV

Changes v2 -> v3 (after review of Samuel Martin):
 - Use OFF instead of no for consistency with other cmake packages
 - Always set USE_STATIC_BOOST and USE_STATIC_OPENZWAVE to OFF as
   BR2_STATIC_LIBS will always be false due to mosquitto dependency

Changes v1 -> v2 (after review of Samuel Martin):
 - Add a hash file
 - Replace the dependency on BR2_PACKAGE_LUA_5_2 by a dependency on
   BR2_PACKAGE_LUA_5_2 or BR2_PACKAGE_LUA_5_3
 - Add dependencies on BR2_USE_MMU and !BR2_STATIC_LIBS (from mosquitto)
 - Add dependency on BR2_PACKAGE_BOOST_ARCH_SUPPORTS (from boost)
 - Automatically add zwave support in domoticz if the user has selected
   the openzwave package
 - Set USE_STATIC_BOOST and USE_STATIC_OPENZWAVE to the correct values
   in domoticz.mk depending on BR2_STATIC_LIBS value to avoid breaking
   static-only build

 package/Config.in                 |  1 +
 package/domoticz/Config.in        | 32 ++++++++++++++++++
 package/domoticz/S99domoticz      | 38 ++++++++++++++++++++++
 package/domoticz/domoticz.hash    |  2 ++
 package/domoticz/domoticz.mk      | 68 +++++++++++++++++++++++++++++++++++++++
 package/domoticz/domoticz.service | 10 ++++++
 6 files changed, 151 insertions(+)
 create mode 100644 package/domoticz/Config.in
 create mode 100644 package/domoticz/S99domoticz
 create mode 100644 package/domoticz/domoticz.hash
 create mode 100644 package/domoticz/domoticz.mk
 create mode 100644 package/domoticz/domoticz.service

diff --git a/package/Config.in b/package/Config.in
index 10d9a6e..6b33a02 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1326,6 +1326,7 @@ menu "Miscellaneous"
 	source "package/bc/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
+	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
new file mode 100644
index 0000000..c7c2878
--- /dev/null
+++ b/package/domoticz/Config.in
@@ -0,0 +1,32 @@
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
+	  Domoticz is a Home Automation System that lets you monitor andi
+	  configure various devices like: Lights, Switches, various
+	  sensors/meters like Temperature, Rain, Wind, UV, Electra, Gas, Water
+	  and much more. Notifications/Alerts can be sent to any mobile device.
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
index 0000000..9a53105
--- /dev/null
+++ b/package/domoticz/S99domoticz
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+NAME=domoticz
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/opt/domoticz/$NAME
+DAEMON_ARGS="-daemon -www 18080 -sslwww 443"
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
index 0000000..64d4074
--- /dev/null
+++ b/package/domoticz/domoticz.mk
@@ -0,0 +1,68 @@
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
+# Due to mosquitto dependency, domoticz depends on !BR2_STATIC_LIBS so sets
+# USE_STATIC_BOOST to OFF
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_BOOST=OFF
+
+# Do not use any built-in libraries which are enabled by default for lua, 
+# sqlite and mqtt
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_LUA=OFF
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_SQLITE=OFF
+DOMOTICZ_CONF_OPTS += -DUSE_BUILTIN_MQTT=OFF
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+DOMOTICZ_DEPENDENCIES += libusb
+endif
+
+ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
+DOMOTICZ_DEPENDENCIES += openzwave
+
+# Due to mosquitto dependency, domoticz depends on !BR2_STATIC_LIBS so sets
+# USE_STATIC_OPENZWAVE to OFF otherwise domoticz will not found openzwave
+# library as it searchs by default a static library
+DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
+endif
+
+# Install domoticz in a dedicated directory (/opt/domoticz) as domoticz expects
+# by default that all its subdirectories (www, Config, scripts, ...) are in the
+# binary directory
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
-- 
2.7.4


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
