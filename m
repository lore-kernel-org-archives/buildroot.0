From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Feb 2014 11:06:05 +0100
Subject: [Buildroot] [PATCH 3/3] dmraid: Update init script
In-Reply-To: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1391508365-30961-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes init script to uses current FOO_INSTALL_INIT_SYSV hooks.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/dmraid/S20dmraid   | 31 +++++++++++++++++++++++++++++++
 package/dmraid/dmraid.init | 31 -------------------------------
 package/dmraid/dmraid.mk   |  8 ++++----
 3 files changed, 35 insertions(+), 35 deletions(-)
 create mode 100644 package/dmraid/S20dmraid
 delete mode 100644 package/dmraid/dmraid.init

diff --git a/package/dmraid/S20dmraid b/package/dmraid/S20dmraid
new file mode 100644
index 0000000..fd2ad9e
--- /dev/null
+++ b/package/dmraid/S20dmraid
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+set -e
+
+[ -x /usr/sbin/dmraid ] || exit 0
+
+# try to load module in case that hasn't been done yet
+modprobe dm-mod >/dev/null 2>&1
+
+case "$1" in
+	start|"")
+		echo "Setting up DMRAID devices..."
+		/usr/sbin/dmraid --activate yes --ignorelocking --verbose
+		;;
+
+	stop)
+		echo "Shutting down DMRAID devices... "
+		/usr/sbin/dmraid --activate no --ignorelocking --verbose
+		;;
+
+	restart|force-reload)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+
+	*)
+		echo "Usage: dmraid {start|stop|restart|force-reload}"
+		exit 1
+		;;
+esac
diff --git a/package/dmraid/dmraid.init b/package/dmraid/dmraid.init
deleted file mode 100644
index fd2ad9e..0000000
--- a/package/dmraid/dmraid.init
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/sh
-
-set -e
-
-[ -x /usr/sbin/dmraid ] || exit 0
-
-# try to load module in case that hasn't been done yet
-modprobe dm-mod >/dev/null 2>&1
-
-case "$1" in
-	start|"")
-		echo "Setting up DMRAID devices..."
-		/usr/sbin/dmraid --activate yes --ignorelocking --verbose
-		;;
-
-	stop)
-		echo "Shutting down DMRAID devices... "
-		/usr/sbin/dmraid --activate no --ignorelocking --verbose
-		;;
-
-	restart|force-reload)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
-
-	*)
-		echo "Usage: dmraid {start|stop|restart|force-reload}"
-		exit 1
-		;;
-esac
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 089e33a..412c903 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -15,10 +15,10 @@ DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 DMRAID_DEPENDENCIES = lvm2
 
-define DMRAID_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/S20dmraid
+define DMRAID_INSTALL_INIT_SYSV
+    [ -f $(TARGET_DIR)/etc/init.d/S20dmraid ] || \
+        $(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
+            $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
-DMRAID_POST_INSTALL_TARGET_HOOKS += DMRAID_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
-- 
1.8.5.3
