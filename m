From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:04:08 +0200
Subject: [Buildroot] [git commit] imx6sabresd/create-boot-sd.sh: allow usage
	for i.MX53
Message-ID: <20141024230432.20B5E9CDBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98db1a53889528b26248ea4cc31811aa97d9dde6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this script permits the generation of an sdcard that will boot on
and i.MX53 QSB with a recent bootloader (now supported by buildroot).

Tested on an i.MX53 QSB and an i.MX53 QSB-R

Signed-off-by: Eric B??nard <eric@eukrea.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx53loco/create-boot-sd.sh   |    1 +
 board/freescale/imx6sabresd/create-boot-sd.sh |    8 +++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
new file mode 120000
index 0000000..3083fd2
--- /dev/null
+++ b/board/freescale/imx53loco/create-boot-sd.sh
@@ -0,0 +1 @@
+../imx6sabresd/create-boot-sd.sh
\ No newline at end of file
diff --git a/board/freescale/imx6sabresd/create-boot-sd.sh b/board/freescale/imx6sabresd/create-boot-sd.sh
index 9930b1e..af45115 100755
--- a/board/freescale/imx6sabresd/create-boot-sd.sh
+++ b/board/freescale/imx6sabresd/create-boot-sd.sh
@@ -7,9 +7,7 @@ PROGNAME=$(basename $0)
 
 usage()
 {
-    echo "Create an SD card that boots on an i.MX6DL SABRESD board."
-    echo "It is supposed to work also for the i.MX6Q SABRESD board, but"
-    echo "it this is not tested."
+    echo "Create an SD card that boots on an i.MX53/6 board."
     echo
     echo "Note: all data on the the card will be completely deleted!"
     echo "Use with care!"
@@ -77,8 +75,8 @@ TMPDIR=$(mktemp -d)
 # FAT partition: kernel and DTBs
 mkfs.vfat ${PART1}
 mount ${PART1} ${TMPDIR}
-cp output/images/uImage ${TMPDIR}/
-cp output/images/*.dtb  ${TMPDIR}/
+cp output/images/*Image ${TMPDIR}/
+cp output/images/*.dtb  ${TMPDIR}/ || true
 sync
 umount ${TMPDIR}
 
