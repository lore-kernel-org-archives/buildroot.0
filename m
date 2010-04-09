From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:07:03 +0200
Subject: [Buildroot] [PATCH 25/44] target/: remove the COPYTO mess
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b605699f1f365c55d094c47737d3f5f7e38c1f61.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no need to provide options to copy the filesystem image after
the build. Just use 'cp' outside of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cpio/Config.in     |    9 ---------
 target/cpio/cpioroot.mk   |   10 ----------
 target/ext2/Config.in     |    8 --------
 target/ext2/ext2root.mk   |    6 ------
 target/jffs2/Config.in    |    6 ------
 target/jffs2/jffs2root.mk |    5 -----
 target/tar/Config.in      |   11 -----------
 target/tar/tarroot.mk     |    4 ----
 target/ubifs/Config.in    |    8 --------
 target/ubifs/ubifsroot.mk |    5 -----
 10 files changed, 0 insertions(+), 72 deletions(-)

diff --git a/target/cpio/Config.in b/target/cpio/Config.in
index 4ee1037..02fd00d 100644
--- a/target/cpio/Config.in
+++ b/target/cpio/Config.in
@@ -38,12 +38,3 @@ config BR2_TARGET_ROOTFS_CPIO_LZMA
 
 endchoice
 
-config BR2_TARGET_ROOTFS_CPIO_COPYTO
-	string "also copy the image to..."
-	depends on BR2_TARGET_ROOTFS_CPIO
-	default ""
-	help
-	  Copies the resulting image to a secondary location
-	  like a tftp server's root directory.
-	
-	  Example: $(IMAGE)-$(DATE).cpio$(CPIO_ROOTFS_COMPRESSOR_EXT)
diff --git a/target/cpio/cpioroot.mk b/target/cpio/cpioroot.mk
index 021847f..0984b72 100644
--- a/target/cpio/cpioroot.mk
+++ b/target/cpio/cpioroot.mk
@@ -29,8 +29,6 @@ else
 CPIO_TARGET := $(CPIO_BASE)
 endif
 
-ROOTFS_CPIO_COPYTO:=$(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_COPYTO))
-
 cpioroot-init:
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
@@ -52,18 +50,10 @@ endif
 	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-ifeq ($(CPIO_ROOTFS_COMPRESSOR),)
-ifneq ($(ROOTFS_CPIO_COPYTO),)
-	$(Q)cp -f $(CPIO_BASE) $(ROOTFS_CPIO_COPYTO)
-endif
-endif
 
 ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
 $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT): $(CPIO_ROOTFS_COMPRESSOR_PREREQ) $(CPIO_BASE)
 	$(CPIO_ROOTFS_COMPRESSOR) $(CPIO_BASE) > $(CPIO_TARGET)
-ifneq ($(ROOTFS_CPIO_COPYTO),)
-	$(Q)cp -f $(CPIO_BASE).$(CPIO_ROOTFS_COMPRESSOR_EXT) $(ROOTFS_CPIO_COPYTO).$(CPIO_ROOTFS_COMPRESSOR_EXT)
-endif
 endif
 
 #############################################################
diff --git a/target/ext2/Config.in b/target/ext2/Config.in
index 1b1dc8a..0047309 100644
--- a/target/ext2/Config.in
+++ b/target/ext2/Config.in
@@ -64,11 +64,3 @@ config BR2_TARGET_ROOTFS_EXT2_LZMA
 
 endchoice
 
-config BR2_TARGET_ROOTFS_EXT2_COPYTO
-	string "also copy the image to..."
-	depends on BR2_TARGET_ROOTFS_EXT2
-	default ""
-	help
-	  Copies the resulting image to a secondary location
-	  like a tftp server's root directory.
-
diff --git a/target/ext2/ext2root.mk b/target/ext2/ext2root.mk
index 6c8e02a..145b182 100644
--- a/target/ext2/ext2root.mk
+++ b/target/ext2/ext2root.mk
@@ -82,13 +82,7 @@ $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(E
 	$(EXT2_ROOTFS_COMPRESSOR) $(EXT2_BASE) > $(EXT2_TARGET)
 endif
 
-EXT2_COPYTO := $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_COPYTO))
-
 ext2root: $(EXT2_TARGET)
-	@ls -l $(EXT2_TARGET)
-ifneq ($(EXT2_COPYTO),)
-	@cp -f $(EXT2_TARGET) $(EXT2_COPYTO)
-endif
 
 #############################################################
 #
