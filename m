From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 May 2013 12:33:35 +0200
Subject: [Buildroot] [PATCH] fs/ext2: explicitly set a NULL UUID
Message-ID: <1369737215-11993-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

"tune2fs -U clear" creates an invalid filesystem, that fsck.ext2
whines about later:

    $ make rootfs-ext2
    [--SNIP--]

    $ ./host/usr/sbin/fsck.ext4 images/rootfs.ext2
    e2fsck 1.42.7 (21-Jan-2013)
    Filesystem did not have a UUID; generating one.
    images/rootfs.ext2: clean, 4616/5120 files, 53171/131072 blocks

    $ ./host/usr/sbin/fsck.ext4 -f images/rootfs.ext2
    e2fsck 1.42.7 (21-Jan-2013)
    One or more block group descriptor checksums are invalid.  Fix<y>? yes
    Group descriptor 0 checksum is 0x4131, should be 0x8bdb.  FIXED.
    [--SNIP--]

So we set an explicitly NULL UUID instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/genext2fs.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index f7f8d33..7a6e232 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -70,11 +70,14 @@ e2tunefsck() {
            "${IMG##*/}" "${GEN}"
 
     # e2fsck will force a *random* UUID, which is bad
-    # for reproducibility, so we do not want it.
+    # for reproducibility, so we do not want it. Asking
+    # tune2fs to 'clear' the UUID makes for an invalid
+    # fs, so we explicitly set a NULL UUID, which works.
     # Remove count- and time-based checks, they are not welcome
     # on embedded devices, where they can cause serious boot-time
     # issues by tremendously slowing down the boot.
-    tune2fs -U clear -c 0 -i 0 "${IMG}"
+    tune2fs -U 00000000-0000-0000-0000-000000000000 "${IMG}"
+    tune2fs -c 0 -i 0 "${IMG}"
 }
 
 # Check we know what generation to generate
-- 
1.8.1.2
