From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:57:36 +0200
Subject: [Buildroot] [git commit] fs/ext2: bump journal overhead to 1300
	blocks
Message-ID: <20130412130255.5121A9B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fab0a4afdff2f27fce49e7b38179e781e7b64ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A quick test with a ~3.5MB ext4 filesystem shows that 1081 blocks isn't
enough:

tune2fs 1.42.7 (21-Jan-2013)

Please run e2fsck on the filesystem.

Creating journal inode:
Journal size too big for filesystem.

So bump it a bit. Overestimating the journal size is probably not really
a big deal for the kind of systems using ext3/4 anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/genext2fs.sh |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index a4eb351..f7f8d33 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -34,14 +34,11 @@ then
     # we scale inodes / blocks with 10% to compensate for bitmaps size + slack
     BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
     BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)
-    # we add 1081 blocks (a bit more than 1 MiB, assuming 1KiB blocks) for
+    # we add 1300 blocks (a bit more than 1 MiB, assuming 1KiB blocks) for
     # the journal if ext3/4
-    # Note: I came to 1081 blocks after trial-and-error checks. With 1080 or
-    # less additional blocks, and tune2fs would refuse to add the journal;
-    # with 1081 additional blocks or above, tune2fs wil happily add a journal.
-    # YMMV.
+    # Note: I came to 1300 blocks after trial-and-error checks. YMMV.
     if [ ${GEN} -ge 3 ]; then
-        BLOCKS=$(expr 1081 + $BLOCKS )
+        BLOCKS=$(expr 1300 + $BLOCKS )
     fi
     set -- $@ -b $BLOCKS
 fi