diff --git a/target/jffs2/Config.in b/target/jffs2/Config.in
index bf4ac60..a216a27 100644
--- a/target/jffs2/Config.in
+++ b/target/jffs2/Config.in
@@ -118,10 +118,4 @@ config BR2_TARGET_ROOTFS_JFFS2_OUTPUT
 	string "Output File"
 	default "$(IMAGE).jffs2"
 
-config BR2_TARGET_ROOTFS_JFFS2_COPYTO
-	string "also copy the image to..."
-	default ""
-	help
-	  Copies the resulting image to a secondary location.
-
 endif
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index 30ac86d..eea0e3a 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -74,12 +74,7 @@ ifeq ($(BR2_JFFS2_TARGET_SREC),y)
 	@ls -l $(JFFS2_TARGET).srec
 endif
 
-JFFS2_COPYTO := $(call qstrip,$(BR2_TARGET_ROOTFS_JFFS2_COPYTO))
-
 jffs2root: $(JFFS2_TARGET)
-ifneq ($(JFFS2_COPYTO),)
-	@cp -f $(JFFS2_TARGET) $(JFFS2_COPYTO)
-endif
 
 #############################################################
 #
diff --git a/target/tar/Config.in b/target/tar/Config.in
index ae02409..0adca79 100644
--- a/target/tar/Config.in
+++ b/target/tar/Config.in
@@ -45,14 +45,3 @@ config BR2_TARGET_ROOTFS_TAR_OPTIONS
 	help
 	  Any other flags you want to pass to tar
 	  Refer to tar --help for details
-
-config BR2_TARGET_ROOTFS_TAR_COPYTO
-	string "also copy the image to..."
-	depends on BR2_TARGET_ROOTFS_TAR
-	default ""
-	help
-	  Copies the resulting image to a secondary location
-	  like a tftp server's root directory.
-
-	  Example: $(IMAGE)-$(DATE).tar
-
diff --git a/target/tar/tarroot.mk b/target/tar/tarroot.mk
index d082672..cd01bc7 100644
--- a/target/tar/tarroot.mk
+++ b/target/tar/tarroot.mk
@@ -21,7 +21,6 @@ ifeq ($(BR2_TARGET_ROOTFS_TAR_LZMA),y)
 TAR_COMPRESSOR:=lzma -9 -c
 TAR_COMPRESSOR_EXT:=lzma
 endif
-ROOTFS_TAR_COPYTO:=$(call qstrip,$(BR2_TARGET_ROOTFS_TAR_COPYTO))
 
 tarroot: host-fakeroot makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
@@ -43,9 +42,6 @@ ifneq ($(TAR_COMPRESSOR),)
 	-rm -f $(TAR_TARGET).$()
 	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)
 endif
-ifneq ($(ROOTFS_TAR_COPYTO),)
-	$(Q)cp -f $(TAR_TARGET) $(ROOTFS_TAR_COPYTO)
-endif
 	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 #############################################################
diff --git a/target/ubifs/Config.in b/target/ubifs/Config.in
index 1ce1ab0..3222fea 100644
--- a/target/ubifs/Config.in
+++ b/target/ubifs/Config.in
@@ -91,11 +91,3 @@ config BR2_TARGET_ROOTFS_UBIFS_LZMA
 
 endchoice
 
-config BR2_TARGET_ROOTFS_UBIFS_COPYTO
-	string "also copy the image to..."
-	depends on BR2_TARGET_ROOTFS_UBIFS
-	default ""
-	help
-	  Copies the resulting image to a secondary location
-	  like a tftp server's root directory.
-
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index b48e10f..d0f3885 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -64,13 +64,8 @@ $(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT): $(UBIFS_ROOTFS_COMPRESSOR_PREREQ)
 	$(UBIFS_ROOTFS_COMPRESSOR) $(UBIFS_BASE) > $(UBIFS_TARGET)
 endif
 
-UBIFS_COPYTO := $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_COPYTO))
-
 ubifsroot: $(UBIFS_TARGET)
 	@ls -l $(UBIFS_TARGET)
-ifneq ($(UBIFS_COPYTO),)
-	@cp -f $(UBIFS_TARGET) $(UBIFS_COPYTO)
-endif
 
 #############################################################
 #
-- 
1.6.3.3
