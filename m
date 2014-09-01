From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:44:34 +0200
Subject: [Buildroot] [PATCH 3/4] fs/ext2: add option to specify a filesystem
	label
In-Reply-To: <cover.1409579021.git.yann.morin.1998@free.fr>
References: <cover.1409579021.git.yann.morin.1998@free.fr>
Message-ID: <022d65d9ce3bcfec00ca00deef51dd6fe4ab9636.1409579021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Filesystems of the ext familly can carry a filesystem label.
Add an option for the user to specify such a label.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ext2/Config.in    | 3 +++
 fs/ext2/ext2.mk      | 4 ++++
 fs/ext2/genext2fs.sh | 9 ++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index adba6f3..65828f2 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -42,6 +42,9 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 	default 0   if BR2_TARGET_ROOTFS_EXT2_2r0
 	default 1   if !BR2_TARGET_ROOTFS_EXT2_2r0
 
+config BR2_TARGET_ROOTFS_EXT2_LABEL
+	string "filesystem label"
+
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	default 0
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index b474e43..b0eb25f 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,6 +18,10 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_LABEL)),0)
+EXT2_OPTS += -L $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
+endif
+
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index f682b24..598aee2 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -8,6 +8,7 @@ CALC_BLOCKS=1
 CALC_INODES=1
 EXT_OPTS=
 EXT_OPTS_O=
+LABEL=
 
 # Backward compatibility
 if [ -n "${GEN}" -o -n "${REV}" ]; then
@@ -17,13 +18,14 @@ fi
 # Tell getopts to stop after all existing options,
 # and not parse the ones we add
 set -- "${@}" --
-while getopts x:d:D:b:i:N:m:g:e:zfqUPhVvG:R: f
+while getopts x:d:D:b:i:N:m:g:e:zfqUPhVvG:R:L: f
 do
     case $f in
         # The following options are specific to our wrapper,
         # so do not pass them to the real genext2fs.
         G) GEN=$OPTARG; continue ;;
         R) REV=$OPTARG; continue ;;
+        L) LABEL=$OPTARG; continue ;;
         # Any other option is recognised by the real genext2fs,
         # so we want to keep them.
         b) CALC_BLOCKS=0 ;;
@@ -133,6 +135,11 @@ if [ ${GEN} -ge 4 ]; then
     EXT_OPTS_O="${EXT_OPTS_O},extents,uninit_bg,dir_index"
 fi
 
+# Set a label if specified
+if [ -n "${LABEL}" ]; then
+    EXT_OPTS="${EXT_OPTS} -L ${LABEL}"
+fi
+
 # Add our -O options (there will be at most one leading comma, remove it)
 if [ -n "${EXT_OPTS_O}" ]; then
     EXT_OPTS="${EXT_OPTS} -O ${EXT_OPTS_O#,}"
-- 
1.9.1
