From: Shlomi Vaknin <shlomi.39sd@gmail.com>
Date: Fri,  2 Oct 2020 17:24:24 +0300
Subject: [Buildroot] [PATCH v2 2/4] configs/stm32mp157*: use trusted
 configuration
In-Reply-To: <20201002142426.1375026-1-shlomi.39sd@gmail.com>
References: <20200927061606.10239-1-shlomi.39sd@gmail.com>
 <20201002142426.1375026-1-shlomi.39sd@gmail.com>
Message-ID: <20201002142426.1375026-2-shlomi.39sd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support for trusted configuration for stm32mp157c-dk2 and stm32mp157a-dk1.
This patch change using uboot spl as fsbl to using arm trusted firmware.
The reason for this change is that st recommends to use this configuration (or optee)
and not the basic.
In addtion, this commit enables gadget support in `linux.config`.

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
---
 .../genimage.cfg                              |  6 ++---
 .../stm32mp157a-dk1/linux.config              | 24 +++++++------------
 .../stm32mp157c-dk2/genimage.cfg              | 23 ++++++++++++++++++
 .../stm32mp157c-dk2/linux.config              | 20 +++++++---------
 configs/stm32mp157a_dk1_defconfig             | 13 ++++++----
 configs/stm32mp157c_dk2_defconfig             | 13 ++++++----
 6 files changed, 58 insertions(+), 41 deletions(-)
 rename board/stmicroelectronics/{common/stm32mp157 => stm32mp157a-dk1}/genimage.cfg (66%)
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg

diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg b/board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg
similarity index 66%
rename from board/stmicroelectronics/common/stm32mp157/genimage.cfg
rename to board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg
index d1ce530cc5..9ba22a981f 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg
+++ b/board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg
@@ -4,15 +4,15 @@ image sdcard.img {
 	}
 
 	partition fsbl1 {
-		image = "u-boot-spl.stm32"
+		image = "tf-a-stm32mp157a-dk1.stm32"
 	}
 
 	partition fsbl2 {
-		image = "u-boot-spl.stm32"
+		image = "tf-a-stm32mp157a-dk1.stm32"
 	}
 
 	partition ssbl {
-		image = "u-boot.img"
+		image = "u-boot.stm32"
 	}
 
 	partition rootfs {
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
index 95c834e431..47729ea97c 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/linux.config
+++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
@@ -47,15 +47,10 @@ CONFIG_CAN=y
 CONFIG_CAN_M_CAN=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_STM32_FMC2=y
 CONFIG_MTD_SPI_NOR=y
 # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
 CONFIG_MTD_UBI=y
@@ -107,13 +102,6 @@ CONFIG_REGULATOR_STPMIC1=y
 CONFIG_DRM=y
 CONFIG_DRM_STM=y
 CONFIG_DRM_STM_DSI=y
-# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
-# CONFIG_DRM_SII902X is not set
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
-# CONFIG_LCD_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_GENERIC is not set
-# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_DYNAMIC_MINORS=y
@@ -129,12 +117,17 @@ CONFIG_USB_DWC2=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
+CONFIG_USB_ISP1760_HOST_ROLE=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_GPIO_VBUS=y
 CONFIG_USB_ISP1301=y
 CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
 CONFIG_TYPEC=y
-CONFIG_TYPEC_STUSB=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
@@ -157,15 +150,12 @@ CONFIG_STM32_IPCC=y
 CONFIG_REMOTEPROC=y
 CONFIG_STM32_RPROC=y
 CONFIG_RPMSG_VIRTIO=y
-CONFIG_RPMSG_TTY=y
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
 CONFIG_SD_ADC_MODULATOR=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-CONFIG_STM32_ADC_TEMP=y
 CONFIG_STM32_DFSDM_ADC=y
-CONFIG_STM32_LPTIMER_CNT=y
 CONFIG_STM32_DAC=y
 CONFIG_IIO_HRTIMER_TRIGGER=y
 CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
@@ -179,4 +169,6 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_PRINTK_TIME=y
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg b/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
new file mode 100644
index 0000000000..3b709f756d
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "tf-a-stm32mp157c-dk2.stm32"
+	}
+
+	partition fsbl2 {
+		image = "tf-a-stm32mp157c-dk2.stm32"
+	}
+
+	partition ssbl {
+		image = "u-boot.stm32"
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		partition-type = 0x83
+		bootable = "yes"
+	}
+}
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux.config b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
index 878a0c39f1..c03eb748b4 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/linux.config
+++ b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
@@ -47,15 +47,10 @@ CONFIG_CAN=y
 CONFIG_CAN_M_CAN=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_STM32_FMC2=y
 CONFIG_MTD_SPI_NOR=y
 # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
 CONFIG_MTD_UBI=y
@@ -82,7 +77,6 @@ CONFIG_SERIAL_STM32_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_STM32F7=y
 CONFIG_SPI=y
 CONFIG_SPI_STM32=y
@@ -109,8 +103,6 @@ CONFIG_DRM_STM=y
 CONFIG_DRM_STM_DSI=y
 CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
 CONFIG_DRM_SII902X=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
@@ -129,12 +121,17 @@ CONFIG_USB_DWC2=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
+CONFIG_USB_ISP1760_HOST_ROLE=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_GPIO_VBUS=y
 CONFIG_USB_ISP1301=y
 CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
 CONFIG_TYPEC=y
-CONFIG_TYPEC_STUSB=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
@@ -157,15 +154,12 @@ CONFIG_STM32_IPCC=y
 CONFIG_REMOTEPROC=y
 CONFIG_STM32_RPROC=y
 CONFIG_RPMSG_VIRTIO=y
-CONFIG_RPMSG_TTY=y
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
 CONFIG_SD_ADC_MODULATOR=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-CONFIG_STM32_ADC_TEMP=y
 CONFIG_STM32_DFSDM_ADC=y
-CONFIG_STM32_LPTIMER_CNT=y
 CONFIG_STM32_DAC=y
 CONFIG_IIO_HRTIMER_TRIGGER=y
 CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
@@ -179,4 +173,6 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_PRINTK_TIME=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index f172539c02..8197fcc31b 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157a-dk1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
@@ -16,15 +16,18 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
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
index 49cfb0733c..15e1e85f69 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
@@ -16,15 +16,18 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
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
-- 
2.25.1
