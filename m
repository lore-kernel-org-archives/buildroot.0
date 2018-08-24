From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:26:34 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] board/technologic/ts7680:
 fix bogus size in genimage.cfg
Message-ID: <20180824081857.A26918E59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30a027f551c32ed1581eecad043e7170c138196e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

512B is not a correct size to express "512 bytes", and causes a
genimage failure:

  ERROR: Invalid size suffix 'B' in '512B'

To express "512 bytes", using just "512" is sufficient. With this
commit, genimage works fine, and we indeed have a 512 bytes unused
partition:

$ fdisk -l output/images/sdcard.img
Disk output/images/sdcard.img: 60 MiB, 62915584 bytes, 122882 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device                    Boot Start    End Sectors  Size Id Type
output/images/sdcard.img1          1      1       1  512B  0 Empty
output/images/sdcard.img2          2 524289  524288  256M 83 Linux

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/88314963

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f1bdb63ff4fddc53cdb43ad670dbf6f3401c19ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/technologic/ts7680/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/technologic/ts7680/genimage.cfg b/board/technologic/ts7680/genimage.cfg
index b5599823dc..70b1dac64f 100644
--- a/board/technologic/ts7680/genimage.cfg
+++ b/board/technologic/ts7680/genimage.cfg
@@ -3,7 +3,7 @@ image sdcard.img {
 	}
 
 	partition unused {
-		size =  512B
+		size =  512
 	}
 
 	partition rootfs {
