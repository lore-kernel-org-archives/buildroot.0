From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 24 Mar 2016 15:42:44 +0100
Subject: [Buildroot] [PATCH v2 4/4] board/atmel: merge and update
	documentation
In-Reply-To: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
References: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1458830564-27350-4-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There were two readme files (one for flashing on NAND and one to create a
SD card) in different places. Merge them and update the SD card
generation part since all Xplained boards are supported and the -u
option of sfdisk is obsolete on latest versions.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---

Changes:
- v2:
  - merge the two readme files

 board/atmel/readme.txt          | 87 ++++++++++++++++++++++++++++++++++++-----
 board/atmel/xplained/readme.txt | 73 ----------------------------------
 2 files changed, 77 insertions(+), 83 deletions(-)
 delete mode 100644 board/atmel/xplained/readme.txt

diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 539ef66..1e86a11 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -1,10 +1,6 @@
-Flashing the NAND using SAM-BA
-==============================
-
-This document explains how to flash a basic Buildroot system on various
-Atmel boards. Additional details can
-also be found on the Linux4SAM website, in particular here:
-http://www.at91.com/linux4sam/bin/view/Linux4SAM/GettingStarted
+This document explains how to set up a basic Buildroot system on various
+Atmel boards. Additional details can also be found on the Linux4SAM website:
+http://www.at91.com/linux4sam/bin/view/Linux4SAM/
 
 This guide covers the following configurations:
  - at91sam9g45m10ek_defconfig
@@ -14,20 +10,91 @@ This guide covers the following configurations:
  - atmel_sama5d3xek_defconfig (sama5d31, sama5d33, sama5d34, sama5d35,
    sama5d36)
  - atmel_sama5d3_xplained_defconfig
+ - atmel_sama5d3_xplained_mmc_defconfig
  - atmel_sama5d4ek_defconfig
  - atmel_sama5d4_xplained_defconfig
+ - atmel_sama5d4_xplained_mmc_defconfig
+ - atmel_sama5d2_xplained_mmc_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
-the git trees maintained by Atmel. They also build u-boot SPL when
-available, it can replace AT91Bootstrap.
+the git trees maintained by Atmel.
 
 
 Configuring and building Buildroot
-----------------------------------
+==================================
+
+For Xplained boards, an alternative mmc defconfig file is provided to boot from
+an SD card: first stage bootloader, second stage bootloader, kernel image,
+device tree file and root file system are all located on the SD card.
 
   make <board>_defconfig
   make
 
+goto to 'Flashing the NAND using SAM-BA' section
+
+or
+
+  make <board>_mmc_defconfig
+  make
+
+goto to 'Preparing the SD card' section
+
+
+Preparing the SD card
+=====================
+
+The SD card must be partitioned with at least two partitions: one
+FAT16 partition for the bootloaders, kernel image and Device Tree
+blob, and one ext4 partition for the root filesystem. To partition the
+SD card:
+
+sudo sfdisk /dev/mmcblk0 <<EOF
+,64MiB,6
+;
+EOF
+
+This creates a 64 MB partition for the FAT16 filesystem (type 6) and
+uses the rest for the ext4 filesystem used for the root filesystem.
+
+Then, format both partitions:
+
+sudo mkfs.msdos -n boot /dev/mmcblk0p1
+sudo mkfs.ext4 -L rootfs -O ^huge_file /dev/mmcblk0p2
+
+ Note: the -O ^huge_file option is needed to avoid enabling the huge
+ files features of ext4 (to support files larges than 2 TB), which
+ needs the kernel option CONFIG_LBDAF to be enabled.
+
+Mount both partitions (if not done automatically by your system):
+
+sudo mount /dev/mmcblk0p1 /media/boot
+sudo mount /dev/mmcblk0p2 /media/rootfs
+
+Copy the bootloaders, kernel image and Device Tree blob to the first
+partition:
+
+cp output/images/boot.bin /media/boot/
+cp output/images/u-boot.bin /media/boot/
+cp output/images/zImage /media/boot/
+cp output/images/at91-sama5d2_xplained.dtb /media/boot/
+
+Extract the root filesystem to the second partition:
+
+sudo tar -C /media/rootfs -xf output/images/rootfs.tar
+
+Unmount both partitions:
+
+sudo umount /media/boot
+sudo umount /media/rootfs
+
+Insert your SD card in your Xplained board, and enjoy. The default
+U-Boot environment will properly load the kernel and Device Tree blob
+from the first partition of the SD card, so everything works
+automatically.
+
+
+Flashing the NAND using SAM-BA
+==============================
 
 Flashing the board
 ------------------
diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
deleted file mode 100644
index ba45122..0000000
--- a/board/atmel/xplained/readme.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-Atmel SAMA5D3 Xplained board
-============================
-
-This document explains how to set up a basic Buildroot system on the
-Atmel SAMA5D3 Xplained board, whose main site is
-http://www.atmel.com/tools/ATSAMA5D3-XPLD.aspx. Additional details can
-also be found on the http://www.at91.com/linux4sam/bin/view/Linux4SAM/
-web site.
-
-Note that the default Buildroot configuration is prepared to boot from
-an SD card: the first stage bootloader, second stage bootloader,
-kernel image and root filesystem are all located on the SD card. Some
-adjustments in the bootloader configuration will be needed to boot
-from NAND flash, see board/atmel/readme.txt
-
-Configuring and building Buildroot
-----------------------------------
-
-  make atmel_sama5d3_xplained_mmc_defconfig
-  make
-
-Preparing the SD card
----------------------
-
-The SD card must be partitioned with@least two partitions: one
-FAT16 partition for the bootloaders, kernel image and Device Tree
-blob, and one ext4 partition for the root filesystem. To partition the
-SD card:
-
-sudo sfdisk -uM /dev/mmcblk0 <<EOF
-,64,6
-;
-EOF
-
-This creates a 64 MB partition for the FAT16 filesystem (type 6) and
-uses the rest for the ext4 filesystem used for the root filesystem.
-
-Then, format both partitions:
-
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
-
-cp output/images/u-boot-spl.bin /media/boot/boot.bin
-cp output/images/u-boot.img /media/boot/u-boot.img
-cp output/images/zImage /media/boot/zImage
-cp output/images/at91-sama5d3_xplained.dtb /media/boot/at91-sama5d3_xplained.dtb
-
-Extract the root filesystem to the second partition:
-
-sudo tar -C /media/rootfs -xf output/images/rootfs.tar
-
-Unmount both partitions:
-
-sudo umount /media/boot
-sudo umount /media/rootfs
-
-Insert your SD card in your Xplained board, and enjoy. The default
-U-Boot environment will properly load the kernel and Device Tree blob
-from the first partition of the SD card, so everything works
-automatically.
-
-- 
2.5.0
