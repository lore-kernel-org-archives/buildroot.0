From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 20 Oct 2015 13:32:23 +0200
Subject: [Buildroot] [PATCH v2 5/7] altera: change mmcblk0 to sdc
In-Reply-To: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445340745-1000-6-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not very common to have mmcblk0 device on the host PC,
the previous text was quite confusing.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/altera/readme.txt | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index fdd7316..62c3670 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -106,9 +106,9 @@ Determine the device associated to the SD card :
 
   $ cat /proc/partitions
 
-let's assume it is /dev/mmcblk0 :
+let's assume it is /dev/sdc :
 
-  $ sudo fdisk /dev/mmcblk0
+  $ sudo fdisk /dev/sdc
 
 Delete all previous partitions with 'd' then create the new partition table,
 using these options, pressing enter after each one:
@@ -120,15 +120,15 @@ using these options, pressing enter after each one:
 Using the 'p' option, the SD card's partition must look like this :
 
 Device         Boot     Start       End  Blocks  Id System
-/dev/mmcblk0p1        9000000   9041919   20960   b W95 FAT32
-/dev/mmcblk0p2           4096   8996863 4496384  83 Linux
-/dev/mmcblk0p3           2048      4095    1024  a2 Unknown
+/dev/sdc1             9000000   9041919   20960   b W95 FAT32
+/dev/sdc2                4096   8996863 4496384  83 Linux
+/dev/sdc3                2048      4095    1024  a2 Unknown
 
 Then write the partition table using 'w' and exit.
 
 Make partition one a DOS partition :
 
-  $ sudo mkdosfs /dev/mmcblk0p1
+  $ sudo mkdosfs /dev/sdc1
 
 Install the binaries to the SDcard
 ----------------------------------
@@ -141,19 +141,19 @@ The partition with type a2 is the partition scan by the first bootloader stage
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
 
 Copy the rootfs :
 
-  $ sudo dd if=rootfs.ext2 of=/dev/mmcblk0p2 bs=64k
+  $ sudo dd if=rootfs.ext2 of=/dev/sdc2 bs=64k
   $ sudo sync
 
 It's Done!
-- 
2.6.1
