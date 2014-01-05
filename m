From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jan 2014 23:56:18 +0100
Subject: [Buildroot] [PATCH] fs/ext2: fix generation of ext4 filesystems
Message-ID: <1388962578-23901-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

cset 7a58a4e (e2fsprogs: bump to version 1.42.9) broke the generation
of ext4 filesystems.

This is because, in ext4, some metadata are dependent on the UUID.
If changing the UUID of an ext4 filesystem, tune2fs now exits with
exit-code 1, and prints a message to run fsck, to avoid trashing the
filesystem.

This condition is of utmost importance on a mounted filesysten (which
is not our case) to avoid corruption (yes, it is possible to change
the UUID of a mounted filesystem).

But the error is not valid for us, since we are working on an unmonted
filesystem image in the first place.

Since we change the UUID after we convert the filesystem (to ext4),
tune2fs just bails out.

We can not just ignore the exit code of tune2fs, since we still want
to catch any other failure.

It turns out that, changing the UUID before converting the filesystem
is just the way to go.

Fixes #6752.

Reported-by: Daniel Mentz <daniel@exxm.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Daniel Mentz <daniel@exxm.de>
---
 fs/ext2/genext2fs.sh | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index a6cd7d2..6f7b075 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -44,19 +44,21 @@ then
 fi
 
 e2tunefsck() {
-    # Upgrade the file system
-    if [ $# -ne 0 ]; then
-        tune2fs "$@" "${IMG}"
-    fi
-
     # genext2fs does not generate a UUID, but fsck will whine if one is
     # is missing, so we need to add a UUID.
     # Of course, this has to happend _before_ we run fsck.
+    # Also, some ext4 metadata are based on the UUID, so we must
+    # set it before we can convert the filesystem to ext4.
     # Although a random UUID may seem bad for reproducibility, there
     # already are so many things that are not reproducible in a
     # filesystem: file dates, file ordering, content of the files...
     tune2fs -U random "${IMG}"
 
+    # Upgrade the filesystem
+    if [ $# -ne 0 ]; then
+        tune2fs "$@" "${IMG}"
+    fi
+
     # After changing filesystem options, running fsck is required
     # (see: man tune2fs). Running e2fsck in other cases will ensure
     # coherency of the filesystem, although it is not required.
-- 
1.8.1.2
