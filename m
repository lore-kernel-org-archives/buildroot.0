From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri,  1 Jul 2016 23:01:57 +0300
Subject: [Buildroot] [PATCH] cubieboard2: Accommodate U-Boot environment on
	SD-card
Message-ID: <1467403317-16425-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to current "include/configs/sunxi-common.h"
U-Boot environment is stored on SD-card with offset 544 kB
and its size is limited as 128 kB.

Given memory layout of sunxi boards:
  1. SPL
  2. U-Boot
  3. U-Boot environment
  4. Partitions
we need to make sure the first real partition starts at least
with 544+128 kB offset. Adding a small safety gap let's put
the first partition with offset 1Mb from the beginning of SD-card.

Otherwise current setup gets broken as soon as one saves U-Boot
environment with "saveenv" which basically overwrites FAT partition with
zImage and board no longer boots into Linux kernel.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Carlos Quijano <carlos@crqgestion.es>
Cc: Andi Shyti <andi@etezian.org>
---
 board/cubietech/cubieboard2/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index 8929a72..cde78e1 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -26,6 +26,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1048576
 	}
 
 	partition rootfs {
-- 
2.5.5
