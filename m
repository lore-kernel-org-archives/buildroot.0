From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 13:40:08 +0200
Subject: [Buildroot] [PATCH v3 11/11] package/mke2img: remove package
In-Reply-To: <20170703225106.1492-12-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-12-s.martin49@gmail.com>
Message-ID: <8d77134b-a6e6-f224-1e43-b5410af7754a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 00:51, Samuel Martin wrote:
> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> Now that we use mkfs to generate ext2/3/4 filesystem image by calling
> mkfs directly from fs/ext2/ext2.mk, we can remove this package.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> changes v2->v3:
> - none
> 
> changes v1->v2:
> - rebase
> ---
>  Config.in.legacy               |   6 ++
>  DEVELOPERS                     |   1 -
>  package/Config.in.host         |   1 -
>  package/mke2img/Config.in.host |  11 ---
>  package/mke2img/mke2img        | 205 -----------------------------------------
>  package/mke2img/mke2img.mk     |  13 ---
>  6 files changed, 6 insertions(+), 231 deletions(-)
>  delete mode 100644 package/mke2img/Config.in.host
>  delete mode 100755 package/mke2img/mke2img
>  delete mode 100644 package/mke2img/mke2img.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 68275f9e0e..130ad1b12e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,12 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_PACKAGE_HOST_MKE2IMG
> +	bool "host mke2img has been removed"
> +	select BR2_LEGACY
> +	help
> +	  We now call mkfs directly to generate ext2/3/4 filesystem image.
> +
>  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
>  	int "exact size in blocks has been removed"
>  	default 0
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d121bd8163..62172abcd0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1779,7 +1779,6 @@ F:	package/libiscsi/
>  F:	package/libseccomp/
>  F:	package/linux-tools/
>  F:	package/mesa3d-headers/
> -F:	package/mke2img/
>  F:	package/nbd/
>  F:	package/nut/
>  F:	package/nvidia-driver/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 0932b9f1f9..c5a852b858 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -24,7 +24,6 @@ menu "Host utilities"
>  	source "package/lpc3250loader/Config.in.host"
>  	source "package/lttng-babeltrace/Config.in.host"
>  	source "package/mfgtools/Config.in.host"
> -	source "package/mke2img/Config.in.host"
>  	source "package/mkpasswd/Config.in.host"
>  	source "package/mtd/Config.in.host"
>  	source "package/mtools/Config.in.host"
> diff --git a/package/mke2img/Config.in.host b/package/mke2img/Config.in.host
> deleted file mode 100644
> index b5bcb8455f..0000000000
> --- a/package/mke2img/Config.in.host
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_HOST_MKE2IMG
> -	bool "host mke2img"
> -	select BR2_PACKAGE_HOST_E2FSPROGS
> -	select BR2_PACKAGE_HOST_GENEXT2FS
> -	help
> -	  Easily create filesystems of the extend familly: ext2/3/4.
> -
> -	  This tool is bundled by, and specific to Buildroot. However, it can
> -	  be used from post-images scripts is needed.
> -
> -	  https://code.google.com/p/mke2img/
> diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
> deleted file mode 100755
> index 399012a2be..0000000000
> --- a/package/mke2img/mke2img
> +++ /dev/null
> @@ -1,205 +0,0 @@
> -#!/usr/bin/env bash
> -
> -# Buildroot wrapper to the collection of ext2/3/4 filesystem tools:
> -# - genext2fs, to generate ext2 filesystem images
> -# - tune2fs, to modify an ext2/3/4 filesystem (possibly in an image file)
> -# - e2fsck, to check and fix an ext2/3/4 filesystem (possibly in an image file)
> -
> -set -e
> -
> -main() {
> -    local OPT OPTARG
> -    local nb_blocks nb_inodes nb_res_blocks root_dir image gen rev label uuid
> -    local -a genext2fs_opts
> -    local -a tune2fs_opts
> -    local tune2fs_O_opts
> -
> -    # Default values
> -    gen=2
> -    rev=1
> -    nb_extra_inodes=0
> -
> -    while getopts :hB:b:i:I:r:d:o:G:R:l:u: OPT; do
> -        case "${OPT}" in
> -        h)  help; exit 0;;
> -        B)  block_size="${OPTARG}";;
> -        b)  nb_blocks=${OPTARG};;
> -        i)  nb_inodes=${OPTARG};;
> -        I)  nb_extra_inodes=${OPTARG};;
> -        r)  nb_res_blocks=${OPTARG};;
> -        d)  root_dir="${OPTARG}";;
> -        o)  image="${OPTARG}";;
> -        G)  gen=${OPTARG};;
> -        R)  rev=${OPTARG};;
> -        l)  label="${OPTARG}";;
> -        u)  uuid="${OPTARG}";;
> -        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> -        \?) error "unknown option '%s'\n" "${OPTARG}";;
> -        esac
> -    done
> -
> -    # Sanity checks
> -    if [ -z "${root_dir}" ]; then
> -        error "you must specify a root directory with '-d'\n"
> -    fi
> -    if [ -z "${image}" ]; then
> -        error "you must specify an output image file with '-o'\n"
> -    fi
> -    if [ -z "${nb_blocks}" ]; then
> -        error "you must specify the size of the output image with '-b'\n"
> -    fi
> -    case "${block_size}" in
> -    1024|2048|4096) ;; # Sole valid values
> -    '') error "you must specify the size of a block with -B\n";;
> -    *)  error "invalid block size '%s' (valid: 1024. 2048, 4096)\n" "${block_size}";;
> -    esac
> -    case "${gen}:${rev}" in
> -    2:0|2:1|3:1|4:1)
> -        ;;
> -    3:0|4:0)
> -        error "revision 0 is invalid for ext3 and ext4\n"
> -        ;;
> -    *)  error "unknown ext generation '%s' and/or revision '%s'\n" \
> -               "${gen}" "${rev}"
> -        ;;
> -    esac
> -
> -    # calculate needed inodes
> -    if [ ${nb_inodes:-0} -eq 0 ]; then
> -        nb_inodes=$(find "${root_dir}" | wc -l)
> -        nb_inodes=$((nb_inodes+400))
> -    fi
> -    nb_inodes=$((nb_inodes+nb_extra_inodes))
> -
> -    # Upgrade to rev1 if needed
> -    if [ ${rev} -ge 1 ]; then
> -        tune2fs_O_opts+=",filetype,sparse_super"
> -    fi
> -
> -    # Add a journal for ext3 and above
> -    if [ ${gen} -ge 3 ]; then
> -        tune2fs_opts+=( -j -J size=1 )
> -    fi
> -
> -    # Add ext4 specific features
> -    if [ ${gen} -ge 4 ]; then
> -        tune2fs_O_opts+=",extents,uninit_bg,dir_index"
> -    fi
> -
> -    # Add our -O options (there will be at most one leading comma, remove it)
> -    if [ -n "${tune2fs_O_opts}" ]; then
> -        tune2fs_opts+=( -O "${tune2fs_O_opts#,}" )
> -    fi
> -
> -    # Add the label if specified
> -    if [ -n "${label}" ]; then
> -        tune2fs_opts+=( -L "${label}" )
> -    fi
> -
> -    # Generate the filesystem
> -    genext2fs_opts=( -z -B ${block_size} -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
> -    if [ -n "${nb_res_blocks}" ]; then
> -        genext2fs_opts+=( -m ${nb_res_blocks} )
> -    fi
> -    genext2fs "${genext2fs_opts[@]}" "${image}"
> -
> -    # genext2fs does not generate a UUID, but fsck will whine if one
> -    # is missing, so we need to add a UUID.
> -    # Of course, this has to happen _before_ we run fsck.
> -    # Also, some ext4 metadata are based on the UUID, so we must
> -    # set it before we can convert the filesystem to ext4.
> -    # If the user did not specify a UUID, we generate a random one.
> -    # Although a random UUID may seem bad for reproducibility, there
> -    # already are so many things that are not reproducible in a
> -    # filesystem: file dates, file ordering, content of the files...
> -    tune2fs -U "${uuid:-random}" "${image}"
> -
> -    # Upgrade the filesystem
> -    if [ ${#tune2fs_opts[@]} -ne 0 ]; then
> -        tune2fs "${tune2fs_opts[@]}" "${image}"
> -    fi
> -
> -    # After changing filesystem options, running fsck is required
> -    # (see: man tune2fs). Running e2fsck in other cases will ensure
> -    # coherency of the filesystem, although it is not required.
> -    # 'e2fsck -pDf' means:
> -    #  - automatically repair
> -    #  - optimise and check for duplicate entries
> -    #  - force checking
> -    # Sending output to oblivion, as e2fsck can be *very* verbose,
> -    # especially with filesystems generated by genext2fs.
> -    # Exit codes 1 & 2 are OK, it means fs errors were successfully
> -    # corrected, hence our little trick with $ret.
> -    ret=0
> -    e2fsck -pDf "${image}" >/dev/null || ret=$?
> -    case ${ret} in
> -       0|1|2) ;;
> -       *)   errorN ${ret} "failed to run e2fsck on '%s' (ext%d)\n" \
> -                   "${image}" ${gen}
> -    esac
> -    printf "\n"
> -    trace "e2fsck was successfully run on '%s' (ext%d)\n" "${image}" ${gen}
> -    printf "\n"
> -
> -    # Remove count- and time-based checks, they are not welcome
> -    # on embedded devices, where they can cause serious boot-time
> -    # issues by tremendously slowing down the boot.
> -    tune2fs -c 0 -i 0 "${image}"
> -}
> -
> -help() {
> -    cat <<_EOF_
> -NAME
> -    ${my_name} - Create an ext2/3/4 filesystem image
> -
> -SYNOPSIS
> -    ${my_name} [OPTION]...
> -
> -DESCRIPTION
> -    Create ext2/3/4 filesystem image from the content of a directory.
> -
> -    -b BLOCKS
> -        Create a filesystem of BLOCKS 1024-byte blocs. The default is to
> -        compute the required number of blocks.
> -
> -    -i INODES
> -        Create a filesystem with INODES inodes. The default is to compute
> -        the required number of inodes.
> -
> -    -r RES_BLOCKS
> -        Create a filesystem with RES_BLOCKS reserved blocks. The default
> -        is to reserve 0 block.
> -
> -    -d ROOT_DIR
> -        Create a filesystem, using the content of ROOT_DIR as the content
> -        of the root of the filesystem. Mandatory.
> -
> -    -o FILE
> -        Create the filesystem in FILE. Madatory.
> -
> -    -G GEN -R REV
> -        Create a filesystem of generation GEN (2, 3 or 4), and revision
> -        REV (0 or 1). The default is to generate an ext2 revision 1
> -        filesystem; revision 0 is invalid for ext3 and ext4.
> -
> -    -l LABEL
> -        Create a filesystem with label LABEL. The default is to not set
> -        a label.
> -
> -    -u UUID
> -        Create filesystem with uuid UUID. The default is to set a random
> -        UUID.
> -
> -  Exit status:
> -    0   if OK
> -    !0  in case of error
> -_EOF_
> -}
> -
> -trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
> -warn()   { trace "${@}" >&2; }
> -errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
> -error()  { errorN 1 "${@}"; }
> -
> -my_name="${0##*/}"
> -main "$@"
> diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
> deleted file mode 100644
> index 9de387a3a3..0000000000
> --- a/package/mke2img/mke2img.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -################################################################################
> -#
> -# mke2img
> -#
> -################################################################################
> -
> -HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
> -
> -define HOST_MKE2IMG_INSTALL_CMDS
> -	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/usr/bin/mke2img
> -endef
> -
> -$(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
