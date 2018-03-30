From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:10:53 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] configs/riotboard: remove
 defconfig
Message-ID: <20180330213159.3ED3F83EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a8a67a5611cc43adf7a28a97f21ef1a45a3458d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This defconfig fails to build with gcc 6.x, even though we switched to
using gcc 6.x as the default gcc version in May 2017.

This defconfig also hasn't seen any non-mechanical update since
November 2015.

So it's time to get rid of it, in order to remove the following build
failure:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306938

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f124c2f0765b1098f86cca71f2df18d1788cba57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                                     |  1 -
 board/embest/riotboard/readme.txt                  | 46 ----------------------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  6 ---
 configs/riotboard_defconfig                        | 36 -----------------
 4 files changed, 89 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 520aac640f..6edd2fbfd3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -212,7 +212,6 @@ raspberrypi3_64_defconfig: *defconfig
 raspberrypi3_defconfig: *defconfig
 raspberrypi3_qt5we_defconfig: *defconfig
 raspberrypi_defconfig: *defconfig
-riotboard_defconfig: *defconfig
 roseapplepi_defconfig: *defconfig
 s6lx9_microboard_defconfig: *defconfig
 sheevaplug_defconfig: *defconfig
diff --git a/board/embest/riotboard/readme.txt b/board/embest/riotboard/readme.txt
deleted file mode 100644
index b7390d0d57..0000000000
--- a/board/embest/riotboard/readme.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Buildroot for Embest RIoTboard
-==============================
-
-1. Compiling buildroot
-----------------------
-
-make riotboard_defconfig
-make
-
-2. Installing buildroot
------------------------
-
-Prepare an SD-card and plug it into your card reader. Write the bootloader to
-your SD-card:
-
-sudo dd if=output/images/u-boot.imx of=/dev/sdX bs=1k seek=1
-
-Create 1 partition on the SD-card using your favourite tool. The
-partition should be big enough to hold your rootfs, for example
-128MiB. Here's an example partition layout:
-
-   Device Boot      Start         End      Blocks   Id  System
-/dev/sdX1            2048      264191      131072   83  Linux
-
-Format the SD-card partition with your favourite filesystem:
-
-sudo mkfs.ext2 /dev/sdX1
-
-Deploy your rootfs to the SD-card:
-
-sudo mkdir /mnt/sdcard/
-sudo mount /dev/sdX1 /mnt/sdcard/
-sudo tar xf output/images/rootfs.tar -C /mnt/sdcard/
-sudo umount /dev/sdX1
-
-3. Running buildroot
---------------------
-
-Position the board so you can read the label "RIoTboard" on the right side of
-SW1 DIP switches. Configure the SW1 swiches like this:
-
-10100101 (1 means ON position, 0 means OFF position)
-
-Now plug your prepared SD-card in slot J6. Connect a serial console (115200, 8,
-N, 1) to header J18. Connect a 5V/1A power supply to the board and enjoy your
-new toy.
diff --git a/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf b/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
deleted file mode 100644
index c7d32e0097..0000000000
--- a/board/embest/riotboard/rootfs_overlay/boot/extlinux/extlinux.conf
+++ /dev/null
@@ -1,6 +0,0 @@
-default buildroot
-
-label buildroot
-kernel /boot/uImage
-devicetree /boot/imx6dl-riotboard.dtb
-append console=ttymxc1,115200 root=/dev/mmcblk0p1 rw
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
deleted file mode 100644
index c2281058f5..0000000000
--- a/configs/riotboard_defconfig
+++ /dev/null
@@ -1,36 +0,0 @@
-# architecture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-
-# system
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-
-# rootfs
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_2r1=y
-BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
-
-# bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
-BR2_TARGET_UBOOT_BOARDNAME="riotboard"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-
-# Linux headers same as kernel, a 4.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.6"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-riotboard"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
