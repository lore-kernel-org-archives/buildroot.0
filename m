From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Tue, 24 Feb 2015 00:39:22 +0100
Subject: [Buildroot] [PATCH 1/2] minidlna: add init script for sysv and
	systemd
Message-ID: <1424734763-23491-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 package/minidlna/S60minidlnad      | 38 ++++++++++++++++++++++++++++++++++++++
 package/minidlna/minidlna.mk       | 15 +++++++++++++++
 package/minidlna/minidlnad.service | 11 +++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 package/minidlna/S60minidlnad
 create mode 100644 package/minidlna/minidlnad.service

diff --git a/package/minidlna/S60minidlnad b/package/minidlna/S60minidlnad
new file mode 100644
index 0000000..0cb8ea6
--- /dev/null
+++ b/package/minidlna/S60minidlnad
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# minidlnad        Starts minidlnad.
+#
+
+start() {
+	echo -n "Starting minidlna: "
+	umask 077
+	start-stop-daemon -S -q -p /var/run/minidlna/minidlna.pid \
+		--exec /usr/sbin/minidlnad
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping minidlna: "
+	start-stop-daemon -K -q -p /var/run/minidlna/minidlna.pid
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
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index bcbe5fa..1ff76e3 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -24,4 +24,19 @@ MINIDLNA_CONF_OPTS = \
 	--disable-static
 endif
 
+define MINIDLNA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/minidlna/S60minidlnad \
+		$(TARGET_DIR)/etc/init.d/S60minidlnad
+endef
+
+define MINIDLNA_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
+		$(TARGET_DIR)/lib/systemd/system/minidlnad.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../minidlnad.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/minidlnad.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/minidlna/minidlnad.service b/package/minidlna/minidlnad.service
new file mode 100644
index 0000000..f69476b
--- /dev/null
+++ b/package/minidlna/minidlnad.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=minidlna server
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/minidlnad
+PIDFile=/var/run/minidlna/minidlna.pid
+
+[Install]
+WantedBy=multi-user.target
-- 
2.3.0
