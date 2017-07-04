From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 12:35:14 +0200
Subject: [Buildroot] [PATCH v3 08/11] fs/ext2: deprecate
 BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option
In-Reply-To: <20170703225106.1492-9-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-9-s.martin49@gmail.com>
Message-ID: <ca4cf9d5-53c3-17e7-15ca-d7a207c9b002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 04-07-17 00:51, Samuel Martin wrote:
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
> 
> ---
> changes v2->v3:
> - new patch (Yann)
> ---
>  Config.in.legacy  | 11 +++++++++++
>  fs/ext2/Config.in |  8 --------
>  fs/ext2/ext2.mk   |  1 -
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 453c5eb8b8..5efe0d1ba0 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,17 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
> +	int "extra inodes has been removed" if BR2_TARGET_ROOTFS_EXT2_INODES = 0

 I was going to say that there should be no condition any more. Indeed, we want
this thing to show up whenever it appears in the old .config file. However, it's
in fact convenient for the user that this thing disappears as soon as he sets
BR2_TARGET_ROOTFS_EXT2_INODES to something, like he should. So OK.

 However, the prompt should clarify that this is about ext2. So:

	int "ext2 extra inodes has been removed"

> +	default 0

 You don't select BR2_LEGACY hear. You need to introduce an extra symbol, like
for BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS{,_WRAP}.


 Otherwise looks good to me :-)


 Regards,
 Arnout

> +	help
> +	  Buildroot now uses mkfs.ext2/3/4 to generate ext2/3/4 images. So
> +	  let mkfs automatically selects the number of inodes needed. Set
> +	  this option to 0.
> +	  Note that, the number of inodes can still be set and passed to
> +	  mkfs; so if extra inodes are needed, prefer setting
> +	  BR2_TARGET_ROOTFS_EXT2_INODES taking account of them.
> +
>  config BR2_STRIP_none
>  	bool "Strip command 'none' has been removed"
>  	select BR2_LEGACY
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 627294e17f..0071ba2bec 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -79,14 +79,6 @@ config BR2_TARGET_ROOTFS_EXT2_INODES
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
> index ec49caa3a5..24643afeb9 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -15,7 +15,6 @@ EXT2_OPTS = \
>  	-B $(BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE) \
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
