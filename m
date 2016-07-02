From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:19:12 +0200
Subject: [Buildroot] [git commit] cubieboard2: Accommodate U-Boot
	environment on SD-card
Message-ID: <20160702111923.B42478179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ce3963a62df423a939c6f8f9d1f961a71d5d74f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to current "include/configs/sunxi-common.h"
U-Boot environment is stored on SD-card with offset 544 kB
and its size is limited as 128 kB.

Given memory layout of sunxi boards:
  1. SPL
  2. U-Boot
  3. U-Boot environment
  4. Partitions

(see http://linux-sunxi.org/Bootable_SD_card#SD_Card_Layout for details)

we need to make sure the first real partition starts at least
with 544+128 kB offset. Adding a small safety gap let's put
the first partition with offset 1MB from the beginning of SD-card.

Otherwise current setup gets broken as soon as one saves U-Boot
environment with "saveenv" which basically overwrites FAT partition with
zImage and board no longer boots into Linux kernel.

[Peter: extend description, add padding to u-boot partition instead]
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Carlos Quijano <carlos@crqgestion.es>
Cc: Andi Shyti <andi@etezian.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/cubietech/cubieboard2/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index 8929a72..b082ab0 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -20,6 +20,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
+		size = 1040384 # 1MB - 8192
 	}
 
 	partition boot {
