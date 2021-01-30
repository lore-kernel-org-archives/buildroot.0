From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 30 Jan 2021 23:44:55 +0300
Subject: [Buildroot] [RFC PATCH] stm32mp1: modify gpt partitions to fix BSP
 update
Message-ID: <20210130204456.793098-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

BSP update for stm32mp1 boards does not work right out of the box. The
first boot is ok, but the second boot fails:

NOTICE:  CPU: STM32MP157CAC Rev.B
NOTICE:  Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
NOTICE:  Board: MB1272 Var2.0 Rev.C-01
NOTICE:  BL2: v2.4(release):2020.11-1087-g8fac193e6d-dirty
NOTICE:  BL2: Built : 20:58:09, Jan 27 2021
ERROR:   Checksum: 0x5023a37 (awaited: 0x5046ea4)
ERROR:   Header check failed
ERROR:   BL2: Failed to load image id 5 (-12)

The root cause is in changes for stm32mp1 trusted defconfig in updated
U-Boot: see U-Boot commit 76db1681da52 ("stm32mp1: use a specific SD/eMMC
partition for U-Boot enviromnent"). Starting from that commit, U-Boot
environment is stored at the end of the U-Boot partition. As a result,
saving environment changes GPT partition checksum verified by ATF.

IIUC at least the following two approaches can be implemented to make
updated BSP work smoothly.

The first approach is to modify U-Boot config fragment for stm32mp1 boards
and to re-enable saving U-Boot environment on ext4. However this choice
implies certain restriction on rootfs ext4 features since it should be
writable by U-Boot. See the mentioned U-Boot commit message for details.

Another approach is implemented by the attached patch: keep U-Boot
environment on a dedicated GPT partition.

Thoughts ? Comments ?

Regards,
Sergey

---
 .../common/stm32mp157/genimage.cfg.template         |  4 ++++
 .../overlay/boot/extlinux/extlinux.conf             |  2 +-
 .../uboot/0001-uboot-stm32mp1-uboot-env.patch       | 13 +++++++++++++
 .../overlay/boot/extlinux/extlinux.conf             |  2 +-
 .../uboot/0001-uboot-stm32mp1-uboot-env.patch       | 13 +++++++++++++
 configs/stm32mp157a_dk1_defconfig                   |  9 +++++----
 configs/stm32mp157c_dk2_defconfig                   |  9 +++++----
 7 files changed, 42 insertions(+), 10 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch

diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index f341c19f2f..12f79efa90 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -15,6 +15,10 @@ image sdcard.img {
 		image = "u-boot.stm32"
 	}
 
+	partition env {
+		size = 16K
+	}
+
 	partition rootfs {
 		image = "rootfs.ext4"
 		bootable = "yes"
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
index 437e80fdeb..62cc58d7e2 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
+++ b/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157a-dk1-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157a-dk1.dtb
-  append root=/dev/mmcblk0p4 rootwait
+  append root=/dev/mmcblk0p5 rootwait
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
new file mode 100644
index 0000000000..9582974caf
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
@@ -0,0 +1,13 @@
+diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+index 6787619290..85c0e1d0a3 100644
+--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
++++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+@@ -16,7 +16,7 @@
+ 	config {
+ 		u-boot,boot-led = "heartbeat";
+ 		u-boot,error-led = "error";
+-		u-boot,mmc-env-partition = "ssbl";
++		u-boot,mmc-env-partition = "env";
+ 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
+ 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
+ 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
index 5b7f56ee77..e1b3ca9f61 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
+++ b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157c-dk2.dtb
-  append root=/dev/mmcblk0p4 rootwait
+  append root=/dev/mmcblk0p5 rootwait
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch b/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
new file mode 100644
index 0000000000..9582974caf
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
@@ -0,0 +1,13 @@
+diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+index 6787619290..85c0e1d0a3 100644
+--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
++++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+@@ -16,7 +16,7 @@
+ 	config {
+ 		u-boot,boot-led = "heartbeat";
+ 		u-boot,error-led = "error";
+-		u-boot,mmc-env-partition = "ssbl";
++		u-boot,mmc-env-partition = "env";
+ 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
+ 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
+ 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 6883aaba7b..4f34456e9d 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -1,11 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -17,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
@@ -25,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 50d875749b..1f3028dcd1 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,11 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157c-dk2/patches/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -17,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
@@ -25,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.30.0
