From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 22:12:15 +0200
Subject: [Buildroot] [PATCH] busybox: Add NTP startup script
Message-ID: <1436731935-25223-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/busybox/S49ntp        | 25 +++++++++++++++++++++++++
 package/busybox/busybox.mk    | 10 ++++++++++
 package/busybox/ntpd.etc.conf |  4 ++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/busybox/S49ntp
 create mode 100644 package/busybox/ntpd.etc.conf

diff --git a/package/busybox/S49ntp b/package/busybox/S49ntp
new file mode 100644
index 0000000..61dbb92
--- /dev/null
+++ b/package/busybox/S49ntp
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+[ -x /usr/sbin/ntpd ] || exit 0
+[ -f /etc/ntpd.conf ] || exit 0
+
+case "$1" in
+	start)
+		echo -n "Starting ntpd: "
+		start-stop-daemon -S -x /usr/sbin/ntpd -- -l
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo -n "Stopping ntpd: "
+		start-stop-daemon -K -q -x /usr/sbin/ntpd
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart)
+		"$0" stop
+		sleep 1
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fbbfcbc..4afebc3 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -126,6 +126,15 @@ define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
 endef
 endif
 
+define BUSYBOX_INSTALL_NTP_SCRIPT
+	if grep -q CONFIG_NTPD=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D package/busybox/S49ntp \
+			$(TARGET_DIR)/etc/init.d/S49ntp; \
+		$(INSTALL) -m 0755 -D package/busybox/ntpd.etc.conf \
+			$(TARGET_DIR)/etc/ntp.conf; \
+	fi
+endef
+
 define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	if grep -q CONFIG_UDHCPC=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
@@ -204,6 +213,7 @@ endef
 define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
 	$(BUSYBOX_INSTALL_INITTAB)
+	$(BUSYBOX_INSTALL_NTP_SCRIPT)
 	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
diff --git a/package/busybox/ntpd.etc.conf b/package/busybox/ntpd.etc.conf
new file mode 100644
index 0000000..1e8afc5
--- /dev/null
+++ b/package/busybox/ntpd.etc.conf
@@ -0,0 +1,4 @@
+server 0.pool.ntp.org
+server 1.pool.ntp.org
+server 3.pool.ntp.org
+server 4.pool.ntp.org
-- 
2.1.4
