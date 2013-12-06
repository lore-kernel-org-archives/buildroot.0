From: Thomas Pedersen <thomas@cozybit.com>
Date: Fri,  6 Dec 2013 12:46:46 -0800
Subject: [Buildroot] [PATCH v2] pandaboard: fix defconf build with recent
	kernels
Message-ID: <1386362806-16798-1-git-send-email-thomas@cozybit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch "pandaboard: Fix defconfig build" locked the
default pandaboard kernel to 3.8.11. This is inconvenient,
since the boot process has changed since kernel > 3.8.

Update the default kernel to 3.12.2 and fix the boot image
configuration, but remain compatible with legacy U-Boot
versions by using appended flattened device tree uImage.

This change *should* keep future kernels compatible with a
fixed U-Boot version.

Note the default device tree is now for the pandaboard-ES,
so users of other board revisions will need to set the
correct DTS_NAME.

Signed-off-by: Thomas Pedersen <thomas@cozybit.com>
---
 configs/pandaboard_defconfig | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 95cfdd6..47d01a2 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -11,14 +11,20 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.12 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.2"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
+BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_APPENDED_DTB=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+# might need omap4-panda or omap4-panda-a4 instead
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
 
 # GCC
 BR2_GCC_VERSION_4_6_X=y
@@ -29,3 +35,6 @@ BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_BOARDNAME="omap4_panda"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_TARGET_UBOOT_LATEST_VERSION=n
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2012.07"
-- 
1.8.4.3
