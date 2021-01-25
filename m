From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Jan 2021 09:11:30 +0100
Subject: [Buildroot] [PATCH] configs/orangepi_r1_defconfig: change to GPT
 partitions for root=PARTLABEL support
Message-ID: <20210125081131.9875-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GPT provides partition labels, which can be used to tell the kernel to find
the rootfs based on it (root=PARTLABEL=rootfs) as a nicer/more extensible
solution than the MBR disk signature / PARTUUID.

The default GPT partition table location unfortunately conflicts with the
SPL location, so move the 16KB GPT table after it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-r1/boot.cmd     | 2 +-
 board/orangepi/orangepi-r1/genimage.cfg | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/orangepi/orangepi-r1/boot.cmd b/board/orangepi/orangepi-r1/boot.cmd
index e62e31a3e4..50745f7e5e 100644
--- a/board/orangepi/orangepi-r1/boot.cmd
+++ b/board/orangepi/orangepi-r1/boot.cmd
@@ -1,6 +1,6 @@
 setenv fdt_high ffffffff
 
-setenv bootargs console=ttyS0,115200 earlyprintk root=PARTUUID=feedc0de-02 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
 
 fatload mmc 0 $kernel_addr_r zImage
 fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-r1.dtb
diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index 3496383573..0f44b368f0 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -13,15 +13,17 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		# for root=PARTUUID=feedc0de-02 support
-		disk-signature = 0xfeedc0de
+		# for root=PARTLABEL support
+		gpt = true
+		# default GPT location conflicts with spl, move it after
+		gpt-location = 1M
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
-		size = 1040384 # 1MB - 8192
+		size = 1056768 # 1MB - 8192 + 16384 (GPT)
 	}
 
 	partition boot {
-- 
2.20.1
