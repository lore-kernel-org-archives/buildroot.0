From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 15 Apr 2020 18:18:31 +0200
Subject: [Buildroot] [PATCH 7/7] configs/nitrogen8mn: new defconfig
In-Reply-To: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
References: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
Message-ID: <20200415161831.2093348-8-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NXP i.MX8MNano based SBC with 1GB of LPDDR4 and 16GB eMMC.

More details on the platform here:
https://boundarydevices.com/product/nitrogen8m-nano/

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .gitlab-ci.yml                          |  1 +
 board/boundarydevices/common/readme.txt |  4 ++
 configs/nitrogen8mn_defconfig           | 56 +++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 configs/nitrogen8mn_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3869fa3a5d..2aa53a8df6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -234,6 +234,7 @@ nitrogen6x_defconfig: { extends: .defconfig }
 nitrogen7_defconfig: { extends: .defconfig }
 nitrogen8m_defconfig: { extends: .defconfig }
 nitrogen8mm_defconfig: { extends: .defconfig }
+nitrogen8mn_defconfig: { extends: .defconfig }
 odroidxu4_defconfig: { extends: .defconfig }
 olimex_a10_olinuxino_lime_defconfig: { extends: .defconfig }
 olimex_a13_olinuxino_defconfig: { extends: .defconfig }
diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
index 0022628d82..d1bb3fa598 100644
--- a/board/boundarydevices/common/readme.txt
+++ b/board/boundarydevices/common/readme.txt
@@ -27,6 +27,10 @@ Here is the list of targeted platforms per defconfig:
   - Nitrogen8MMini
   - Nitrogen8MMini_SOM
 
+- nitrogen8mn_defconfig
+  - Nitrogen8MNano
+  - Nitrogen8MNano_SOM
+
 To install, simply copy the image to your storage (SD, eMMC, USB):
 
 $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
new file mode 100644
index 0000000000..b78eba1422
--- /dev/null
+++ b/configs/nitrogen8mn_defconfig
@@ -0,0 +1,56 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mn-nitrogen8_nano.dtb"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# DDR training binaries
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# ARM Trusted Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+# Latest revision of branch boundary-imx_4.14.98_2.3.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/99e07a29.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+# Latest revision of branch boundary-imx_v2018.07
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/bd4e3154.tar.gz"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_SPL=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+# Latest revision  of branch boundary-imx_4.14.x_2.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/519c6839.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="boundary"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-nitrogen8_nano freescale/imx8mn-nitrogen8mn freescale/imx8mn-nitrogen8mn_som"
-- 
2.25.1
