From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 13:38:44 +0200
Subject: [Buildroot] [PATCH v3 10/11] fs/ext2: Add
 BR2_TARGET_ROOTFS_EXT2_FEATURES option
In-Reply-To: <20170703225106.1492-11-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-11-s.martin49@gmail.com>
Message-ID: <f1b8e835-eeb9-45a1-3092-904f98d4b404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 00:51, Samuel Martin wrote:
> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> This option lets the user specify ext2/3/4 features.

 Again, instead of a features option, I'd give a string option for additional
arguments.


> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v2->v3:
> - none
> 
> changes v1->v2:
> - rebase
> ---
>  fs/ext2/Config.in | 10 ++++++++++
>  fs/ext2/ext2.mk   |  5 ++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index 9850823e10..123a4ad6a6 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -89,6 +89,16 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
>  	  Traditionally, this has been 5%, and all ext-related tools still
>  	  default to reserving 5% when creating a nez ext filesystem.
>  
> +config BR2_TARGET_ROOTFS_EXT2_FEATURES
> +	string "Filesystem features"
> +	default "^64bit"

 The commit message should mention why it is a good idea to default to this.

 Regards,
 Arnout

> +	help
> +	  Specify a comma-separated list of ext2/3/4 features.
> +	  For more information about this option, see the mkefs' -O option in
> +	  the manual page mke2fs(8).
> +	  For more information about the features which can be set, see then
> +	  manual page ext4(5).
> +
>  choice
>  	prompt "Compression method"
>  	default BR2_TARGET_ROOTFS_EXT2_NONE
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index bc366bc689..ddf30ecd10 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -9,6 +9,8 @@ ifeq ($(EXT2_SIZE),)
>  $(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
>  endif
>  
> +EXT2_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_FEATURES))
> +
>  # qstrip results in stripping consecutive spaces into a single one. So the
>  # variable is not qstrip-ed to preserve the integrity of the string value.
>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
> @@ -20,7 +22,8 @@ EXT2_OPTS = \
>  	-b $(BR2_TARGET_ROOTFS_EXT2_BLOCK_SIZE) \
>  	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
>  	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
> -	-L "$(EXT2_LABEL)"
> +	-L "$(EXT2_LABEL)" \
> +	$(if $(EXT2_FEATURES),-O "$(EXT2_FEATURES)")
>  
>  ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
