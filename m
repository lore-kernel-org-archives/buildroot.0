From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 29 May 2012 15:19:14 +0800
Subject: [Buildroot] [PATCH v3] busybox: install S41inetd and inetd.conf if
	inetd is enabled in busybox.
Message-ID: <1338275954-20596-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install S41inetd and inetd.conf if inetd is enabled in busybox.
Add telnetd to /etc/inetd.conf when inetd and telnetd are enabled.
Provide examples for /etc/inetd.conf when ftpd and tftpd are enabled.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
Changes for v3:
        Create a pidfile for inetd (asked by Arnout and Peter).
        For ftp and tftp service, provide examples instead of configurations.

Changes for v2:
        Update ftpd and tftpd configuration in inetd.conf
---
 package/busybox/S41inetd   |   30 ++++++++++++++++++++++++++++++
 package/busybox/busybox.mk |   32 ++++++++++++++++++++++++++++++++
 package/busybox/inetd.conf |    3 +++
 3 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/S41inetd
 create mode 100644 package/busybox/inetd.conf

diff --git a/package/busybox/S41inetd b/package/busybox/S41inetd
new file mode 100644
index 0000000..0f54e50
--- /dev/null
+++ b/package/busybox/S41inetd
@@ -0,0 +1,30 @@
+#!/bin/sh
+#
+# Starts the inetd daemon.
+#
+
+NAME=inetd
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+case "$1" in
+  start)
+	echo -n "Starting $NAME: "
+	start-stop-daemon -S -q -m -p $PIDFILE -b -x $DAEMON -- -f && echo "OK" || echo "Failed"
+	;;
+  stop)
+	echo -n "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE && echo "OK" || echo "Failed"
+	rm -f $PIDFILE
+	;;
+  restart|reload)
+	$0 stop
+	$0 start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1d988f8..7d9420c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -155,6 +155,36 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
+define BUSYBOX_INSTALL_INETD_SCRIPT
+	if grep -q CONFIG_INETD=y $(@D)/.config; then \
+		[ -f $(TARGET_DIR)/etc/init.d/S41inetd ] || \
+			$(INSTALL) -m 0755 -D package/busybox/S41inetd \
+				$(TARGET_DIR)/etc/init.d/S41inetd; \
+	else rm -f $(TARGET_DIR)/etc/init.d/S41inetd; fi
+endef
+define BUSYBOX_INSTALL_INETD_CONF
+	if grep -q CONFIG_INETD=y $(@D)/.config; then \
+		[ -f $(TARGET_DIR)/etc/inetd.conf ] || \
+			install -D -m 0644 package/busybox/inetd.conf \
+				$(TARGET_DIR)/etc/inetd.conf; \
+		if grep -q CONFIG_TELNETD=y $(@D)/.config; then \
+			if ! grep -q '^telnet' $(TARGET_DIR)/etc/inetd.conf; then \
+				echo -e "telnet\tstream\ttcp\tnowait\troot\ttelnetd\ttelnetd -i" >> $(TARGET_DIR)/etc/inetd.conf; \
+			fi; \
+		else $(SED) '/^telnet/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
+		if grep -q CONFIG_FTPD=y $(@D)/.config; then \
+			if ! grep -q '^ftp' $(TARGET_DIR)/etc/inetd.conf; then \
+				echo -e "#ftp\tstream\ttcp\tnowait\troot\tftpd\tftpd -w /files/to/serve" >> $(TARGET_DIR)/etc/inetd.conf; \
+			fi; \
+		else $(SED) '/^ftp/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
+		if grep -q CONFIG_TFTPD=y $(@D)/.config; then \
+			if ! grep -q '^tftp' $(TARGET_DIR)/etc/inetd.conf; then \
+				echo -e "#tftp\tdgram\tudp\tnowait\troot\ttftpd\ttftpd -l -c /files/to/serve" >> $(TARGET_DIR)/etc/inetd.conf; \
+			fi; \
+		else $(SED) '/^tftp/d' $(TARGET_DIR)/etc/inetd.conf; fi \
+	else rm -f $(TARGET_DIR)/etc/inetd.conf; fi
+endef
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -187,6 +217,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_INETD_SCRIPT)
+	$(BUSYBOX_INSTALL_INETD_CONF)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
diff --git a/package/busybox/inetd.conf b/package/busybox/inetd.conf
new file mode 100644
index 0000000..82cfa15
--- /dev/null
+++ b/package/busybox/inetd.conf
@@ -0,0 +1,3 @@
+# <service_name> <sock_type> <proto> <flags> <user> <server_path> <args>
+#
+
-- 
1.7.1
