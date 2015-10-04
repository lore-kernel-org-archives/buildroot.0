From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 19:01:59 +0200
Subject: [Buildroot] [git commit] configs: remove gnublin_defconfig
Message-ID: <20151004171022.3E60E807AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d755067b7c497cc76cac57f88e79e34be592009e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig tries to fetch its kernel source code and U-Boot source
code from gitorious.org, which is not longer available. Therefore,
this defconfig has been failing to build since quite some time. Since
there's no obvious other place to grab the kernel and u-boot source
code, and the defconfig was not updated since a long time, let's
simply get rid of it.

[Peter: also drop README]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/gnublin/README      |   48 ---------------------------------------------
 configs/gnublin_defconfig |   28 --------------------------
 2 files changed, 0 insertions(+), 76 deletions(-)

diff --git a/board/gnublin/README b/board/gnublin/README
deleted file mode 100644
index 8f6a9f0..0000000
--- a/board/gnublin/README
+++ /dev/null
@@ -1,48 +0,0 @@
-This the Buildroot support for the LPC3131 based Gnublin board (see here:
-http://en.gnublin.org/) and to the Elektor Linux board
-(http://www.elektor.com/news/elektor-presents-embedded-linux-made-easy.2147294.
-lynkx)
-
-Unfortunately currently the AD and the pwm modules are not supported, i'm about
-to add also those drivers as well to the current kernel later.
-
-Base kernel version: 3.7 (available here:
-https://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin/commits/gnublin-
-support)
-
-U-boot version: 2009.11 (available here:
-https://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support)
-
-
-Steps to create a bootable SD card (with the given config you need an at least
-500 MB SD card):
-
-1.Config buildroot with the gnublin_defconfig:
-
-$ make gnublin_defconfig
-
-2.Tweak the config for your needs:
-
-$ make menuconfig
-
-3.Build:
-
-$ make
-
-4.Create two partitions on your SD card, one with type of BootIt (fdisk ID: df),
-the size should be around 1M, and another partition with all of the left space
-on the card, and with the type of normal DOS partition.
-
-5.From the output/images directory dump the u-boot image to the BootIt partition
-(probably you have to modify the output /dev files according to your system):
-
-$ dd if=output/images/u-boot.bin of=/dev/sdc1
-
-6.Dump the root fs image as well:
-
-$ dd if=output/images/rootfs.ext2 of=/dev/sdc2
-
-7.Insert the SD card into the board's slot, and your board should boot up with
-your newly created system.
-
-Any feedback/report is welcome on the mr.zoltan.gyarmati[at]gmail.com
diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
deleted file mode 100644
index 369c9da..0000000
--- a/configs/gnublin_defconfig
+++ /dev/null
@@ -1,28 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# System
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.7"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_BLOCKS=475000
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2009.11_gnublin_support_v2"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v3.7-gnublin-2"
-BR2_LINUX_KERNEL_DEFCONFIG="gnublin"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
