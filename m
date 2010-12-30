From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Dec 2010 23:10:21 +0100
Subject: [Buildroot] [git commit master 1/1] genext2fs.sh: improve number of
	blocks calculation
Message-ID: <20101230222011.4B7A08EE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eeea3ea6a88a8f1c7511abf0b429297a562e7d30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2929

Instead of just adding a fixed amount to the blocks used, try to
estimate the real space needed according to the filesystem structure
(bitmaps, inodes, blocks).

The side effect of this is that we no longer significantly overestimate
the size needed for small file systems.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    1 +
 fs/ext2/genext2fs.sh |   25 +++++++++++--------------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4fef0eb..a67d1d1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,6 +24,7 @@
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
 	#2371: QT MYSQL Module does not build when MySQL installed on the host
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
+	#2929: genext2fs: couldn't allocate a block (no free space)
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
 
diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index b315ec3..7a518ae 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -10,24 +10,11 @@ while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv f
 do
     case $f in
 	b) CALC_BLOCKS=0 ;;
-	N) CALC_INODES=0 ;;
+	N) CALC_INODES=0; INODES=$OPTARG ;;
 	d) TARGET_DIR=$OPTARG ;;
     esac
 done
 
-# calculate needed blocks
-if [ $CALC_BLOCKS -eq 1 ];
-then
-    BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
-    if [ $BLOCKS -ge 20000 ];
-    then
-	BLOCKS=$(expr $BLOCKS + 16384)
-    else
-	BLOCKS=$(expr $BLOCKS + 2400)
-    fi
-    set -- $@ -b $BLOCKS
-fi
-
 # calculate needed inodes
 if [ $CALC_INODES -eq 1 ];
 then
@@ -36,4 +23,14 @@ then
     set -- $@ -N $INODES
 fi
 
+# calculate needed blocks
+if [ $CALC_BLOCKS -eq 1 ];
+then
+    # size ~= superblock, block+inode bitmaps, inodes (8 per block), blocks
+    # we scale inodes / blocks with 10% to compensate for bitmaps size + slack
+    BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
+    BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)
+    set -- $@ -b $BLOCKS
+fi
+
 exec genext2fs $@
-- 
1.7.2.2
