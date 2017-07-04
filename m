From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 13:36:33 +0200
Subject: [Buildroot] [PATCH v3 09/11] fs/ext2: use mkfs to generate
 rootfs image
In-Reply-To: <20170703225106.1492-10-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-10-s.martin49@gmail.com>
Message-ID: <bc01af2c-4e1e-0427-4302-3b20b68dd7c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Can this patch be split up into

1/ use mkfs to generate rootfs image

2/ replace BR2_TARGET_ROOTFS_EXT2_BLOCKS with BR2_TARGET_ROOTFS_EXT2_SIZE

?

 The latter patch will also have to be combined with fixing up the 8 defconfigs
that use this option.

On 04-07-17 00:51, Samuel Martin wrote:
> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> mkfs is now capable of generating rootfs images. Use mkfs instead of
> genext2fs.
> 
> If not set, we now let mkfs calculate the block size and the number of
> inodes needed.
> 
> This change also adjusts the options to meet those of mkfs. Note that
> passing a null inode number to mkfs triggers its automatic calculation.
> 
> The BR2_TARGET_ROOTFS_EXT2_BLOCKS symbol is ranamed as well, into
> BR2_TARGET_ROOTFS_EXT2_SIZE, since it now accepts the same values as the
> mkfs' fs-size argument (i.e. with k, m, g or t suffix).
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v2->v3:
> - reword commit log
> 
> changes v1->v2:
> - rebase
> - add default size value
> ---
>  Config.in.legacy  |  8 ++++++++
>  fs/ext2/Config.in | 21 +++++++++++----------
>  fs/ext2/ext2.mk   | 23 ++++++++++++++---------
>  3 files changed, 33 insertions(+), 19 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5efe0d1ba0..68275f9e0e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,14 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> +	int "exact size in blocks has been removed"
> +	default 0
> +	help
> +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.

 Again BR2_LEGACY is not selected.

> +
> +# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS still reference in fs/ext2/Config.in
> +
>  config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
>  	int "extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
>  	default 0
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 0071ba2bec..9850823e10 100644
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
> @@ -66,19 +66,20 @@ config BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE
>  	default 2048 if BR2_TARGET_ROOTFS_EXT2_BLOCK_2048
>  	default 4096 if BR2_TARGET_ROOTFS_EXT2_BLOCK_4096
>  
> -# 61440 block od 1024 bytes = 60MB, i.e usually small enough to fit
> -# on a 64MB media
> -config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> -	int "exact size in blocks"
> -	default 61440
> -	help
> -	  Specify the file system size as a number of blocks, which
> -	  size is specified above.
> -
>  config BR2_TARGET_ROOTFS_EXT2_INODES
>  	int "exact number of inodes (leave at 0 for auto calculation)"
>  	default 0
>  
> +config BR2_TARGET_ROOTFS_EXT2_SIZE

 Admittedly this keeps things alphabetical, but I still think it makes more
sense to have size first and inodes afterwards.

> +	string "exact size"
> +	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0 # legacy 2017.08
> +	default "60M" # default size
> +	help
> +	  The size of the filesystem image. If it does not have a suffix, it is
> +	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',

 So actually, it is NOT the same as the legacy BR2_TARGET_ROOTFS_EXT2_BLOCKS
because that one was not kilobytes but blocks, and there was the option to use
2K or 4K blocks... Oh, but of course, for legacy purposes, it actually *was* 1K
blocks. So OK.


 Regards,
 Arnout


> +	  'g', 't' (either upper-case or lower-case), then it is interpreted in
> +	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
> +
>  config BR2_TARGET_ROOTFS_EXT2_RESBLKS
>  	int "reserved blocks percentage"
>  	default 5
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 24643afeb9..bc366bc689 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -4,24 +4,29 @@
>  #
>  ################################################################################
>  
> +EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
> +ifeq ($(EXT2_SIZE),)
> +$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
> +endif
> +
>  # qstrip results in stripping consecutive spaces into a single one. So the
>  # variable is not qstrip-ed to preserve the integrity of the string value.
>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
>  #" Syntax highlighting... :-/ )
>  
>  EXT2_OPTS = \
> -	-G $(BR2_TARGET_ROOTFS_EXT2_GEN) \
> -	-R $(BR2_TARGET_ROOTFS_EXT2_REV) \
> -	-B $(BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE) \
> -	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
> -	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
> -	-r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
> -	-l "$(EXT2_LABEL)"
> +	-d $(TARGET_DIR) \
> +	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
> +	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE) \
> +	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
> +	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
> +	-L "$(EXT2_LABEL)"
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
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
