From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
Date: Fri, 20 Jan 2017 10:12:39 -0500
Subject: [Buildroot] [PATCH v3 3/3] board/altera: update README for new
	scripts and fixed some typos
In-Reply-To: <1484925159-25292-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484925159-25292-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <1484925159-25292-4-git-send-email-lucas.bajolet@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old README has a few typos which needed fixing.
Also with the newer versions of U-Boot and the patch applied to
the configuration, the partition table information and related
commands need to be updated.

Since the post-install script now supports Genimage,
a new paragraph explaining how it works has been added.

Also, removed link to mkpimage, since it is also natively
supported by Buildroot as an option.

Signed-off-by: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
---
 board/altera/readme.txt | 64 +++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index 1894a79..a19ba21 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -69,27 +69,13 @@ After building, you should obtain this tree:
 
     output/images/
     ??? rootfs.ext2
-    ??? rootfs.ext3 -> rootfs.ext2
     ??? rootfs.tar
     ??? socfpga_cyclone5_sockit.dtb or socfpga_cyclone5_socdk.dtb
-    ??? socfpga.dtb
+    ??? u-boot.bin
     ??? u-boot.img
     ??? u-boot-spl.bin
-    ??? uImage
-
-
-Signing the Preloader
----------------------
-
-*** BEWARE ****
-The u-boot-spl.bin must be signed using the Altera's tool "mkpimage".
-This tool comes as a part of the Altera development environnment (SoC EDS).
-A fork of this tool have been done by Maxime Hadjinlian and can be found here:
-https://github.com/maximeh/mkpimage
-
-Remember that without signing the u-boot-spl.bin, the board will not boot !!!
-
-  $ mkpimage u-boot-spl.bin -o u-boot-spl-signed.bin
+    ??? u-boot-spl.bin.crc
+    ??? zImage
 
 Prepare your SDcard
 ===================
@@ -111,22 +97,26 @@ let's assume it is /dev/mmcblk0:
 Delete all previous partitions with 'd' then create the new partition table,
 using these options, pressing enter after each one:
 
-  * n p 1 9000000 +20480K t 1 b
-  * n p 2 4096 +4496384K t 83
-  * n p 3 2048 +1024K t 3 a2
+  * n p 1 1 4095
+  * n p 2 4096 +22000
+  * n p 3  <Enter> -- This will take the remaining space from the SD card
+
+Then, still in fdisk, change the type of the partitions according to this
+  * t 1 a2
+  * t 2 b
 
 Using the 'p' option, the SD card's partition must look like this:
 
-Device         Boot     Start       End  Blocks  Id System
-/dev/mmcblk0p1        9000000   9041919   20960   b W95 FAT32
-/dev/mmcblk0p2           4096   8996863 4496384  83 Linux
-/dev/mmcblk0p3           2048      4095    1024  a2 Unknown
+Device         Boot     Start     End   Blocks  Id  System
+/dev/mmcblk0p1           2048    4095     2048  a2  Unknown
+/dev/mmcblk0p2           4096   26096    22001   b  W95 FAT32
+/dev/mmcblk0p3          26624 3862527  3835904  83  Linux
 
 Then write the partition table using 'w' and exit.
 
 Make partition one a DOS partition:
 
-  $ sudo mkdosfs /dev/mmcblk0p1
+  $ sudo mkdosfs /dev/mmcblk0p2
 
 Install the binaries to the SDcard
 ----------------------------------
@@ -139,27 +129,39 @@ The partition with type a2 is the partition scan by the first bootloader stage
 in the SoCkit ROM to find the next bootloader stage so we must write the signed
 preloader and the u-boot binaries in that partition:
 
-  $ sudo dd if=u-boot-spl-signed.bin of=/dev/mmcblk0p3 bs=64k seek=0
-  $ sudo dd if=u-boot.img of=/dev/mmcblk0p3 bs=64k seek=4
+  $ sudo dd if=u-boot-spl.bin of=/dev/mmcblk0p1 bs=64k seek=0
+  $ sudo dd if=u-boot-spl.bin.crc of=/dev/mmcblk0p1 bs=64k seek=1
+  $ sudo dd if=u-boot.img of=/dev/mmcblk0p1 bs=64k seek=4
 
 Copy the Linux kernel and its Device tree:
 
   $ sudo mkdir /mnt/sdcard
-  $ sudo mount /dev/mmcblk0p1 /mnt/sdcard
-  $ sudo cp socfpga.dtb uImage /mnt/sdcard
+  $ sudo mount /dev/mmcblk0p2 /mnt/sdcard
+  $ sudo cp socfpga_cyclone5_sockit.dtb /mnt/sdcard/socfpga.dtb
+  $ sudo cp zImage /mnt/sdcard
   $ sudo umount /mnt/sdcard
 
 Copy the rootfs:
 
-  $ sudo dd if=rootfs.ext2 of=/dev/mmcblk0p2 bs=64k
+  $ sudo dd if=rootfs.ext2 of=/dev/mmcblk0p3 bs=64k
   $ sudo sync
 
 It's Done!
 
+(ALT) Install the binaries to SDcard from genimage
+--------------------------------------------
+
+`genimage` will generate a `sockit_image.img` image in the output folder.
+From that point, you will need to execute the following command:
+
+   $ sudo dd if=sockit_image.img of=/dev/mmcblk0
+
+It's Done!
+
 Finish
 ======
 
 Eject your SDcard, insert it in your SoCkit, and power it up.
 
 if you want a serial console, you can plug a micro B USB cable on the USB-UART
-port, the serial port config to used is 57600/8-N-1.
+port, the serial port config to use is 115200/8-N-1.
-- 
2.7.4
