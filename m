From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Jul 2016 22:12:31 -0300
Subject: [Buildroot] [PATCH 1/2] configs: mx51evk: Bump U-Boot version to
	2016.07
Message-ID: <1468285952-7497-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump U-Boot version to 2016.07 and also remove the extra patch
as it is already part of U-Boot mainline now.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../0001-video-ipu_common-fix-build-error.patch    | 47 ----------------------
 configs/mx51evk_defconfig                          |  5 +--
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch

diff --git a/board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch b/board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch
deleted file mode 100644
index 356d0b0..0000000
--- a/board/freescale/imx51evk/patches/uboot/0001-video-ipu_common-fix-build-error.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c510f2e436008e55a50b063f2180cb1e63984224 Mon Sep 17 00:00:00 2001
-From: Peng Fan <van.freenix@gmail.com>
-Date: Thu, 28 Apr 2016 10:07:53 +0800
-Subject: [PATCH] video: ipu_common: fix build error
-
-Some toolchains fail to build
-"clk->rate = (u64)(clk->parent->rate * 16) / div;"
-And the cast usage is wrong.
-
-Use the following code to fix the issue,
-"
-  do_div(parent_rate, div);
-  clk->rate = parent_rate;
-"
-
-Reported-by: Peter Robinson <pbrobinson@gmail.com>
-Signed-off-by: Peng Fan <van.freenix@gmail.com>
-Cc: Stefano Babic <sbabic@denx.de>
-Cc: Fabio Estevam <fabio.estevam@nxp.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Anatolij Gustschin <agust@denx.de>
-Cc: Peter Robinson <pbrobinson@gmail.com>
-Reviewed-by: Tom Rini <trini@konsulko.com>
-Tested-by: Peter Robinson <pbrobinson@gmail.com>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- drivers/video/ipu_common.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/video/ipu_common.c b/drivers/video/ipu_common.c
-index 36d4b23..5676a0f 100644
---- a/drivers/video/ipu_common.c
-+++ b/drivers/video/ipu_common.c
-@@ -352,7 +352,9 @@ static int ipu_pixel_clk_set_rate(struct clk *clk, unsigned long rate)
- 	 */
- 	__raw_writel((div / 16) << 16, DI_BS_CLKGEN1(clk->id));
- 
--	clk->rate = (u64)(clk->parent->rate * 16) / div;
-+	do_div(parent_rate, div);
-+
-+	clk->rate = parent_rate;
- 
- 	return 0;
- }
--- 
-1.9.1
-
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index 0e2682a..bc72e06 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -8,9 +8,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/imx51evk/patches/"
-
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
@@ -25,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx51evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
-- 
1.9.1
