From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Mar 2017 15:30:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: use mkfs to generate
 rootfs image
In-Reply-To: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20170318143054.GA3716@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S?bastien, All,

On 2017-03-02 10:06 +0100, S?bastien Szymanski spake thusly:
> mkfs is now capable of generating rootfs images. Use mkfs intead of
> genext2fs.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

So, to sumarize the discussion in this thread, and a discussion Thomas,
Arnout and I just had on IRC:

 1. mke2fs can't auto-calculate the size;

 2. auto-calculation is inherently flawed, because it relies on the host
    filesystem specifics;

 3. so we want the user to be responsible for specifying the exact size
    he wants for his extfs;

 4. we don't care much about generating filesystems that are bckward
    identical (i.e. we don;t care if the enerated filesystem does not
    have the same feature set as was previously done);

 5. except we want to drop features that make it incompatible with older
    U-Boot or other bootlaoders, or older kernels, but that should be
    optional.

 6. can we kill most of mke2img, or can we even kill it altogether? ;-)

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/mke2img/Config.in.host |  1 -
>  package/mke2img/mke2img        | 58 +++++++++++++++++-------------------------
>  package/mke2img/mke2img.mk     |  2 +-
>  3 files changed, 25 insertions(+), 36 deletions(-)
> 
> diff --git a/package/mke2img/Config.in.host b/package/mke2img/Config.in.host
> index b5bcb84..f252715 100644
> --- a/package/mke2img/Config.in.host
> +++ b/package/mke2img/Config.in.host
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_HOST_MKE2IMG
>  	bool "host mke2img"
>  	select BR2_PACKAGE_HOST_E2FSPROGS
> -	select BR2_PACKAGE_HOST_GENEXT2FS
>  	help
>  	  Easily create filesystems of the extend familly: ext2/3/4.
>  
> diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
> index c2e0d02..15b7246 100755
> --- a/package/mke2img/mke2img
> +++ b/package/mke2img/mke2img
> @@ -10,9 +10,8 @@ set -e
>  main() {
>      local OPT OPTARG
>      local nb_blocks nb_inodes nb_res_blocks root_dir image gen rev label uuid
> -    local -a genext2fs_opts
> -    local -a tune2fs_opts
> -    local tune2fs_O_opts
> +    local -a mkfs_opts
> +    local mkfs_O_opts
>  
>      # Default values
>      gen=2
> @@ -82,55 +81,51 @@ main() {
>  
>      # Upgrade to rev1 if needed
>      if [ ${rev} -ge 1 ]; then
> -        tune2fs_O_opts+=",filetype,sparse_super"
> +        mkfs_O_opts+=",filetype,sparse_super"
>      fi
>  
>      # Add a journal for ext3 and above
> +    # resize_inode for online resizing
>      if [ ${gen} -ge 3 ]; then
> -        tune2fs_opts+=( -j -J size=1 )
> +        mkfs_opts+=( -j -J size=1 )
> +        mkfs_O_opts+=",resize_inode"
>      fi
>  
>      # Add ext4 specific features
>      if [ ${gen} -ge 4 ]; then
> -        tune2fs_O_opts+=",extents,uninit_bg,dir_index"
> +        mkfs_O_opts+=",extents,uninit_bg,dir_index"
>      fi
>  
> +    # Disable some defaults features
> +    mkfs_O_opts+=",^ext_attr,^64bit,^flex_bg,^large_file,^huge_file,^dir_nlink,^extra_isize"
> +
>      # Add our -O options (there will be at most one leading comma, remove it)
> -    if [ -n "${tune2fs_O_opts}" ]; then
> -        tune2fs_opts+=( -O "${tune2fs_O_opts#,}" )
> +    if [ -n "${mkfs_O_opts}" ]; then
> +        mkfs_opts+=( -O "${mkfs_O_opts#,}" )
>      fi
>  
>      # Add the label if specified
>      if [ -n "${label}" ]; then
> -        tune2fs_opts+=( -L "${label}" )
> +        mkfs_opts+=( -L "${label}" )
>      fi
>  
> -    # Generate the filesystem
> -    genext2fs_opts=( -z -b ${nb_blocks} -N ${nb_inodes} -d "${root_dir}" )
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
> +    # If the user did not specify a UUID, mkfs will generate a random one.
>      # Although a random UUID may seem bad for reproducibility, there
>      # already are so many things that are not reproducible in a
>      # filesystem: file dates, file ordering, content of the files...
> -    tune2fs -U "${uuid:-random}" "${image}"
> +    if [ -n "${UUID}" ]; then
> +        mkfs_opts+=( -U "${UUID}" )
> +    fi
>  
> -    # Upgrade the filesystem
> -    if [ ${#tune2fs_opts[@]} -ne 0 ]; then
> -        tune2fs "${tune2fs_opts[@]}" "${image}"
> +    # Generate the filesystem
> +    mkfs_opts+=( -d "${root_dir}" -N ${nb_inodes} -T small -F )
> +    if [ -n "${nb_res_block}" ]; then
> +        mkfs_opts+=( -m ${nb_res_blocks} )
>      fi
> +    mkfs.ext${gen} "${mkfs_opts[@]}" "${image}" "${nb_blocks}"
>  
> -    # After changing filesystem options, running fsck is required
> -    # (see: man tune2fs). Running e2fsck in other cases will ensure
> -    # coherency of the filesystem, although it is not required.
> +    # Running e2fsck will ensure coherency of the filesystem,
> +    # although it is not required.
>      # 'e2fsck -pDf' means:
>      #  - automatically repair
>      #  - optimise and check for duplicate entries
> @@ -149,11 +144,6 @@ main() {
>      printf "\n"
>      trace "e2fsck was successfully run on '%s' (ext%d)\n" "${image}" ${gen}
>      printf "\n"
> -
> -    # Remove count- and time-based checks, they are not welcome
> -    # on embedded devices, where they can cause serious boot-time
> -    # issues by tremendously slowing down the boot.
> -    tune2fs -c 0 -i 0 "${image}"
>  }
>  
>  help() {
> diff --git a/package/mke2img/mke2img.mk b/package/mke2img/mke2img.mk
> index 9de387a..ead9d70 100644
> --- a/package/mke2img/mke2img.mk
> +++ b/package/mke2img/mke2img.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HOST_MKE2IMG_DEPENDENCIES = host-genext2fs host-e2fsprogs
> +HOST_MKE2IMG_DEPENDENCIES = host-e2fsprogs
>  
>  define HOST_MKE2IMG_INSTALL_CMDS
>  	$(INSTALL) -D -m 0755 package/mke2img/mke2img $(HOST_DIR)/usr/bin/mke2img
> -- 
> 2.7.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
