From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 24 Mar 2017 17:20:31 +0100
Subject: [Buildroot] [PATCH 3/4] package/mke2img: remove unused package
In-Reply-To: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <1490372432-879-3-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we use mkfs to generate ext filesystem image, call mkfs
directly from fs/ext2/ext2.mk and remove mke2img package.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 Config.in.legacy               |   6 ++
 DEVELOPERS                     |   1 -
 fs/ext2/Config.in              |   2 +-
 fs/ext2/ext2.mk                |  25 +++----
 package/Config.in.host         |   1 -
 package/mke2img/Config.in.host |  10 ---
 package/mke2img/mke2img        | 148 -----------------------------------------
 package/mke2img/mke2img.mk     |  13 ----
 8 files changed, 20 insertions(+), 186 deletions(-)
 delete mode 100644 package/mke2img/Config.in.host
 delete mode 100755 package/mke2img/mke2img
 delete mode 100644 package/mke2img/mke2img.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index dfd4d67..b5a68aa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_HOST_MKE2IMG
+	bool "host mke2img has been removed"
+	select BR2_LEGACY
+	help
+	  We now call mkfs directly to generate ext filesystem image.
+
 config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
 	int "extra size in blocks has been removed"
 	default 0
diff --git a/DEVELOPERS b/DEVELOPERS
index 186f48f..fa3ce41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1665,7 +1665,6 @@ F:	package/libiscsi/
 F:	package/libseccomp/
 F:	package/linux-tools/
 F:	package/mesa3d-headers/
-F:	package/mke2img/
 F:	package/nbd/
 F:	package/nut/
 F:	package/nvidia-driver/
diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index aa6ee05..dfc3b0a 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2/3/4 root filesystem"
-	select BR2_PACKAGE_HOST_MKE2IMG
+	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  Build an ext2/3/4 root filesystem
 
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 30f1d17..3872e52 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,32 +4,33 @@
 #
 ################################################################################
 
-EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
+EXT2_OPTS = -d $(TARGET_DIR)
+EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
+NB_INODES := $(strip $(BR2_TARGET_ROOTFS_EXT2_INODES))
+ifeq ($(NB_INODES),0)
+NB_INODES = $(shell echo $$(($$(find $(TARGET_DIR) | wc -l) + 400)))
 endif
-
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
-EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
-endif
-EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
+EXT2_OPTS += -N $(shell echo $$(($(NB_INODES) + $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES))))
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
-EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
+EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
 endif
 
+EXT2_OPTS += -O ^64bit
+EXT2_OPTS += -T small -F
+
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
 EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 ifneq ($(EXT2_LABEL),)
-EXT2_OPTS += -l "$(EXT2_LABEL)"
+EXT2_OPTS += -L "$(EXT2_LABEL)"
 endif
 
-ROOTFS_EXT2_DEPENDENCIES = host-mke2img
+ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
-	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
+	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 endef
 
 rootfs-ext2-symlink:
