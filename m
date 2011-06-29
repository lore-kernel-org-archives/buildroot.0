From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 Jun 2011 15:46:17 +0200
Subject: [Buildroot] [PATCH 2/6] Add the stunnel package
Message-ID: <1309355181-21048-2-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stunnel is an SSL tunnelling proxy.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Config.in          |    1 +
 package/stunnel/Config.in  |    6 ++++++
 package/stunnel/S50stunnel |   37 +++++++++++++++++++++++++++++++++++++
 package/stunnel/stunnel.mk |   22 ++++++++++++++++++++++
 4 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 package/stunnel/Config.in
 create mode 100644 package/stunnel/S50stunnel
 create mode 100644 package/stunnel/stunnel.mk

diff --git a/package/Config.in b/package/Config.in
index 8f1f030..1a4815a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -441,6 +441,7 @@ source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/squid/Config.in"
+source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
new file mode 100644
index 0000000..b3603ed
--- /dev/null
+++ b/package/stunnel/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_STUNNEL
+	bool "stunnel"
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  Stunnel is a program that wraps any TCP connection with an SSL
+	  connection.
diff --git a/package/stunnel/S50stunnel b/package/stunnel/S50stunnel
new file mode 100644
index 0000000..394eb82
--- /dev/null
+++ b/package/stunnel/S50stunnel
@@ -0,0 +1,37 @@
+#!/bin/sh
+#
+# Starts stunnel
+#
+
+start() {
+ 	echo -n "Starting stunnel: "
+	start-stop-daemon -S -q -p /var/run/stunnel.pid --exec /usr/bin/stunnel
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping stunnel: "
+	start-stop-daemon -K -q -p /var/run/stunnel.pid
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart|reload)
+  	restart
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
new file mode 100644
index 0000000..1c1ba9b
--- /dev/null
+++ b/package/stunnel/stunnel.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# stunnel
+#
+#############################################################
+
+STUNNEL_VERSION = 4.36
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x/
+STUNNEL_DEPENDENCIES = openssl
+
+STUNNEL_CONF_OPT += \
+	--with-ssl=$(STAGING_DIR)/usr \
+	--with-threads=fork
+
+define STUNNEL_INSTALL_CONF_SCRIPT
+	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
+	$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf $(TARGET_DIR)/etc/stunnel/stunnel.conf
+endef
+
+STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
+
+$(eval $(call AUTOTARGETS,package,stunnel))
-- 
1.7.4.1
