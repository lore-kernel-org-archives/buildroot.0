From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2013 08:04:04 +0100
Subject: [Buildroot] [PATCH 2/4] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <1a995bdbc65141cf4e8a540c41cb56f4a43fba5f.1361142401.git.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <1a995bdbc65141cf4e8a540c41cb56f4a43fba5f.1361142401.git.yann.morin.1998@free.fr>
Message-ID: <512323E4.7000901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Great feature addition!

On 18/02/13 00:10, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   fs/ext2/Config.in    |   37 ++++++++++++++++++++++++++++++-------
>   fs/ext2/ext2.mk      |    4 ++--
>   fs/ext2/genext2fs.sh |   48 ++++++++++++++++++++++++++++++++++++++++++++++--
>   3 files changed, 78 insertions(+), 11 deletions(-)
>
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index cb4beed..00f11a2 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -1,10 +1,33 @@
>   config BR2_TARGET_ROOTFS_EXT2
> -	bool "ext2 root filesystem"
> +	bool "ext2/3/4 root filesystem"
>   	help
> -	  Build an ext2 root filesystem
> +	  Build an ext2/3/4 root filesystem
>
>   if BR2_TARGET_ROOTFS_EXT2
>
> +choice
> +	bool "ext generation"

  Given the way it appears in menuconfig, I think this will be hard to 
understand for many users. Perhaps "ext generation (ext2, ext3 or ext4)".

> +	default BR2_TARGET_ROOTFS_EXT2_2

  Although this matches the current default, doesn't it make more sense 
to "bump" to ext4?

> +
> +config BR2_TARGET_ROOTFS_EXT2_2
> +	bool "ext2"
> +
> +config BR2_TARGET_ROOTFS_EXT2_3
> +	bool "ext3"
> +	select BR2_PACKAGE_HOST_E2FSPROGS

  We don't usually select the host package. On the other hand, the 
support for user-selectable host packages is pretty recent, so we don't 
have a real tradition for this.

  Peter?

> +
> +config BR2_TARGET_ROOTFS_EXT2_4
> +	bool "ext4"
> +	select BR2_PACKAGE_HOST_E2FSPROGS
> +
> +endchoice
> +
> +config BR2_TARGET_ROOTFS_EXT2_GEN
> +	int
> +	default 2 if BR2_TARGET_ROOTFS_EXT2_2
> +	default 3 if BR2_TARGET_ROOTFS_EXT2_3
> +	default 4 if BR2_TARGET_ROOTFS_EXT2_4
> +
>   config BR2_TARGET_ROOTFS_EXT2_BLOCKS
>   	int "size in blocks (leave at 0 for auto calculation)"
>   	default 0
[snip]
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 7b71592..80ad93f 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -18,10 +18,10 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
>   EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
>   endif
>
> -ROOTFS_EXT2_DEPENDENCIES = host-genext2fs
> +ROOTFS_EXT2_DEPENDENCIES = host-genext2fs $(if $(BR2_PACKAGE_HOST_E2FSPROGS),host-e2fsprogs)

  Although this is correct, I think it looks confusing. I prefer a more 
explicit

ifeq ($(BR2_TARGET_ROOTFS_EXT2_3)$(BR2_TARGET_ROOTFS_EXT2_4),y)
ROOTFS_EXT2_DEPENDENCIES += host-e2fsprogs
endif

>
>   define ROOTFS_EXT2_CMD
> -	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
> +	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) -$(BR2_TARGET_ROOTFS_EXT2_GEN) $@

  Minor nit: I would prefer
EXT2_OPTS += -$(BR2_TARGET_ROOTFS_EXT2_GEN)

>   endef
>
>   $(eval $(call ROOTFS_TARGET,ext2))
> diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
> index 7a518ae..fcbd43c 100755
> --- a/fs/ext2/genext2fs.sh
> +++ b/fs/ext2/genext2fs.sh
> @@ -1,19 +1,22 @@
>   #!/bin/sh
>   # genext2fs wrapper calculating needed blocks/inodes values if not specified
> +set -e
>
>   export LC_ALL=C
>
>   CALC_BLOCKS=1
>   CALC_INODES=1
>
> -while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv f
> +while getopts x:d:D:b:i:N:m:g:e:zfqUPhVv234 f
>   do
>       case $f in
> +	2|3|4) GEN=$f ;;
>   	b) CALC_BLOCKS=0 ;;
>   	N) CALC_INODES=0; INODES=$OPTARG ;;
>   	d) TARGET_DIR=$OPTARG ;;
>       esac
>   done
> +eval IMG="\"\${${OPTIND}}\""
>
>   # calculate needed inodes
>   if [ $CALC_INODES -eq 1 ];
> @@ -30,7 +33,48 @@ then
>       # we scale inodes / blocks with 10% to compensate for bitmaps size + slack
>       BLOCKS=$(du -s -c -k $TARGET_DIR | grep total | sed -e "s/total//")
>       BLOCKS=$(expr 500 + \( $BLOCKS + $INODES / 8 \) \* 11 / 10)
> +    # we add 1081 blocks (a bit more than 1 MiB, assuming 1KiB blocks) for
> +    # the journal if ext3/4

  Is this based on anything? Could you add something like "This allows 
filesystems up to 4GiB"?

> +    if [ ${GEN} -ge 3 ]; then
> +        BLOCKS=$(expr 1081 + $BLOCKS )
> +    fi
>       set -- $@ -b $BLOCKS
>   fi
>
> -exec genext2fs $@
> +# Remove -{2,3,4} from the arguments, they are not recognised
> +# by genext2fs and we handle them manually later

  Wouldn't it be a lot simpler to pass the generation through the 
environment instead?

> +first=1
> +for o; do
> +    case "${o}" in
> +	-2|-3|-4)  ;;
> +	*)  if [ ${first} -eq 1 ]; then
> +		set --
> +		first=0
> +	    fi
> +	    set -- "$@" "${o}"
> +            ;;
> +    esac
> +done
> +
> +# Generate the base ext2 file system
> +genext2fs "$@"
> +
> +# Upgrade to ext3 if needed
> +if [ ${GEN} -ge 3 ]; then
> +    tune2fs -j -J size=1 "${IMG}" >/dev/null

  Ah, this is where the 1081 blocks come from.  There should be a comment 
pointing to that 1081 so it's easier to find this back if it is ever 
changed to a different value.

  Why does it have to be >/dev/null? We don't usually do that...

  In the script I used, I also added -c 0 (max mount count) and -i 0 
(interval between checks).  That's not for this patch of course, but I 
think it's something useful to have in general.

> +fi
> +
> +# Upgrade to ext4 if needed
> +if [ ${GEN} -ge 4 ]; then
> +    tune2fs -O extents,uninit_bg,dir_index "${IMG}" >/dev/null
> +    ret=0
> +    fsck.ext4 -pDf "${IMG}" >/dev/null || ret=$?

  This fsck is needed for ext3 as well, just to set rev0 -> rev1. Of 
course, patch 4/4 does that already.

  You should add a comment why fsck is needed.

  I would use e2fsck rather than fsck.ext4, but that's a minor thing.

> +    # Exit codes 1 & 2 are OK, it means fs errors
> +    # were successfully corrected
> +    case ${ret} in
> +	0|1|2) ;;
> +	*)   exit 1;;
> +    esac
> +    # fsck.ext4 will force a UUID, which we do not want
> +    tune2fs -U clear "${IMG}" >/dev/null

  Why don't we want a UUID? We have it for other filesystems, e.g. ubifs...


  Regards,
  Arnout

> +fi
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
