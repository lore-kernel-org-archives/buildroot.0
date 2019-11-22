From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 19:24:07 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] board/beaglebone: fix
 boot on BeagleBone Black
Message-ID: <20191122182411.A93278DF1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce6bad8cbc60adf35879b1c7002fcd71521858cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Commit 68b5b79b2f has set the getty port to the default console but left
"ttyO0" in bootargs, in the U-Boot environment. Use "ttyS0", instead.

Also set loadaddr to 0x82000000 and fdtaddr to 0x88000000, replacing the
values that were valid for the ancient U-Boot and Linux pre-installed on
old boards but cause boot hangs with the current versions.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6458b154a2064267116fe14b50315b3b55d47e50)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/beaglebone/uEnv.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index a665f20889..8fce54d87e 100644
--- a/board/beaglebone/uEnv.txt
+++ b/board/beaglebone/uEnv.txt
@@ -3,6 +3,9 @@ devtype=mmc
 bootdir=
 bootfile=zImage
 bootpartition=mmcblk0p2
+console=ttyS0,115200n8
+loadaddr=0x82000000
+fdtaddr=0x88000000
 set_mmc1=if test $board_name = A33515BB; then setenv bootpartition mmcblk1p2; fi
-set_bootargs=setenv bootargs console=ttyO0,115200n8 root=/dev/${bootpartition} rw rootfstype=ext4 rootwait
+set_bootargs=setenv bootargs console=${console} root=/dev/${bootpartition} rw rootfstype=ext4 rootwait
 uenvcmd=run set_mmc1; run set_bootargs;run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr}
