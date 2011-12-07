From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Wed,  7 Dec 2011 18:19:10 +0800
Subject: [Buildroot] [PATCH] busybox: install S41inetd and inetd.conf if
	inetd applet is enabled
Message-ID: <1323253150-30575-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install S41inetd and inetd.conf if inetd is enabled in busybox.
Add ftpd to /etc/inetd.conf if if inetd and ftpd are enabled.
Add telnetd to /etc/inetd.conf if if inetd and telnetd are enabled.
Add tftpd to /etc/inetd.conf if if inetd and tftpd are enabled.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 package/busybox/S41inetd   |   27 +++++++++++++++++++++++++++
 package/busybox/busybox.mk |   32 ++++++++++++++++++++++++++++++++
 package/busybox/inetd.conf |    2 ++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/S41inetd
 create mode 100644 package/busybox/inetd.conf

diff --git a/package/busybox/S41inetd b/package/busybox/S41inetd
new file mode 100644
index 0000000..cc288dd
--- /dev/null
+++ b/package/busybox/S41inetd
@@ -0,0 +1,27 @@
+#!/bin/sh
+#
+# Starts the inetd daemon.
+#
+
+NAME=inetd
+DAEMON=/usr/sbin/$NAME
+
+case "$1" in
+  start)
+	echo -n "Starting $NAME: "
+	start-stop-daemon -S -q -x $DAEMON && echo "OK" || echo "Failed"
+	;;
+  stop)
+	echo -n "Stopping $NAME: "
+	start-stop-daemon -K -q -n $NAME && echo "OK" || echo "Failed"
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
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d18b6d0..1c0d473 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -137,6 +137,36 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
 
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
+		if grep -q CONFIG_FTPD=y $(@D)/.config; then \
+			if ! grep -q '^ftp' $(TARGET_DIR)/etc/inetd.conf; then \
+				echo -e "ftp\tstream\ttcp\tnowait\troot\t/usr/sbin/ftpd\tftpd" >> $(TARGET_DIR)/etc/inetd.conf; \
+			fi; \
+		else $(SED) '/^ftp/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
+		if grep -q CONFIG_TELNETD=y $(@D)/.config; then \
+			if ! grep -q '^telnet' $(TARGET_DIR)/etc/inetd.conf; then \
+				echo -e "telnet\tstream\ttcp\tnowait\troot\t/usr/sbin/telnetd\ttelnetd -i" >> $(TARGET_DIR)/etc/inetd.conf; \
+			fi; \
+		else $(SED) '/^telnet/d' $(TARGET_DIR)/etc/inetd.conf; fi; \
+		if grep -q CONFIG_TFTPD=y $(@D)/.config; then \
+			if ! grep -q '^tftp' $(TARGET_DIR)/etc/inetd.conf; then \
+				echo -e "tftp\tdgram\tudp\tnowait\tnobody\t/usr/bin/tftpd\ttftpd" >> $(TARGET_DIR)/etc/inetd.conf; \
+			fi; \
+		else $(SED) '/^tftp/d' $(TARGET_DIR)/etc/inetd.conf; fi \
+	else rm -f $(TARGET_DIR)/etc/inetd.conf; fi
+endef
+
 # We do this here to avoid busting a modified .config in configure
 BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 
@@ -167,6 +197,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
+	$(BUSYBOX_INSTALL_INETD_SCRIPT)
+	$(BUSYBOX_INSTALL_INETD_CONF)
 endef
 
 define BUSYBOX_UNINSTALL_TARGET_CMDS
diff --git a/package/busybox/inetd.conf b/package/busybox/inetd.conf
new file mode 100644
index 0000000..36cebd5
--- /dev/null
+++ b/package/busybox/inetd.conf
@@ -0,0 +1,2 @@
+# <service_name> <sock_type> <proto> <flags> <user> <server_path> <args>
+#
-- 
1.7.1
