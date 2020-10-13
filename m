From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 23:04:03 +0200
Subject: [Buildroot] [git commit] configs/stm32mp157*: switch to use TF-A
 based configurations
Message-ID: <20201013205326.1FD45813C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d15114713c9f20a6901ec156c8ae73f0cf3739d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes the stm32mp1 configurations to use the TF-A ->
U-Boot boot flow (called "trusted boot flow" by ST) instead of the
U-Boot SPL -> U-Boot boot flow. ST recommands this trusted boot, and
it's also the only one that allows to use the STM32 Cube Programmer
for reflashing devices.

As part of this, the genimage configuration file is now generated, as
it contains some file names that depend on the platform. Removing
partition-type from genimage.cfg is mandatory, since it would cause a
hybrid MBR partition table to be created, which itself would prevent
ATF from finding the ssbl parition.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{genimage.cfg => genimage.cfg.template}        |  7 ++---
 .../common/stm32mp157/post-image.sh                | 36 ++++++++++++++++++++++
 configs/stm32mp157a_dk1_defconfig                  | 16 ++++++----
 configs/stm32mp157c_dk2_defconfig                  | 16 ++++++----
 4 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
similarity index 63%
rename from board/stmicroelectronics/common/stm32mp157/genimage.cfg
rename to board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index d1ce530cc5..f341c19f2f 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -4,20 +4,19 @@ image sdcard.img {
 	}
 
 	partition fsbl1 {
-		image = "u-boot-spl.stm32"
+		image = "%ATFBIN%"
 	}
 
 	partition fsbl2 {
-		image = "u-boot-spl.stm32"
+		image = "%ATFBIN%"
 	}
 
 	partition ssbl {
-		image = "u-boot.img"
+		image = "u-boot.stm32"
 	}
 
 	partition rootfs {
 		image = "rootfs.ext4"
-		partition-type = 0x83
 		bootable = "yes"
 	}
 }
diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
new file mode 100755
index 0000000000..eec3cb739d
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
@@ -0,0 +1,36 @@
+#!/usr/bin/env bash
+
+#
+# atf_image extracts the ATF binary image from DTB_FILE_NAME that appears in
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES in ${BR_CONFIG},
+# then prints the corresponding file name for the genimage
+# configuration file
+#
+atf_image()
+{
+	local ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
+
+	if grep -Eq "DTB_FILE_NAME=stm32mp157c-dk2.dtb" <<< ${ATF_VARIABLES}; then
+		echo "tf-a-stm32mp157c-dk2.stm32"
+	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-dk1.dtb" <<< ${ATF_VARIABLES}; then
+                echo "tf-a-stm32mp157a-dk1.stm32"
+	fi
+}
+
+main()
+{
+	local ATFBIN="$(atf_image)"
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+	sed -e "s/%ATFBIN%/${ATFBIN}/" \
+		board/stmicroelectronics/common/stm32mp157/genimage.cfg.template > ${GENIMAGE_CFG}
+
+	support/scripts/genimage.sh -c ${GENIMAGE_CFG}
+
+	rm -f ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index f172539c02..b00c068698 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -2,8 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
@@ -16,15 +15,20 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 49cfb0733c..d89dd180b2 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -2,8 +2,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
@@ -16,15 +15,20 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_FORMAT_STM32=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
 BR2_PACKAGE_HOST_GENIMAGE=y
