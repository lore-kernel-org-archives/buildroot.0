From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/ubifs: cleanup, unbroken
Message-ID: <20100409142127.90C5A20E5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58a02b1e43c79543c3c9f46ad88ef68cc5cc70b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use package/mtd to build the host mtd-utils, which contains
mkfs.ubifs. Remove dependency on BR2_HOST_FAKEROOT.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/ubifs/Config.in    |    2 -
 target/ubifs/ubifsroot.mk |   50 +++-----------------------------------------
 2 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/target/ubifs/Config.in b/target/ubifs/Config.in
index 886c34b..1ce1ab0 100644
--- a/target/ubifs/Config.in
+++ b/target/ubifs/Config.in
@@ -1,7 +1,5 @@
 config BR2_TARGET_ROOTFS_UBIFS
 	bool "ubifs root filesystem"
-	depends on BROKEN # upstream git gone, should use mtd-utils
-	select BR2_HOST_FAKEROOT
 	help
 	  Build a ubifs root filesystem
 
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index e73d4f9..b48e10f 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -1,37 +1,5 @@
 #############################################################
 #
-# mkfs.ubifs to build to target ubifs filesystems
-#
-#############################################################
-#MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
-#MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_VERSION=v0.4
-MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
-MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
-MKFS_UBIFS_CAT:=$(ZCAT)
-MKFS_UBIFS_NAME:=mkfs.ubifs
-
-$(DL_DIR)/$(MKFS_UBIFS_SOURCE):
-	$(WGET) -O $(DL_DIR)/$(MKFS_UBIFS_SOURCE) "$(MKFS_UBIFS_URL)"
-
-$(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MKFS_UBIFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	mv $(BUILD_DIR)/$(MKFS_UBIFS_NAME) $(MKFS_UBIFS_DIR)
-	toolchain/patch-kernel.sh $(MKFS_UBIFS_DIR) target/ubifs/ mkfs-ubifs-\*.patch
-	touch $@
-
-$(MKFS_UBIFS_DIR)/mkfs.ubifs: $(MKFS_UBIFS_DIR)/.unpacked
-	$(MAKE) -C $(MKFS_UBIFS_DIR)
-	touch -c $@
-
-mkfs.ubifs-dirclean:
-	rm -rf $(MKFS_UBIFS_DIR)
-
-mkfs.ubifs: $(MKFS_UBIFS_DIR)/mkfs.ubifs
-
-#############################################################
-#
 # Build the ubifs root filesystem image
 #
 #############################################################
@@ -56,17 +24,15 @@ UBIFS_ROOTFS_COMPRESSOR_PREREQ:=
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_GZIP),y)
 UBIFS_ROOTFS_COMPRESSOR:=gzip -9 -c
 UBIFS_ROOTFS_COMPRESSOR_EXT:=gz
-#UBIFS_ROOTFS_COMPRESSOR_PREREQ:= gzip-host
 endif
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_BZIP2),y)
 UBIFS_ROOTFS_COMPRESSOR:=bzip2 -9 -c
 UBIFS_ROOTFS_COMPRESSOR_EXT:=bz2
-#UBIFS_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
 endif
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_LZMA),y)
-UBIFS_ROOTFS_COMPRESSOR:=lzma -9 -c
+UBIFS_ROOTFS_COMPRESSOR:=$(LZMA) -9 -c
 UBIFS_ROOTFS_COMPRESSOR_EXT:=lzma
-UBIFS_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
+UBIFS_ROOTFS_COMPRESSOR_PREREQ:= host-lzma
 endif
 
 ifneq ($(UBIFS_ROOTFS_COMPRESSOR),)
@@ -75,7 +41,7 @@ else
 UBIFS_TARGET := $(UBIFS_BASE)
 endif
 
-$(UBIFS_BASE): host-fakeroot makedevs mkfs.ubifs
+$(UBIFS_BASE): host-fakeroot host-mtd makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	touch $(BUILD_DIR)/.fakeroot.00000
@@ -87,7 +53,7 @@ ifneq ($(TARGET_DEVICE_TABLE),)
 		>> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
 	# Use fakeroot so mkfs.ubifs believes the previous fakery
-	echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
+	echo "$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) " \
 		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
@@ -106,14 +72,6 @@ ifneq ($(UBIFS_COPYTO),)
 	@cp -f $(UBIFS_TARGET) $(UBIFS_COPYTO)
 endif
 
-ubifsroot-source: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
-
-ubifsroot-clean:
-	-$(MAKE) -C $(MKFS_UBIFS_DIR) clean
-
-ubifsroot-dirclean:
-	rm -rf $(MKFS_UBIFS_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
