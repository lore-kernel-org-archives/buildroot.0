From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 May 2016 17:16:06 -0300
Subject: [Buildroot] [PATCH 1/3] configs: mx53loco: Update bootloader and
	kernel versions
Message-ID: <1464207368-22532-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update U-boot to the 2016.05 version and the kernel to 4.6.

U-boot 2016.05 needs a patch for fixing an IPU build error.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...1-U-Boot-video-ipu_common-fix-build-error.patch | 41 ++++++++++++++++++++++
 configs/mx53loco_defconfig                         | 20 ++++++-----
 2 files changed, 53 insertions(+), 8 deletions(-)
 create mode 100644 board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch

diff --git a/board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch b/board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch
new file mode 100644
index 0000000..1d39f4e
--- /dev/null
+++ b/board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch
@@ -0,0 +1,41 @@
+commit c510f2e436008e55a50b063f2180cb1e63984224
+Author: Peng Fan <van.freenix@gmail.com>
+Date:   Thu Apr 28 10:07:53 2016 +0800
+
+video: ipu_common: fix build error
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
