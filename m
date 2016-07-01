From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 00:06:11 +0200
Subject: [Buildroot] [PATCH] babeld: New package
Message-ID: <1467410771-12765-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in             |  1 +
 package/babeld/Config.in      |  7 +++++++
 package/babeld/S50babeld      | 40 ++++++++++++++++++++++++++++++++++++++++
 package/babeld/babeld.hash    |  2 ++
 package/babeld/babeld.mk      | 37 +++++++++++++++++++++++++++++++++++++
 package/babeld/babeld.service | 10 ++++++++++
 6 files changed, 97 insertions(+)
 create mode 100644 package/babeld/Config.in
 create mode 100644 package/babeld/S50babeld
 create mode 100644 package/babeld/babeld.hash
 create mode 100644 package/babeld/babeld.mk
 create mode 100644 package/babeld/babeld.service

diff --git a/package/Config.in b/package/Config.in
index a6cc258..535d46f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1393,6 +1393,7 @@ menu "Networking applications"
 	source "package/autossh/Config.in"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
+	source "package/babeld/Config.in"
 	source "package/bandwidthd/Config.in"
 	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
diff --git a/package/babeld/Config.in b/package/babeld/Config.in
new file mode 100644
index 0000000..67f499c
--- /dev/null
+++ b/package/babeld/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BABELD
+	bool "babeld"
+	help
+	  Babel is a loop-avoiding distance-vector routing protocol for IPv6
+	  and IPv4 with fast convergence properties.
+
+	  http://www.pps.univ-paris-diderot.fr/~jch/software/babel/
diff --git a/package/babeld/S50babeld b/package/babeld/S50babeld
new file mode 100644
index 0000000..c75b4c3
--- /dev/null
+++ b/package/babeld/S50babeld
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# Starts babeld.
+#
+
+# Allow a few customizations from a config file
+test -r /etc/default/babeld && . /etc/default/babeld
+
+start() {
+	printf "Starting babeld: "
+	start-stop-daemon -S -q -p /run/babeld.pid \
+		--exec /usr/sbin/babeld -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping babeld: "
+	start-stop-daemon -K -q -p /run/babeld.pid
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
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
new file mode 100644
index 0000000..0ee64c4
--- /dev/null
+++ b/package/babeld/babeld.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2c955e7d4ad971da1e860e5cedbaf1dd79903468ff6488b3f67102b2a8d087b6  babeld-1.7.1.tar.gz
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
new file mode 100644
index 0000000..5e96c68
--- /dev/null
+++ b/package/babeld/babeld.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# babeld
+#
+################################################################################
+
+BABELD_VERSION = 1.7.1
+BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BALELD_LICENSE = MIT
+BALELD_LICENSE_FILES = LICENSE
+
+define BABELD_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		PLATFORM_DEFINES="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+endef
+
+define BABELD_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/babeld $(TARGET_DIR)/usr/sbin/babeld
+endef
+
+define BABELD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/babeld/S50babeld \
+		$(TARGET_DIR)/etc/init.d/S50babeld
+endef
+
+define BABELD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/babeld/babeld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/babeld.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/babeld.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/babeld.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/babeld/babeld.service b/package/babeld/babeld.service
new file mode 100644
index 0000000..abe72a8
--- /dev/null
+++ b/package/babeld/babeld.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Babel daemon
+
+[Service]
+EnvironmentFile=-/etc/default/babeld
+ExecStart=/usr/sbin/babeld $DAEMON_ARGS
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.1
