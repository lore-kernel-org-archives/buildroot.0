From: Karoly Kasza <kaszak@gmail.com>
Date: Tue,  9 Dec 2014 17:03:26 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/mkrawimg: new package
In-Reply-To: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
References: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
Message-ID: <1418141008-18739-3-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkrawimg is a helper script like mke2img.
It a host package, useful to build a complete raw disk image,
with grub in the MBR and one ext* partition.
Creates a bootable raw disk image as a new rootfs image.
Boots in QEMU or on bare metal after written (dd) to disk.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Changes v1 -> v2:
  - Created a new package from the script in v1.
  - Fdisk now specifies head and sector.
  - Sector size of ext* image is calculated properly.

 package/Config.in.host          |    1 +
 package/mkrawimg/Config.in.host |   13 +++++++++++++
 package/mkrawimg/mkrawimg       |   38 ++++++++++++++++++++++++++++++++++++++
 package/mkrawimg/mkrawimg.mk    |   14 ++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 package/mkrawimg/Config.in.host
 create mode 100755 package/mkrawimg/mkrawimg
 create mode 100644 package/mkrawimg/mkrawimg.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..4fa58f8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -11,6 +11,7 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
+	source "package/mkrawimg/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
diff --git a/package/mkrawimg/Config.in.host b/package/mkrawimg/Config.in.host
new file mode 100644
index 0000000..f5083b4
--- /dev/null
+++ b/package/mkrawimg/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_MKRAWIMG
+	bool "host mkrawimg"
+	select BR2_TARGET_GRUB
+	select BR2_TARGET_GRUB_FS_EXT2
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	select BR2_PACKAGE_HOST_UTIL_LINUX_FDISK
+	help
+	  Easily create raw disk images.
+
+	  This tool is bundled by, and specific to Buildroot.
+	  It does not make much sense, to use it without
+	  the "raw disk image" rootfs target.
diff --git a/package/mkrawimg/mkrawimg b/package/mkrawimg/mkrawimg
new file mode 100755
index 0000000..dcc5d06
--- /dev/null
+++ b/package/mkrawimg/mkrawimg
@@ -0,0 +1,38 @@
+#!/bin/bash
+
+# Buildroot tool to generate bootable raw disk image
+# GRUB in MBR, boot first primary partition (ext*)
+
+set -e
+
+BINARIES_DIR="$1"
+OUTPUT_IMG="$2"
+# Size of generated ext* fs in sectors
+SECTORS=`fdisk -l $BINARIES_DIR/rootfs.ext2 | grep $BINARIES_DIR/rootfs.ext2 | cut -d" " -f7`
+# Size of image with MBR and partition table (512 block size with fdisk image file)
+SECTOR_COUNT=$(($SECTORS+2048))
+
+# Create an empty file, final size
+dd if=/dev/zero of=$OUTPUT_IMG bs=512 count=$SECTOR_COUNT 2>/dev/null
+
+# Create a partition table - call our own fdisk in $PATH from host-util-linux
+fdisk -H 16 -S 63 $OUTPUT_IMG >/dev/null 2>/dev/null <<EOB
+n
+p
+1
+
+
+w
+EOB
+
+# Write the rootfs to the 1st partition
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
diff --git a/package/mkrawimg/mkrawimg.mk b/package/mkrawimg/mkrawimg.mk
new file mode 100644
index 0000000..858db79
--- /dev/null
+++ b/package/mkrawimg/mkrawimg.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# mkrawimg
+#
+################################################################################
+
+HOST_MKRAWIMG_SOURCE =
+HOST_MKRAWIMG_DEPENDENCIES = host-util-linux grub
+
+define HOST_MKRAWIMG_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 package/mkrawimg/mkrawimg $(HOST_DIR)/usr/bin/mkrawimg
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.10.4
