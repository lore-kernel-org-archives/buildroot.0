From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:32 +0100
Subject: [Buildroot] [PATCH 4/7] rootfs-common: refactor the common
	compression commands
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes the compression extension available in a variable, so it
can be used by the fs-specific commands. In this patch, it is used
by iso9660. Following patches show more use cases.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
- Initial revision. This patch was introduced to enable the U-Boot image
  of the cpio rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/common.mk          | 42 +++++++++++++++++++++++++++---------------
 fs/iso9660/iso9660.mk |  6 +-----
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index f22fb61..aa9d961 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -37,7 +37,31 @@ USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
-ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
+ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs
+
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
+ROOTFS_$(2)_COMPRESS_EXT = .gz
+ROOTFS_$(2)_COMPRESS_CMD = gzip -9 -c
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
+ROOTFS_$(2)_COMPRESS_EXT = .bz2
+ROOTFS_$(2)_COMPRESS_CMD = bzip2 -9 -c
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
+ROOTFS_$(2)_DEPENDENCIES += host-lzma
+ROOTFS_$(2)_COMPRESS_EXT = .lzma
+ROOTFS_$(2)_COMPRESS_CMD = $$(LZMA) -9 -c
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZO),y)
+ROOTFS_$(2)_DEPENDENCIES += host-lzop
+ROOTFS_$(2)_COMPRESS_EXT = .lzo
+ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
+endif
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
+ROOTFS_$(2)_DEPENDENCIES += host-xz
+ROOTFS_$(2)_COMPRESS_EXT = .xz
+ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
+endif
 
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
@@ -60,20 +84,8 @@ endif
 	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
 	cp support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
-	gzip -9 -c $$@ > $$@.gz
-endif
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_BZIP2),y)
-	bzip2 -9 -c $$@ > $$@.bz2
-endif
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
-	$$(LZMA) -9 -c $$@ > $$@.lzma
-endif
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZO),y)
-	$$(LZOP) -9 -c $$@ > $$@.lzo
-endif
-ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
-	$(XZ) -9 -C crc32 -c $$@ > $$@.xz
+ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
+	$$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
 
 rootfs-$(1)-show-depends:
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 317314a..979a0b2 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -10,10 +10,6 @@
 ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
-ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_GZIP)  = .gz
-ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_BZIP2) = .bz2
-ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_LZMA)  = .lzma
-
 $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
@@ -21,7 +17,7 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
 	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
 	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
-	cp $(BINARIES_DIR)/rootfs.cpio$(ISO9660_CPIO_EXT-y) $(ISO9660_TARGET_DIR)/initrd
+	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(FAKEROOT_SCRIPT)
 	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
-- 
1.8.4.rc3
