From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 19:57:20 +0200
Subject: [Buildroot] [git commit] imx28evk: Fix the first partition location
Message-ID: <20161025175906.2A7E1800B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23e0f3350fbeccf727dd4e87889d9b2875e8e615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the SD card is connected to the host PC it can be mounted as
/dev/mmcblk0 or /dev/sdX, depending on how the SD controller is connected to
/the PC.

In this case the first partition is /dev/mmcblk0p1, not /dev/mmcblk01.

So use the ${PART1} variable to correctly assign this location.

[Peter: extend commit meesage]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx28evk/create-boot-sd.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/imx28evk/create-boot-sd.sh b/board/freescale/imx28evk/create-boot-sd.sh
index 5e050cb..bce2212 100755
--- a/board/freescale/imx28evk/create-boot-sd.sh
+++ b/board/freescale/imx28evk/create-boot-sd.sh
@@ -71,7 +71,7 @@ sync
 
 # Copy the bootloader at offset 2048
 # (We need to skip the partition table in the .sd, too.)
-dd if=output/images/u-boot.sd of=${DEV}1 bs=1M
+dd if=output/images/u-boot.sd of=${PART1} bs=1M
 
 # Prepare a temp dir for mounting partitions
 TMPDIR=$(mktemp -d)
