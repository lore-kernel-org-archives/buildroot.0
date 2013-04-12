From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 14:43:22 +0200
Subject: [Buildroot] [git commit] fs/ext2: add support for ext2 rev0 and rev1
Message-ID: <20130412130254.D322C9B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fd27fc84998c6683728353f57dc7c6000e5b4c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some bootloaders have a buggy ext2 support, and require ext2 rev1
instead of the traditional ext2 rev0 that genext2fs produces.

tune2fs accepts only one '-O list' at a time, so we need to construct
a list of -O options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/Config.in    |   20 +++++++++++++++++---
 fs/ext2/ext2.mk      |    3 ++-
 fs/ext2/genext2fs.sh |   12 +++++++++---
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index c8320e2..097242e 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -6,12 +6,20 @@ config BR2_TARGET_ROOTFS_EXT2
 
 if BR2_TARGET_ROOTFS_EXT2
 
+config BR2_TARGET_ROOTFS_EXT2_2
+	bool
+
 choice
 	bool "ext2/3/4 variant"
-	default BR2_TARGET_ROOTFS_EXT2_2
+	default BR2_TARGET_ROOTFS_EXT2_2r0
 
-config BR2_TARGET_ROOTFS_EXT2_2
-	bool "ext2"
+config BR2_TARGET_ROOTFS_EXT2_2r0
+	bool "ext2 (rev0)"
+	select BR2_TARGET_ROOTFS_EXT2_2
+
+config BR2_TARGET_ROOTFS_EXT2_2r1
+	bool "ext2 (rev1)"
+	select BR2_TARGET_ROOTFS_EXT2_2
 
 config BR2_TARGET_ROOTFS_EXT2_3
 	bool "ext3"
@@ -27,6 +35,12 @@ config BR2_TARGET_ROOTFS_EXT2_GEN
 	default 3 if BR2_TARGET_ROOTFS_EXT2_3
 	default 4 if BR2_TARGET_ROOTFS_EXT2_4
 
+# All ext generations are revision 1, except ext2r0, which is revision 0
+config BR2_TARGET_ROOTFS_EXT2_REV
+    int
+    default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
+    default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
+
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	default 0
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index ffb7257..d74f31e 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -20,7 +20,8 @@ endif
 
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
-EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
+EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
+EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
 
 define ROOTFS_EXT2_CMD
 	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index c2049f5..76f454c 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -78,15 +78,21 @@ e2tunefsck() {
 }
 
 # Check we know what generation to generate
-case "${GEN}" in
-    2|3|4)
+case "${GEN}:${REV}" in
+    2:0|2:1|3:1|4:1)
 	;;
     *)
-	printf "%s: unknown ext generation to generate\n" "${0##*/}" >&2
+	printf "%s: unknown ext generation '%s' and/or revision '%s'\n" \
+	       "${0##*/}" "${GEN}" "${REV}" >&2
 	exit 1
 	;;
 esac
 
+# Upgrade to rev1 if needed
+if [ ${REV} -ge 1 ]; then
+    EXT_OPTS_O="${EXT_OPTS_O},filetype"
+fi
+
 # Add a journal for ext3 and above
 if [ ${GEN} -ge 3 ]; then
     EXT_OPTS="${EXT_OPTS} -j -J size=1"
