From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 21:04:31 +0000 (UTC)
Subject: [Buildroot] svn commit: [26020] trunk/buildroot: target/cloop
	target/cpio target/cramfs etc...
Message-ID: <20090407210431.8D732768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 21:04:31 +0000 (Tue, 07 Apr 2009)
New Revision: 26020

Log:
Makefile: add target-finalize for common filesystem cleanup

And remove from each rootfs variant.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/cloop/cloop.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/romfs/romfs.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk
   trunk/buildroot/target/ubifs/ubifsroot.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/Makefile	2009-04-07 21:04:31 UTC (rev 26020)
@@ -262,7 +262,7 @@
 
 include package/*/*.mk
 
-TARGETS+=target-devfiles
+TARGETS+=target-finalize
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
@@ -343,7 +343,7 @@
 erase-fakeroots:
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
-target-devfiles:
+target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
@@ -351,6 +351,14 @@
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -delete
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -delete
 endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
+endif
+	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(PROJECT_BUILD_DIR)/locales.nopurge

Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/cloop/cloop.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -63,17 +63,6 @@
 ### Note: target/default/device_table.txt is not yet supported! ck
 # the quickfix is to use sudo to mount the previous created cramroot
 check-tools:
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-	@rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-	@rm -rf $(TARGET_DIR)/usr/share/info
-endif
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	which mkisofs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	- which symlinks && symlinks -r $(TARGET_DIR)
 
 $(IMAGE).cramfs: cramfsroot

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -40,14 +40,6 @@
 	ln -s sbin/init $(TARGET_DIR)/init
 
 $(CPIO_BASE): host-fakeroot makedevs cpioroot-init
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -52,15 +52,6 @@
 CRAMFS_TARGET=$(IMAGE).cramfs
 
 cramfsroot: host-fakeroot makedevs cramfs
-	#- at find $(TARGET_DIR)/lib -type f -name \*.so\* | xargs $(STRIPCMD) --strip-unneeded 2>/dev/null || true
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/ext2/ext2root.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -87,18 +87,6 @@
 endif
 
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-	@rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	@test -d $(TARGET_DIR)/usr/share && \
-		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
-		true
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -17,14 +17,6 @@
 $(INITRAMFS_TARGET) initramfs: host-fakeroot makedevs
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
-	-find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -46,16 +46,6 @@
 # just built.
 #
 $(JFFS2_TARGET): host-fakeroot makedevs mtd-host
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-	@rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/romfs/romfs.mk
===================================================================
--- trunk/buildroot/target/romfs/romfs.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/romfs/romfs.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -37,14 +37,6 @@
 ROMFS_TARGET=$(IMAGE).romfs
 
 romfsroot: host-fakeroot makedevs romfs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -48,14 +48,6 @@
 SQUASHFS_TARGET:=$(IMAGE).squashfs
 
 squashfsroot: host-fakeroot makedevs squashfs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/tar/tarroot.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -25,14 +25,6 @@
 # "))
 
 tarroot: host-fakeroot makedevs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000

Modified: trunk/buildroot/target/ubifs/ubifsroot.mk
===================================================================
--- trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-07 21:04:23 UTC (rev 26019)
+++ trunk/buildroot/target/ubifs/ubifsroot.mk	2009-04-07 21:04:31 UTC (rev 26020)
@@ -77,18 +77,6 @@
 endif
 
 $(UBIFS_BASE): host-fakeroot makedevs mkfs.ubifs
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/man
-	@rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	@rm -rf $(TARGET_DIR)/usr/info
-endif
-	@test -d $(TARGET_DIR)/usr/share && \
-		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share || \
-		true
-	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
