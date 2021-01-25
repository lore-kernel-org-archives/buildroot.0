From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2021 21:53:10 +0100
Subject: [Buildroot] [git commit] configs/orangepi_r1_defconfig: change to
 GPT partitions for root=PARTLABEL support
Message-ID: <20210125203533.17B86836D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38d04e6b13410f79ab18044737bdb078c637136a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GPT provides partition labels, which can be used to tell the kernel to find
the rootfs based on it (root=PARTLABEL=rootfs) as a nicer/more extensible
solution than the MBR disk signature / PARTUUID.

When using GPT, the name of the partition in genimage.cfg is used as the
label for that partition.

The default GPT partition table location unfortunately conflicts with the
SPL location, so move the 16KB GPT table after it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: add the comment about 'rootfs']
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-r1/boot.cmd     |  2 +-
 board/orangepi/orangepi-r1/genimage.cfg | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

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
index 3496383573..46097cd2e5 100644
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
@@ -30,6 +32,8 @@ image sdcard.img {
 		image = "boot.vfat"
 	}
 
+	# 'rootfs' will be used as the partition label, used
+	# with root=PARTLABEL=rootfs kernel commadn line
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
