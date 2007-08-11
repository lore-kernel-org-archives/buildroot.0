From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 15:01:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cpio
Message-ID: <20070811220114.5E082A6132@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 15:01:13 -0700 (Sat, 11 Aug 2007)
New Revision: 19442

Log:
Allow compression of cpio targets

Modified:
   trunk/buildroot/target/cpio/Config.in
   trunk/buildroot/target/cpio/cpioroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/Config.in
===================================================================
--- trunk/buildroot/target/cpio/Config.in	2007-08-11 21:58:53 UTC (rev 19441)
+++ trunk/buildroot/target/cpio/Config.in	2007-08-11 22:01:13 UTC (rev 19442)
@@ -5,3 +5,38 @@
 	help
 	  Build a cpio archive of the root filesystem
 
+choice
+        prompt "Compression method"
+        default BR2_TARGET_ROOTFS_CPIO_NONE
+        depends on BR2_TARGET_ROOTFS_CPIO
+        help
+          Select compressor for cpio filesystem of the root filesystem
+
+config BR2_TARGET_ROOTFS_CPIO_NONE
+        bool "no compression"
+        help
+         Do not compress the cpio filesystem.
+
+config BR2_TARGET_ROOTFS_CPIO_GZIP
+        bool "gzip"
+        help
+         Do compress the cpio filesystem with gzip.
+         Note that you either have to have gzip installed on your host
+         or select to build a gzip for your host. See the packages submenu.
+
+config BR2_TARGET_ROOTFS_CPIO_BZIP2
+        bool "bzip2"
+        help
+         Do compress the cpio filesystem with bzip2.
+         Note that you either have to have bzip2 installed on your host
+         or select to build a bzip2 for your host. See the packages submenu.
+
+config BR2_TARGET_ROOTFS_CPIO_LZMA
+        bool "lzma"
+        help
+         Do compress the cpio filesystem with lzma.
+         Note that you either have to have lzma installed on your host
+         or select to build a lzma for your host. See the packages submenu.
+
+endchoice
+

Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2007-08-11 21:58:53 UTC (rev 19441)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2007-08-11 22:01:13 UTC (rev 19442)
@@ -4,13 +4,39 @@
 #
 #############################################################
 
-CPIO_TARGET:=$(IMAGE).cpio
+CPIO_BASE:=$(IMAGE).cpio
 
+CPIO_ROOTFS_COMPRESSOR:=
+CPIO_ROOTFS_COMPRESSOR_EXT:=
+CPIO_ROOTFS_COMPRESSOR_PREREQ:=
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_GZIP),y)
+CPIO_ROOTFS_COMPRESSOR:=gzip -9 -c
+CPIO_ROOTFS_COMPRESSOR_EXT:=gz
+#CPIO_ROOTFS_COMPRESSOR_PREREQ:= gzip-host
+endif
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_BZIP2),y)
+CPIO_ROOTFS_COMPRESSOR:=bzip2 -9 -c
+CPIO_ROOTFS_COMPRESSOR_EXT:=bz2
+#CPIO_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
+endif
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_LZMA),y)
+CPIO_ROOTFS_COMPRESSOR:=lzma -9 -c
+CPIO_ROOTFS_COMPRESSOR_EXT:=lzma
+CPIO_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
+endif
+
+ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
+CPIO_TARGET := $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT)
+else
+CPIO_TARGET := $(CPIO_BASE)
+endif
+
+
 cpioroot-init:
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
 
-cpioroot: host-fakeroot makedevs cpioroot-init
+$(CPIO_BASE): host-fakeroot makedevs cpioroot-init
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/info
@@ -18,20 +44,27 @@
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 endif
 	# Use fakeroot so tar believes the previous fakery
-	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_TARGET)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
-	#- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
+	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_BASE)" \
+		>> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	#- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 
+ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
+$(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT): $(CPIO_ROOTFS_COMPRESSOR_PREREQ) $(CPIO_BASE)
+	$(CPIO_ROOTFS_COMPRESSOR) $(CPIO_BASE) > $(CPIO_TARGET)
+endif
+
+cpioroot: $(CPIO_TARGET)
+
 cpioroot-source:
 
 cpioroot-clean:
