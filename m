From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 17 Oct 2014 14:34:10 +0200
Subject: [Buildroot] [PATCH 2/2] fs/rawimage: new rootfs image
In-Reply-To: <1413549250-2753-1-git-send-email-kaszak@gmail.com>
References: <1413549250-2753-1-git-send-email-kaszak@gmail.com>
Message-ID: <1413549250-2753-3-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Creates a bootable raw disk image as a new rootfs image.
Boots in QEMU or on bare metal after written (dd) to disk.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 fs/Config.in           |    1 +
 fs/rawimg/Config.in    |   17 +++++++++++++++++
 fs/rawimg/genrawimg.sh |   35 +++++++++++++++++++++++++++++++++++
 fs/rawimg/rawimg.mk    |   13 +++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 fs/rawimg/Config.in
 create mode 100755 fs/rawimg/genrawimg.sh
 create mode 100644 fs/rawimg/rawimg.mk

diff --git a/fs/Config.in b/fs/Config.in
index 5853113..36961db 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -8,6 +8,7 @@ source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
 source "fs/romfs/Config.in"
+source "fs/rawimg/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
diff --git a/fs/rawimg/Config.in b/fs/rawimg/Config.in
new file mode 100644
index 0000000..d0f7380
--- /dev/null
+++ b/fs/rawimg/Config.in
@@ -0,0 +1,17 @@
+config BR2_TARGET_ROOTFS_RAWIMG
+	bool "raw disk image"
+	depends on (BR2_i386 || BR2_x86_64)
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_KERNEL_INSTALL_TARGET
+	select BR2_TARGET_ROOTFS_EXT2
+	select BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_EXT2
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	select BR2_PACKAGE_HOST_UTIL_LINUX_FDISK
+	help
+	  Build a bootable raw disk image, that can be booted in a VM (e.g. QEMU),
+	  or directly written to disk. Creates a valid partition table with MBR.
+
+comment "raw disk image needs a Linux kernel to be built"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_LINUX_KERNEL
diff --git a/fs/rawimg/genrawimg.sh b/fs/rawimg/genrawimg.sh
new file mode 100755
index 0000000..f3ec320
--- /dev/null
+++ b/fs/rawimg/genrawimg.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+set -e
+
+BINARIES_DIR="$1"
+OUTPUT_IMG="$2"
+# Size of generated ext2 fs
+EXT2SIZE=`ls -l $BINARIES_DIR/rootfs.ext2 | cut -d' ' -f5`
+# Size of image with MBR and partition table (512 block size with fdisk image file)
+# Add 2048 blocks to beginning & end of file
+IMGCOUNT=$(($EXT2SIZE/512+2048+2048))
+
+# Create an empty file, final size
+dd if=/dev/zero of=$OUTPUT_IMG bs=512 count=$IMGCOUNT 2>/dev/null
+
+# Create a partition table - call our own fdisk in $PATH from host-util-linux
+fdisk $OUTPUT_IMG >/dev/null 2>/dev/null <<EOB
+n
+p
+1
+
+
+w
+EOB
+
+# Write the ext2 rootfs to the 1st partition
+dd if=$BINARIES_DIR/rootfs.ext2 of=$OUTPUT_IMG conv=notrunc bs=512 iflag=fullblock seek=2048 skip=0 2>/dev/null
+
+# Write MBR, grub is also called from $PATH
+grub --no-floppy --batch >/dev/null 2>/dev/null <<EOB
+device (hd0) $OUTPUT_IMG
+geometry (hd0)
+root (hd0,0)
+setup (hd0)
+quit
+EOB
diff --git a/fs/rawimg/rawimg.mk b/fs/rawimg/rawimg.mk
new file mode 100644
index 0000000..49a662d
--- /dev/null
+++ b/fs/rawimg/rawimg.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# Build the raw disk image
+#
+################################################################################
+
+ROOTFS_RAWIMG_DEPENDENCIES = rootfs-ext2
+
+define ROOTFS_RAWIMG_CMD
+	PATH=$(BR_PATH) fs/rawimg/genrawimg.sh $(BINARIES_DIR) $@
+endef
+
+$(eval $(call ROOTFS_TARGET,rawimg))
-- 
1.7.10.4
