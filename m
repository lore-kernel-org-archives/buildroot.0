From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Jul 2017 14:23:22 +0200
Subject: [Buildroot] [PATCH] configs: nexbox_a95x_defconfig: bump to kernel
	4.12
Message-ID: <20170712122322.12281-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Main difference is that the drm driver now supports the hdmi output.

The gxl variant device tree has been renamed in:

commit 7eea67101b9713ae438955e8899b3c4b078419f9
Author: Kevin Hilman <khilman@baylibre.com>
Date:   Fri Jan 20 07:57:52 2017 -0800

    ARM64: dts: meson-gxl: rename Nexbox A95x for consistency

    Since the GXL family has S905X and S905D SoCs, we're keeping the SoC
    name in the DTS filename for clarity.  Rename this file accordingly to
    be consistent with the rest of the GXL DTS files.

    Cc: Neil Armstrong <narmstrong@baylibre.com>
    Reviewed-by: Andreas F?rber <afaerber@suse.de>
    Signed-off-by: Kevin Hilman <khilman@baylibre.com>

So adjust the defconfig and boot script to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/nexbox/a95x/boot.txt     | 2 +-
 board/nexbox/a95x/genimage.cfg | 2 +-
 configs/nexbox_a95x_defconfig  | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/nexbox/a95x/boot.txt b/board/nexbox/a95x/boot.txt
index b538b4a9ab..f388ba814a 100644
--- a/board/nexbox/a95x/boot.txt
+++ b/board/nexbox/a95x/boot.txt
@@ -3,7 +3,7 @@ setenv bootargs console=ttyAML0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
 fatload mmc 0:1 0x01080000 uImage
 
 if itest.s "${aml_dt}" == "gxl_p212_2g"; then
-	fatload mmc 0:1 $dtb_mem_addr meson-gxl-nexbox-a95x.dtb
+	fatload mmc 0:1 $dtb_mem_addr meson-gxl-s905x-nexbox-a95x.dtb
 else
 	fatload mmc 0:1 $dtb_mem_addr meson-gxbb-nexbox-a95x.dtb
 fi
diff --git a/board/nexbox/a95x/genimage.cfg b/board/nexbox/a95x/genimage.cfg
index c6c80f860b..74e2d3a6f9 100644
--- a/board/nexbox/a95x/genimage.cfg
+++ b/board/nexbox/a95x/genimage.cfg
@@ -3,7 +3,7 @@ image boot.vfat {
 		files = {
 			"uImage",
 			"meson-gxbb-nexbox-a95x.dtb",
-			"meson-gxl-nexbox-a95x.dtb",
+			"meson-gxl-s905x-nexbox-a95x.dtb",
 			"boot.scr"
 		}
 	}
diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 375b4d3f03..80265932c2 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -1,16 +1,16 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-nexbox-a95x"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.11.0