diff --git a/package/Config.in.host b/package/Config.in.host
index bb91671..4385ac3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -24,7 +24,6 @@ menu "Host utilities"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
-	source "package/mke2img/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
diff --git a/package/mke2img/Config.in.host b/package/mke2img/Config.in.host
deleted file mode 100644
index f252715..0000000
--- a/package/mke2img/Config.in.host
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_HOST_MKE2IMG
-	bool "host mke2img"
-	select BR2_PACKAGE_HOST_E2FSPROGS
-	help
-	  Easily create filesystems of the extend familly: ext2/3/4.
-
-	  This tool is bundled by, and specific to Buildroot. However, it can
-	  be used from post-images scripts is needed.
-
-	  https://code.google.com/p/mke2img/
diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
deleted file mode 100755
index 01f04fc..0000000
--- a/package/mke2img/mke2img
+++ /dev/null
@@ -1,148 +0,0 @@
-#!/usr/bin/env bash
-
-# Buildroot wrapper to the collection of ext2/3/4 filesystem tools:
-# - genext2fs, to generate ext2 filesystem images
-# - tune2fs, to modify an ext2/3/4 filesystem (possibly in an image file)
-# - e2fsck, to check and fix an ext2/3/4 filesystem (possibly in an image file)
-
-set -e
-
-main() {
-    local OPT OPTARG
-    local nb_blocks nb_inodes nb_res_blocks root_dir image gen rev label uuid
-    local -a mkfs_opts
-    local mkfs_O_opts
-
-    # Default values
-    gen=2
-    rev=1
-    nb_extra_inodes=0
-
-    while getopts :hb:i:I:r:d:o:G:R:l:u: OPT; do
-        case "${OPT}" in
-        h)  help; exit 0;;
-        b)  nb_blocks=${OPTARG};;
-        i)  nb_inodes=${OPTARG};;
-        I)  nb_extra_inodes=${OPTARG};;
-        r)  nb_res_blocks=${OPTARG};;
-        d)  root_dir="${OPTARG}";;
-        o)  image="${OPTARG}";;
-        G)  gen=${OPTARG};;
-        R)  rev=${OPTARG};;
-        l)  label="${OPTARG}";;
-        u)  uuid="${OPTARG}";;
-        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
-        \?) error "unknown option '%s'\n" "${OPTARG}";;
-        esac
-    done
-
-    # Sanity checks
-    if [ -z "${root_dir}" ]; then
-        error "you must specify a root directory with '-d'\n"
-    fi
-    if [ -z "${image}" ]; then
-        error "you must specify an output image file with '-o'\n"
-    fi
-    case "${gen}:${rev}" in
-    2:0|2:1|3:1|4:1)
-        ;;
-    3:0|4:0)
-        error "revision 0 is invalid for ext3 and ext4\n"
-        ;;
-    *)  error "unknown ext generation '%s' and/or revision '%s'\n" \
-               "${gen}" "${rev}"
-        ;;
-    esac
-
-    # calculate needed inodes
-    if [ -z "${nb_inodes}" ]; then
-        nb_inodes=$(find "${root_dir}" | wc -l)
-        nb_inodes=$((nb_inodes+400))
-    fi
-    nb_inodes=$((nb_inodes+nb_extra_inodes))
-
-    # Disable 64bit flag as it's incompatible with older U-Boot versions
-    mkfs_O_opts+=",^64bit"
-
-    # Add our -O options (there will be at most one leading comma, remove it)
-    if [ -n "${mkfs_O_opts}" ]; then
-        mkfs_opts+=( -O "${mkfs_O_opts#,}" )
-    fi
-
-    # Add the label if specified
-    if [ -n "${label}" ]; then
-        mkfs_opts+=( -L "${label}" )
-    fi
-
-    # If the user did not specify a UUID, mkfs will generate a random one.
-    # Although a random UUID may seem bad for reproducibility, there
-    # already are so many things that are not reproducible in a
-    # filesystem: file dates, file ordering, content of the files...
-    if [ -n "${UUID}" ]; then
-        mkfs_opts+=( -U "${UUID}" )
-    fi
-
-    # Generate the filesystem
-    mkfs_opts+=( -d "${root_dir}" -N ${nb_inodes} -T small -F )
-    if [ -n "${nb_res_blocks}" ]; then
-        mkfs_opts+=( -m ${nb_res_blocks} )
-    fi
-    mkfs.ext${gen} "${mkfs_opts[@]}" "${image}" "${nb_blocks}"
-}
-
-help() {
-    cat <<_EOF_
-NAME
-    ${my_name} - Create an ext2/3/4 filesystem image
-
-SYNOPSIS
-    ${my_name} [OPTION]...
-
-DESCRIPTION
-    Create ext2/3/4 filesystem image from the content of a directory.
-
-    -b BLOCKS
-        Create a filesystem of BLOCKS 1024-byte blocs. The default is to
-        compute the required number of blocks.
-
-    -i INODES
-        Create a filesystem with INODES inodes. The default is to compute
-        the required number of inodes.
-
-    -r RES_BLOCKS
-        Create a filesystem with RES_BLOCKS reserved blocks. The default
-        is to reserve 0 block.
-
-    -d ROOT_DIR
-        Create a filesystem, using the content of ROOT_DIR as the content
-        of the root of the filesystem. Mandatory.
-
-    -o FILE
-        Create the filesystem in FILE. Madatory.
-
-    -G GEN -R REV
-        Create a filesystem of generation GEN (2, 3 or 4), and revision
-        REV (0 or 1). The default is to generate an ext2 revision 1
-        filesystem; revision 0 is invalid for ext3 and ext4.
-
-    -l LABEL
-        Create a filesystem with label LABEL. The default is to not set
-        a label.
-
-    -u UUID
-        Create filesystem with uuid UUID. The default is to set a random
-        UUID.
-
-  Exit status:
-    0   if OK
-    !0  in case of error
-_EOF_
-}
-
-trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
-warn()   { trace "${@}" >&2; }
-errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
-error()  { errorN 1 "${@}"; }
-
-my_name="${0##*/}"
-main "$@"
diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
deleted file mode 100644
index ead9d70..0000000
--- a/package/mke2img/mke2img.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# mke2img
-#
-################################################################################
-
-HOST_MKE2IMG_DEPENDENCIES = host-e2fsprogs
-
-define HOST_MKE2IMG_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/usr/bin/mke2img
-endef
-
-$(eval $(host-generic-package))
-- 
2.7.3
