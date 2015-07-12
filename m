From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 20:44:58 +0200
Subject: [Buildroot] [PATCH v5 3/3] package: busybox: Collocate ntp startup
	script
In-Reply-To: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436726698-17776-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of having an NTP startup scripts for NTPD, Busybox's NTPD,
OpenNTPD, have only one available in Busybox and make the rest symlink
to it.

The configuration file is also common.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/busybox/S49ntp     | 29 +++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 11 +++++++++++
 package/busybox/ntp.conf   |  4 ++++
 package/ntp/S49ntp         | 39 +--------------------------------------
 package/ntp/ntp.conf       |  1 +
 package/ntp/ntp.mk         |  2 +-
 package/ntp/ntpd.etc.conf  |  8 --------
 package/openntpd/S49ntp    | 26 +-------------------------
 8 files changed, 48 insertions(+), 72 deletions(-)
 create mode 100644 package/busybox/S49ntp
 create mode 100644 package/busybox/ntp.conf
 mode change 100755 => 120000 package/ntp/S49ntp
 create mode 120000 package/ntp/ntp.conf
 delete mode 100644 package/ntp/ntpd.etc.conf
 mode change 100755 => 120000 package/openntpd/S49ntp

diff --git a/package/busybox/S49ntp b/package/busybox/S49ntp
new file mode 100644
index 0000000..50b2aba
--- /dev/null
+++ b/package/busybox/S49ntp
@@ -0,0 +1,29 @@
+#! /bin/sh
+
+NAME=ntpd
+
+[ -x /usr/sbin/${NAME} ] || exit 0
+[ -f /etc/${NAME}.conf ] || exit 0
+
+case "$1" in
+        start)
+                echo -n "Starting ${NAME}: "
+                start-stop-daemon -S -x /usr/sbin/${NAME} -- -p /run/${NAME}.pid
+                [ $? = 0 ] && echo "OK" || echo "FAIL"
+                ;;
+        stop)
+                echo -n "Stopping ${NAME}: "
+                start-stop-daemon -K -q -p /run/${NAME}.pid
+                [ $? = 0 ] && echo "OK" || echo "FAIL"
+                ;;
+        restart)
+                "$0" stop
+                sleep 1
+                "$0" start
+                ;;
+        *)
+                echo "Usage: $0 {start|stop|restart}"
+                ;;
+esac
+
+exit 0
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d722e02..9998bf4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -135,6 +135,17 @@ define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	fi
 endef
 
+define BUSYBOX_INSTALL_NTPD_SCRIPT
+	if grep -q CONFIG_NTPD=y $(@D)/.config; then \
+		$(INSTALL) -m 0755 -D package/busybox/S49ntp \
+			$(TARGET_DIR)/etc/init.d/S49ntp; \
+	fi
+	if grep -q CONFIG_FEATURE_NTPD_CONF=y $(@D)/.config; then \
+		$(INSTALL) -m 0644 -D package/busybox/ntp.conf \
+			$(TARGET_DIR)/etc/ntp.conf; \
+	fi
+endef
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_SET_INIT
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
diff --git a/package/busybox/ntp.conf b/package/busybox/ntp.conf
new file mode 100644
index 0000000..1e8afc5
--- /dev/null
+++ b/package/busybox/ntp.conf
@@ -0,0 +1,4 @@
+server 0.pool.ntp.org
+server 1.pool.ntp.org
+server 3.pool.ntp.org
+server 4.pool.ntp.org
diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
deleted file mode 100755
index 171c200..0000000
--- a/package/ntp/S49ntp
+++ /dev/null
@@ -1,38 +0,0 @@
-#! /bin/sh
-
-NAME=ntpd
-DAEMON=/usr/sbin/$NAME
-
-# Gracefully exit if the package has been removed.
-test -x $DAEMON || exit 0
-
-# Read config file if it is present.
-if [ -r /etc/default/$NAME ]
-then
-  . /etc/default/$NAME
-fi
-
-case "$1" in
-  start)
-    echo -n "Starting $NAME: "
-    start-stop-daemon -S -q -x $DAEMON -- -g
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-  stop)
-    echo -n "Stopping $NAME: "
-    start-stop-daemon -K -q -n $NAME
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-  restart|reload)
-    echo "Restarting $NAME: "
-    $0 stop
-    sleep 1
-    $0 start
-    ;;
-  *)
-    echo "Usage: $0 {start|stop|restart|reload}" >&2
-    exit 1
-    ;;
-esac
-
-exit 0
diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
new file mode 120000
index 0000000..2062ffd
--- /dev/null
+++ b/package/ntp/S49ntp
@@ -0,0 +1 @@
+../busybox/S49ntp
\ No newline at end of file
diff --git a/package/ntp/ntp.conf b/package/ntp/ntp.conf
new file mode 120000
index 0000000..8dbf833
--- /dev/null
+++ b/package/ntp/ntp.conf
@@ -0,0 +1 @@
+../busybox/ntp.conf
\ No newline at end of file
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 5997247..14bbcc7 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -53,7 +53,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 define NTP_INSTALL_TARGET_CMDS
 	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
-	$(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
+	$(INSTALL) -m 644 package/ntp/ntp.conf $(TARGET_DIR)/etc/ntp.conf
 endef
 
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
diff --git a/package/ntp/ntpd.etc.conf b/package/ntp/ntpd.etc.conf
deleted file mode 100644
index 543c8ff..0000000
--- a/package/ntp/ntpd.etc.conf
+++ /dev/null
@@ -1,8 +0,0 @@
-server 0.pool.ntp.org iburst
-server 1.pool.ntp.org iburst
-
-# Allow only time queries, at a limited rate, sending KoD when in excess.
-# Allow all local queries (IPv4, IPv6)
-restrict default nomodify nopeer noquery limited kod
-restrict 127.0.0.1
-restrict [::1]
diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
deleted file mode 100755
index 2654f82..0000000
--- a/package/openntpd/S49ntp
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-[ -x /usr/sbin/ntpd ] || exit 0
-[ -f /etc/ntpd.conf ] || exit 0
-
-case "$1" in
-	start)
-		echo -n "Starting openntpd: "
-		start-stop-daemon -S -x /usr/sbin/ntpd -- -p /run/ntpd.pid
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		echo -n "Stopping openntpd: "
-		start-stop-daemon -K -q -p /run/ntpd.pid
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	restart)
-		"$0" stop
-		sleep 1
-		"$0" start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		;;
-esac
diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
new file mode 120000
index 0000000..2062ffd
--- /dev/null
+++ b/package/openntpd/S49ntp
@@ -0,0 +1 @@
+../busybox/S49ntp
\ No newline at end of file
-- 
2.1.4
