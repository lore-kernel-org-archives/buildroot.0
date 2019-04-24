From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:23:41 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 configs/asus_tinker_rk3288: adjust U-Boot config to boot larger kernel
 image
Message-ID: <20190424201926.420F6813D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab80f66b51dffe1b7cc91307959e0b362db91836
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Default value of CONFIG_SYS_BOOTM_LEN in u-boot causes board reset for
large uImage files, so add u-boot patch to increase the maximum kernel
image size.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7dfcd850b9021d4a6e7d3c220680131de222a615)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...figs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch | 35 ++++++++++++++++++++++
 configs/asus_tinker_rk3288_defconfig               |  1 +
 2 files changed, 36 insertions(+)

diff --git a/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
new file mode 100644
index 0000000000..64a147c09e
--- /dev/null
+++ b/board/asus/tinker/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
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
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index a0df3de8a1..b14cb0a2c2 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -43,3 +43,4 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
+BR2_GLOBAL_PATCH_DIR="board/asus/tinker/patches/"
