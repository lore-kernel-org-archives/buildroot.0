From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri,  2 Jul 2021 00:00:04 +0300
Subject: [Buildroot] [PATCH 2/4] stm32mp157c_dk2: add non-trusted
 configuration
In-Reply-To: <20210701210006.1171347-1-geomatsi@gmail.com>
References: <20210701210006.1171347-1-geomatsi@gmail.com>
Message-ID: <20210701210006.1171347-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The stm32mp157 supports two different boot chains. Trusted boot chain uses
TF-A firmare as FSBL and U-Boot as SSBL. Basic boot chain uses U-Boot SPL
as FSBL and U-Boot as SSBL. Available stm32mp157c_dk2_defconfig provides
image with trusted boot chain. This commit renames existing defconfig and
adds another defconfig for basic boot chain. Genimage template and
post-image script are modified to use appropriate FSBL and SSBL
to support both build configurations.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                    |  4 ++-
 .../common/stm32mp157/genimage.cfg.template   |  6 ++--
 .../common/stm32mp157/post-image.sh           | 35 +++++++++++++++----
 .../stm32mp157c-dk2/readme.txt                |  7 +++-
 configs/stm32mp157c_dk2_basic_defconfig       | 28 +++++++++++++++
 ...nfig => stm32mp157c_dk2_trusted_defconfig} |  0
 6 files changed, 68 insertions(+), 12 deletions(-)
 create mode 100644 configs/stm32mp157c_dk2_basic_defconfig
 rename configs/{stm32mp157c_dk2_defconfig => stm32mp157c_dk2_trusted_defconfig} (100%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a69f88299..11b0c57d8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2427,6 +2427,8 @@ F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
+F:	configs/stm32mp157c_dk2_basic_defconfig
+F:	configs/stm32mp157c_dk2_trusted_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
@@ -2639,7 +2641,7 @@ F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
 F:	configs/beaglev_defconfig
-F:	configs/stm32mp157c_dk2_defconfig
+F:	configs/stm32mp157c_dk2_trusted_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
 F:	package/b43-fwcutter/
diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index f341c19f2f..88f6eb2785 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -4,15 +4,15 @@ image sdcard.img {
 	}
 
 	partition fsbl1 {
-		image = "%ATFBIN%"
+		image = "%FSBL%"
 	}
 
 	partition fsbl2 {
-		image = "%ATFBIN%"
+		image = "%FSBL%"
 	}
 
 	partition ssbl {
-		image = "u-boot.stm32"
+		image = "%SSBL%"
 	}
 
 	partition rootfs {
diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
index 363c3127cf..100e2f58dc 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
@@ -1,14 +1,17 @@
 #!/usr/bin/env bash
 
 #
-# atf_image extracts the ATF binary image from DTB_FILE_NAME that appears in
-# BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES in ${BR_CONFIG},
-# then prints the corresponding file name for the genimage
-# configuration file
+# fsbl_image extracts the the first stage bootloader then prints the corresponding file name
+# for the genimage configuration file:
+# - for trusted configuration this is the name of ATF binary image from DTB_FILE_NAME
+#   that appears in BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES in ${BR2_CONFIG}
+# - for basic configuration this  is the name of SPL binary specified in
+#   BR2_TARGET_UBOOT_SPL_NAME in ${BR2_CONFIG}
 #
-atf_image()
+fsbl_image()
 {
 	local ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	local SPL_NAME=$(sed -n 's/^BR2_TARGET_UBOOT_SPL_NAME="\(.*\)"$/\1/p' ${BR2_CONFIG})
 
 	if grep -Eq "DTB_FILE_NAME=stm32mp157c-dk2.dtb" <<< ${ATF_VARIABLES}; then
 		echo "tf-a-stm32mp157c-dk2.stm32"
@@ -16,16 +19,34 @@ atf_image()
                 echo "tf-a-stm32mp157a-dk1.stm32"
 	elif grep -Eq "DTB_FILE_NAME=stm32mp157a-avenger96.dtb" <<< ${ATF_VARIABLES}; then
                 echo "tf-a-stm32mp157a-avenger96.stm32"
+	else
+		echo "${SPL_NAME}"
+	fi
+}
+
+#
+# ssbl_image extracts the the second stage bootloader then prints the corresponding file name
+# for the genimage configuration file:
+# - for trusted configuration this is u-boot.stm32
+# - for basic configuration this  is u-boot.img
+#
+ssbl_image()
+{
+	if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_STM32=y$" ${BR2_CONFIG}; then
+		echo "u-boot.stm32"
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMG=y$" ${BR2_CONFIG}; then
+		echo "u-boot.img"
 	fi
 }
 
 main()
 {
-	local ATFBIN="$(atf_image)"
 	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+	local FSBL="$(fsbl_image)"
+	local SSBL="$(ssbl_image)"
 
-	sed -e "s/%ATFBIN%/${ATFBIN}/" \
+	sed -e "s/%FSBL%/${FSBL}/" -e "s/%SSBL%/${SSBL}/" \
 		board/stmicroelectronics/common/stm32mp157/genimage.cfg.template > ${GENIMAGE_CFG}
 
 	support/scripts/genimage.sh -c ${GENIMAGE_CFG}
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/readme.txt b/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
index 8edc3e8bbb..331ffb3f70 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
+++ b/board/stmicroelectronics/stm32mp157c-dk2/readme.txt
@@ -11,7 +11,12 @@ platform:
 How to build
 ============
 
- $ make stm32mp157c_dk2_defconfig
+Build 'basic' image:
+ $ make stm32mp157c_dk2_basic_defconfig
+ $ make
+
+Build 'trusted' image:
+ $ make stm32mp157c_dk2_trusted_defconfig
  $ make
 
 How to write the microSD card
diff --git a/configs/stm32mp157c_dk2_basic_defconfig b/configs/stm32mp157c_dk2_basic_defconfig
new file mode 100644
index 0000000000..13f0a135e1
--- /dev/null
+++ b/configs/stm32mp157c_dk2_basic_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.10"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-spl.stm32"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
+BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_trusted_defconfig
similarity index 100%
rename from configs/stm32mp157c_dk2_defconfig
rename to configs/stm32mp157c_dk2_trusted_defconfig
-- 
2.32.0
