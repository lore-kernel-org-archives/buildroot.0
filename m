From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 07:32:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: cloop cpio cramfs
	ext2 initramfs jffs2 s etc...
Message-ID: <20070821143239.C7515A5D29@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 07:32:38 -0700 (Tue, 21 Aug 2007)
New Revision: 19618

Log:
- start to use BR2_HAVE_MANPAGES and BR2_HAVE_INFOPAGES
- always error out if ldconfig for the target fails (was inconsistent..)


Modified:
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/cloop/cloop.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -75,9 +75,13 @@
 
 clooproot: cloop check-tools $(IMAGE).cramfs ### cramfsroot
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
+endif
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	### $(CLOOP_DIR)/create_compressed_fs -q -D target/default/device_table.txt $(TARGET_DIR) $(CLOOP_TARGET)
 	## mkisofs -r $(TARGET_DIR) | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -38,9 +38,13 @@
 
 $(CPIO_BASE): host-fakeroot makedevs cpioroot-init
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
-	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+endif
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -50,9 +50,13 @@
 cramfsroot: host-fakeroot makedevs cramfs
 	#- at find $(TARGET_DIR)/lib -type f -name \*.so\* | xargs $(STRIP) --strip-unneeded 2>/dev/null || true;
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
-	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+endif
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -88,13 +88,17 @@
 
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
+endif
 	@test -d $(TARGET_DIR)/usr/share && \
 		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
 		true
-	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -16,9 +16,13 @@
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
 	-find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/info
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+endif
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -50,11 +50,15 @@
 #
 $(JFFS2_TARGET): host-fakeroot makedevs mtd-host
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
+endif
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -45,8 +45,12 @@
 
 squashfsroot: host-fakeroot makedevs squashfs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
+endif
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-08-21 14:27:57 UTC (rev 19617)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-08-21 14:32:38 UTC (rev 19618)
@@ -24,8 +24,12 @@
 
 tarroot: host-fakeroot makedevs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+ifneq ($(BR2_HAVE_MANPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
 	@rm -rf $(TARGET_DIR)/usr/info
+endif
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
