From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 27 Oct 2019 10:01:26 +0100
Subject: [Buildroot] [PATCH] configs/stm32mp157_dk: bump U-Boot to 2019.10
In-Reply-To: <20191027090126.13878-1-b.bilas@grinn-global.com>
References: <20191027090126.13878-1-b.bilas@grinn-global.com>
Message-ID: <20191027090126.13878-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix mounting rootfs partition properly.
This issue is already reported upstream.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...-fix-checking-the-presence-of-an-env.patch | 37 +++++++++++++++++++
 configs/stm32mp157_dk_defconfig               |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch

diff --git a/board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch b/board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
new file mode 100644
index 0000000000..695c8bbc42
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157-dk/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
@@ -0,0 +1,37 @@
+From a7204e5ae1e5f87ad449c7425cf7614205e60734 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <bartosz.bilas@hotmail.com>
+Date: Sun, 27 Oct 2019 09:01:12 +0100
+Subject: [PATCH] stm32mp1: configs: fix checking the presence of an
+ environment
+
+Execute env check command within extra env settings section instead of
+bootcmd whereby we are able to mount rootfs partition from sd card properly.
+
+Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
+---
+ include/configs/stm32mp1.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
+index 988992b336..cadc0358fd 100644
+--- a/include/configs/stm32mp1.h
++++ b/include/configs/stm32mp1.h
+@@ -115,7 +115,6 @@
+ 	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
+ 	"then stm32prog ${boot_device} ${boot_instance}; " \
+ 	"else " \
+-		"run env_check;" \
+ 		"if test ${boot_device} = mmc;" \
+ 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+ 		"if test ${boot_device} = nand;" \
+@@ -160,6 +159,7 @@
+ 	"initrd_high=0xffffffff\0" \
+ 	"altbootcmd=run bootcmd\0" \
+ 	"env_default=1\0" \
++	"run env_check;" \
+ 	"env_check=if test $env_default -eq 1;"\
+ 		" then env set env_default 0;env save;fi\0" \
+ 	STM32MP_BOOTCMD \
+-- 
+2.23.0
+
diff --git a/configs/stm32mp157_dk_defconfig b/configs/stm32mp157_dk_defconfig
index 5ff25743ca..39605262fc 100644
--- a/configs/stm32mp157_dk_defconfig
+++ b/configs/stm32mp157_dk_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157-dk/patches"
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157-dk/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157-dk/genimage.cfg"
@@ -19,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.23.0
