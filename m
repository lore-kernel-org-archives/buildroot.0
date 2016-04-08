From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 8 Apr 2016 16:30:41 +0200
Subject: [Buildroot] [PATCH v3 4/4] board/atmel: update documentation for SD
	card generation
In-Reply-To: <1460125841-7648-1-git-send-email-ludovic.desroches@atmel.com>
References: <1460125841-7648-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1460125841-7648-6-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Henceforth, a sdcard.img file is automatically generated. It simplifies the
procedure to generate a bootable SD card for Atmel Xplained boards.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 board/atmel/readme.txt | 66 +++++++++++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 38 deletions(-)

diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 5029e7b..7f1a086 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -119,51 +119,41 @@ Reboot, the system should boot up to the buildroot login invite.
 Preparing the SD card
 =====================
 
-The SD card must be partitioned with at least two partitions: one
-FAT16 partition for the bootloaders, kernel image and Device Tree
-blob, and one ext4 partition for the root filesystem. To partition the
-SD card:
+An image named sdcard.img is automatically generated. With this image, you no
+longer have to care about the creation of the partition and copying files to
+the SD card.
 
-sudo sfdisk /dev/mmcblk0 <<EOF
-,64MiB,6
-;
-EOF
+You need@least a 1GB SD card. All the data on the SD card will be lost. To
+copy the image on the SD card:
 
-This creates a 64 MB partition for the FAT16 filesystem (type 6) and
-uses the rest for the ext4 filesystem used for the root filesystem.
+/!\ Caution be sure to do it on the right mmcblk device /!\
 
-Then, format both partitions:
+dd if=output/images/sdcard.img of=/dev/mmcblk0
 
-sudo mkfs.msdos -n boot /dev/mmcblk0p1
-sudo mkfs.ext4 -L rootfs -O ^huge_file /dev/mmcblk0p2
-
- Note: the -O ^huge_file option is needed to avoid enabling the huge
- files features of ext4 (to support files larges than 2 TB), which
- needs the kernel option CONFIG_LBDAF to be enabled.
-
-Mount both partitions (if not done automatically by your system):
-
-sudo mount /dev/mmcblk0p1 /media/boot
-sudo mount /dev/mmcblk0p2 /media/rootfs
-
-Copy the bootloaders, kernel image and Device Tree blob to the first
-partition:
+Insert your SD card in your Xplained board, and enjoy. The default
+U-Boot environment will load properly the kernel and Device Tree blob
+from the first partition of the SD card, so everything works
+automatically.
 
-cp output/images/boot.bin /media/boot/
-cp output/images/u-boot.bin /media/boot/
-cp output/images/zImage /media/boot/
-cp output/images/at91-sama5d2_xplained.dtb /media/boot/
+By default a 16MB FAT partition is created. It contains at91bootstrap, u-boot,
+the kernel image and all dtb variants for your board. The dtb used is the basic
+one:
 
-Extract the root filesystem to the second partition:
+U-Boot> print
+[...]
+bootcmd=fatload mmc 1:1 0x21000000 at91-sama5d2_xplained.dtb; fatload mmc 1:1 0x22000000 zImage; bootz 0x22000000 - 0x21000000
+[...]
 
-sudo tar -C /media/rootfs -xf output/images/rootfs.tar
+If you want to use a variant such as the _pda7 one, you will have to update
+your u-boot environment:
 
-Unmount both partitions:
+U-Boot> setenv bootcmd 'fatload mmc 1:1 0x21000000 at91-sama5d2_xplained_pda7.dtb; fatload mmc 1:1 0x22000000 zImage; bootz 0x22000000 - 0x21000000'
+U-Boot> save
+Saving Environment to FAT...
+writing uboot.env
+done
 
-sudo umount /media/boot
-sudo umount /media/rootfs
+A 512MB ext4 partition is also created to store the rootfs generated.
 
-Insert your SD card in your Xplained board, and enjoy. The default
-U-Boot environment will properly load the kernel and Device Tree blob
-from the first partition of the SD card, so everything works
-automatically.
+If you want to customize the size of the partitions and their content, take a
+look at the the genimage.cfg file in the board repository.
-- 
2.5.0
