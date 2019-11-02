From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat,  2 Nov 2019 19:38:38 -0300
Subject: [Buildroot] [PATCH 1/2] board/beaglebone: fix boot on BeagleBone
 Black
In-Reply-To: <20191102223839.16262-1-unixmania@gmail.com>
References: <20191102223839.16262-1-unixmania@gmail.com>
Message-ID: <20191102223839.16262-2-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Commit 68b5b79b2f has set the getty port to the default console but left
"ttyO0" in bootargs, in the U-Boot environment. Use "ttyS0", instead.

Also set loadaddr to 0x82000000 and fdtaddr to 0x88000000, replacing the
ancient U-Boot 2013.10-dirty default values that cause system hangs.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
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
-- 
2.18.1
