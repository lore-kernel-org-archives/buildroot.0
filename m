From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 Jun 2011 15:46:21 +0200
Subject: [Buildroot] [PATCH 6/6] Add the rsyslog package.
Message-ID: <1309355181-21048-6-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rsyslog is a powerful and flexible syslog daemon.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/Config.in          |    1 +
 package/rsyslog/Config.in  |    6 ++++++
 package/rsyslog/S01logging |   38 ++++++++++++++++++++++++++++++++++++++
 package/rsyslog/rsyslog.mk |   23 +++++++++++++++++++++++
 4 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 package/rsyslog/Config.in
 create mode 100644 package/rsyslog/S01logging
 create mode 100644 package/rsyslog/rsyslog.mk

diff --git a/package/Config.in b/package/Config.in
index 1a4815a..b06c669 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
+source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
new file mode 100644
index 0000000..cee19fc
--- /dev/null
+++ b/package/rsyslog/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RSYSLOG
+	bool "rsyslog"
+	help
+          Rsyslog is a powerful and flexible syslog implementation
+
+	  http://www.rsyslog.com
diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
new file mode 100644
index 0000000..cc640ea
--- /dev/null
+++ b/package/rsyslog/S01logging
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# Starts rsyslog.
+#
+
+start() {
+ 	echo -n "Starting rsyslog daemon: "
+	umask 077
+	start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping rsyslog daemon: "
+	start-stop-daemon -K -q -p /var/run/rsyslogd.pid
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
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
new file mode 100644
index 0000000..fd2ba0b
--- /dev/null
+++ b/package/rsyslog/rsyslog.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# rsyslog
+#
+#############################################################
+RSYSLOG_VERSION = 5.8.0
+RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
+RSYSLOG_DEPENDENCIES = zlib
+
+# Build after Busybox
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	RSYSLOG_DEPENDENCIES += busybox
+endif
+
+define RSYSLOG_INSTALL_CONF_SCRIPT
+	$(INSTALL) -m 0755 -D package/rsyslog/S01logging $(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -m 0644 -D $(@D)/rsyslog.conf $(TARGET_DIR)/etc/rsyslog.conf
+	mkdir -p $(TARGET_DIR)/etc/rsyslog.d
+endef
+
+RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
+
+$(eval $(call AUTOTARGETS,package,rsyslog))
-- 
1.7.4.1
