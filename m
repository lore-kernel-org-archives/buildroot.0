From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Jul 2017 18:38:47 +0200
Subject: [Buildroot] [PATCH v2 3/6] fs/ext2: use mkfs to generate rootfs
 image
In-Reply-To: <20170703155154.24104-4-s.martin49@gmail.com>
References: <20170703155154.24104-1-s.martin49@gmail.com>
 <20170703155154.24104-4-s.martin49@gmail.com>
Message-ID: <20170703163847.GA20618@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, S?bastien, All,

On 2017-07-03 17:51 +0200, Samuel Martin spake thusly:
> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> mkfs is now capable of generating rootfs images. Use mkfs intead of
> genext2fs. As we let mkfs calculate the block size and the number of
> inodes needed we can drop BR2_TARGET_ROOTFS_EXT2_INODES and
> BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES and rename
> BR2_TARGET_ROOTFS_EXT2_BLOCKS to BR2_TARGET_ROOTFS_EXT2_SIZE

This is incorrect, because we now loose two features:

  1. the possibility to force the number of inodes;

  2. the possibility to auto-calculate the number of inodes, but add a
     bit of extra ones.

While I agree that mkfs.ext2 can now autocalculate the number of inodes
and so we need not do it ourselves anymore. However, we so far had the
option to force the exact number of inodes, and this is lost with this
patch.

So, I would like that:

  1. we keep BR2_TARGET_ROOTFS_EXT2_INODES and handle adequately:
    - if it is set to zero, we let mkfs auto-calcualte
    - if it is non-zero, we pass -N $(BR2_TARGET_ROOTFS_EXT2_INODES)

  2. we indeed drop the option to set the extra number of inodes, as
    there is no way to pass this information to mkfs.ext2

So, can you rework this patch as thus:

  - split it in two, with the first one that drops (and adds legacy for)
    BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES

  - the seond patch is the actual switch to using mkfs.ext2, but keeps
    using BR2_TARGET_ROOTFS_EXT2_INODES

Thank you! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - rebase
> - add default size value
> ---
>  Config.in.legacy  | 34 ++++++++++++++++++++++++++++++++++
>  fs/ext2/Config.in | 27 +++++++++------------------
>  fs/ext2/ext2.mk   | 22 +++++++++++-----------
>  3 files changed, 54 insertions(+), 29 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 453c5eb8b8..c086d30ee5 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,40 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_TARGET_ROOTFS_EXT2_INODES
> +	int "exact number of inodes has been removed"
> +	default 0
> +	help
> +	  Buildroot uses mkfs.ext2/3/4 to generate ext2/3/4 images. So let mkfs
> +	  automatically selects the number of inodes needed. Set this option to
> +	  0.
> +
> +config BR2_TARGET_ROOTFS_EXT2_INODES_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_INODES != 0
> +	select BR2_LEGACY
> +
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> +	int "extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
> +	default 0
> +	help
> +	  Buildroot uses mkfs.ext2/3/4 to generate ext2/3/4 images. So let mkfs
> +	  automatically selects the number of inodes needed. Set this option to
> +	  0.
> +
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES != 0
> +	select BR2_LEGACY
> +
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> +	int "exact size in blocks has been removed"
> +	default 0
> +	help
> +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
> +
> +# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS still reference in fs/ext2/Config.in
> +
>  config BR2_STRIP_none
>  	bool "Strip command 'none' has been removed"
>  	select BR2_LEGACY
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 33891601f4..d3e9d16a44 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_TARGET_ROOTFS_EXT2
>  	bool "ext2/3/4 root filesystem"
> -	select BR2_PACKAGE_HOST_MKE2IMG
> +	select BR2_PACKAGE_HOST_E2FSPROGS
>  	help
>  	  Build an ext2/3/4 root filesystem
>  
> @@ -44,24 +44,15 @@ config BR2_TARGET_ROOTFS_EXT2_REV
>  config BR2_TARGET_ROOTFS_EXT2_LABEL
>  	string "filesystem label"
>  
> -# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
> -config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> -	int "exact size in blocks"
> -	default 61440
> +config BR2_TARGET_ROOTFS_EXT2_SIZE
> +	string "exact size"
> +	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0 # legacy 2017.08
> +	default "60M" # default size
>  	help
> -	  Specify the file system size as a number of 1024-byte blocks.
> -
> -config BR2_TARGET_ROOTFS_EXT2_INODES
> -	int "exact number of inodes (leave at 0 for auto calculation)"
> -	default 0
> -
> -config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> -	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
> -	default 0
> -	help
> -	  Enter here the number of extra free inodes you want on
> -	  your filesystem. By default, Buildroot will not leave
> -	  many free inodes.
> +	  The size of the filesystem image. If it does not have a suffix, it is
> +	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',
> +	  'g', 't' (either upper-case or lower-case), then it is interpreted in
> +	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
>  
>  config BR2_TARGET_ROOTFS_EXT2_RESBLKS
>  	int "reserved blocks percentage"
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index ce567de34c..5269e99a29 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -4,28 +4,28 @@
>  #
>  ################################################################################
>  
> -EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
> -
> -EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> -
> -ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
> -EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
> +EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
> +ifeq ($(EXT2_SIZE),)
> +$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
>  endif
> -EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
>  
> -EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
> +EXT2_OPTS = -d $(TARGET_DIR)
> +EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
> +
> +EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
>  
>  # qstrip results in stripping consecutive spaces into a single one. So the
>  # variable is not qstrip-ed to preserve the integrity of the string value.
>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
>  #" Syntax highlighting... :-/ )
>  
> -EXT2_OPTS += -l "$(EXT2_LABEL)"
> +EXT2_OPTS += -L "$(EXT2_LABEL)"
>  
> -ROOTFS_EXT2_DEPENDENCIES = host-mke2img
> +ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>  
>  define ROOTFS_EXT2_CMD
> -	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
> +	rm -f $@
> +	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(EXT2_SIZE)
>  endef
>  
>  rootfs-ext2-symlink:
> -- 
> 2.13.2
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
