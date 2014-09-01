From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:44:35 +0200
Subject: [Buildroot] [PATCH 4/4] fs/ext2: add support for specifying UUID
In-Reply-To: <cover.1409579021.git.yann.morin.1998@free.fr>
References: <cover.1409579021.git.yann.morin.1998@free.fr>
Message-ID: <aef27eee3aa358ec0d07fd0e2a437a0f16a3b4b2.1409579021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some post-image script might want to call our own genext2fs wrapper,
instead of re-inventing their own wrapper. Also, such scripts may want
to set a specific UUID to the newly generated filesystem.

Given how tricky the ext2/3/4 handling can be (remember our past bad
experiences with it?), and given that we already have a proven, stable
solution for generating ext2/3/4 filesystems, add a new option that
allows external callers to specify the UUID, instead of letting tune2fs
compute a random one, which is kept as the default behaviour if no UUID
is specified.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/genext2fs.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index 598aee2..a3150d5 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -9,6 +9,7 @@ CALC_INODES=1
 EXT_OPTS=
 EXT_OPTS_O=
 LABEL=
+UUID=random
 
 # Backward compatibility
 if [ -n "${GEN}" -o -n "${REV}" ]; then
@@ -18,7 +19,7 @@ fi
 # Tell getopts to stop after all existing options,
 # and not parse the ones we add
 set -- "${@}" --
-while getopts x:d:D:b:i:N:m:g:e:zfqUPhVvG:R:L: f
+while getopts x:d:D:b:i:N:m:g:e:zfqUPhVvG:R:L:u: f
 do
     case $f in
         # The following options are specific to our wrapper,
@@ -26,6 +27,7 @@ do
         G) GEN=$OPTARG; continue ;;
         R) REV=$OPTARG; continue ;;
         L) LABEL=$OPTARG; continue ;;
+        u) UUID=$OPTARG; continue ;;
         # Any other option is recognised by the real genext2fs,
         # so we want to keep them.
         b) CALC_BLOCKS=0 ;;
@@ -76,7 +78,7 @@ e2tunefsck() {
     # Although a random UUID may seem bad for reproducibility, there
     # already are so many things that are not reproducible in a
     # filesystem: file dates, file ordering, content of the files...
-    tune2fs -U random "${IMG}"
+    tune2fs -U "${UUID}" "${IMG}"
 
     # Upgrade the filesystem
     if [ $# -ne 0 ]; then
-- 
1.9.1
