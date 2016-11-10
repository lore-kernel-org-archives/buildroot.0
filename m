From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 10 Nov 2016 13:39:48 -0200
Subject: [Buildroot] [PATCH 4/4] imx233_olinuxino: readme: Remove a section
In-Reply-To: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
References: <1478792388-13279-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1478792388-13279-4-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the conversion to the common genimage scripts, the uImage.imx23-olinuxino
file no longer exists.

Instead of updating the section, let's simply remove it as the more
standard method of using sdcard.img is already explained.

This also makes the readme more consistent with the other i.MX readme files.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/olimex/imx233_olinuxino/readme.txt | 70 --------------------------------
 1 file changed, 70 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
index 2722c3a..1e676c4 100644
--- a/board/olimex/imx233_olinuxino/readme.txt
+++ b/board/olimex/imx233_olinuxino/readme.txt
@@ -27,73 +27,3 @@ Then, run the following command as root:
 *** WARNING! The command will destroy all the card content. Use with care! ***
 
  sudo dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
-
-=== Manual creation of SD card image =========================================
-
-You'll need a spare MicroSD card with Freescale's special partition layout.
-This is basically three partitions:
-
-1) Type 53, the U-Boot partition, should be 16MB.
-2) VFAT, place the kernel uImage there
-3) Anything you like, for this example an ext2 partition, type 83 (linux).
-
-Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
-and from the buildroot project top level directory:
-(remember to replace /dev/sdc* with the appropiate device name!)
-
-***** WARNING: Double check that /dev/sdc is your MicroSD card *****
-*****      It might be /dev/sdb or some other device name      *****
-***** Failure to do so may result in you wiping your hard disk *****
-
-1. Unmount the filesystem(s) if they're already mounted, usually...
-
-   # for fs in `grep /dev/sdc /proc/mounts|cut -d ' ' -f 1`;do umount $fs;done
-
-   ...should work
-
-2. Blank the partition table out
-
-   # dd if=/dev/zero of=/dev/sdc bs=1024 count=1024
-
-3. Set up the partitions
-
-   # fdisk /dev/sdc
-   n
-   p
-   1
-   <ENTER>
-   +16MB
-   t
-   53
-   n
-   p
-   2
-   <ENTER>
-   +5M
-   t
-   2
-   4
-   n
-   p
-   3
-   <ENTER>
-   <ENTER>
-   w
-
-4. Fill up the first (U-Boot) partition
-   # dd if=output/images/u-boot.sd bs=512 of=/dev/sdc1
-
-5. Create VFAT Filesystem
-   # mkfs.vfat /dev/sdc2
-
-6. Mount and copy output/images/uImage.imx23-olinuxino to the VFAT partition, rename to uImage
-   # mount /dev/sdc2 /mnt
-   # cp output/images/uImages/uImage.imx23-olinuxino /mnt/uImage
-   # umount /mnt
-
-7. Fill up the third (filesystem) partition
-   # dd if=output/images/rootfs.ext2 of=/dev/sdc3 bs=512
-
-8. Remove the MicroSD card from your linux PC and put it into your olinuxino.
-
-9. Boot! You're done!
-- 
2.7.4
