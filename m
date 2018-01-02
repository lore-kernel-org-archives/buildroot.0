From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Jan 2018 21:04:12 +0100
Subject: [Buildroot] [PATCH 2/2] fs/iso9660: fix transparent (de)compression
In-Reply-To: <cover.1514923441.git.yann.morin.1998@free.fr>
References: <cover.1514923441.git.yann.morin.1998@free.fr>
Message-ID: <e793abe185c20ebd853db927552156e203813613.1514923441.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It needs mkzftree from zisofs_tools, so we add a dependency to it, and
we call that one explicitly (to avoid using the one from the host in
PATH.

It also needs the the uncompressed kernel image, but because it is
already in target/ so it gets compressed by mkzftree. We have two
options:
  - compress everything but the kernel image,
  - compress everything, kernel included, and recopy it later.

We choose the latter, because it is the simplest solution. So, we alwats
define the kernel-copy hook, but only register it when needed.

Finally, itneeds a kernel with support for transparent (de)compression,
so we update the existing test config.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/iso9660.mk                               | 12 ++++++++----
 support/testing/conf/minimal-x86-qemu-kernel.config |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 06467262e0..66929a9ccd 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -42,11 +42,12 @@ define ROOTFS_ISO9660_CREATE_TEMPDIR
 endef
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_CREATE_TEMPDIR
 else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION),y)
+ROOTFS_ISO9660_DEPENDENCIES += host-zisofs_tools
 ROOTFS_ISO9660_TARGET_DIR = $(FS_DIR)/rootfs.iso9660.tmp
-# This must be early, before we copy the bootloader files
+# This must be early, before we copy the bootloader files.
 define ROOTFS_ISO9660_MKZFTREE
 	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
-	mkzftree -X -z 9 -p $(PARALLEL_JOBS) \
+	$(HOST_DIR)/bin/mkzftree -X -z 9 -p $(PARALLEL_JOBS) \
 		$(TARGET_DIR) \
 		$(ROOTFS_ISO9660_TARGET_DIR)
 endef
@@ -92,14 +93,13 @@ define ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
 endef
 
-ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
-
 # Copy the kernel to temporary filesystem
 define ROOTFS_ISO9660_COPY_KERNEL
 	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) \
 		$(ROOTFS_ISO9660_TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
 endef
 
+ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_KERNEL
 
 # If initramfs is used, disable loading the initrd as the rootfs is
@@ -119,6 +119,10 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_INITRD
 endif
 
 else # ROOTFS_ISO9660_USE_INITRD
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION),y)
+# We must use the uncompressed kernel image
+ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_KERNEL
+endif
 
 ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
 
diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
index 4aaaab7218..cc8ee6a713 100644
--- a/support/testing/conf/minimal-x86-qemu-kernel.config
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -43,6 +43,7 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
+CONFIG_ZISOFS=y
 CONFIG_JOLIET=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.11.0
