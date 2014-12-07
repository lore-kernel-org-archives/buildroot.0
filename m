From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:06:44 +0100
Subject: [Buildroot] [git commit] package/mke2img: new package
Message-ID: <20141207210727.231FA800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d19f8fc86a69487463e2b523b4e2a7066167674
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we are using a shell script called genext2fs, that
impersonates the real genext2fs. But that script does much more than
just call genextfs: it also calls tune2fs and e2fsck.

Because it impersonates genext2fs, we can not easily add new options,
and are constrained by the genext2fs options.

But it turns out that, of all the options supported by the real
genext2fs, we only really care for a subset, namely:
  - number of blocks
  - number of inodes
  - percentage of blocks reeserved to root
  - the root directory which to generate the image from

So, we introduce a new host package, mke2img, that is intended to
eventually replace genext2fs.sh.

This new script is highly modeled from the existing genext2fs.sh, but
was slightly refreshed, and a new, supposedly sane set of options has
been choosen for the features we need (see above), and some new options
were added, too, rather than relying on the arguments order or
environment variables:
  -b <nb-blocks>    number of blocks in the filesystem
  -i <nb-inodes>    number of inodes in the filesystem
  -r <pc-reserved>  percentage of reserved blocks
* -d <root-dir>     directory containing the root of the filesystem
* -o <img-file>     output image file
  -G <ext-gen>      extfs generation: 2, 3, or 4 (default: 2)
  -R <ext-rev>      ext2 revision: 0 or 1 (default 1)
  -l <label>        filesystem label
  -u <uid>          filesystem UUID; if not specified, a random one is used

* Mandatory options

Since the upstream e2fsprogs are expected to release a new mke2fs that
will be able to generate a filesystem image from a directory, we then
will be able to replace all the logic in mke2img, to use mke2fs instead
of the (relatively fragile) combination of the three tools we currently
use.

An entry is added for it in the "Host utilities" menu, so it can be
selected for use by post-{build,image} scripts. The ext2 filesystem
selection is changed to select that now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ext2/Config.in              |    3 +-
 package/Config.in.host         |    1 +
 package/mke2img/Config.in.host |    9 ++
 package/mke2img/mke2img        |  206 ++++++++++++++++++++++++++++++++++++++++
 package/mke2img/mke2img.mk     |   14 +++
 5 files changed, 231 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index adba6f3..8751b62 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2/3/4 root filesystem"
