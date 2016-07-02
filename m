From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 10:47:58 +0200
Subject: [Buildroot] [PATCH] dante: New package
Message-ID: <1467449278-3166-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in           |  1 +
 package/dante/Config.in     |  9 +++++++++
 package/dante/S50dante      | 40 ++++++++++++++++++++++++++++++++++++++++
 package/dante/dante.hash    |  2 ++
 package/dante/dante.mk      | 32 ++++++++++++++++++++++++++++++++
 package/dante/dante.service | 15 +++++++++++++++
 6 files changed, 99 insertions(+)
 create mode 100644 package/dante/Config.in
 create mode 100644 package/dante/S50dante
 create mode 100644 package/dante/dante.hash
 create mode 100644 package/dante/dante.mk
 create mode 100644 package/dante/dante.service

diff --git a/package/Config.in b/package/Config.in
index 5779d04..0840ef2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1416,6 +1416,7 @@ menu "Networking applications"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/dante/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dhcp/Config.in"
 endif
diff --git a/package/dante/Config.in b/package/dante/Config.in
new file mode 100644
index 0000000..4aa30bc
--- /dev/null
+++ b/package/dante/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DANTE
+	bool "dante"
+	help
+	  Dante is a product developed by Inferno Nettverk A/S. It consists of a
+	  SOCKS server and a SOCKS client, implementing RFC 1928 and related
+	  standards. It is a flexible product that can be used to provide
+	  convenient and secure network connectivity.
+
+	  http://www.inet.no/dante/
diff --git a/package/dante/S50dante b/package/dante/S50dante
new file mode 100644
index 0000000..3613991
--- /dev/null
+++ b/package/dante/S50dante
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# Starts dante
+#
+
+# Allow a few customizations from a config file
+test -r /etc/default/dante && . /etc/default/dante
+
+start() {
+	printf "Starting dante: "
+	start-stop-daemon -S -q -p /run/dante.pid \
+		--exec /usr/sbin/dante -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping dante: "
+	start-stop-daemon -K -q -p /run/dante.pid
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
diff --git a/package/dante/dante.hash b/package/dante/dante.hash
new file mode 100644
index 0000000..38dea61
--- /dev/null
+++ b/package/dante/dante.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53	dante-1.4.1.tar.gz
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
new file mode 100644
index 0000000..3aa04b4
--- /dev/null
+++ b/package/dante/dante.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# dante
+#
+################################################################################
+
+DANTE_VERSION = 1.4.1
+DANTE_SITE = http://www.inet.no/dante/files
+DANTE_LICENSE = BSD-3c
+DANTE_LICENSE_FILES = LICENSE
+
+# Dante uses a *VERY* old configure.ac
+DANTE_LIBTOOL_PATCH = NO
+DANTE_INSTALL_STAGING = YES
+
+DANTE_CONF_OPTS += --disable-client --disable-preload
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+	DANTE_CONF_OPTS += --enable-debug
+endif
+
+define DANTE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dante/dante.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/dante.service
+endef
+
+define DANTE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/dante/S50dante \
+		$(TARGET_DIR)/etc/init.d/S50dante
+endef
+
+$(eval $(autotools-package))
diff --git a/package/dante/dante.service b/package/dante/dante.service
new file mode 100644
index 0000000..b783cee
--- /dev/null
+++ b/package/dante/dante.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=SOCKS v4 and v5 compatible proxy server and client
+Requires=network.target
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/default/dante
+PIDFile=/run/dante.pid
+ExecStart=/usr/sbin/sockd -D -p /run/dante.pid $DAEMON_ARGS
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.8.1
