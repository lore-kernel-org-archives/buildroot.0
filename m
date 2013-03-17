From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 23:37:07 +0100
Subject: [Buildroot] [PATCH 2/5] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <cover.1363559530.git.yann.morin.1998@free.fr>
References: <cover.1363559530.git.yann.morin.1998@free.fr>
Message-ID: <334c272210a5b742dbc05443d9bfcedf0f9eea01.1363559530.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the host-e2fsprogs to tune2fs the generated rootfs.ext2 image,
and upgrade it to either one of ext2, ext3 or ext4.

Since calling tune2fs may require running e2fsck (tune2fs will warn
to do so when certain FS options are changed), we systematically call
e2fsck. This makes the code path simpler, and as a side-effect checks
that genext2fs did not generate garbage.

In turn, e2fsck will unconditionally add a UUID to the filesystem,
which is bad for reproducibility, so we call tune2fs again to remove
the UUID. This does not require checking the filesystem.

To ensure compatibility of Buildroot's .config, leave ext2 as the
default. Boards' .config can override this at will.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v3 -> v2:
  - quiesce e2fsck a bit

Changes v2 -> v3:
  - fix dependencies (Thomas)

Changes v1->v2: (all after comments by Arnout)
  - menuconfig prompt rework (& Peter)
  - cleanup ext2.mk
  - use environment to pass ext generation/variant
  - add rational for 1081 additional blocks
  - explain the reason we run e2fsck
---
 fs/ext2/Config.in                |   36 +++++++++++++++----
 fs/ext2/ext2.mk                  |    6 ++-
 fs/ext2/genext2fs.sh             |   73 +++++++++++++++++++++++++++++++++++++-
 package/e2fsprogs/Config.in.host |    2 +-
 4 files changed, 106 insertions(+), 11 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index cb4beed..c8320e2 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,10 +1,32 @@
 config BR2_TARGET_ROOTFS_EXT2
-	bool "ext2 root filesystem"
+	bool "ext2/3/4 root filesystem"
+	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
-	  Build an ext2 root filesystem
+	  Build an ext2/3/4 root filesystem
 
 if BR2_TARGET_ROOTFS_EXT2
 
+choice
+	bool "ext2/3/4 variant"
+	default BR2_TARGET_ROOTFS_EXT2_2
+
+config BR2_TARGET_ROOTFS_EXT2_2
+	bool "ext2"
+
+config BR2_TARGET_ROOTFS_EXT2_3
+	bool "ext3"
+
+config BR2_TARGET_ROOTFS_EXT2_4
+	bool "ext4"
+
+endchoice
+
+config BR2_TARGET_ROOTFS_EXT2_GEN
+	int
+	default 2 if BR2_TARGET_ROOTFS_EXT2_2
+	default 3 if BR2_TARGET_ROOTFS_EXT2_3
+	default 4 if BR2_TARGET_ROOTFS_EXT2_4
+
 config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	default 0
@@ -21,27 +43,27 @@ choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_EXT2_NONE
 	help
-	  Select compressor for ext2 filesystem of the root filesystem
+	  Select compressor for ext2/3/4 filesystem of the root filesystem
 
 config BR2_TARGET_ROOTFS_EXT2_NONE
 	bool "no compression"
 	help
-	  Do not compress the ext2 filesystem.
+	  Do not compress the ext2/3/4 filesystem.
 
 config BR2_TARGET_ROOTFS_EXT2_GZIP
 	bool "gzip"
 	help
-	  Do compress the ext2 filesystem with gzip.
+	  Do compress the ext2/3/4 filesystem with gzip.
 
 config BR2_TARGET_ROOTFS_EXT2_BZIP2
 	bool "bzip2"
 	help
-	  Do compress the ext2 filesystem with bzip2.
+	  Do compress the ext2/3/4 filesystem with bzip2.
 
 config BR2_TARGET_ROOTFS_EXT2_LZMA
 	bool "lzma"
 	help
-	  Do compress the ext2 filesystem with lzma.
+	  Do compress the ext2/3/4 filesystem with lzma.
 
 endchoice
 
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 7b71592..018a5a3 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -18,10 +18,12 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
 EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
-ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
+ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
+
+EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
 
 define ROOTFS_EXT2_CMD
