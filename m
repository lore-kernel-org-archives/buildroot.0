From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:56:50 +0100
Subject: [Buildroot] [git commit] via_imx6_vab820_defconfig: remove broken
	defconfig
Message-ID: <20170305205705.9F62B8222C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12db1937114ea56e859d99c776f91e4416af1c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig has been broken due to gcc5 for more than half a year,
and nobody stepped up to fix it. Remove it, as well as it board
directory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Gergely Imreh <imrehg@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/via/imx6_vab820/genimage.cfg  |  38 ------------
 board/via/imx6_vab820/post-image.sh |  17 -----
 board/via/imx6_vab820/readme.txt    | 120 ------------------------------------
 configs/via_imx6_vab820_defconfig   |  34 ----------
 4 files changed, 209 deletions(-)

diff --git a/board/via/imx6_vab820/genimage.cfg b/board/via/imx6_vab820/genimage.cfg
deleted file mode 100644
index 54acaa7..0000000
--- a/board/via/imx6_vab820/genimage.cfg
+++ /dev/null
@@ -1,38 +0,0 @@
-# Minimal SD card image for the VIA VAB-820 / AMOS-820
-#
-# The SD card must have at least 1 MB free at the beginning.
-# U-Boot is added before the filesystem partitions as is.
-# A FAT boot partition and an Ext4 root filesystem partition are required.
-
-image boot.vfat {
-  vfat {
-    files = {
-      "imx6q-vab820.dtb",
-      "uImage"
-    }
-  }
-  size = 10M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition u-boot {
-    in-partition-table = "no"
-    image = "u-boot.imx"
-    offset = 1024
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-    size = 512M
-  }
-}
diff --git a/board/via/imx6_vab820/post-image.sh b/board/via/imx6_vab820/post-image.sh
deleted file mode 100755
index 00de33b..0000000
--- a/board/via/imx6_vab820/post-image.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
-
-RET=${?}
-exit ${RET}
diff --git a/board/via/imx6_vab820/readme.txt b/board/via/imx6_vab820/readme.txt
deleted file mode 100644
index 908441f..0000000
--- a/board/via/imx6_vab820/readme.txt
+++ /dev/null
@@ -1,120 +0,0 @@
-VIA VAB-820/AMOS-820
-====================
-
-This file documents the Buildroot support for the VIA VAB-820 board and
-VIA AMOS-820 system, which are built around a Freescale i.MX6 Quad/Dual SoC.
-The kernel and u-boot is based on the official VIA BSP, which is in turn
-based on the Freescale Linux 3.10.17_1.0.0_ga BSP.
-
-
-Configuring and building Buildroot
-----------------------------------
-
-Start from the defconfig:
-
-  $ make via_imx6_vab820_defconfig
-
-You can edit build options the usual way:
-
-  $ make menuconfig
-
-When you are happy with the setup, run:
-
-  $ make
-
-The result of the build with the default settings should be these files:
-
-  output/images
-  ????????? boot.vfat
-  ????????? imx6q-vab820.dtb
-  ????????? rootfs.ext2
-  ????????? rootfs.ext4 -> rootfs.ext2
-  ????????? rootfs.tar
-  ????????? sdcard.img
-  ????????? u-boot.imx
-  ????????? uImage
-
-Copy the bootable `sdcard.img` onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
-
-where "sdX" is the appropriate partition of your card.
-
-For details about the medium image layout, see the definition in
-`board/via/imx6_vab820/genimage.cfg`.
-
-
-Setting up your SD card manually
---------------------------------
-
-*Important*: pay attention which partition you are modifying so you don't
-accidentally erase the wrong file system, e.g your host computer or your
-external storage!
-
-In the default setup you need to create 2 partitions on your SD card:
-a boot partition and a root partition. In this guide and in the default u-boot
-settings the boot partition is vfat, while the root partition is ext4.
-
-You also need to leave space for u-boot at the beginning of the card, before
-all the partitions.
-
-For example, if your SD card is at /dev/sdX, using fdisk, and starting from
-an empty card, the steps are along these lines:
-
-  # fdisk /dev/sdX
-  n         (new partition)
-  p         (primary partition)
-  1	    (first partition)
-  <return>  (default first sector, should be at least 1MB from the beginning
-             which is 2048 sectors if the sector size is 512KB)
-  +50M      (50MB size, as an example)
-  t         (switch partition type)
-  b         (select "W95 FAT32" type)
-  n         (the second partition)
-  p         (primary partition)
-  2	    (second partition)
-  <return>  (default first sector)
-  <return>  (use all remaining space)
-  p         (print so the partition looks something like this below)
-    Device     Boot  Start      End  Sectors  Size Id Type
-    /dev/sdX1         2048   104447   102400   50M  b W95 FAT32
-    /dev/sdX2       104448 15564799 15460352  7.4G 83 Linux
-  w         (save changes)
-
-After this you need to format the newly created file system:
-
-  # mkfs.vfat -L boot /dev/sdX1
-  # mkfs.ext4 -L rootfs /dev/sdX2
-
-Now the system can be copied onto the card. First copy the u-boot onto
-the region of the card before the first partition (starting from the
-root directory of buildroot):
-
-  # dd if=output/images/u-boot.imx of=/dev/sdX bs=512 seek=2
-
-Mount the first partition /dev/sdX1, and copy the kernel and the
-compiled device tree:
-
-  # cp output/images/uImage /mnt/<BOOT-PARTITION>
-  # cp output/images/imx6q-vab820.dtb /mnt/<BOOT-PARTITION>
-
-Finally, copy the root file system onto the mounted (empty) /dev/sdX2
-rootfs partition:
-
-  # tar xf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
-
-
-Booting
--------
-
-To use the on-card u-boot, you need adjust jumper J11 located just next to
-the SD card slot on the VAB-820 board. The correct position for SD card
-boot is jumping the two pins towards the inside of the board.
-
-To modify the default boot parameters compiled into u-boot, you can create
-a boot script with the file name `boot.scr` and place it onto the boot
-partition (same directory as `uImage`).
-
-If you want to have the login prompt on the serial debug line instead of
-the console, adjust the buildroot settings as:
-"System Configuration > getty options > TTY port > ttymxc1"
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
deleted file mode 100644
index fa646f0..0000000
--- a/configs/via_imx6_vab820_defconfig
+++ /dev/null
@@ -1,34 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_VFP=y
-
-# Linux headers same as kernel, a 3.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/viaembedded/vab820-kernel-bsp.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.10.17_2.0.6"
-BR2_LINUX_KERNEL_DEFCONFIG="via_vab820"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-vab820"
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qvab820"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/viaembedded/vab820-uboot-bsp.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="via_3.10.17_2.0.6"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/via/imx6_vab820/post-image.sh"
