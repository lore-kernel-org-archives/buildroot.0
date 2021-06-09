From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  9 Jun 2021 22:59:54 +0300
Subject: [Buildroot] [PATCH v2 19/28] configs/orangepi_zero_plus_defconfig:
 bump BSP versions
In-Reply-To: <20210609200003.2866122-1-geomatsi@gmail.com>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
Message-ID: <20210609200003.2866122-20-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot and Linux kernel versions. Updating U-Boot to 2021.04
requires the following two changes.

First, after switching to binman, u-boot.itb is no more generated for
64-bit sunxi boards. Combined u-boot-sunxi-with-spl.bin image should
be used instead. This image contains SPL, U-Boot, and FIT image,
where FIT image contains other binaries such as BL31 and SCP.

Second, new U-Boot enables support for System Control Processor (SCP)
firmware. SCP firmware is included by default into FIT image in the
combined u-boot-sunxi-with-spl.bin binary. When SCP is not available
or not needed, it should be explicitly disabled by pointing to an
empty file. Support for Allwinner SCP firmware is not yet available
neither in Buildroot nor in mainline kernel. So disable it for now
using custom U-Boot build options.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-zero-plus/genimage.cfg | 10 ++--------
 configs/orangepi_zero_plus_defconfig           | 11 +++++------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus/genimage.cfg b/board/orangepi/orangepi-zero-plus/genimage.cfg
index ec15898ddd..13f42533ca 100644
--- a/board/orangepi/orangepi-zero-plus/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus/genimage.cfg
@@ -15,15 +15,9 @@ image sdcard.img {
 
 	partition spl {
 		in-partition-table = "no"
-		image = "sunxi-spl.bin"
+		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1040384 # 1MB - 8KB
 	}
 
 	partition boot {
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 790dfff276..76dbbcdb6d 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 
@@ -18,16 +18,15 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus/boot.cmd"
@@ -35,7 +34,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-pl
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus"
-- 
2.31.1
