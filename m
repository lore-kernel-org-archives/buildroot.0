From: Georges Savoundararadj <savoundg@gmail.com>
Date: Sun,  3 Jul 2016 17:22:29 -0700
Subject: [Buildroot] [PATCH 1/1] create-boot-sd.sh: fix script for sfdisk
	(>=2.26)
Message-ID: <20160704002229.9354-1-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Since version 2.26, sfdisk [...] no longer provides any functionality
for CHS (Cylinder-Head-Sector) addressing." [1]

The unit used in this script is the cylinder which is not supported in
the latest versions of sfdisk. However, it supports the deprecated option
"--unit S" that allows to keep the retro-compatibility with the older
versions of sfdisk if we use the sector unit.

This commit converts the offset and size from the cylinder unit (8 bytes)
to the sector unit (512 bytes).

[1] man page of sfdisk 2.28

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
Signed-off-by: Stanislas Bach <sbach@0g.re>
---
 board/freescale/create-boot-sd.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/freescale/create-boot-sd.sh b/board/freescale/create-boot-sd.sh
index af45115..32ad31e 100755
--- a/board/freescale/create-boot-sd.sh
+++ b/board/freescale/create-boot-sd.sh
@@ -59,9 +59,9 @@ sync
 # - Bootloader at offset 1024
 # - FAT partition starting at 1MB offset, containing uImage and *.dtb
 # - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
-sfdisk ${DEV} <<EOF
-32,480,b
-512,,L
+sfdisk --unit S ${DEV} <<EOF
+2048,30720,b
+32768,,L
 EOF
 
 sync
-- 
2.9.0
