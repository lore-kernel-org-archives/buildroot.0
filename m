From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 00:18:37 +0200
Subject: [Buildroot] [git commit] fs/ext2: further fix to the UUID
Message-ID: <20130528222053.1E2AE9A624@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60474dcec67922782a244ca3fe30fe9c35a5c963
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Turned out that setting a nil-UUID is no better than clearing it.

What currently happens is as follows:
  - first, genext2fs does not generate a UUID
  - then we tune2fs to upgrade the filesystem
  - then we run fsck, which generates a random UUID
  - then we re-run tune2fs to set a nil-UUID

So, on the target, if the file system is improperly unmounted (eg.
with a power failure), on next boot, fsck may be run, and a new
random UUID will be generated.

*However*, fsck improperly updates the filesystem when it adds the
UUID, and there are a few group descriptor checksum errors.

Those errors will go undetected until the next fsck, which will then
block for user input (bad on embedded systems, bad).

Fix that by systematically generating a random UUID _before_ we call
to fsck.

A random UUID is not so bad, after all, since there are already so
many sources of unpredictability in the filesystem: files date and
ordering, files content (date, paths...) which renders a fixed UUID
unneeded.

And it is still possible to set the UUID in a post-image script if
needed, anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/genext2fs.sh |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index 7a6e232..a6cd7d2 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -49,6 +49,14 @@ e2tunefsck() {
         tune2fs "$@" "${IMG}"
     fi
 
+    # genext2fs does not generate a UUID, but fsck will whine if one is
+    # is missing, so we need to add a UUID.
+    # Of course, this has to happend _before_ we run fsck.
+    # Although a random UUID may seem bad for reproducibility, there
+    # already are so many things that are not reproducible in a
+    # filesystem: file dates, file ordering, content of the files...
+    tune2fs -U random "${IMG}"
+
     # After changing filesystem options, running fsck is required
     # (see: man tune2fs). Running e2fsck in other cases will ensure
     # coherency of the filesystem, although it is not required.
@@ -69,14 +77,9 @@ e2tunefsck() {
     printf "\ne2fsck was successfully run on '%s' (ext%d)\n\n"  \
            "${IMG##*/}" "${GEN}"
 
-    # e2fsck will force a *random* UUID, which is bad
-    # for reproducibility, so we do not want it. Asking
-    # tune2fs to 'clear' the UUID makes for an invalid
-    # fs, so we explicitly set a NULL UUID, which works.
     # Remove count- and time-based checks, they are not welcome
     # on embedded devices, where they can cause serious boot-time
     # issues by tremendously slowing down the boot.
-    tune2fs -U 00000000-0000-0000-0000-000000000000 "${IMG}"
     tune2fs -c 0 -i 0 "${IMG}"
 }
 
