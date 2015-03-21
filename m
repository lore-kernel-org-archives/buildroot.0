From: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 21 Mar 2015 20:30:52 +0200
Subject: [Buildroot] [RFC 06/11] ptp: new init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <ec16418e4be650aaaae82b03126d8b19c25791be.1426960081.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typical package: a simple foreground daemon.
---
 package/ptpd/S65ptpd  | 29 -----------------------------
 package/ptpd/ptpd.mk  |  5 -----
 package/ptpd/ptpd.run |  1 +
 3 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100755 package/ptpd/S65ptpd
 create mode 100644 package/ptpd/ptpd.run

diff --git a/package/ptpd/S65ptpd b/package/ptpd/S65ptpd
deleted file mode 100755
index 4206c5e..0000000
--- a/package/ptpd/S65ptpd
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-#
-# Start ptpd
-#
-
-case "$1" in
-  start)
-	echo -n "Starting ptpd: "
-	start-stop-daemon -S -q -x /usr/sbin/ptpd -- -S
-	if [ $? != 0 ]; then
-		echo "FAILED"
-		exit 1
-	else
-		echo "OK"
-	fi
-	;;
-  stop)
-	echo -n "Stopping ptpd: "
-	start-stop-daemon -K -q -x /usr/sbin/ptpd
-	echo "OK"
-	;;
-  restart|reload)
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/ptpd/ptpd.mk b/package/ptpd/ptpd.mk
index ac9ab98..b08a5db 100644
--- a/package/ptpd/ptpd.mk
+++ b/package/ptpd/ptpd.mk
@@ -17,9 +17,4 @@ define PTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/src/ptpd $(TARGET_DIR)/usr/sbin/ptpd
 endef
 
-define PTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/ptpd/S65ptpd \
-		$(TARGET_DIR)/etc/init.d/S65ptpd
-endef
-
 $(eval $(generic-package))
diff --git a/package/ptpd/ptpd.run b/package/ptpd/ptpd.run
new file mode 100644
index 0000000..bf391c1
--- /dev/null
+++ b/package/ptpd/ptpd.run
@@ -0,0 +1 @@
+exec /usr/sbin/ptpd -c -S
-- 
2.0.3
