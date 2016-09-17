From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 Sep 2016 13:31:39 +0200
Subject: [Buildroot] [PATCH] darkhttpd: new package
Message-ID: <1474111899-5705-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides darkhttpd, a simple, fast HTTP 1.1 web server
for static content.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                   |  1 +
 package/darkhttpd/Config.in         | 18 +++++++++++++++
 package/darkhttpd/S50darkhttpd      | 46 +++++++++++++++++++++++++++++++++++++
 package/darkhttpd/darkhttpd.hash    |  2 ++
 package/darkhttpd/darkhttpd.mk      | 36 +++++++++++++++++++++++++++++
 package/darkhttpd/darkhttpd.service | 11 +++++++++
 6 files changed, 114 insertions(+)
 create mode 100644 package/darkhttpd/Config.in
 create mode 100755 package/darkhttpd/S50darkhttpd
 create mode 100644 package/darkhttpd/darkhttpd.hash
 create mode 100644 package/darkhttpd/darkhttpd.mk
 create mode 100644 package/darkhttpd/darkhttpd.service

diff --git a/package/Config.in b/package/Config.in
index 332f05d..2a38fac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1437,6 +1437,7 @@ menu "Networking applications"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
 	source "package/dante/Config.in"
+	source "package/darkhttpd/Config.in"
 	source "package/dhcp/Config.in"
 	source "package/dhcpcd/Config.in"
 	source "package/dhcpdump/Config.in"
diff --git a/package/darkhttpd/Config.in b/package/darkhttpd/Config.in
new file mode 100644
index 0000000..bd12588
--- /dev/null
+++ b/package/darkhttpd/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DARKHTTPD
+	bool "darkhttpd"
+	help
+	  Darkhttpd is a simple, fast HTTP 1.1 web server which only serves
+	  static content. It does not support PHP or CGI.
+
+	  The behavior of darkhttpd can be altered by setting some variables in
+	  /etc/default/darkhttpd:
+
+	  - DARKHTTPD_ROOT: path to the server document root.
+	  - DARKHTTPD_FLAGS: options to pass to darkhttpd.
+
+	  Note: when Busybox or SysV init system is used, darkhttpd logs to
+	  /var/log/darkhttpd.log, which may grow beyond the file system limits.
+	  Please consider using a log rotating system such as logrotate or
+	  change the path to the log file using the configuration file.
+
+	  https://unix4lyfe.org/darkhttpd/
diff --git a/package/darkhttpd/S50darkhttpd b/package/darkhttpd/S50darkhttpd
new file mode 100755
index 0000000..6d0e976
--- /dev/null
+++ b/package/darkhttpd/S50darkhttpd
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# Starts darkhttpd.
+#
+
+# Allow a few customizations from a config file
+test -r /etc/default/darkhttpd && . /etc/default/darkhttpd
+
+DARKHTTPD_PROG=/usr/sbin/darkhttpd
+DARKHTTPD_PIDFILE=/var/run/darkhttpd.pid
+DARKHTTPD_FLAGS="$DARKHTTPD_FLAGS --chroot --uid nobody --gid www-data"
+DARKHTTPD_ARGS="${DARKHTTPD_ROOT:-/var/www} --log /var/log/darkhttpd.log $DARKHTTPD_FLAGS"
+
+start() {
+    printf "Starting darkhttpd: "
+    start-stop-daemon -S -q -b -p $DARKHTTPD_PIDFILE -m --exec $DARKHTTPD_PROG -- $DARKHTTPD_ARGS
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+    printf "Stopping darkhttpd: "
+    start-stop-daemon -K -q -p $DARKHTTPD_PIDFILE
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+    stop
+    start
+}
+
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    restart|reload)
+        restart
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
new file mode 100644
index 0000000..39152e3
--- /dev/null
+++ b/package/darkhttpd/darkhttpd.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 a50417b622b32b5f421b3132cb94ebeff04f02c5fb87fba2e31147d23de50505 darkhttpd-1.12.tar.bz2
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
new file mode 100644
index 0000000..ba1c3c9
--- /dev/null
+++ b/package/darkhttpd/darkhttpd.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# darkhttpd
+#
+################################################################################
+
+DARKHTTPD_VERSION = 1.12
+DARKHTTPD_SITE = https://unix4lyfe.org/darkhttpd
+DARKHTTPD_SOURCE = darkhttpd-$(DARKHTTPD_VERSION).tar.bz2
+DARKHTTPD_LICENSE = MIT
+
+DARKHTTPD_MAKE_OPTS = CC="$(TARGET_CC)"
+
+define DARKHTTPD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(DARKHTTPD_MAKE_OPTS) -C $(@D)
+endef
+
+define DARKHTTPD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/darkhttpd \
+		$(TARGET_DIR)/usr/sbin/darkhttpd
+endef
+
+define DARKHTTPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/darkhttpd/darkhttpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/darkhttpd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/darkhttpd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/darkhttpd.service
+endef
+
+define DARKHTTPD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/darkhttpd/S50darkhttpd \
+		$(TARGET_DIR)/etc/init.d/S50darkhttpd
+endef
+
+$(eval $(generic-package))
diff --git a/package/darkhttpd/darkhttpd.service b/package/darkhttpd/darkhttpd.service
new file mode 100644
index 0000000..17abd98
--- /dev/null
+++ b/package/darkhttpd/darkhttpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Darkhttpd Web Server
+After=syslog.target network.target auditd.service
+
+[Service]
+Environment="DARKHTTPD_ROOT=/var/www"
+EnvironmentFile=-/etc/default/darkhttpd
+ExecStart=/usr/sbin/darkhttpd $DARKHTTPD_ROOT $DARKHTTPD_FLAGS --chroot --uid nobody --gid www-data
+
+[Install]
+WantedBy=multi-user.target
-- 
2.4.11