-	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
+	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
 endef
 
 $(eval $(call ROOTFS_TARGET,ext2))
diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index 7a518ae..c2049f5 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -1,10 +1,13 @@
 #!/bin/sh
 # genext2fs wrapper calculating needed blocks/inodes values if not specified
+set -e
 
 export LC_ALL=C
 
 CALC_BLOCKS=1
 CALC_INODES=1
+EXT_OPTS=
+EXT_OPTS_O=
 
 while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv f
 do
@@ -14,6 +17,7 @@ do
 	d) TARGET_DIR=$OPTARG ;;
     esac
 done
+eval IMG="\"\${${OPTIND}}\""
 
 # calculate needed inodes
 if [ $CALC_INODES -eq 1 ];
@@ -30,7 +34,74 @@ then
     # we scale inodes / blocks with 10% to compensate for bitmaps size + slack
     BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
     BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)
+    # we add 1081 blocks (a bit more than 1 MiB, assuming 1KiB blocks) for
+    # the journal if ext3/4
+    # Note: I came to 1081 blocks after trial-and-error checks. With 1080 or
+    # less additional blocks, and tune2fs would refuse to add the journal;
+    # with 1081 additional blocks or above, tune2fs wil happily add a journal.
+    # YMMV.
+    if [ ${GEN} -ge 3 ]; then
+        BLOCKS=$(expr 1081 + $BLOCKS )
+    fi
     set -- $@ -b $BLOCKS
 fi
 
-exec genext2fs $@
+e2tunefsck() {
+    # Upgrade the file system
+    if [ $# -ne 0 ]; then
+        tune2fs "$@" "${IMG}"
+    fi
+
+    # After changing filesystem options, running fsck is required
+    # (see: man tune2fs). Running e2fsck in other cases will ensure
+    # coherency of the filesystem, although it is not required.
+    # 'e2fsck -pDf' means:
+    #  - automatically repair
+    #  - optimise and check for duplicate entries
+    #  - force checking
+    # Sending output to oblivion, as e2fsck can be *very* verbose,
+    # especially with filesystems generated by genext2fs.
+    # Exit codes 1 & 2 are OK, it means fs errors were successfully
+    # corrected, hence our little trick with $ret.
+    ret=0
+    e2fsck -pDf "${IMG}" >/dev/null || ret=$?
+    case ${ret} in
+       0|1|2) ;;
+       *)   exit ${ret};;
+    esac
+    printf "\ne2fsck was successfully run on '%s' (ext%d)\n\n"  \
+           "${IMG##*/}" "${GEN}"
+
+    # e2fsck will force a *random* UUID, which is bad
+    # for reproducibility, so we do not want it
+    tune2fs -U clear "${IMG}"
+}
+
+# Check we know what generation to generate
+case "${GEN}" in
+    2|3|4)
+	;;
+    *)
+	printf "%s: unknown ext generation to generate\n" "${0##*/}" >&2
+	exit 1
+	;;
+esac
+
+# Add a journal for ext3 and above
+if [ ${GEN} -ge 3 ]; then
+    EXT_OPTS="${EXT_OPTS} -j -J size=1"
+fi
+
+# Add ext4 specific features
+if [ ${GEN} -ge 4 ]; then
+    EXT_OPTS_O="${EXT_OPTS_O},extents,uninit_bg,dir_index"
+fi
+
+# Add our -O options (there will be at most one leading comma, remove it)
+if [ -n "${EXT_OPTS_O}" ]; then
+    EXT_OPTS="${EXT_OPTS} -O ${EXT_OPTS_O#,}"
+fi
+
+# Generate and upgrade the filesystem
+genext2fs "$@"
+e2tunefsck ${EXT_OPTS}
diff --git a/package/e2fsprogs/Config.in.host b/package/e2fsprogs/Config.in.host
index ea6a0bd..0c001c2 100644
--- a/package/e2fsprogs/Config.in.host
+++ b/package/e2fsprogs/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_E2FSPROGS
 	bool "host e2fsprogs"
 	help
-	  The EXT2 file system utilities.
+	  The EXT2/3/4 file system utilities.
 	  
 	  http://e2fsprogs.sf.net
-- 
1.7.2.5
