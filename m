From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:47:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20061214154751.3B4DB485E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:47:50 -0800 (Thu, 14 Dec 2006)
New Revision: 16929

Log:
- update the ext2 rootfs compression mechanism to allow for gzip, bzip2, lzma or none


Modified:
   trunk/buildroot/target/ext2/Config.in
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/Config.in
===================================================================
--- trunk/buildroot/target/ext2/Config.in	2006-12-14 15:41:29 UTC (rev 16928)
+++ trunk/buildroot/target/ext2/Config.in	2006-12-14 15:47:50 UTC (rev 16929)
@@ -29,17 +29,40 @@
 	depends on BR2_TARGET_ROOTFS_EXT2
 	default "$(IMAGE).ext2"
 
-config BR2_TARGET_ROOTFS_EXT2_GZ
-	bool "gzip the output file"
-	depends on 	BR2_TARGET_ROOTFS_EXT2
-	default n
+choice
+        prompt "Compression method"
+        default BR2_TARGET_ROOTFS_EXT2_NONE
+        depends on BR2_TARGET_ROOTFS_EXT2
+        help
+          Select compressor for ext2 filesystem of the root filesystem
 
+config BR2_TARGET_ROOTFS_EXT2_NONE
+        bool "no compression"
+        help
+         Do not compress the ext2 filesystem.
+
+config BR2_TARGET_ROOTFS_EXT2_GZIP
+        bool "gzip"
+        help
+         Do compress the ext2 filesystem with gzip.
+         Note that you either have to have gzip installed on your host
+         or select to build a gzip for your host. See the packages submenu.
+
+config BR2_TARGET_ROOTFS_EXT2_BZIP2
+        bool "bzip2"
+        help
+         Do compress the ext2 filesystem with bzip2.
+         Note that you either have to have bzip2 installed on your host
+         or select to build a bzip2 for your host. See the packages submenu.
+
 config BR2_TARGET_ROOTFS_EXT2_LZMA
-	bool "lzma the output file" 
-	depends on	BR2_TARGET_ROOTFS_EXT2 
-	select		BR2_PACKAGE_LZMA_HOST
-	default n
+        bool "lzma"
+        help
+         Do compress the ext2 filesystem with lzma.
+         Note that you either have to have lzma installed on your host
+         or select to build a lzma for your host. See the packages submenu.
 
+endchoice
 
 config BR2_TARGET_ROOTFS_EXT2_COPYTO
 	string "also copy the image to..."

Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-12-14 15:41:29 UTC (rev 16928)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-12-14 15:47:50 UTC (rev 16929)
@@ -59,17 +59,28 @@
 endif
 
 EXT2_BASE :=	$(subst ",,$(BR2_TARGET_ROOTFS_EXT2_OUTPUT))
-# " stupid syntax highlighting does not like unmatched quote from above line
+#")
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_GZ)),y)
-EXT2_TARGET := $(EXT2_BASE).gz
-else
 EXT2_TARGET := $(EXT2_BASE)
-endif
 
-ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_LZMA)),y)
-EXT2_TARGET := $(EXT2_BASE).lzma
+EXT2_ROOTFS_COMPRESSOR:=
+EXT2_ROOTFS_COMPRESSOR_EXT:=
+EXT2_ROOTFS_COMPRESSOR_PREREQ:=
+ifeq ($(BR2_TARGET_ROOTFS_EXT2_GZIP),y)
+EXT2_ROOTFS_COMPRESSOR:=gzip -9 -c
+EXT2_ROOTFS_COMPRESSOR_EXT:=gz
+#EXT2_ROOTFS_COMPRESSOR_PREREQ:= gzip-host
 endif
+ifeq ($(BR2_TARGET_ROOTFS_EXT2_BZIP2),y)
+EXT2_ROOTFS_COMPRESSOR:=bzip2 -9 -c
+EXT2_ROOTFS_COMPRESSOR_EXT:=bz2
+#EXT2_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
+endif
+ifeq ($(BR2_TARGET_ROOTFS_EXT2_LZMA),y)
+EXT2_ROOTFS_COMPRESSOR:=lzma -9 -c
+EXT2_ROOTFS_COMPRESSOR_EXT:=lzma
+EXT2_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
+endif
 
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
@@ -104,14 +115,13 @@
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 
-$(EXT2_BASE).gz: $(EXT2_BASE)
-	@gzip --best -fv $(EXT2_BASE)
+ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
+$(EXT2_TARGET).(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(EXT2_BASE)
+	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_TARGET) > $(EXT2_TARGET).$(EXT2_ROOTFS_COMPRESSOR_EXT)
+endif
 
-$(EXT2_BASE).lzma: lzma-host $(EXT2_BASE)
-	@$(STAGING_DIR)/bin/lzma -vc $(EXT2_BASE) > $(EXT2_BASE).lzma
-
 EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
-# " stupid syntax highlighting does not like unmatched quote from above line
+# "))
 
 ext2root: $(EXT2_TARGET)
 	@ls -l $(EXT2_TARGET)
