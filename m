From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 17 Jan 2013 01:22:39 +0100
Subject: [Buildroot] [PATCH 2/2] Basic filesystem image with partition table
	support
In-Reply-To: <1358382160-18842-1-git-send-email-bos@je-eigen-domein.nl>
References: <1358382160-18842-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1358382160-18842-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very basic support for generating .img files that can be written directly to SD card
by using 'dd' or a similar raw image writing tool.
The image generated contains a MBR partition table, optionally a FAT partition for boot
files, and a partition for the root filessytem.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 fs/Config.in     |    1 +
 fs/img/Config.in |   84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/img/img.mk    |   51 +++++++++++++++++++++++++++++++++
 fs/img/mkimg.sh  |   50 ++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 fs/img/Config.in
 create mode 100644 fs/img/img.mk
 create mode 100755 fs/img/mkimg.sh

diff --git a/fs/Config.in b/fs/Config.in
index da4c5ff..fdfc5d9 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -4,6 +4,7 @@ source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
 source "fs/ext2/Config.in"
+source "fs/img/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
diff --git a/fs/img/Config.in b/fs/img/Config.in
new file mode 100644
index 0000000..ff393dd
--- /dev/null
+++ b/fs/img/Config.in
@@ -0,0 +1,84 @@
+config BR2_TARGET_ROOTFS_IMG
+        bool "filesystem image with partition table"
+        help
+          Build an image with a partition table, a rootfs partition and optionally a boot partition.
+
+config BR2_TARGET_ROOTFS_IMG_FAT
+        bool "create FAT boot partition"
+        depends on BR2_TARGET_ROOTFS_IMG
+        help
+          Create a FAT boot partition, in addition to the rootfs partition.
+          Needed for devices that can only boot from a FAT file system.
+
+config BR2_TARGET_ROOTFS_IMG_FAT_SIZE
+        int "size in MB"
+        default 32
+        depends on BR2_TARGET_ROOTFS_IMG_FAT
+        help
+          Boot partition size in MB
+
+config BR2_TARGET_ROOTFS_IMG_FAT_FOLDER
+        string "copy boot files from folder (input required)"
+        depends on BR2_TARGET_ROOTFS_IMG_FAT
+        help
+          The contents of the folder specified will be copied to the boot partition.
+          This needs to be specified. makebootfat will not create an empty file system.
+
+config BR2_TARGET_ROOTFS_IMG_FAT_EXTRAFILES
+        string "extra files to copy"
+        depends on BR2_TARGET_ROOTFS_IMG_FAT
+        help
+          Specify extra files here (e.g. "output/images/zImage") that will be copied
+          to the root folder of the boot partition.
+
+config BR2_TARGET_ROOTFS_IMG_SCRIPT
+        string "custom script to install bootloader"
+        depends on BR2_TARGET_ROOTFS_IMG
+        help
+          Custom script to be executed once image has been generated.
+          The script will be passed the image file name as first parameter.
+
+choice
+        prompt "root filesystem type"
+        default BR2_TARGET_ROOTFS_IMG_EXT2
+        depends on BR2_TARGET_ROOTFS_IMG
+        help
+          Filesystem type of the rootfs partition.
+
+config BR2_TARGET_ROOTFS_IMG_EXT2
+        bool "ext2"
+        select BR2_TARGET_ROOTFS_EXT2
+
+config BR2_TARGET_ROOTFS_IMG_SQUASHFS
+        bool "squashfs"
+        select BR2_TARGET_ROOTFS_SQUASHFS
+endchoice
+
+choice
+        prompt "Compression method"
+        default BR2_TARGET_ROOTFS_IMG_NONE
+        depends on BR2_TARGET_ROOTFS_IMG
+        help
+          Select compressor for the image
+
+config BR2_TARGET_ROOTFS_IMG_NONE
+        bool "no compression"
+        help
+          Do not compress the image.
+
+config BR2_TARGET_ROOTFS_IMG_GZIP
+        bool "gzip"
+        help
+          Do compress the image with gzip.
+
+config BR2_TARGET_ROOTFS_IMG_BZIP2
+        bool "bzip2"
+        help
+          Do compress the image with bzip2.
+
+config BR2_TARGET_ROOTFS_IMG_LZMA
+        bool "lzma"
+        help
+          Do compress the image with lzma.
+endchoice
+
diff --git a/fs/img/img.mk b/fs/img/img.mk
new file mode 100644
index 0000000..1456a22
--- /dev/null
+++ b/fs/img/img.mk
@@ -0,0 +1,51 @@
+#############################################################
+#
+# Create filesystem image with partition table
+#
+#############################################################
+
+# sfdisk is part of util-linux
+ROOTFS_IMG_DEPENDENCIES += host-util-linux
+
+ifeq ($(BR2_TARGET_ROOTFS_IMG_EXT2),y)
+ROOTFS_IMG_DEPENDENCIES += rootfs-ext2
+ROOTFS_IMG_DATAPART = $(BINARIES_DIR)/rootfs.ext2
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_IMG_SQUASHFS),y)
+ROOTFS_IMG_DEPENDENCIES += rootfs-squashfs
+ROOTFS_IMG_DATAPART = $(BINARIES_DIR)/rootfs.squashfs
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_IMG_FAT),y)
+ROOTFS_IMG_DEPENDENCIES += host-makebootfat
+ROOTFS_IMG_BOOTPART = $(BINARIES_DIR)/bootpart.fat
+ROOTFS_IMG_PRE_GEN_HOOKS += ROOTFS_IMG_MAKEFAT
+endif
+
+ifneq ($(BR2_TARGET_ROOTFS_IMG_FAT_EXTRAFILES),"")
+ROOTFS_IMG_MAKEBOOTFAT_EXTRAOPTS += $(foreach s,$(call qstrip,$(BR2_TARGET_ROOTFS_IMG_FAT_EXTRAFILES)),-c "$(s)")
+endif
+
+ifneq ($(BR2_TARGET_ROOTFS_IMG_SCRIPT),"")
+ROOTFS_IMG_POST_GEN_HOOKS += ROOTFS_IMG_BOOTLOADER_SCRIPT
+endif
+
+define ROOTFS_IMG_CMD
+	PATH=$(TARGET_PATH) fs/img/mkimg.sh $(ROOTFS_IMG_DATAPART) $$@ $(ROOTFS_IMG_BOOTPART)
+endef
+
+define ROOTFS_IMG_BOOTLOADER_SCRIPT
+	@$(call MESSAGE,"Executing custom bootloader installation script\(s\)")
+	@$(foreach s, $(call qstrip,$(BR2_TARGET_ROOTFS_IMG_SCRIPT)), \
+		$(s) $$@)
+endef
+
+define ROOTFS_IMG_MAKEFAT
+	dd if=/dev/zero of=$(ROOTFS_IMG_BOOTPART) bs=1024k count=$(BR2_TARGET_ROOTFS_IMG_FAT_SIZE)
+	$(HOST_DIR)/usr/bin/makebootfat $(ROOTFS_IMG_MAKEBOOTFAT_EXTRAOPTS) \
+		-b $(HOST_DIR)/usr/lib/makebootfat/mbrfat.bin \
+		-o $(ROOTFS_IMG_BOOTPART) $(BR2_TARGET_ROOTFS_IMG_FAT_FOLDER)
+endef
+
+$(eval $(call ROOTFS_TARGET,img))
diff --git a/fs/img/mkimg.sh b/fs/img/mkimg.sh
new file mode 100755
index 0000000..0227181
--- /dev/null
+++ b/fs/img/mkimg.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+# Create a file system image consisting of a partition table and one or two partitions
+#
+# Usage: mkimg.sh datapartition.ext2 output.img [bootpartition.fat]
+#
+
+DATAPART=$1
+IMG=$2
+BOOTPART=$3
+HEADS=255
+CYLINDERS=63
+BPC=$(($HEADS * $CYLINDERS * 512))
+
+set -e
+
+# Leave first MB empty for alignment, partition table and bootloader use.
+dd bs=1024k seek=1 if=/dev/null of="$IMG"
+
+# Append boot partition (if available)
+if [ -n "$BOOTPART" ]; then
+  STARTSECTOR_BOOTPART=$(($(stat -c%s "$IMG")/512))
+  cat "$BOOTPART" >> "$IMG"
+fi
+
+# Append data partition
+STARTSECTOR_DATAPART=$(($(stat -c%s "$IMG")/512))
+cat "$DATAPART" >> "$IMG"
+
+# Pad image to cylinder size
+PADDING_SIZE=$(($BPC - $(stat -c%s "$IMG") % $BPC))
+dd ibs=1 count=$PADDING_SIZE oflag=append conv=notrunc if=/dev/zero of="$IMG"
+
+# Fill in the partition table
+if [ -n "$STARTSECTOR_BOOTPART" ]; then
+  SIZE_BOOTPART=$(($STARTSECTOR_DATAPART-$STARTSECTOR_BOOTPART))
+  PART1="$STARTSECTOR_BOOTPART,$SIZE_BOOTPART,0E,*"
+  PART2="$STARTSECTOR_DATAPART,,L"
+else
+  PART1="$STARTSECTOR_DATAPART,,L,*"
+  PART2="0,0"
+fi
+
+sfdisk -uS -H $HEADS -C $CYLINDERS "$IMG" 2>/dev/null <<EOT
+$PART1
+$PART2
+0,0
+0,0
+EOT
+
-- 
1.7.10.4
