From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2015 22:02:48 -0000
Subject: [Buildroot] [git commit] board: add support for VIA VAB-820/AMOS-820
Message-ID: <20150601220247.C25677FD8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=731b2257fe9b42c4572f7a71547c52c3b5843840
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VIA VAB-820 board (and the AMOS-820 system built around it) is
based on Freescale i.MX6 for embedded and industrial computing.

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../uboot/default-to-boot-from-the-SD-card.patch   |   25 +++++
 board/via/imx6_vab820/readme.txt                   |  107 ++++++++++++++++++++
 configs/via_imx6_vab820_defconfig                  |   31 ++++++
 3 files changed, 163 insertions(+), 0 deletions(-)

diff --git a/board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch b/board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch
new file mode 100644
index 0000000..9b219f7
--- /dev/null
+++ b/board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch
@@ -0,0 +1,25 @@
+From 6e72bef18c928753c9861c1f6fc8c2c4dd5d1e97 Mon Sep 17 00:00:00 2001
+From: Gergely Imreh <imrehg@gmail.com>
+Date: Thu, 30 Apr 2015 16:24:38 +0800
+Subject: [PATCH] default to boot from the SD card
+
+---
+ include/configs/mx6qvab820_common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/mx6qvab820_common.h b/include/configs/mx6qvab820_common.h
+index 99bc8a9..2e70c94 100644
+--- a/include/configs/mx6qvab820_common.h
++++ b/include/configs/mx6qvab820_common.h
+@@ -216,7 +216,7 @@
+ 	"bootcmd_mmc=setenv mmcdev 1; setenv rootdev 0; setenv mmcname mmc; run bootcmd_main;\0"
+ 
+ #define CONFIG_BOOTCOMMAND \
+-	"run bootcmd_mmc"
++	"run bootcmd_sd"
+ 
+ #define CONFIG_ARP_TIMEOUT     200UL
+ 
+-- 
+2.3.7
+
diff --git a/board/via/imx6_vab820/readme.txt b/board/via/imx6_vab820/readme.txt
new file mode 100644
index 0000000..7345e5d
--- /dev/null
+++ b/board/via/imx6_vab820/readme.txt
@@ -0,0 +1,107 @@
+VIA VAB-820/AMOS-820
+====================
+
+This file documents the Buildroot support for the VIA VAB-820 board and
+VIA AMOS-820 system, which are built around a Freescale i.MX6 Quad/Dual SoC.
+The kernel and u-boot is based on the official VIA BSP, which is in turn
+based on the Freescale Linux 3.10.17_1.0.0_ga BSP.
+
+
+Configuring and building Buildroot
+----------------------------------
+
+Start from the defconfig:
+
+  $ make via_imx6_vab820_defconfig
+
+You can edit build options the usual way:
+
+  $ make menuconfig
+
+When you are happy with the setup, run:
+
+  $ make
+
+The result of the build with the default settings should be these files:
+
+  output/images
+  ????????? imx6q-vab820.dtb
+  ????????? rootfs.tar
+  ????????? u-boot.imx
+  ????????? uImage
+
+
+Set up your SD card
+-------------------
+
+*Important*: pay attention which partition you are modifying so you don't
+accidentally erase the wrong file system, e.g your host computer or your
+external storage!
+
+In the default setup you need to create 2 partitions on your SD card:
+a boot partition and a root partition. In this guide and in the default u-boot
+settings the boot partition is vfat, while the root partition is ext4.
+
+You also need to leave space for u-boot at the beginning of the card, before
+all the partitions.
+
+For example, if your SD card is at /dev/sdX, using fdisk, and starting from
+an empty card, the steps are along these lines:
+
+  # fdisk /dev/sdX
+  n         (new partition)
+  p         (primary partition)
+  1	    (first partition)
+  <return>  (default first sector, should be at least 1MB from the beginning
+             which is 2048 sectors if the sector size is 512KB)
+  +50M      (50MB size, as an example)
+  t         (switch partition type)
+  b         (select "W95 FAT32" type)
+  n         (the second partition)
+  p         (primary partition)
+  2	    (second partition)
+  <return>  (default first sector)
+  <return>  (use all remaining space)
+  p         (print so the partition looks something like this below)
+    Device     Boot  Start      End  Sectors  Size Id Type
+    /dev/sdX1         2048   104447   102400   50M  b W95 FAT32
+    /dev/sdX2       104448 15564799 15460352  7.4G 83 Linux
+  w         (save changes)
+
+After this you need to format the newly created file system:
+
+  # mkfs.vfat -L boot /dev/sdX1
+  # mkfs.ext4 -L rootfs /dev/sdX2
+
+Now the system can be copied onto the card. First copy the u-boot onto
+the region of the card before the first partition (starting from the
+root directory of buildroot):
+
+  # dd if=output/images/u-boot.imx of=/dev/sdX bs=512 seek=2
+
+Mount the first partition /dev/sdX1, and copy the kernel and the
+compiled device tree:
+
+  # cp output/images/uImage /mnt/<BOOT-PARTITION>
+  # cp output/images/imx6q-vab820.dtb /mnt/<BOOT-PARTITION>
+
+Finally, copy the root file system onto the mounted (empty) /dev/sdX2
+rootfs partition:
+
+  # tar xf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
+
+
+Booting
+-------
+
+To use the on-card u-boot, you need adjust jumper J11 located just next to
+the SD card slot on the VAB-820 board. The correct position for SD card
+boot is jumping the two pins towards the inside of the board.
+
+To modify the default boot parameters compiled into u-boot, you can create
+a boot script with the file name `boot.scr` and place it onto the boot
+partition (same directory as `uImage`).
+
+If you want to have the login prompt on the serial debug line instead of
+the console, adjust the buildroot settings as:
+"System Configuration > getty options > TTY port > ttymxc1"
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
new file mode 100644
index 0000000..8f24c65
--- /dev/null
+++ b/configs/via_imx6_vab820_defconfig
@@ -0,0 +1,31 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV3=y
+
+# Toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_GLOBAL_PATCH_DIR="board/via/imx6_vab820/patches"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-kernel-bsp.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.10.17_2.0.1"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-vab820"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6qvab820"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-uboot-bsp.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="via_3.10.17_2.0.1"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
