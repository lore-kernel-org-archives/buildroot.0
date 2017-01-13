From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
Date: Fri, 13 Jan 2017 10:55:30 -0500
Subject: [Buildroot] [PATCH 4/4] board/altera: Update README for new scripts
	and fixed some typos
In-Reply-To: <1484322930-27625-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484322930-27625-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <1484322930-27625-4-git-send-email-lucas.bajolet@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
---
 board/altera/readme.txt | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index 1894a79..b002161 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -84,7 +84,7 @@ Signing the Preloader
 *** BEWARE ****
 The u-boot-spl.bin must be signed using the Altera's tool "mkpimage".
 This tool comes as a part of the Altera development environnment (SoC EDS).
-A fork of this tool have been done by Maxime Hadjinlian and can be found here:
+A fork of this tool by Maxime Hadjinlian is available here:
 https://github.com/maximeh/mkpimage
 
 Remember that without signing the u-boot-spl.bin, the board will not boot !!!
@@ -111,16 +111,20 @@ let's assume it is /dev/mmcblk0:
 Delete all previous partitions with 'd' then create the new partition table,
 using these options, pressing enter after each one:
 
-  * n p 1 9000000 +20480K t 1 b
-  * n p 2 4096 +4496384K t 83
-  * n p 3 2048 +1024K t 3 a2
+  * n p 1 9000000 +20480K
+  * n p 2 4096 +4496384K
+  * n p 3 2048 +1024K
+
+Then, still in fdisk, change the type of the partitions according to this
+  * t 1 a2
+  * t 2 b
 
 Using the 'p' option, the SD card's partition must look like this:
 
-Device         Boot     Start       End  Blocks  Id System
-/dev/mmcblk0p1        9000000   9041919   20960   b W95 FAT32
-/dev/mmcblk0p2           4096   8996863 4496384  83 Linux
-/dev/mmcblk0p3           2048      4095    1024  a2 Unknown
+Device         Boot     Start   End   Blocks  Id System
+/dev/mmcblk0p1              1  1395     1395  a2 Unknown
+/dev/mmcblk0p2           2048 22527    20480   b W95 FAT32
+/dev/mmcblk0p3          24576 29119     4544  83 Linux
 
 Then write the partition table using 'w' and exit.
 
@@ -156,10 +160,22 @@ Copy the rootfs:
 
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
+NOTE: For the script to work, you will need `mkpimage` in your PATH somewhere as it is called at the end of the build.
+
 Finish
 ======
 
 Eject your SDcard, insert it in your SoCkit, and power it up.
 
 if you want a serial console, you can plug a micro B USB cable on the USB-UART
-port, the serial port config to used is 57600/8-N-1.
+port, the serial port config to use is 115200/8-N-1.
-- 
2.7.4