-	select BR2_PACKAGE_HOST_GENEXT2FS
-	select BR2_PACKAGE_HOST_E2FSPROGS
+	select BR2_PACKAGE_HOST_MKE2IMG
 	help
 	  Build an ext2/3/4 root filesystem
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 185dcbc..0b7bc36 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
+	source "package/mke2img/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
diff --git a/package/mke2img/Config.in.host b/package/mke2img/Config.in.host
new file mode 100644
index 0000000..9781c6a
--- /dev/null
+++ b/package/mke2img/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_MKE2IMG
+	bool "host mke2img"
+	select BR2_PACKAGE_HOST_E2FSPROGS
+	select BR2_PACKAGE_HOST_GENEXT2FS
+	help
+	  Easily create filesystems of the extend familly: ext2/3/4.
+
+	  This tool is bundled by, and specific to Buildroot. However, it can
+	  be used from post-images scripts is needed.
diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
new file mode 100755
index 0000000..9c56bc2
--- /dev/null
+++ b/package/mke2img/mke2img
@@ -0,0 +1,206 @@
+#!/bin/bash
+
+# Buildroot wrapper to the collection of ext2/3/4 filesystem tools:
+# - genext2fs, to generate ext2 filesystem images
+# - tune2fs, to modify an ext2/3/4 filesystem (possibly in an image file)
+# - e2fsck, to check and fix an ext2/3/4 filesystem (possibly in an image file)
+
+set -e
+
+main() {
+    local OPT OPTARG
+    local nb_blocks nb_inodes nb_res_blocks root_dir image gen rev label uuid
+    local -a genext2fs_opts
+    local -a tune2fs_opts
+    local tune2fs_O_opts
+
+    # Default values
+    gen=2
+    rev=1
+
+    while getopts :hb:i:r:d:o:G:R:l:u: OPT; do
+        case "${OPT}" in
+        h)  help; exit 0;;
+        b)  nb_blocks=${OPTARG};;
+        i)  nb_inodes=${OPTARG};;
+        r)  nb_res_blocks=${OPTARG};;
+        d)  root_dir="${OPTARG}";;
+        o)  image="${OPTARG}";;
+        G)  gen=${OPTARG};;
+        R)  rev=${OPTARG};;
+        l)  label="${OPTARG}";;
+        u)  uuid="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+    done
+
+    # Sanity checks
+    if [ -z "${root_dir}" ]; then
+        error "you must specify a root directory with '-d'\n"
+    fi
+    if [ -z "${image}" ]; then
+        error "you must specify an output image file with '-o'\n"
+    fi
+    case "${gen}:${rev}" in
+    2:0|2:1|3:1|4:1)
+        ;;
+    3:0|4:0)
+        error "revision 0 is invalid for ext3 and ext4\n"
+        ;;
+    *)  error "unknown ext generation '%s' and/or revision '%s'\n" \
+               "${gen}" "${rev}"
+        ;;
+    esac
+
+    # calculate needed inodes
+    if [ -z "${nb_inodes}" ]; then
+        nb_inodes=$(find "${root_dir}" | wc -l)
+        nb_inodes=$((nb_inodes+400))
+    fi
+
+    # calculate needed blocks
+    if [ -z "${nb_blocks}" ]; then
+        # size ~= superblock, block+inode bitmaps, inodes (8 per block),
+        # blocks; we scale inodes / blocks with 10% to compensate for
+        # bitmaps size + slack
+        nb_blocks=$(du -s -k "${root_dir}" |sed -r -e 's/[[:space:]]+.*$//')
+        nb_blocks=$((500+(nb_blocks+nb_inodes/8)*11/10))
+    fi
+
+    # Upgrade to rev1 if needed
+    if [ ${rev} -ge 1 ]; then
+        tune2fs_O_opts+=",filetype"
+    fi
+
+    # Add a journal for ext3 and above
+    if [ ${gen} -ge 3 ]; then
+        tune2fs_opts+=( -j -J size=1 )
+        # we add 1300 blocks (a bit more than 1 MiB, assuming 1KiB blocks)
+        # for the journal
+        # Note: I came to 1300 blocks after trial-and-error checks. YMMV.
+        nb_blocks=$((nb_blocks+1300))
+    fi
+
+    # Add ext4 specific features
+    if [ ${gen} -ge 4 ]; then
+        tune2fs_O_opts+=",extents,uninit_bg,dir_index"
+    fi
+
+    # Add our -O options (there will be at most one leading comma, remove it)
+    if [ -n "${tune2fs_O_opts}" ]; then
+        tune2fs_opts+=( -O "${tune2fs_O_opts#,}" )
+    fi
+
+    # Add the label if specified
+    if [ -n "${label}" ]; then
+        tune2fs_opts+=( -L "${label}" )
+    fi
+
+    # Generate the filesystem
+    genext2fs_opts=( -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
+    if [ -n "${nb_res_blocks}" ]; then
+        genext2fs_opts+=( -m ${nb_res_blocks} )
+    fi
+    genext2fs "${genext2fs_opts[@]}" "${image}"
+
+    # genext2fs does not generate a UUID, but fsck will whine if one
+    # is missing, so we need to add a UUID.
+    # Of course, this has to happen _before_ we run fsck.
+    # Also, some ext4 metadata are based on the UUID, so we must
+    # set it before we can convert the filesystem to ext4.
+    # If the user did not specify a UUID, we generate a random one.
+    # Although a random UUID may seem bad for reproducibility, there
+    # already are so many things that are not reproducible in a
+    # filesystem: file dates, file ordering, content of the files...
+    tune2fs -U "${uuid:-random}" "${image}"
+
+    # Upgrade the filesystem
+    if [ ${#tune2fs_opts[@]} -ne 0 ]; then
+        tune2fs "${tune2fs_opts[@]}" "${image}"
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
+    e2fsck -pDf "${image}" >/dev/null || ret=$?
+    case ${ret} in
+       0|1|2) ;;
+       *)   errorN ${ret} "failed to run e2fsck on '%s' (ext%d)\n" \
+                   "${image}" ${gen}
+    esac
+    printf "\n"
+    trace "e2fsck was successfully run on '%s' (ext%d)\n" "${image}" ${gen}
+    printf "\n"
+
+    # Remove count- and time-based checks, they are not welcome
+    # on embedded devices, where they can cause serious boot-time
+    # issues by tremendously slowing down the boot.
+    tune2fs -c 0 -i 0 "${image}"
+}
+
+help() {
+    cat <<_EOF_
+NAME
+    ${my_name} - Create an ext2/3/4 filesystem image
+
+SYNOPSIS
+    ${my_name} [OPTION]...
+
+DESCRIPTION
+    Create ext2/3/4 filesystem image from the content of a directory.
+
+    -b BLOCKS
+        Create a filesystem of BLOCKS 1024-byte blocs. The default is to
+        compute the required number of blocks.
+
+    -i INODES
+        Create a filesystem with INODES inodes. The default is to compute
+        the required number of inodes.
+
+    -r RES_BLOCKS
+        Create a filesystem with RES_BLOCKS reserved blocks. The default
+        is to reserve 0 block.
+
+    -d ROOT_DIR
+        Create a filesystem, using the content of ROOT_DIR as the content
+        of the root of the filesystem. Mandatory.
+
+    -o FILE
+        Create the filesystem in FILE. Madatory.
+
+    -G GEN -R REV
+        Create a filesystem of generation GEN (2, 3 or 4), and revision
+        REV (0 or 1). The default is to generate an ext2 revision 1
+        filesystem; revision 0 is invalid for ext3 and ext4.
+
+    -l LABEL
+        Create a filesystem with label LABEL. The default is to not set
+        a label.
+
+    -u UUID
+        Create filesystem with uuid UUID. The default is to set a random
+        UUID.
+
+  Exit status:
+    0   if OK
+    !0  in case of error
+_EOF_
+}
+
+trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+warn()   { trace "${@}" >&2; }
+errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
+error()  { errorN 1 "${@}"; }
+
+my_name="${0##*/}"
+main "$@"
diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
new file mode 100644
index 0000000..04aaa8f
--- /dev/null
+++ b/package/mke2img/mke2img.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# mke2img
+#
+################################################################################
+
+HOST_MKE2IMG_SOURCE =
+HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
+
+define HOST_MKE2IMG_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/usr/bin/mke2img
+endef
+
+$(eval $(host-generic-package))
