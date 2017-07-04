From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 19:28:17 +0200
Subject: [Buildroot] [PATCH v5 3/5] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170704144729.19753-4-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-4-s.martin49@gmail.com>
Message-ID: <f63d9508-137a-e9c7-b1ef-79873989930f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:47, Samuel Martin wrote:
> This change deprecates the ext2/3/4 rootfs size in blocks symbol in
> favor of one that mimic the fs-size argument behavior of mkfs (i.e.
> size in a human readable format accepting k, m, g or t suffix or their
> upper-case variants).
> 
> This change also updates the defconfigs that used to set
> BR2_TARGET_ROOTFS_EXT2_BLOCKS symbol.

 So I tried this and it is in fact very annoying that it changes. Anyone who was
using ext2 will be hit by this legacy stuff...


> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - new patch (Arnout)
> ---
>  Config.in.legacy                            | 11 +++++++++++
>  configs/at91sam9x5ek_mmc_dev_defconfig      |  2 +-
>  configs/beaglebone_qt5_defconfig            |  2 +-
>  configs/firefly_rk3288_demo_defconfig       |  2 +-
>  configs/minnowboard_max-graphical_defconfig |  2 +-
>  configs/nanopi_neo_defconfig                |  2 +-
>  configs/pc_x86_64_bios_defconfig            |  2 +-
>  configs/pc_x86_64_efi_defconfig             |  2 +-
>  configs/raspberrypi3_64_defconfig           |  2 +-
>  fs/ext2/Config.in                           | 13 ++++++++-----
>  fs/ext2/ext2.mk                             |  8 ++++++--
>  11 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8ea468b64a..a26869ac64 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,17 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> +	int "exact size in blocks has been removed"
> +	default 0
> +	help
> +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.

 Add:
	  It has been set automatically to the value you had before.

> +
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0

 So this will hit legacy handling for anyone using the default value in 2017.05,
because there the default is 61440. And if we change it into != 61440, then it
will hit anyone who upgrades from <2017.05. And if we add || != 61440, it will
still hit anyone who changed the default.

 So@the very least we should add || != 61440 so anyone who was using the
default before will not get hit by legacy.

 Ideally we don't change the symbol name but then we can't change it from int to
string. So I guess we'll have to do this after all :-(



> +	select BR2_LEGACY
> +

 Add a comment that fs/ext2/Config.in refers this symbol.

>  config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
>  	int "ext2 extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
>  	default 0
> diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
> index 0060111fca..1bf2983ee7 100644
> --- a/configs/at91sam9x5ek_mmc_dev_defconfig
> +++ b/configs/at91sam9x5ek_mmc_dev_defconfig
> @@ -81,7 +81,7 @@ BR2_PACKAGE_VIM=y
>  # Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120000K"

 While you're at it, make it 120M instead. Not exactly the same but it's larger
so should be OK.

[snip]
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 9c58ac62ed..b2363940f0 100644
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
> +	default BR2_TARGET_ROOTFS_EXT2_BLOCKS if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0 # legacy 2017.08

 Make it instead "if BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP" - simpler.

> +	default "61440K" # default size

 Use "60M" instead.

>  	help
> -	  Specify the file system size as a number of 1024-byte blocks.
> +	  The size of the filesystem image. If it does not have a suffix, it is
> +	  interpreted as power-of-two kilobytes. If it is suffixed by 'k', 'm',
> +	  'g', 't' (either upper-case or lower-case), then it is interpreted in
> +	  power-of-two kilobytes, megabytes, gigabytes, terabytes, etc.
>  
>  config BR2_TARGET_ROOTFS_EXT2_INODES
>  	int "exact number of inodes (leave at 0 for auto calculation)"
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index bff442ff18..c8da9c4451 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -4,6 +4,11 @@
>  #
>  ################################################################################
>  
> +EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
> +ifeq ($(BR2_TARGET_ROOTFS_EXT)-$(EXT2_SIZE),y-)
                                ^2

> +$(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)

 I wonder if it makes sense to check this explicitly. There are thousands of
ways it can be wrong, empty is just one of them. If it is empty, mke2fs will
complain that the argument is missing.

> +endif
> +
>  # qstrip results in stripping consecutive spaces into a single one. So the
>  # variable is not qstrip-ed to preserve the integrity of the string value.
>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
> @@ -20,8 +25,7 @@ ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>  
>  define ROOTFS_EXT2_CMD
>  	rm -f $@
> -	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
> -		 $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> +	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(EXT2_SIZE)

 Put quotes around EXT2_SIZE - a user may have added spaces there (which will
never work, but better let mke2fs give the appropriate error message).

 Regards,
 Arnout

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
