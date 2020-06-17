From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:23 +0200
Subject: [Buildroot] [PATCH v2 15/17] board/olpc: document flashing the
 JFFS2 image
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-16-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/readme.txt | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/board/olpc/readme.txt b/board/olpc/readme.txt
index 2ed44011f7..f04ad7037c 100644
--- a/board/olpc/readme.txt
+++ b/board/olpc/readme.txt
@@ -9,10 +9,13 @@ Supported models
 
 * OLPC XO-1
   The original NS Geode based OLPC laptop, uses the x86 architecture.
+  Can be booted either from an internal MTD device formatted with JFFS2
+  or from a FAT or EXT4 partition on a SD card or a USB flash stick.
 
 * OLPC XO-7.5
   The ARM-based laptop. Needs a recent enough firmware to provide a good
-  enough flattened device tree to the kernel.
+  enough flattened device tree to the kernel. Can be from a FAT or EXT4
+  partition on a internal eMMC, a SD card or a USB flash stick.
 
 Configure and build
 ===================
@@ -59,20 +62,37 @@ to update the firmware:
   ok flash ext:\q4e00ja.rom   \ Flash the "q4e00ja.rom" from the SD card
   ok flash u:\q4e00ja.rom     \ Flash the "q4e00ja.rom" from USB stick
 
-Create the bootable media
-=========================
+Create the bootable SD card or USB flash stick
+==============================================
 
-When the build is finished, the resulting image file will be called
-"sdcard.img". It can be written directly to a SD-card or and USB flash stick.
+When the build is finished, an image file called "sdcard.img" will be created.
+It is suitable for writing directly to a SD card, USB flash stick or (on a
+XO-1.75) the internal eMMC flash.
 
-Please double check that you're using the right device (e.g. with "lsblk"
-command). Doing the following will DESTROY ALL DATA that's currently on the
-media.
+Before writing the image, please double check that you're using the right
+device (e.g. with "lsblk" command). Doing the following will DESTROY ALL DATA
+that's currently on the media.
 
   # cat output/images/sdcard.img >/dev/<device>
 
+Flashing the JFFS2 image (XO-1 only)
+====================================
+
+Unlike XO-1.75, the internal NAND flash on XO-1 is accessed without a FTL
+and needs a filesystem flash-friendly filesystem. A build configured for
+XO-1 creates a file named "root.jffs2" that can be written to it.
+
+One way to write it is from the Open Firmware prompt. First, partition
+and format a USB flash disk with a FAT file system and place the
+"root.jffs2" file onto it. Then power on the machine, enter the
+Open Firmware port by pressing the ESC key and run the following:
+
+  ok patch noop ?open-crcs copy-nand  \ Disable CRC check
+  ok copy-nand u:\root.jffs2
+
 Booting the machine
 ===================
 
 Once your machine is unlocked, it will automatically boot from your media
-wherever it will detect it attached to the USB bus or the SD card slot.
+wherever it will detect it attached to the USB bus or the SD card slot,
+otherwise it will proceed booting from the internal flash.
-- 
2.26.2
