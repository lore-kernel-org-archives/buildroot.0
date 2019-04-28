From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 28 Apr 2019 15:49:39 +0100
Subject: [Buildroot] [PATCH v2 3/3] board/sifive: add support for the HiFive
 Unleashed board
In-Reply-To: <20190428144939.28964-1-mark.corbin@embecosm.com>
References: <20190428144939.28964-1-mark.corbin@embecosm.com>
Message-ID: <20190428144939.28964-4-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds basic support for the SiFive HiFive Unleashed
board.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

---
Changes v1 -> v2:
  - removed the large kernel patch and replaced it with a custom
    git repository (Arnout)
  - reduced the kernel config fragment to a minimum (Arnout)
  - use a separate root filesystem instead of a linked-in
    initramfs image (Arnout)
  - changed naming convention from sifive-u540* to
    sifive_hifive* (Arnout)
  - added post-image script to generate a complete SD card image
    file (Arnout)
  - updated the default configuration to make use of compressed
    instructions and the lp64d ABI for builds.
  - updated the DEVELOPERS file.
---
 DEVELOPERS                                    |  1 +
 .../hifive-unleashed/linux.config.fragment    | 14 ++++
 board/sifive/hifive-unleashed/post-image.sh   | 37 +++++++++++
 board/sifive/hifive-unleashed/readme.txt      | 65 +++++++++++++++++++
 configs/sifive_hifive_unleashed_defconfig     | 31 +++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 board/sifive/hifive-unleashed/linux.config.fragment
 create mode 100755 board/sifive/hifive-unleashed/post-image.sh
 create mode 100644 board/sifive/hifive-unleashed/readme.txt
 create mode 100644 configs/sifive_hifive_unleashed_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 56556413aa..5f76b6951d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1417,6 +1417,7 @@ F:	arch/arch.mk.riscv
 F:	arch/Config.in.riscv
 F:	board/qemu/riscv32-virt/
 F:	board/qemu/riscv64-virt/
+F:	board/sifive/
 F:	boot/riscv-pk/
 F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/hifive-unleashed/linux.config.fragment
new file mode 100644
index 0000000000..8957eb5d36
--- /dev/null
+++ b/board/sifive/hifive-unleashed/linux.config.fragment
@@ -0,0 +1,14 @@
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlyprintk console=ttySIF0,115200 root=/dev/mmcblk0p2 rootwait"
+CONFIG_SERIAL_SIFIVE=y
+CONFIG_SERIAL_SIFIVE_CONSOLE=y
+# CONFIG_HVC_RISCV_SBI is not set
+CONFIG_SPI=y
+CONFIG_SPI_SIFIVE=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_MMC=y
+CONFIG_MMC_SPI=y
+CONFIG_CLK_U54_PRCI=y
+CONFIG_CLK_GEMGXL_MGMT=y
+CONFIG_SIFIVE_PLIC=y
diff --git a/board/sifive/hifive-unleashed/post-image.sh b/board/sifive/hifive-unleashed/post-image.sh
new file mode 100755
index 0000000000..ed2461995b
--- /dev/null
+++ b/board/sifive/hifive-unleashed/post-image.sh
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+set -e
+
+cd ${BINARIES_DIR}
+
+# GPT partition codes
+KERNEL=2E54B353-1271-4842-806F-E436D6AF6985
+ROOTFS=0FC63DAF-8483-4772-8E79-3D69D8477DE4
+
+# Partition offsets and sizes
+KERNEL_PART_START=2048
+KERNEL_PART_SIZE=65536
+KERNEL_PART_END=$(( KERNEL_PART_START + KERNEL_PART_SIZE - 1 ))
+ROOTFS_PART_START=$(( KERNEL_PART_END + 1 )) 
+ROOTFS_PART_SIZE=$(( $(stat -c %s rootfs.ext2) / 512 ))
+ROOTFS_PART_END=$(( ROOTFS_PART_START + ROOTFS_PART_SIZE - 1 ))
+GPT_SIZE=34
+
+# Disk image size
+IMAGE_SIZE=$(( GPT_SIZE + ROOTFS_PART_END + 1 ))
+
+# Create an empty SD image
+dd if=/dev/zero of=sdcard.img bs=512 count=0 seek=$IMAGE_SIZE
+
+sgdisk --clear \
+        --new=1:${KERNEL_PART_START}:${KERNEL_PART_END} \
+        --change-name=1:kernel \
+        --typecode=1:${KERNEL} \
+        --new=2:${ROOTFS_PART_START}:${ROOTFS_PART_END} \
+        --change-name=2:rootfs \
+        --typecode=2:${ROOTFS} \
+        sdcard.img
+
+dd if=bbl.bin of=sdcard.img bs=512 count=$KERNEL_PART_SIZE seek=$KERNEL_PART_START conv=notrunc
+dd if=rootfs.ext2 of=sdcard.img bs=512 count=$ROOTFS_PART_SIZE seek=$ROOTFS_PART_START conv=notrunc
+
diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
new file mode 100644
index 0000000000..842de5ee58
--- /dev/null
+++ b/board/sifive/hifive-unleashed/readme.txt
@@ -0,0 +1,65 @@
+SiFive HiFive Unleashed
+=======================
+
+This file describes how to use the pre-defined Buildroot
+configuration for the SiFive HiFive Unleashed board.
+
+Further information about the HiFive Unleashed board can be found
+at https://www.sifive.com/boards/hifive-unleashed
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  $ make sifive_hifive_unleashed_defconfig
+
+Customise the build as necessary:
+
+  $ make menuconfig
+
+Start the build:
+
+  $ make
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- bbl
+    +-- bbl.bin
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- vmlinux
+    
+
+Creating a bootable SD card
+===========================
+
+WARNING! This will destroy the existing contents of the SD card.
+Use with caution - ensure that you select the correct block device!
+
+The sdcard.img file is a complete bootable image containing two
+partitions. The first partition contains the bootloader and
+kernel (bbl.bin) and the second partition contains the rootfs.
+
+Write the image to an SD card:
+
+    $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
+
+Make sure that the all DIP switches are set to the off position for
+default boot mode (MSEL mode = 1111), insert the SD card and power
+up the board.
+
+Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
+
+See the 'SiFive HiFive Unleashed Getting Started Guide' for
+more details (https://www.sifive.com/documentation).
+
+--
+
+Mark Corbin <mark.corbin@embecosm.com> April 2019
diff --git a/configs/sifive_hifive_unleashed_defconfig b/configs/sifive_hifive_unleashed_defconfig
new file mode 100644
index 0000000000..715402339f
--- /dev/null
+++ b/configs/sifive_hifive_unleashed_defconfig
@@ -0,0 +1,31 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_CUSTOM_RVM=y
+BR2_RISCV_ISA_CUSTOM_RVF=y
+BR2_RISCV_ISA_CUSTOM_RVD=y
+BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_64=y
+BR2_RISCV_ABI_LP64D=y
+
+# Linux headers same as kernel, a 4.20 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
+
+# System
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sifive/hifive-unleashed/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/markcorbinuk/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="hifive-4.20.17"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Bootloader
+BR2_TARGET_RISCV_PK=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.19.1
