From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:44:33 +0200
Subject: [Buildroot] [PATCH 2/4] fs/ext2: pass the ext GEN and REV as options
In-Reply-To: <cover.1409579021.git.yann.morin.1998@free.fr>
References: <cover.1409579021.git.yann.morin.1998@free.fr>
Message-ID: <0af47f4eb7b989cf57353fef82da4596ad541d78.1409579021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we do have a way to pass options to the wrapper, that are not
options to the real genext2fs, use that mechanism to pass the generation
and revision of ext filesystem to generate.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/ext2.mk      |  7 ++-----
 fs/ext2/genext2fs.sh | 10 ++++++++--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 1bc49da..b474e43 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXT2_OPTS :=
+EXT2_OPTS := -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
@@ -20,11 +20,8 @@ endif
 
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
-EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
-EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
-
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
+	PATH=$(BR_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
 rootfs-ext2-symlink:
diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index db80383..f682b24 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -9,15 +9,21 @@ CALC_INODES=1
 EXT_OPTS=
 EXT_OPTS_O=
 
+# Backward compatibility
+if [ -n "${GEN}" -o -n "${REV}" ]; then
+    printf "GEN and REV are now to be specified with the -G and -R options\n" >&2
+fi
+
 # Tell getopts to stop after all existing options,
 # and not parse the ones we add
 set -- "${@}" --
-while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv f
+while getopts x:d:D:b:i:N:m:g:e:zfqUPhVvG:R: f
 do
     case $f in
         # The following options are specific to our wrapper,
         # so do not pass them to the real genext2fs.
-        # (none for now)
+        G) GEN=$OPTARG; continue ;;
+        R) REV=$OPTARG; continue ;;
         # Any other option is recognised by the real genext2fs,
         # so we want to keep them.
         b) CALC_BLOCKS=0 ;;
-- 
1.9.1
