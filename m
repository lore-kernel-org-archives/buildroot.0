From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 28 Mar 2016 20:26:34 +0200
Subject: [Buildroot] [PATCH 7/9 v2] fs/common: get rid of post-target
 rules
In-Reply-To: <8b80b3acbc1970ef45892b662e6c2bf1dc407d0b.1457721607.git.yann.morin.1998@free.fr>
References: <cover.1457721607.git.yann.morin.1998@free.fr>
 <8b80b3acbc1970ef45892b662e6c2bf1dc407d0b.1457721607.git.yann.morin.1998@free.fr>
Message-ID: <56F9775A.1050103@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 11/03/2016 19:41, Yann E. MORIN a ?crit :
> The only users of post-target rules were ext2, cpio and initramfs.
> 
> Of those, ext2 and cpio were changed to use post-gen hooks, while
> initramfs was not even using the generic rootfs infra and was fixed
> to no longer reference post-target rules.
> 
> Besides, the comment in the infra was really misleading: it referenced
> initramfs implying it was the sole user of that feature, even though
> initramfs was not using the fs infra.
> 
> Furthermore, using post-target rules was inherently broken for top-level
> parallel builds, because filesystems had to ensure the ordering by
> themselves. Of the two real users of post-target rules (cpio and ext2),
> one did enforce rules ordering (apparently correctly), while the other
> forgot to do so.
> 
> We can get rid of post-target rules altogether, now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  fs/common.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 3a424f6..0b8163c 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -19,10 +19,6 @@
>  #  ROOTFS_$(FSTYPE)_POST_GEN_HOOKS, a list of hooks to call after
>  #  generating the filesystem image
>  #
> -#  ROOTFS_$(FSTYPE)_POST_TARGETS, the list of targets that should be
> -#  run after running the main filesystem target. This is useful for
> -#  initramfs, to rebuild the kernel once the initramfs is generated.
> -#
>  # In terms of configuration option, this macro assumes that the
>  # BR2_TARGET_ROOTFS_$(FSTYPE) config option allows to enable/disable
>  # the generation of a filesystem image of a particular type. If
> @@ -104,7 +100,7 @@ endif
>  rootfs-$(1)-show-depends:
>  	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
>  
> -rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
> +rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  
>  .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
>  
> 
