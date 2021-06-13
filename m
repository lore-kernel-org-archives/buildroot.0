From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 13 Jun 2021 19:19:26 +0300
Subject: [Buildroot] [PATCH 6/6] board/orangepi-pc-plus: switch to GPT
 partitions for PARTLABEL support
In-Reply-To: <20210613161926.2790763-1-geomatsi@gmail.com>
References: <20210613161926.2790763-1-geomatsi@gmail.com>
Message-ID: <20210613161926.2790763-7-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In new kernels sunxi-mmc driver has been switched to asynchronous probe.
As a result, mmc (SD/eMMC) indexes can be shuffled breaking board boot.
Switch to GPT partitions to use partition labels instead of explicit
mmcblk device names. Note that the default GPT partition table location
conflicts with the SPL location, so move GPT table after bootloaders.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-pc-plus/boot.cmd     | 2 +-
 board/orangepi/orangepi-pc-plus/genimage.cfg | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc-plus/boot.cmd b/board/orangepi/orangepi-pc-plus/boot.cmd
index 0c75c862e0..c91f77942f 100644
--- a/board/orangepi/orangepi-pc-plus/boot.cmd
+++ b/board/orangepi/orangepi-pc-plus/boot.cmd
@@ -1,6 +1,6 @@
 setenv fdt_high ffffffff
 
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
 
 fatload mmc 0 $kernel_addr_r zImage
 fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc-plus.dtb
diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index 9ffa1a21ae..b4fcc827ec 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -13,13 +13,17 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
+		# for root=PARTLABEL support
+		gpt = true
+		# default GPT location conflicts with bootloaders, move it after
+		gpt-location = 1M
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
-		size = 1040384 # 1MB - 8192
+		size = 1056768 # 1MB - 8K + 16K(GPT)
 	}
 
 	partition boot {
@@ -28,6 +32,8 @@ image sdcard.img {
 		image = "boot.vfat"
 	}
 
+	# 'rootfs' will be used as the partition label, used
+	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-- 
2.32.0
