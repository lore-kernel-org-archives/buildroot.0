From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 19:01:15 +0200
Subject: [Buildroot] [PATCH v5 1/5] fs/ext2: deprecate
 BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option
In-Reply-To: <20170704144729.19753-2-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-2-s.martin49@gmail.com>
Message-ID: <4f258b76-ffa3-feb8-d60c-c6578dca0e8d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:47, Samuel Martin wrote:
> Soon, the ext{2,3,4} rootfs image will no longer be generated with
> genext2fs, but using mke2fs instead which has no support for the extra
> inode number option.
> 
> So, deprecate the BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option and
> recommend, in lieu, to set the total inode number, taking account of
> the extra ones if needed.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> changes v4->v5:
> - reword legacy option help text (Arnout)
> 
> changes v3->v4:
> - rename deprecate prompt in Config.in.legacy (Arnout)
> - introduce a _WRAP symbol to actually select BR2_LEGACY when needed
>   (Arnout)
> 
> changes v2->v3:
> - new patch (Yann)
> ---
>  Config.in.legacy  | 15 +++++++++++++++
>  fs/ext2/Config.in |  8 --------
>  fs/ext2/ext2.mk   |  1 -
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 453c5eb8b8..8ea468b64a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,21 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> +	int "ext2 extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
> +	default 0
> +	help
> +	  Buildroot now uses mkfs.ext2/3/4 to generate ext2/3/4 images. It
> +	  now automatically selects the number of inodes based on the image
> +	  size. The extra number of inodes can no longer be provided; instead,
> +	  provide the total number of inodes needed in
> +	  BR2_TARGET_ROOTFS_EXT2_INODES.
> +
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES != 0
> +	select BR2_LEGACY
> +
>  config BR2_STRIP_none
>  	bool "Strip command 'none' has been removed"
>  	select BR2_LEGACY
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 6f16dde17f..ec1b5f2c55 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -55,14 +55,6 @@ config BR2_TARGET_ROOTFS_EXT2_INODES
>  	int "exact number of inodes (leave at 0 for auto calculation)"
>  	default 0
>  
> -config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> -	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
> -	default 0
> -	help
> -	  Enter here the number of extra free inodes you want on
> -	  your filesystem. By default, Buildroot will not leave
> -	  many free inodes.
> -
>  config BR2_TARGET_ROOTFS_EXT2_RESBLKS
>  	int "reserved blocks percentage"
>  	default 5
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 0d5fc7f118..8a648dd66c 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -15,7 +15,6 @@ EXT2_OPTS = \
>  	-B 1024 \
>  	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS) \
>  	-i $(BR2_TARGET_ROOTFS_EXT2_INODES) \
> -	-I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES) \
>  	-r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
>  	-l "$(EXT2_LABEL)"
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
