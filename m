From: Lubomir Rintel <lkundrak@v3.sk>
Date: Sun, 17 May 2020 13:53:38 +0200
Subject: [Buildroot] [PATCH 12/15] board/olpc: set JFFS2 root when booting
 from a MTD
In-Reply-To: <20200517115341.1677382-1-lkundrak@v3.sk>
References: <20200517115341.1677382-1-lkundrak@v3.sk>
Message-ID: <20200517115341.1677382-13-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makes the boot script set appropriate root parameters when it's
loaded from a NAND flash device.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/olpc.fth | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/olpc/olpc.fth b/board/olpc/olpc.fth
index 678f0af5b5..b4cbecf11f 100644
--- a/board/olpc/olpc.fth
+++ b/board/olpc/olpc.fth
@@ -5,10 +5,11 @@
 
 " /aliases" find-device " last" get-property
 abort" No last alias"
-" /pci/sd at c"          2over substring?  if  " root=/dev/mmcblk0p1 " to boot-file  then
-" /sd/sdhci at d4280000" 2over substring?  if  " root=/dev/mmcblk1p1 " to boot-file  then
-" /pci/usb@"          2over substring?  if  " root=/dev/sda1 "      to boot-file  then
-" /usb@"              2over substring?  if  " root=/dev/sda1 "      to boot-file  then
+" /pci/sd at c"          2over substring?  if  " root=/dev/mmcblk0p1 "                  to boot-file  then
+" /sd/sdhci at d4280000" 2over substring?  if  " root=/dev/mmcblk1p1 "                  to boot-file  then
+" /pci/usb@"          2over substring?  if  " root=/dev/sda1 "                       to boot-file  then
+" /usb@"              2over substring?  if  " root=/dev/sda1 "                       to boot-file  then
+" /pci/nandflash at c"   2over substring?  if  " root=/dev/mtdblock0 rootfstype=jffs2 " to boot-file  then
 2drop
 
 root-device " compatible" get-property dend  if  0 0  then  ( compatible$ )
-- 
2.26.2
