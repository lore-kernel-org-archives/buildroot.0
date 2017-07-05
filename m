From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Jul 2017 16:07:50 +0300
Subject: [Buildroot] [PATCH v6 1/2] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170705130100.441-1-s.martin49@gmail.com>
References: <20170705130100.441-1-s.martin49@gmail.com>
Message-ID: <20170705130750.c3ilmo52bakld4cf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Wed, Jul 05, 2017 at 03:00:59PM +0200, Samuel Martin wrote:
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
> index 12362da6f..853e2f913 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -152,6 +152,21 @@ config BR2_PACKAGE_HOST_MKE2IMG
>  	  We now call mkfs directly to generate ext2/3/4 filesystem
>  	  image, so mke2img is no longer necessary.
>  
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> +	int "exact size in blocks has been removed"
> +	default 0

Missing BR2_LEGACY.

> +	help
> +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
> +	  It has been set automatically to the value you had before.
> +
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0
> +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 61440 # deprecated default value
> +	select BR2_LEGACY
> +
> +# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP still reference in fs/ext2/Config.in

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
