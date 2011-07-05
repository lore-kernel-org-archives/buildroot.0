From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Jul 2011 08:26:44 +0200
Subject: [Buildroot] [git commit] package: add rsyslog
Message-ID: <20110705064716.60A0D8A31E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6e53e059c82ba0ac235a5ca732a40b8999a7e65e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rsyslog is a powerful and flexible syslog daemon.

[Peter: whitespace, rename initscript, allow platform override of conf file]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/rsyslog/Config.in  |    6 ++++++
 package/rsyslog/S01rsyslog |   38 ++++++++++++++++++++++++++++++++++++++
 package/rsyslog/rsyslog.mk |   26 ++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 package/rsyslog/Config.in
 create mode 100644 package/rsyslog/S01rsyslog
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
index 0000000..2503f71
--- /dev/null
+++ b/package/rsyslog/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RSYSLOG
+	bool "rsyslog"
+	help
+	  Rsyslog is a powerful and flexible syslog implementation
+
+	  http://www.rsyslog.com
diff --git a/package/rsyslog/S01rsyslog b/package/rsyslog/S01rsyslog
new file mode 100644
index 0000000..8c28e02
--- /dev/null
+++ b/package/rsyslog/S01rsyslog
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# Starts rsyslog.
+#
+
+start() {
+	echo -n "Starting rsyslog daemon: "
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
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
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
index 0000000..af7ac2e
--- /dev/null
+++ b/package/rsyslog/rsyslog.mk
@@ -0,0 +1,26 @@
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
+	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
+		$(TARGET_DIR)/etc/init.d/S01rsyslog
+	[ -f $(TARGET_DIR)/etc/rsyslog.conf ] || \
+		$(INSTALL) -m 0644 -D $(@D)/rsyslog.conf \
+			$(TARGET_DIR)/etc/rsyslog.conf
+	mkdir -p $(TARGET_DIR)/etc/rsyslog.d
+endef
+
+RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
+
+$(eval $(call AUTOTARGETS,package,rsyslog))
-- 
1.7.3.4
