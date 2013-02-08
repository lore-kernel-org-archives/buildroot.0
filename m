From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri,  8 Feb 2013 13:09:37 +0100
Subject: [Buildroot] [PATCH] Add Gnublin board support with fixed kernel
	header version
Message-ID: <1360325377-31200-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 board/gnublin/README      |   52 +++++++++++++++++++++++++++++++++++++++++++++
 configs/gnublin_defconfig |   18 ++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 board/gnublin/README
 create mode 100644 configs/gnublin_defconfig

diff --git a/board/gnublin/README b/board/gnublin/README
new file mode 100644
index 0000000..e58b366
--- /dev/null
+++ b/board/gnublin/README
@@ -0,0 +1,52 @@
+This the Buildroot support for the  LPC3131 based Gnublin board (see here:
+http://en.gnublin.org/) and to the Elektor Linux board
+(http://www.elektor.com/news/elektor-presents-embedded-linux-made-easy.2147294.
+lynkx)
+
+Unfortunately currently the AD and the pwm modules are not supported, i'm about
+to add also those drivers as well to the current kernel later.
+
+Base kernel version: 3.7 (available here:
+https://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin/commits/gnublin-
+support)
+
+U-boot version: 2009.11 (available here:
+https://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support)
+
+
+Steps to create a bootable SD card (with the given config you need an at least
+500 MB SD card):
+
+1.Config buildroot with the gnublin_defconfig:
+
+$ make gnublin_defconfig
+
+2.Tweak the config for your needs:
+
+$ make menuconfig
+
+3.Build:
+
+$ make
+
+4.Create two partitions on your SD card, one with type of BootIt (fdisk ID: df),
+the size should be around 1M, and another partition with all of the left space
+on the card, and with the type of normal DOS partition.
+
+5.From the output/images directory dump the u-boot image to the BootIt partition
+(probably you have to modify the output /dev files according to your system):
+
+$ dd if=output/images/u-boot.bin of=/dev/sdc1
+
+6.Dump the root fs image as well:
+
+$ dd if=output/images/rootfs.ext2 of=/dev/sdc2
+
+7.Insert the SD card into the board's slot, and your board should boot up with
+your newly created system.
+
+Any feedback/report is welcome on the mr.zoltan.gyarmati[at]gmail.com 
+
+
+
+
diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
new file mode 100644
index 0000000..85fa189
--- /dev/null
+++ b/configs/gnublin_defconfig
@@ -0,0 +1,18 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.7"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Gnublin"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=475000
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="2009.11_gnublin_support_v2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="v3.7-gnublin-2"
+BR2_LINUX_KERNEL_DEFCONFIG="gnublin"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.7.9.5
