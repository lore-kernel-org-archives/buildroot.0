From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:18:00 +0200
Subject: [Buildroot] [git commit] configs/amarula_vyasa_rk3288: adjust
 U-Boot config to boot larger kernel image
Message-ID: <20190421101650.F29AB8136E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0bae3bcc85c0c6e63b9487a777d29f2187c5e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default value of CONFIG_SYS_BOOTM_LEN in u-boot causes board reset for
large uImage files, so add u-boot patch to increase the maximum kernel
image size.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...figs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch | 35 ++++++++++++++++++++++
 configs/amarula_vyasa_rk3288_defconfig             |  1 +
 2 files changed, 36 insertions(+)

diff --git a/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
new file mode 100644
index 0000000000..64a147c09e
--- /dev/null
+++ b/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
@@ -0,0 +1,35 @@
+From 8ee2b03039cccf64402a72dea2185d7fe1972729 Mon Sep 17 00:00:00 2001
+From: Shyam Saini <shyam.saini@amarulasolutions.com>
+Date: Mon, 15 Apr 2019 16:16:16 +0530
+Subject: [PATCH] include: configs: Increase CONFIG_SYS_BOOTM_LEN to 16MB
+
+The default value of CONFIG_SYS_BOOTM_LEN is 0x800000 i.e, 8MB which
+causes board reset because of larger uImage size.
+
+Error log snippet:
+   Booting using the fdt blob at 0x1f00000
+   Loading Kernel Image ... Image too large: increase CONFIG_SYS_BOOTM_LEN
+Must RESET board to recover
+resetting ...
+
+Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
+---
+ include/configs/rk3288_common.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/configs/rk3288_common.h b/include/configs/rk3288_common.h
+index 72a54bc0ab..eab7cf4d86 100644
+--- a/include/configs/rk3288_common.h
++++ b/include/configs/rk3288_common.h
+@@ -9,6 +9,8 @@
+ #include <asm/arch/hardware.h>
+ #include "rockchip-common.h"
+ 
++#define CONFIG_SYS_BOOTM_LEN (16 << 20) /* 16MB */
++
+ #define CONFIG_SKIP_LOWLEVEL_INIT_ONLY
+ #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
+ #define CONFIG_SYS_CBSIZE		1024
+-- 
+2.11.0
+
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 88fb6abbec..b1267f8574 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -44,3 +44,4 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
+BR2_GLOBAL_PATCH_DIR="board/amarula/vyasa/patches/"
