From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 25 Aug 2007 04:13:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cpio cramfs ext2
	initramfs jffs2 squashf etc...
Message-ID: <20070825111322.34FB4A682B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-25 04:13:20 -0700 (Sat, 25 Aug 2007)
New Revision: 19691

Log:
- workaround for broken external toolchains


Modified:
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -44,7 +44,7 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -56,7 +56,7 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -98,7 +98,7 @@
 	@test -d $(TARGET_DIR)/usr/share && \
 		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
 		true
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -22,7 +22,7 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/info
 endif
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -58,7 +58,7 @@
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -51,7 +51,7 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-08-24 21:46:24 UTC (rev 19690)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-08-25 11:13:20 UTC (rev 19691)
@@ -30,7 +30,7 @@
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
 endif
-	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
