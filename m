From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  8 Aug 2007 07:58:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package target/cpio
	target/cramfs target etc...
Message-ID: <20070808145848.AFCADA6112@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-08-08 07:58:47 -0700 (Wed, 08 Aug 2007)
New Revision: 19418

Log:
Use cross ldconfig instead of host version

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/package/Makefile.in	2007-08-08 14:58:47 UTC (rev 19418)
@@ -131,6 +131,7 @@
 TARGET_CC=$(TARGET_CROSS)gcc
 TARGET_CXX=$(TARGET_CROSS)g++
 TARGET_RANLIB=$(TARGET_CROSS)ranlib
+TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
 INSTALL=/usr/bin/install
 ifeq ($(BR2_STRIP_strip),y)
 STRIP=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-08-08 14:58:47 UTC (rev 19418)
@@ -14,7 +14,7 @@
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/info
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-08-08 14:58:47 UTC (rev 19418)
@@ -52,7 +52,7 @@
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/info
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-08-08 14:58:47 UTC (rev 19418)
@@ -94,7 +94,7 @@
 	@test -d $(TARGET_DIR)/usr/share && \
 		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
 		true
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-08 14:58:47 UTC (rev 19418)
@@ -54,7 +54,7 @@
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-08 14:58:47 UTC (rev 19418)
@@ -47,7 +47,7 @@
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/info
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-08-07 17:47:03 UTC (rev 19417)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-08-08 14:58:47 UTC (rev 19418)
@@ -26,7 +26,7 @@
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/info
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
