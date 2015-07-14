From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 14 Jul 2015 17:16:08 +0200
Subject: [Buildroot] [PATCH v4 6/7] zedboard: Patch default U-Boot
 environment for zedboard
In-Reply-To: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
Message-ID: <20150714171608.5d71bdcf@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes the U-Boot's default environment to
boot Zedboard out-of-the-box from SD card.

The sdboot procedure tries to load a file system.bit into
the Zynq's PL (only if it exists). It is also possible to
alter the booting by an uEnv.txt file located on your SD card.
The uEnv.txt is a plain text file with <key>=<value> pairs
one per line.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 ...eate-zedboard-specific-U-Boot-environment.patch | 46 ++++++++++++++++++++++
 configs/zedboard_defconfig                         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch

diff --git a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
new file mode 100644
index 0000000..1971503
--- /dev/null
+++ b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
@@ -0,0 +1,46 @@
+From a4c0058967a551385da5e16d2787d9f704cab225 Mon Sep 17 00:00:00 2001
+From: Jan Viktorin <viktorin@rehivetech.com>
+Date: Thu, 18 Jun 2015 16:26:02 +0200
+Subject: [PATCH 2/2] zynq: Create zedboard-specific U-Boot environment
+
+---
+ include/configs/zynq_zed.h | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/include/configs/zynq_zed.h b/include/configs/zynq_zed.h
+index 946de95..2400a88 100644
+--- a/include/configs/zynq_zed.h
++++ b/include/configs/zynq_zed.h
+@@ -24,4 +24,29 @@
+
+ #include <configs/zynq-common.h>
+
++#undef CONFIG_EXTRA_ENV_SETTINGS
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
++	" then echo Importing uEnv.txt; env import -t 0x1000"  \
++	" $filesize; fi;\0"                                    \
++	"bootcmd=run $modeboot\0"                              \
++	"modeboot=sdboot\0"                                    \
++	"baudrate=115200\0"                                    \
++	"bootenv=uEnv.txt\0"                                   \
++	"devicetree_image=zynq-zed.dtb\0"                      \
++	"kernel_image=uImage\0"                                \
++	"ramdisk_image=rootfs.cpio.uboot\0"                    \
++	"fpga_image=system.bit\0"                              \
++	"sdboot=echo Booting from SD...;"                      \
++	" run envload; run fpgaboot;"                          \
++	" fatload mmc 0 0x1000000 ${kernel_image}"             \
++	" && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
++	" && fatload mmc 0 0x3000000 ${devicetree_image}"      \
++	" && bootm 0x1000000 0x2000000 0x3000000\0"            \
++	"fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
++	" then echo Booting FPGA from ${fpga_image};"          \
++	" fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
++	" else echo FPGA image ${fpga_image} was not found,"   \
++	" skipping...; fi;\0"
++
+ #endif /* __CONFIG_ZYNQ_ZED_H */
+--
+2.4.3
+
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index cd6436c..99720db 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2015.07-rc2"
+BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/zedboard/uboot"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
-- 
2.4.5




-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech                    Phone:  +420 606 201 868
   Brno, Czech Republic
