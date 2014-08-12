From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Tue, 12 Aug 2014 10:49:26 +0200
Subject: [Buildroot] [PATCH] imx6sabresd: boot to /init in mfgtools mode
Message-ID: <1407833366-21448-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot supplies a nice /init wrapper script to use when booting from a
ramdisk.

We add a patch to u-boot to tell the kernel to boot into /init (instead of
/linuxrc) on i.MX6, when booting in mfgtools mode. This way we can boot a
buildroot system entirely through USB.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Cc: Gilles Talis <gilles.talis@gmail.com>
---

Hi,

Putting a few persons in Cc:, which might be interested in i.MX6 related
changes.

Best regards,

V.

 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ++++++++++++++++++++++
 configs/freescale_imx6sabresd_defconfig            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch

diff --git a/board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
new file mode 100644
index 0000000..c01df4e
--- /dev/null
+++ b/board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -0,0 +1,36 @@
+From 4a7cd7c5b165317dccf45cfc235da3e14bc339e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
+Date: Tue, 12 Aug 2014 10:17:31 +0200
+Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Buildroot supplies a nice /init wrapper script to use when booting from a
+ramdisk.
+
+This patch tells u-boot to tell the kernel to boot into /init (instead of
+/linuxrc) on i.MX6, when booting in mfgtools mode. This way we can boot a
+buildroot system entirely through USB.
+
+Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
+---
+ include/configs/mx6qsabre_common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/mx6qsabre_common.h b/include/configs/mx6qsabre_common.h
+index 69ff0df..ec7b665 100644
+--- a/include/configs/mx6qsabre_common.h
++++ b/include/configs/mx6qsabre_common.h
+@@ -129,7 +129,7 @@
+ 
+ #define CONFIG_MFG_ENV_SETTINGS \
+ 	"mfgtool_args=setenv bootargs console=" CONFIG_CONSOLE_DEV ",115200 " \
+-		"rdinit=/linuxrc " \
++		"rdinit=/init " \
+ 		"g_mass_storage.stall=0 g_mass_storage.removable=1 " \
+ 		"g_mass_storage.idVendor=0x066F g_mass_storage.idProduct=0x37FF "\
+ 		"g_mass_storage.iSerialNumber=\"\" "\
+-- 
+2.0.1
+
diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6sabresd_defconfig
index 16e4d0b..bc0aa46 100644
--- a/configs/freescale_imx6sabresd_defconfig
+++ b/configs/freescale_imx6sabresd_defconfig
@@ -25,3 +25,4 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/freescale/imx6sabresd"
-- 
2.0.1
