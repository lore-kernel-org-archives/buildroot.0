From: andersen@uclibc.org <andersen@uclibc.org>
Date: Wed Jul 19 10:51:14 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/dmraid
Message-ID: <20060719175112.E7BB848698@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-19 10:51:12 -0700 (Wed, 19 Jul 2006)
New Revision: 15726

Log:
oops


Added:
   trunk/buildroot/package/dmraid/dmraid.init

Modified:
   trunk/buildroot/package/dmraid/dmraid.mk


Changeset:
Added: trunk/buildroot/package/dmraid/dmraid.init
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.init	2006-07-19 06:37:58 UTC (rev 15725)
+++ trunk/buildroot/package/dmraid/dmraid.init	2006-07-19 17:51:12 UTC (rev 15726)
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+# try to load module in case that hasn't been done yet
+modprobe dm-mod >/dev/null 2>&1
+
+set -e
+
+[ -x /sbin/dmraid ] || exit 0
+
+case "$1" in
+	start|"")
+		echo "Setting up DMRAID devices..."
+		/sbin/dmraid --activate yes --ignorelocking --verbose
+		;;
+
+	stop)
+		echo "Shutting down DMRAID devices... "
+		/sbin/dmraid --activate no --ignorelocking --verbose
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

Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2006-07-19 06:37:58 UTC (rev 15725)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2006-07-19 17:51:12 UTC (rev 15726)
@@ -18,7 +18,7 @@
 
 $(DMRAID_DIR)/.unpacked: $(DL_DIR)/$(DMRAID_SOURCE)
 	$(DMRAID_CAT) $(DL_DIR)/$(DMRAID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	$(SOURCE_DIR)/patch-kernel.sh $(DMRAID_DIR) $(SOURCE_DIR) dmraid\*.patch
+	toolchain/patch-kernel.sh $(DMRAID_DIR) package/dmraid \*.patch
 	touch $(DMRAID_DIR)/.unpacked
 
 $(DMRAID_DIR)/.configured: $(DMRAID_DIR)/.unpacked
@@ -44,7 +44,7 @@
 
 $(DMRAID_TARGET_BINARY): $(DMRAID_DIR)/tools/$(DMRAID_BINARY)
 	$(INSTALL) -m 0755 $? $@
-	$(INSTALL) -m 0755 $(SOURCE_DIR)/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid
+	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid
 
 dmraid: uclibc dm $(DMRAID_TARGET_BINARY)
 
