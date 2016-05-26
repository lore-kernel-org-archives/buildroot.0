From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 May 2016 16:28:29 -0300
Subject: [Buildroot] [PATCH v2 1/3] configs: mx53loco: Update bootloader and
	kernel versions
Message-ID: <1464290911-30595-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update U-boot to the 2016.05 version and the kernel to 4.6.

U-boot 2016.05 needs the patch c510f2e436008 ("video: ipu_common: fix build
error") that is already in mainline to fix an IPU build error.

We can remove this patch in the future when we switch to U-boot 2016.07.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Add my Signed-off-by and mention that the U-boot patch comes from 
U-boot mainline (Baruch).

 .../0001-video-ipu_common-fix-build-error.patch    | 47 ++++++++++++++++++++++
 configs/mx53loco_defconfig                         | 20 +++++----
 2 files changed, 59 insertions(+), 8 deletions(-)
 create mode 100644 board/freescale/imx53loco/patches/uboot/0001-video-ipu_common-fix-build-error.patch

diff --git a/board/freescale/imx53loco/patches/uboot/0001-video-ipu_common-fix-build-error.patch b/board/freescale/imx53loco/patches/uboot/0001-video-ipu_common-fix-build-error.patch
new file mode 100644
index 0000000..356d0b0
--- /dev/null
+++ b/board/freescale/imx53loco/patches/uboot/0001-video-ipu_common-fix-build-error.patch
@@ -0,0 +1,47 @@
+From c510f2e436008e55a50b063f2180cb1e63984224 Mon Sep 17 00:00:00 2001
+From: Peng Fan <van.freenix@gmail.com>
+Date: Thu, 28 Apr 2016 10:07:53 +0800
+Subject: [PATCH] video: ipu_common: fix build error
+
+Some toolchains fail to build
+"clk->rate = (u64)(clk->parent->rate * 16) / div;"
+And the cast usage is wrong.
+
+Use the following code to fix the issue,
+"
+  do_div(parent_rate, div);
+  clk->rate = parent_rate;
+"
+
+Reported-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Peng Fan <van.freenix@gmail.com>
+Cc: Stefano Babic <sbabic@denx.de>
+Cc: Fabio Estevam <fabio.estevam@nxp.com>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Anatolij Gustschin <agust@denx.de>
+Cc: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Tom Rini <trini@konsulko.com>
+Tested-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ drivers/video/ipu_common.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/video/ipu_common.c b/drivers/video/ipu_common.c
+index 36d4b23..5676a0f 100644
+--- a/drivers/video/ipu_common.c
++++ b/drivers/video/ipu_common.c
+@@ -352,7 +352,9 @@ static int ipu_pixel_clk_set_rate(struct clk *clk, unsigned long rate)
+ 	 */
+ 	__raw_writel((div / 16) << 16, DI_BS_CLKGEN1(clk->id));
+ 
+-	clk->rate = (u64)(clk->parent->rate * 16) / div;
++	do_div(parent_rate, div);
++
++	clk->rate = parent_rate;
+ 
+ 	return 0;
+ }
+-- 
+1.9.1
+
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 3cb1b74..06150c7 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,25 +2,29 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 2.6 series (so, no option selected)
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx53loco/patches/"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Freescale/u-boot-fslc.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="e36968af0a033e9d66535928886103370620cb4d"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b3912bb8a4caf3ec50909135e88af959982c43ca"
-BR2_LINUX_KERNEL_DEFCONFIG="imx5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
-- 
1.9.1
