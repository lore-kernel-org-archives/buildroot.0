From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jul 2017 23:11:55 +0200
Subject: [Buildroot] [PATCH v9 1/2] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170705213936.22344-1-s.martin49@gmail.com>
References: <20170705213936.22344-1-s.martin49@gmail.com>
Message-ID: <b19afd79-79af-53e9-de90-c80efdea8740@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Still some minor comments...

On 05-07-17 23:39, Samuel Martin wrote:
> This change deprecates the ext2/3/4 rootfs size in blocks symbol in
> favor of one that mimic the fs-size argument behavior of mkfs (i.e.
> size in a human readable format accepting k, m, g or t suffix or their
> upper-case variants).
> 
> This change also updates the defconfigs that used to set
> BR2_TARGET_ROOTFS_EXT2_BLOCKS symbol.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[snip]
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> +	int "exact size in blocks has been removed"
> +	default 0
> +	help
> +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
> +	  It has been set automatically to the value you had before.

 It's not obvious to the user how the warning should be removed, so add:

	  Set to 0 here to remove the warning.

> +
> +config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0 && \
> +		BR2_TARGET_ROOTFS_EXT2_BLOCKS != 61440 # deprecated default value
> +	select BR2_LEGACY
> +
> +# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP still reference in fs/ext2/Config.in
                                                             ^d

> +
>  config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
>  	int "ext2 extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
>  	default 0

[snip]
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 9c58ac62ed..a851afb439 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -44,12 +44,16 @@ config BR2_TARGET_ROOTFS_EXT2_REV
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

 This comment is pretty useless: default is default, and the option is about size...

 With those minor things fixed (which can be done while applying):
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
