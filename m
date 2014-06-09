From: Javier Domingo Cansino <javierdo1@gmail.com>
Date: Mon,  9 Jun 2014 21:58:07 +0200
Subject: [Buildroot] [PATCH 1/1] Rewriting instructions to generate a
	zedboard image to make it really verbose
Message-ID: <1402343887-12278-1-git-send-email-javierdo1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Javier Domingo Cansino <javierdo1@gmail.com>
---
 board/avnet/zedboard/readme.txt |   51 +++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index efd076f..575c285 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -5,26 +5,57 @@ System-On-Chip.
 Zedboard information including schematics, reference designs, and manuals are
 available from http://www.zedboard.org .
 
-To boot the Zedboard using a buildroot generated image copy the following files
-to the sdcard:
-	zynq-zed.dtb -> devicetree.dtb
-	rootfs.cpio.gz.uboot -> uramdisk.image.gz
-	uImage -> uImage
-	boot.bin -> boot.bin
+The firmware releases for the Xilinx Zynq silicons depend on Xilinx some propietary tools or code. This dependency has been reduced to a pair of source files available in the regular Xilinx SDK.
 
-U-Boot SPL Support
--------------
+You will need this files from Xilinx tree to generate the later listed files:
+	ps7_init.c
+	ps7_init.h
+
+You will need the following files from output/images:
+	zynq-zed.dtb
+	rootfs.cpio.uboot
+	uImage
+	u-boot.img
+	boot.bin
+
+
+uboot.bin  -- U-Boot SPL Support
+--------------------------------
 
 Due to licensing issues, the files ps7_init.c/h are not able to be
 distributed with the U-Boot source code.  These files are required to make a
 boot.bin file.
 
-If you already have the Xilinx tools installed, the follwing sequence will
+If you already have the Xilinx tools installed, the following sequence will
 unpack, patch and build the rfs, kernel, uboot, and uboot-spl.
 
 make zedboard_defconfig
 make uboot-patch
 cp ${XILINX}/ISE_DS/EDK/sw/lib/hwplatform_templates/zed_hw_platform/ps7_init.{c,h} \
-output/build/uboot-xilinx-v2014.1/boards/xilinx/zynq/
+output/build/uboot-xilinx-v2014.1/board/xilinx/zynq/
+
+Now that you patched the uboot files, you will be capable of compiling the
+buildroot:
+
 make
 
+
+Resulting system
+----------------
+The SD card should be filled like the following, in a FAT32 partition at the
+beggining of the device:
+	/boot.bin
+	/devicetree.dtb
+	/uImage
+	/uramdisk.image.gz
+	/u-boot.img
+
+
+All needed files can be taken from output/images/
+
+boot.bin, uImage and u-boot.img are direct copies of the same files
+available on output/images/
+
+devicetree.dtb is just zynq-zed.dtb renamed.
+
+uramdisk.image.gz is rootfs.cpio.uboot renamed
-- 
1.7.10.4
