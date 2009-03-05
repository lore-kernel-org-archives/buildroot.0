From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 16:42:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/logrotate
Message-ID: <20090305164215.0B3EA7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 16:42:14 +0000 (Thu, 05 Mar 2009)
New Revision: 25551

Log:
logrotate: fix build with external toolchain

Modified:
   trunk/buildroot/package/logrotate/logrotate.mk


Changeset:
Modified: trunk/buildroot/package/logrotate/logrotate.mk
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.mk	2009-03-05 16:32:27 UTC (rev 25550)
+++ trunk/buildroot/package/logrotate/logrotate.mk	2009-03-05 16:42:14 UTC (rev 25551)
@@ -10,11 +10,11 @@
 
 $(LOGROTATE_DIR)/.source: $(DL_DIR)/$(LOGROTATE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LOGROTATE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ *.patch	
+	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ *.patch
 	touch $@
 
 $(LOGROTATE_DIR)/$(LOGROTATE_BINARY): $(LOGROTATE_DIR)/.source
-	$(MAKE) CC=$(TARGET_CC) -C $(LOGROTATE_DIR)
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(LOGROTATE_DIR)
 
 $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
 	$(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
