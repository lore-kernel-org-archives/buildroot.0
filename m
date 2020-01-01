From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 17:19:24 +0100
Subject: [Buildroot] [git commit] configs/stm32mp157c_dk2: remove
 unnecessary workaround
Message-ID: <20200101161034.007CA8EA59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4eaa2be389cd69d9116e8e690f6cc19571c439f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the metadata_csum ext4 option is disabled, we no longer need
the U-Boot workaround.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfigs-fix-checking-the-presence-of-an-env.patch | 37 ----------------------
 configs/stm32mp157c_dk2_defconfig                  |  1 -
 2 files changed, 38 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch b/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
deleted file mode 100644
index 695c8bbc42..0000000000
--- a/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-stm32mp1-configs-fix-checking-the-presence-of-an-env.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a7204e5ae1e5f87ad449c7425cf7614205e60734 Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <bartosz.bilas@hotmail.com>
-Date: Sun, 27 Oct 2019 09:01:12 +0100
-Subject: [PATCH] stm32mp1: configs: fix checking the presence of an
- environment
-
-Execute env check command within extra env settings section instead of
-bootcmd whereby we are able to mount rootfs partition from sd card properly.
-
-Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
----
- include/configs/stm32mp1.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
-index 988992b336..cadc0358fd 100644
---- a/include/configs/stm32mp1.h
-+++ b/include/configs/stm32mp1.h
-@@ -115,7 +115,6 @@
- 	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
- 	"then stm32prog ${boot_device} ${boot_instance}; " \
- 	"else " \
--		"run env_check;" \
- 		"if test ${boot_device} = mmc;" \
- 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
- 		"if test ${boot_device} = nand;" \
-@@ -160,6 +159,7 @@
- 	"initrd_high=0xffffffff\0" \
- 	"altbootcmd=run bootcmd\0" \
- 	"env_default=1\0" \
-+	"run env_check;" \
- 	"env_check=if test $env_default -eq 1;"\
- 		" then env set env_default 0;env save;fi\0" \
- 	STM32MP_BOOTCMD \
--- 
-2.23.0
-
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 7e5db3caa9..0535cb212a 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157c-dk2/patches"
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32mp157c-dk2/genimage.cfg"
