From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 19 Oct 2015 18:24:53 +0200
Subject: [Buildroot] [PATCH 3/4] socfpga: update readme for sockit/socdk
	boards
In-Reply-To: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445271894-22553-4-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The readme uses mmcblk0 which is quite unusual on host PC.
Moreover, the referred website uses /dev/sdx convention.

The fdisk rules didn't work for me this way. there is a little
mistake when setting type of partition 2. The numbers are for
bigger SD card. This is to be considered...

Should I break it to smaller commits?

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/altera/readme.txt | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index 8d5b891..882f54d 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -101,29 +101,30 @@ Determine the device associated to the SD card :
 
   $ cat /proc/partitions
 
-let's assume it is /dev/mmcblk0 :
+let's assume it is /dev/sdc :
 
-  $ sudo fdisk /dev/mmcblk0
+  $ sudo fdisk /dev/sdc
 
 Delete all previous partitions with 'd' then create the new partition table,
-using these options, pressing enter after each one:
+using these options, pressing enter after each one (you may need to use different
+values if your SD card is smaller/bigger then 4G):
 
-  * n p 1 9000000 +20480K t 1 b
-  * n p 2 4096 +4496384K t 83
-  * n p 3 2048 +1024K t 3 a2
+  * n p 1 7000000 7774207 t b
+  * n p 2 4096 6999999 t 2 83
+  * n p 3 2048 4095 t 3 a2
 
 Using the 'p' option, the SD card's partition must look like this :
 
-Device         Boot     Start       End  Blocks  Id System
-/dev/mmcblk0p1        9000000   9041919   20960   b W95 FAT32
-/dev/mmcblk0p2           4096   8996863 4496384  83 Linux
-/dev/mmcblk0p3           2048      4095    1024  a2 Unknown
+Device     Boot   Start     End Sectors  Size Id Type
+/dev/sdc1       7000000 7774207  774208  378M  b W95 FAT32
+/dev/sdc2          4096 6999999 6995904  3.3G 83 Linux
+/dev/sdc3          2048    4095    2048    1M a2 unknown
 
 Then write the partition table using 'w' and exit.
 
 Make partition one a DOS partition :
 
-  $ sudo mkdosfs /dev/mmcblk0p1
+  $ sudo mkdosfs /dev/sdc1
 
 Install the binaries to the SDcard
 ----------------------------------
@@ -136,13 +137,13 @@ The partition with type a2 is the partition scan by the first bootloader stage
 in the SoCkit ROM to find the next bootloader stage so we must write the signed
 preloader and the u-boot binaries in that partition :
 
-  $ sudo dd if=u-boot-spl-signed.bin of=/dev/mmcblk0p3 bs=64k seek=0
-  $ sudo dd if=u-boot.img of=/dev/mmcblk0p3 bs=64k seek=4
+  $ sudo dd if=u-boot-spl-signed.bin of=/dev/sdc3 bs=64k seek=0
+  $ sudo dd if=u-boot.img of=/dev/sdc3 bs=64k seek=4
 
 Copy the Linux kernel and its Device tree :
 
   $ sudo mkdir /mnt/sdcard
-  $ sudo mount /dev/mmcblk0p1 /mnt/sdcard
+  $ sudo mount /dev/sdc1 /mnt/sdcard
   $ sudo cp socfpga.dtb uImage /mnt/sdcard
   $ sudo umount /mnt/sdcard
 
-- 
2.6.1
