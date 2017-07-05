From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 22:41:32 +0200
Subject: [Buildroot] [PATCH v7 1/2] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170705201657.8361-1-s.martin49@gmail.com>
References: <20170705201657.8361-1-s.martin49@gmail.com>
Message-ID: <92a987bb-add6-e2da-5872-963a1fd24efd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 22:16, Samuel Martin wrote:
> This change deprecates the ext2/3/4 rootfs size in blocks symbol in
> favor of one that mimic the fs-size argument behavior of mkfs (i.e.
> size in a human readable format accepting k, m, g or t suffix or their
> upper-case variants).
> 
> This change also updates the defconfigs that used to set
> BR2_TARGET_ROOTFS_EXT2_BLOCKS symbol.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v6->v7:
> - rebase after usr/ removal
> 
> changes v5->v6:
> - rebase
> - fix typo (Peter)
> - add comments in legacy (Arnout)
> - quote EXT2_SIZE usage (Arnout)
> - use more human-friendly size (defaults + defconfigs) (Arnout)
> - trigger legacy when using the deprecated valid (Arnout)
> 
> changes v4->v5:
> - new patch (Arnout)
> ---
>  Config.in.legacy                            | 15 +++++++++++++++
>  configs/at91sam9x5ek_mmc_dev_defconfig      |  2 +-
>  configs/beaglebone_qt5_defconfig            |  2 +-
>  configs/firefly_rk3288_demo_defconfig       |  2 +-
>  configs/minnowboard_max-graphical_defconfig |  3 +--
>  configs/nanopi_neo_defconfig                |  2 +-
>  configs/pc_x86_64_bios_defconfig            |  2 +-
>  configs/pc_x86_64_efi_defconfig             |  2 +-
>  configs/raspberrypi3_64_defconfig           |  2 +-
>  fs/ext2/Config.in                           | 13 ++++++++-----
>  fs/ext2/ext2.mk                             |  7 ++++++-
>  11 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 12362da6f2..853e2f913d 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -152,6 +152,21 @@ config BR2_PACKAGE_HOST_MKE2IMG
>  	  We now call mkfs directly to generate ext2/3/4 filesystem
>  	  image, so mke2img is no longer necessary.
>  
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> +	int "exact size in blocks has been removed"
> +	default 0
> +	help
> +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
> +	  It has been set automatically to the value you had before.
> +
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0
> +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 61440 # deprecated default value

 I know I wrote ||, but I meant &&. Now this is always true. I guess you didn't
test this?

> +	select BR2_LEGACY
> +
> +# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP still reference in fs/ext2/Config.in
> +
>  config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
>  	int "ext2 extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
>  	default 0
[snip]
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 9c58ac62ed..aeee91748f 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -44,12 +44,15 @@ config BR2_TARGET_ROOTFS_EXT2_REV
>  config BR2_TARGET_ROOTFS_EXT2_LABEL
>  	string "filesystem label"
>  
> -# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
> -config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> -	int "exact size in blocks"
> -	default 61440
> +config BR2_TARGET_ROOTFS_EXT2_SIZE
> +	string "exact size"
> +	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP # legacy 2017.08
> +	default "60M" # default size
>  	help
> -	  Specify the file system size as a number of 1024-byte blocks.
> +	  The size of the filesystem image. If it does not have a suffix, it is

 Line is still too long. Wrap at 72 columns, where tab counts as 8, so 62
characters after the tab + 2 spaces. You have 69 characters.

> +	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',
> +	  'g', 't' (either upper-case or lower-case), then it is interpreted in
> +	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
>  
>  config BR2_TARGET_ROOTFS_EXT2_INODES
>  	int "exact number of inodes (leave at 0 for auto calculation)"
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 99d03f10cf..fdd4a389a0 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -4,6 +4,11 @@
>  #
>  ################################################################################
>  
> +EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
> +ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(EXT2_SIZE),y-)
> +$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)

 I still think this check is pretty much redundant but some people disagree so OK.

 Regards,
 Arnout

> +endif
> +
>  # qstrip results in stripping consecutive spaces into a single one. So the
>  # variable is not qstrip-ed to preserve the integrity of the string value.
>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
> @@ -21,7 +26,7 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>  define ROOTFS_EXT2_CMD
>  	rm -f $@
>  	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
> -		 $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> +		"$(EXT2_SIZE)"
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
