From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 21:11:22 +0100
Subject: [Buildroot] [PATCH] package/mke2img: do not overshoot
	user-specified size
Message-ID: <1419797482-28041-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we forcibly expand the generated filesystem by 1300 blocks
(i.e. a bit more than 1MiB) when we need to generate an ext3 or ext4
filesystem, even if the user already supplied us with the size it wants
the filesystem to be.

In that case, we overshoot what the user requested, which is bad because
the filesystem may no longer fit in the partition it is supposed to be
written into.

Only add extra blocks when we do compute the required size, not when the
user specifies the size.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mke2img/mke2img | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 9c56bc2..e93d869 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -66,6 +66,12 @@ main() {
         # bitmaps size + slack
         nb_blocks=$(du -s -k "${root_dir}" |sed -r -e 's/[[:space:]]+.*$//')
         nb_blocks=$((500+(nb_blocks+nb_inodes/8)*11/10))
+        if [ ${gen} -ge 3 ]; then
+            # we add 1300 blocks (a bit more than 1 MiB, assuming 1KiB blocks)
+            # for the journal
+            # Note: I came to 1300 blocks after trial-and-error checks. YMMV.
+            nb_blocks=$((nb_blocks+1300))
+        fi
     fi
 
     # Upgrade to rev1 if needed
@@ -76,10 +82,6 @@ main() {
     # Add a journal for ext3 and above
     if [ ${gen} -ge 3 ]; then
         tune2fs_opts+=( -j -J size=1 )
-        # we add 1300 blocks (a bit more than 1 MiB, assuming 1KiB blocks)
-        # for the journal
-        # Note: I came to 1300 blocks after trial-and-error checks. YMMV.
-        nb_blocks=$((nb_blocks+1300))
     fi
 
     # Add ext4 specific features
-- 
1.9.1
