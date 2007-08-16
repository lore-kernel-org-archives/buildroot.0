From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 16 Aug 2007 11:19:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/at
	package/ltp-testsuite packag etc...
Message-ID: <20070816181943.51DFDA5D40@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-16 11:19:42 -0700 (Thu, 16 Aug 2007)
New Revision: 19532

Log:
Move fakeroot temps from STAGING_DIR to PROJECT_BUILD_DIR

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/target/cpio/cpioroot.mk
   trunk/buildroot/target/cramfs/cramfs.mk
   trunk/buildroot/target/ext2/ext2root.mk
   trunk/buildroot/target/initramfs/initramfs.mk
   trunk/buildroot/target/iso9660/iso9660.mk
   trunk/buildroot/target/jffs2/jffs2root.mk
   trunk/buildroot/target/squashfs/squashfsroot.mk
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/Makefile	2007-08-16 18:19:42 UTC (rev 19532)
@@ -260,7 +260,7 @@
 $(TARGET_DIR):	$(PROJECT_BUILD_DIR)/.root
 
 erase-fakeroots:
-	rm -f $(STAGING_DIR)/.fakeroot*
+	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 

Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/package/at/at.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -49,8 +49,8 @@
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root ' \
 		'$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
-		> $(STAGING_DIR)/.fakeroot.at
-	echo 'rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at' >> $(STAGING_DIR)/.fakeroot.at
+		> $(PROJECT_BUILD_DIR)/.fakeroot.at
+	echo 'rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/doc/at' >> $(PROJECT_BUILD_DIR)/.fakeroot.at
 	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
 
 at: uclibc host-fakeroot $(TARGET_DIR)/$(AT_TARGET_SCRIPT)

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -47,7 +47,7 @@
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) ' \
 			'-C $(LTP_TESTSUITE_DIR) install' \
-			> $(STAGING_DIR)/.fakeroot.ltp
+			> $(PROJECT_BUILD_DIR)/.fakeroot.ltp
 	touch $@
 
 ltp-testsuite: uclibc host-fakeroot $(LTP_TESTSUITE_DIR)/.installed

Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -59,7 +59,7 @@
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD)	+= usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD)	+= usr/sbin/rpc.rquotad
 
-$(STAGING_DIR)/.fakeroot.nfs-utils: $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
+$(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils: $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE) prefix=$(TARGET_DIR)/usr statedir=$(TARGET_DIR)/var/lib/nfs $(TARGET_CONFIGURE_OPTS) -C $(NFS_UTILS_DIR) install' > $@
 	echo 'rm -f $(TARGET_DIR)/usr/bin/event_rpcgen.py $(TARGET_DIR)/usr/sbin/nhfs* $(TARGET_DIR)/usr/sbin/nfsstat $(TARGET_DIR)/usr/sbin/showmount' >> $@
@@ -70,7 +70,7 @@
 	echo "file; done" >> $@
 	echo 'rm -rf $(TARGET_DIR)/var/lib/nfs' >> $@
 
-$(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY): $(STAGING_DIR)/.fakeroot.nfs-utils
+$(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY): $(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils
 	touch -c $@
 
 nfs-utils: uclibc host-fakeroot $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
@@ -81,7 +81,7 @@
 		rm -f $(TARGET_DIR)/$$file; \
 	done
 	-$(MAKE) -C $(NFS_UTILS_DIR) clean
-	rm -f $(STAGING_DIR)/.fakeroot.nfs-utils
+	rm -f $(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils
 
 nfs-utils-dirclean:
 	rm -rf $(NFS_UTILS_DIR)

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -42,21 +42,21 @@
 	@rm -rf $(TARGET_DIR)/usr/info
 	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 endif
 	# Use fakeroot so tar believes the previous fakery
 	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_BASE)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	#- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	#- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 
 ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
 $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT): $(CPIO_ROOTFS_COMPRESSOR_PREREQ) $(CPIO_BASE)

Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -54,21 +54,21 @@
 	@rm -rf $(TARGET_DIR)/usr/info
 	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 endif
 	# Use fakeroot so mkcramfs believes the previous fakery
 	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_ENDIANNESS) " \
-		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 
 cramfsroot-source: cramfs-source
 

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -96,14 +96,14 @@
 		true
 	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
 	# Use fakeroot so genext2fs believes the previous fakery
 ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
@@ -115,14 +115,14 @@
 	set -x; \
 	echo "$(GENEXT2_DIR)/genext2fs -b $$GENEXT2_SIZE " \
 		"-N $$GENEXT2_INODES -d $(TARGET_DIR) " \
-		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 else
 	echo "$(GENEXT2_DIR)/genext2fs -d $(TARGET_DIR) " \
-		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 
 ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
 $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(EXT2_BASE)

Modified: trunk/buildroot/target/initramfs/initramfs.mk
===================================================================
--- trunk/buildroot/target/initramfs/initramfs.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/initramfs/initramfs.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -20,19 +20,19 @@
 	rm -rf $(TARGET_DIR)/usr/info
 	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot so gen_initramfs_list.sh  believes the previous fakery
 	echo "$(CONFIG_SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	-rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	-rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 initramfs-source:
 

Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -62,17 +62,17 @@
 	cp $(LINUX_KERNEL) $(ISO9660_TARGET_DIR)/kernel
 	cp $(EXT2_TARGET) $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 	# Use fakeroot so mkisofs believes the previous fakery
 	echo "$(MKISOFS_TARGET) -R -b boot/grub/stage2_eltorito -no-emul-boot " \
 		"-boot-load-size 4 -boot-info-table -o $(ISO9660_TARGET) $(ISO9660_TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 
 iso9660root: $(ISO9660_TARGET)
 	echo $(ISO9660_TARGET)

Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -56,21 +56,21 @@
 	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	-$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
 	# Use fakeroot so mkfs.jffs2 believes the previous fakery
 	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	@ls -l $(JFFS2_TARGET)
 ifeq ($(BR2_JFFS2_TARGET_SREC),y)
 	$(TARGET_CROSS)objcopy -I binary -O srec --adjust-vma 0xa1000000 $(JFFS2_TARGET) $(JFFS2_TARGET).srec

Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -49,23 +49,23 @@
 	@rm -rf $(TARGET_DIR)/usr/info
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 endif
 	# Use fakeroot so mksquashfs believes the previous fakery
 	echo "$(SQUASHFS_DIR)/squashfs-tools/mksquashfs " \
 		    "$(TARGET_DIR) $(SQUASHFS_TARGET) " \
 		    "-noappend $(SQUASHFS_ENDIANNESS)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 
 squashfsroot-source: squashfs-source
 

Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2007-08-16 18:17:39 UTC (rev 19531)
+++ trunk/buildroot/target/tar/tarroot.mk	2007-08-16 18:19:42 UTC (rev 19532)
@@ -28,25 +28,25 @@
 	@rm -rf $(TARGET_DIR)/usr/info
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
+	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 endif
 	# Use fakeroot so tar believes the previous fakery
 	echo "tar -c$(TAR_OPTS)f $(TAR_TARGET) -C $(TARGET_DIR) ." \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TAR_COMPRESSOR),)
 	-rm -f $(TAR_TARGET).$()
 	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)
 endif
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 tarroot-source:
 
