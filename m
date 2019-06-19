From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:59:21 +0200
Subject: [Buildroot] [git commit] configs/solidrun_clearfog_gt_8k: new
 defconfig
Message-ID: <20190619115853.BC3BE822B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0de91e572569fc450f74839b1bd3683aed16c196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the SolidRun Armada 8040 based Clearfog GT-8K. This
board has the same processor as the Macchiatobin, so we can reuse the
Macchiatobin U-Boot and image definitions.

The kernel fragment enables drivers that are necessary to make
networking ports work (SFP, Ethernet port, and Ethernet switch).

Cc: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  2 +
 board/solidrun/clearfog_gt_8k/extlinux.conf        |  4 ++
 board/solidrun/clearfog_gt_8k/genimage.cfg         |  1 +
 board/solidrun/clearfog_gt_8k/linux-extras.config  |  4 ++
 .../solidrun/clearfog_gt_8k/post-build-mainline.sh |  1 +
 board/solidrun/clearfog_gt_8k/readme.txt           | 61 ++++++++++++++++++++++
 .../solidrun/clearfog_gt_8k/uboot-fragment.config  |  1 +
 configs/solidrun_clearfog_gt_8k_defconfig          | 46 ++++++++++++++++
 9 files changed, 121 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 087bfa7602..9cdb5f2b89 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -300,6 +300,7 @@ snps_archs38_hsdk_defconfig: { extends: .defconfig }
 snps_archs38_vdk_defconfig: { extends: .defconfig }
 socrates_cyclone5_defconfig: { extends: .defconfig }
 solidrun_clearfog_defconfig: { extends: .defconfig }
+solidrun_clearfog_gt_8k_defconfig: { extends: .defconfig }
 solidrun_macchiatobin_mainline_defconfig: { extends: .defconfig }
 solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
 stm32f429_disco_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 62aacc1fd0..9d806db6f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -254,6 +254,8 @@ F:	package/pulseview/
 F:	package/sigrok-cli/
 
 N:	Baruch Siach <baruch@tkos.co.il>
+F:	board/solidrun/clearfog_gt_8k/
+F:	configs/solidrun_clearfog_gt_8k_defconfig
 F:	package/18xx-ti-utils/
 F:	package/daemon/
 F:	package/dropbear/
diff --git a/board/solidrun/clearfog_gt_8k/extlinux.conf b/board/solidrun/clearfog_gt_8k/extlinux.conf
new file mode 100644
index 0000000000..aae0c0d5fb
--- /dev/null
+++ b/board/solidrun/clearfog_gt_8k/extlinux.conf
@@ -0,0 +1,4 @@
+label Clearfog GT-8K Linux
+  kernel /boot/Image
+  devicetree /boot/armada-8040-clearfog-gt-8k.dtb
+  append console=ttyS0,115200n8 root=/dev/mmcblk1p1 rootwait
diff --git a/board/solidrun/clearfog_gt_8k/genimage.cfg b/board/solidrun/clearfog_gt_8k/genimage.cfg
new file mode 120000
index 0000000000..0cc2754ff6
--- /dev/null
+++ b/board/solidrun/clearfog_gt_8k/genimage.cfg
@@ -0,0 +1 @@
+../macchiatobin/genimage.cfg
\ No newline at end of file
diff --git a/board/solidrun/clearfog_gt_8k/linux-extras.config b/board/solidrun/clearfog_gt_8k/linux-extras.config
new file mode 100644
index 0000000000..bce2a2e9d2
--- /dev/null
+++ b/board/solidrun/clearfog_gt_8k/linux-extras.config
@@ -0,0 +1,4 @@
+CONFIG_MARVELL_PHY=y
+CONFIG_SFP=y
+CONFIG_NET_DSA=y
+CONFIG_NET_DSA_MV88E6XXX=y
diff --git a/board/solidrun/clearfog_gt_8k/post-build-mainline.sh b/board/solidrun/clearfog_gt_8k/post-build-mainline.sh
new file mode 120000
index 0000000000..a8c9a52437
--- /dev/null
+++ b/board/solidrun/clearfog_gt_8k/post-build-mainline.sh
@@ -0,0 +1 @@
+../macchiatobin/post-build-mainline.sh
\ No newline at end of file
diff --git a/board/solidrun/clearfog_gt_8k/readme.txt b/board/solidrun/clearfog_gt_8k/readme.txt
new file mode 100644
index 0000000000..1648ffa38d
--- /dev/null
+++ b/board/solidrun/clearfog_gt_8k/readme.txt
@@ -0,0 +1,61 @@
+Intro
+=====
+
+The default configuration described below will allow you to start
+experimenting with the buildroot environment for the SolidRun Clearfog GT-8K
+based on the Marvell Armada 8040 SoC.
+
+This default configuration will bring up the board and allow shell command
+line access through the serial console.
+
+How to build
+============
+
+  $ make solidrun_clearfog_gt_8k_defconfig
+  $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image file named
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+
+How to boot the board
+=====================
+
+The Clearfog GT-8K can be setup to load the bootloader from different sources
+including eMMC, SPI flash, and SD-card.
+
+To select boot from SD-card the DIP switches in SW6 (at the bottom of the
+board) should be configured as follows:
+
+  SW6: 11010
+
+Insert the micro SDcard in the Cleargfog GT-8K and power it up.
+
+Serial console
+==============
+
+The serial console is accessible at the J27 pins header (TTL UART) with the
+following pinout (pin #1 is marked with triangle on the PCB):
+
+  pin #1: Ground
+  pin #2: Armada 8040 Rx
+  pin #3: Armada 8040 Tx
+
+Enable the switch (yellow) Ethernet ports
+=========================================
+
+To enable the Clearfog GT-8K internal switch port make sure to load the
+'mv88e6xxx' kernel module, and up the switch up-link port (eth2 by default):
+
+  modprobe mv88e6xxx
+  ifconfig eth2 up
+
+Then you can configure each switch port separately. These port are named
+'lan1' to 'lan4' by default. 'lan1' is closest to the USB port, while 'lan4'
+is closest to the blue Ethernet port.
diff --git a/board/solidrun/clearfog_gt_8k/uboot-fragment.config b/board/solidrun/clearfog_gt_8k/uboot-fragment.config
new file mode 120000
index 0000000000..996c4aa6b6
--- /dev/null
+++ b/board/solidrun/clearfog_gt_8k/uboot-fragment.config
@@ -0,0 +1 @@
+../macchiatobin/uboot-fragment.config
\ No newline at end of file
diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
new file mode 100644
index 0000000000..a44038e663
--- /dev/null
+++ b/configs/solidrun_clearfog_gt_8k_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+BR2_TARGET_GENERIC_HOSTNAME="clearfog-gt-8k"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for SolidRun Clearfog GT-8K"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
+# This commit corresponds to release armada-18.09.4
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_BINARIES_MARVELL_8040=y
+BR2_TARGET_MV_DDR_MARVELL=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog_gt_8k"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog_gt_8k/uboot-fragment.config"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.9"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog_gt_8k/linux-extras.config"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-clearfog-gt-8k"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog_gt_8k/post-build-mainline.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog_gt_8k/genimage.cfg"
