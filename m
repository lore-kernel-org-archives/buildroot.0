From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:02:47 +0200
Subject: [Buildroot] [git commit] board/olpc: set JFFS2 root when booting
 from a MTD
Message-ID: <20200617190503.52B29814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=751a13618a7452a322104251bd0b9cd56e941009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes the boot script set appropriate root parameters when it's
loaded from a NAND flash device.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
