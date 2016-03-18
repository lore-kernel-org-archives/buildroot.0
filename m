From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 22:08:19 +0100
Subject: [Buildroot] [PATCH v2 17/17] configs/stm32f469_disco: new
	configuration for STM32F469 Discovery board
In-Reply-To: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458335299-27409-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lee Jones <lee.jones@linaro.org>

Similar to stm32f429_disco, this commit adds a configuration for the
Cortex-M4 based STM32F469 platform.

It requires a few kernel patches, which have already been submitted
upstream, as well as a small OpenOCD patch. Besides that, it re-uses
most of what has been added for the STM32F429 platform.

Signed-off-by: Lee Jones <lee.jones@linaro.org>

[Thomas:
 - squash multiple patches from Lee Jones into one
 - improve the readme.txt file
 - sync the defconfig with the adaptations made to the stm32f429
   configuration.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/stmicroelectronics/stm32f469-disco/flash.sh  |  20 ++++
 ...-ARM-stm32-Identify-a-new-board-STM32F469.patch |  25 +++++
 ...upply-a-DTS-file-for-the-STM32F469-Discov.patch | 101 +++++++++++++++++++++
 ...-Add-new-config-fragment-to-change-RAM-st.patch |  28 ++++++
 .../patches/openocd/0001-add-config.patch          |  37 ++++++++
 .../patches/openocd/0002-flash-nor.patch           |  37 ++++++++
 .../stmicroelectronics/stm32f469-disco/readme.txt  |  19 ++++
 configs/stm32f469_disco_defconfig                  |  19 ++++
 8 files changed, 286 insertions(+)
 create mode 100755 board/stmicroelectronics/stm32f469-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/readme.txt
 create mode 100644 configs/stm32f469_disco_defconfig

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
new file mode 100755
index 0000000..a68bea0
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+${OUTPUT_DIR}/host/usr/bin/openocd -f board/stm32f469discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08008000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch
new file mode 100644
index 0000000..01af415
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Identify-a-new-board-STM32F469.patch
@@ -0,0 +1,25 @@
+From 3b572676972f9bcf69695fd85a582c6622f7faa8 Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Tue, 16 Feb 2016 14:04:17 +0000
+Subject: [PATCH] ARM: stm32: Identify a new board - STM32F469
+
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+---
+ arch/arm/mach-stm32/board-dt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
+index f2ad772..ceee477 100644
+--- a/arch/arm/mach-stm32/board-dt.c
++++ b/arch/arm/mach-stm32/board-dt.c
+@@ -10,6 +10,7 @@
+ 
+ static const char *const stm32_compat[] __initconst = {
+ 	"st,stm32f429",
++	"st,stm32f469",
+ 	NULL
+ };
+ 
+-- 
+2.6.4
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch
new file mode 100644
index 0000000..45f5228
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Supply-a-DTS-file-for-the-STM32F469-Discov.patch
@@ -0,0 +1,101 @@
+From a08561ffdfb13986e2628296ccfd42f8a273b729 Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Tue, 16 Feb 2016 13:53:47 +0000
+Subject: [PATCH] ARM: stm32: Supply a DTS file for the STM32F469 Discovery
+ board
+
+It's pretty similar to the STM32F429, but there are some
+subtle changes required to boot successfully.
+
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+[Thomas: remove rdinit= from /chosen/bootargs.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ arch/arm/boot/dts/stm32f469-disco.dts | 75 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 75 insertions(+)
+ create mode 100644 arch/arm/boot/dts/stm32f469-disco.dts
+
+diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
+new file mode 100644
+index 0000000..9e73656
+--- /dev/null
++++ b/arch/arm/boot/dts/stm32f469-disco.dts
+@@ -0,0 +1,75 @@
++/*
++ * Copyright 2016 - Lee Jones <lee.jones@linaro.org>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This file is distributed in the hope that it will be useful,
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ *     You should have received a copy of the GNU General Public
++ *     License along with this file; if not, write to the Free
++ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
++ *     MA 02110-1301 USA
++ *
++ * Or, alternatively,
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use,
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/dts-v1/;
++#include "stm32f429.dtsi"
++
++/ {
++	model = "STMicroelectronics STM32F469i-DISCO board";
++	compatible = "st,stm32f469i-disco", "st,stm32f469";
++
++	chosen {
++		bootargs = "root=/dev/ram";
++		stdout-path = "serial0:115200n8";
++	};
++
++	memory {
++		reg = <0x00000000 0x800000>;
++	};
++
++	aliases {
++		serial0 = &usart3;
++	};
++};
++
++&clk_hse {
++	clock-frequency = <8000000>;
++};
++
++&usart3 {
++	status = "okay";
++};
+-- 
+2.6.4
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch
new file mode 100644
index 0000000..e12c9bc
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-Add-new-config-fragment-to-change-RAM-st.patch
@@ -0,0 +1,28 @@
+From 7d67f4be6e1b4d08126023c3902e3fc39488bbf9 Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Tue, 16 Feb 2016 13:56:13 +0000
+Subject: [PATCH] ARM: configs: Add new config fragment to change RAM start
+ point
+
+Rather than duplicate a defconfig for each difference
+between platforms, we can choose to pick a basic defconfig and
+manipulate it at run-time using config fragments.  Here we're
+adding a new fragment to over-ride the RAM start point to 0x0.
+
+Cc: Arnd Bergmann <arnd@arndb.de>
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+---
+ arch/arm/configs/dram_0x00000000.config | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 arch/arm/configs/dram_0x00000000.config
+
+diff --git a/arch/arm/configs/dram_0x00000000.config b/arch/arm/configs/dram_0x00000000.config
+new file mode 100644
+index 0000000..db96dcb
+--- /dev/null
++++ b/arch/arm/configs/dram_0x00000000.config
+@@ -0,0 +1 @@
++CONFIG_DRAM_BASE=0x00000000
+-- 
+2.6.4
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch b/board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
new file mode 100644
index 0000000..036c4f6
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/openocd/0001-add-config.patch
@@ -0,0 +1,37 @@
+From 26045588f462476cee356d15a24944d6c26befb4 Mon Sep 17 00:00:00 2001
+From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
+Date: Sat, 24 Oct 2015 00:13:38 +0200
+Subject: [PATCH] tcl: add STM32F469 discovery board config
+
+Change-Id: Iad7ee06330b3259ea0ce0d174dfdade6785913eb
+Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
+Reviewed-on: http://openocd.zylin.com/3043
+Tested-by: jenkins
+Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
+Reviewed-by: Freddie Chopin <freddie.chopin@gmail.com>
+---
+ tcl/board/stm32f469discovery.cfg | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+ create mode 100644 tcl/board/stm32f469discovery.cfg
+
+diff --git a/tcl/board/stm32f469discovery.cfg b/tcl/board/stm32f469discovery.cfg
+new file mode 100644
+index 0000000..eecfe33
+--- /dev/null
++++ b/tcl/board/stm32f469discovery.cfg
+@@ -0,0 +1,12 @@
++#
++# This is an STM32F469 discovery board with a single STM32F469NI chip.
++# http://www.st.com/web/catalog/tools/FM116/CL1620/SC959/SS1532/LN1848/PF262395
++#
++
++source [find interface/stlink-v2-1.cfg]
++
++transport select hla_swd
++
++source [find target/stm32f4x.cfg]
++
++reset_config srst_only
+-- 
+1.9.1
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch b/board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
new file mode 100644
index 0000000..bfec983
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/openocd/0002-flash-nor.patch
@@ -0,0 +1,37 @@
+From 3e219648c80a27f0519003f3b088cbb846e255d8 Mon Sep 17 00:00:00 2001
+From: Maxime Coquelin <maxime.coquelin@st.com>
+Date: Sat, 24 Oct 2015 00:03:54 +0200
+Subject: [PATCH] flash/nor/stm32f2x: Add STM32F469 part
+
+Change-Id: I4e13ceb0ba954dc2fea059ddeef10109be938c9c
+Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
+Reviewed-on: http://openocd.zylin.com/3042
+Tested-by: jenkins
+Reviewed-by: Freddie Chopin <freddie.chopin@gmail.com>
+---
+ src/flash/nor/stm32f2x.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/flash/nor/stm32f2x.c b/src/flash/nor/stm32f2x.c
+index 2130444..89fc75d 100644
+--- a/src/flash/nor/stm32f2x.c
++++ b/src/flash/nor/stm32f2x.c
+@@ -790,6 +790,7 @@ static int stm32x_probe(struct flash_bank *bank)
+ 		max_flash_size_in_kb = 1024;
+ 		break;
+ 	case 0x419:
++	case 0x434:
+ 		max_flash_size_in_kb = 2048;
+ 		break;
+ 	case 0x423:
+@@ -952,6 +953,7 @@ static int get_stm32x_info(struct flash_bank *bank, char *buf, int buf_size)
+ 
+ 	case 0x413:
+ 	case 0x419:
++	case 0x434:
+ 		device_str = "STM32F4xx";
+ 
+ 		switch (rev_id) {
+-- 
+1.9.1
+
diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
new file mode 100644
index 0000000..3b88496
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -0,0 +1,19 @@
+STM32F469 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F469 Discovery evaluation platform.
+
+Building
+--------
+
+  make stm32f469_disco_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32/stm32f469-disco/flash.sh output/
+
+It will flash the minimal bootloader, the Device Tree Blob, and the
+kernel image which includes the root filesystem as initramfs.
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
new file mode 100644
index 0000000..5fd893b
--- /dev/null
+++ b/configs/stm32f469_disco_defconfig
@@ -0,0 +1,19 @@
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches/"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
+BR2_PACKAGE_BUSYBOX_CONFIG="board/stmicroelectronics/busybox-minimal.config"
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AFBOOT_STM32=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.6.4
