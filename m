From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 23:07:17 +0200
Subject: [Buildroot] [git commit] configs/macchiatobin*: drop vendor
 defconfig, rename mainline defconfig
Message-ID: <20200415205308.D5CBF8EDA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37da2511120ecbbf8bff00e4dd4eec1923dd1937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The support for MacchiatoBin board in U-Boot and Linux has been
significantly improved in the past years. So it no longer makes much
sense to have a separate build configuration based on older vendor
Linux kernel and U-Boot. This commit drops the configuration based on
vendor kernel and U-Boot and renames the mainline-based defconfig.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  3 +-
 DEVELOPERS                                         |  3 +-
 board/solidrun/macchiatobin/readme.txt             | 44 +++++++---------------
 ...e_defconfig => solidrun_macchiatobin_defconfig} |  0
 configs/solidrun_macchiatobin_marvell_defconfig    | 44 ----------------------
 5 files changed, 16 insertions(+), 78 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3869fa3a5d..efce0d5c66 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -326,8 +326,7 @@ snps_archs38_vdk_defconfig: { extends: .defconfig }
 socrates_cyclone5_defconfig: { extends: .defconfig }
 solidrun_clearfog_defconfig: { extends: .defconfig }
 solidrun_clearfog_gt_8k_defconfig: { extends: .defconfig }
-solidrun_macchiatobin_mainline_defconfig: { extends: .defconfig }
-solidrun_macchiatobin_marvell_defconfig: { extends: .defconfig }
+solidrun_macchiatobin_defconfig: { extends: .defconfig }
 stm32f429_disco_defconfig: { extends: .defconfig }
 stm32f469_disco_defconfig: { extends: .defconfig }
 stm32mp157a_dk1_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 375ab07092..3d9c976a95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2308,8 +2308,7 @@ F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
-F:	configs/solidrun_macchiatobin_mainline_defconfig
-F:	configs/solidrun_macchiatobin_marvell_defconfig
+F:	configs/solidrun_macchiatobin_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
index dc5d6c794d..7412951aab 100644
--- a/board/solidrun/macchiatobin/readme.txt
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -12,32 +12,14 @@ through the serial console.
 How to build
 ============
 
-There are two build options: mainline support and vendor support.
+Default configuration provides the following BSP versions:
+ - Linux v5.6.3 (mainline)
+ - U-Boot v2020.01 (mainline)
+ - ATF v1.5-18.12.2 (Marvell)
 
-For the mainline BSP, we use:
- - Linux v4.19.2
- - U-Boot v2018.11
+To build images run the following commands:
 
-For the vendor BSP, we use the sources available from Marvell Github
-page at https://github.com/MarvellEmbeddedProcessors, which uses:
- - Linux v4.4.120
- - U-Boot v2018.03
-
-At the moment mainline support for the board is a work in
-progress. Mainline kernel 4.19 enables eth2 in 1Gb (RJ45 connector J5),
-copper 10Gb interfaces, and automatic configuration of select SFP
-modules on the SFP cages. The vendor BSP enables more hardware features
-out of the box, but lacks support for SFP detection and automatic
-configuration.
-
-To use the mainline BSP run the following commands:
-
-    $ make solidrun_macchiatobin_mainline_defconfig
-    $ make
-
-To use the vendor BSP run the following commands:
-
-    $ make solidrun_macchiatobin_marvell_defconfig
+    $ make solidrun_macchiatobin_defconfig
     $ make
 
 How to write the SD card
@@ -74,13 +56,15 @@ Insert the micro SDcard in the MacchiatoBin board and power it up.
 The serial console is accessible at the micro-USB Type-B connector
 marked CON9. The serial line settings are 115200 8N1.
 
-Note: the following text only applies to the vendor BSP from
-solidrun_macchiatobin_marvell_defconfig.
+U-Boot environment
+==================
 
-By default Marvell provided U-Boot will load its environment from the
-SPI flash. On the first boot SPI flash may be empty or it may contain a
-legacy environment that prevents proper boot. Then the following
-commands can be used to boot the board:
+By default current configuration provides U-Boot that keeps environment
+in SD/eMMC. However, if needed, u-boot-fragment.config can be tweaked
+so that U-Boot will keep environment in SPI flash. On the first boot
+SPI flash may be empty or it may contain a stale environment that
+prevents proper boot. Then the following commands can be used
+to boot the board:
 
 => ext4load mmc 1:1 0x01700000 /boot/uEnv-example.txt
 => env import -t 0x01700000 $filesize
diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_defconfig
similarity index 100%
rename from configs/solidrun_macchiatobin_mainline_defconfig
rename to configs/solidrun_macchiatobin_defconfig
diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
deleted file mode 100644
index 4d269b9f75..0000000000
--- a/configs/solidrun_macchiatobin_marvell_defconfig
+++ /dev/null
@@ -1,44 +0,0 @@
-BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
-BR2_TARGET_GENERIC_HOSTNAME="mcbin"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
-
-# Firmware
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-# This commit corresponds to release armada-18.09.4
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
-BR2_TARGET_BINARIES_MARVELL=y
-BR2_TARGET_MV_DDR_MARVELL=y
-
-# U-Boot
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/u-boot-marvell"
-# This commit corresponds to armada-18.09.1, based on u-boot 2018.03
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="8fe403172c58440bcfbb3724242301c0108eff5b"
-BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.120-armada-18.09.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v8_lsp"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-
-# rootfs
-BR2_TARGET_ROOTFS_TAR=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build.sh"
