From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 18:12:03 -0500
Subject: [Buildroot] [PATCH 2/3] fs: add uimage support w/ example for cpio
In-Reply-To: <1368659524-21154-1-git-send-email-spenser@gillilanding.com>
References: <1368659524-21154-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368659524-21154-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <Spenser309@gmail.com>

Adds uimage support for various root filesystems.  Uimage support is needed when
using the bootm command in uboot.  This provides both a simple infrastructure
similar to the current BR2_TARGET_ROOTFS_$(2)_GZ for adding compression. To
define the a rootfs should have a UIMAGE wrapper simply create the
BR2_TARGET_ROOTFS_$(2)_UIMAGE symbol.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Tested-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 fs/common.mk      |   22 +++++++++++++++++++++-
 fs/cpio/Config.in |    7 +++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index 36da2dd..f456025 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -31,6 +31,8 @@
 # BR2_TARGET_ROOTFS_$(FSTYPE)_LZMA exist and are enabled, then the
 # macro will automatically generate a compressed filesystem image.
 
+MKIMAGE_RAMDISK = $(HOST_DIR)/usr/bin/mkimage -A $(BR2_ARCH) -T ramdisk -C $(1) -d $(2) $(2).uboot
+
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
@@ -40,7 +42,11 @@ USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
+ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
+	$$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) \
+	$$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) \
+	$$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz) \
+	$$(if $$(BR2_TARGET_ROOTFS_$(2)_UIMAGE),host-uboot-tools)
 
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
@@ -79,6 +85,20 @@ endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
 	$(XZ) -9 -C crc32 -c $$@ > $$@.xz
 endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_UIMAGE),y)
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_NONE),y)
+	$$(call MKIMAGE_RAMDISK,none,$$@)
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
+	$$(call MKIMAGE_RAMDISK,gzip,$$@.gz)
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
+	$$(call MKIMAGE_RAMDISK,bzip2,$$@.bz2)
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
+	$$(call MKIMAGE_RAMDISK,lzma,$$@.lzma)
+endif
+endif
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 87dde64..3e82dc5 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -5,6 +5,13 @@ config BR2_TARGET_ROOTFS_CPIO
 	  used for an initial RAM filesystem that is passed to the kernel
 	  by the bootloader.
 
+config BR2_TARGET_ROOTFS_CPIO_UIMAGE
+	bool "Add U-Boot header to the root filesystem"
+	depends on BR2_TARGET_ROOTFS_CPIO
+	help
+	  Add a u-boot header to the cpio root filesystem.  This allows
+	  the image to be booted by the bootm command in uboot.
+
 choice
         prompt "Compression method"
         default BR2_TARGET_ROOTFS_CPIO_NONE
-- 
1.7.9.5
