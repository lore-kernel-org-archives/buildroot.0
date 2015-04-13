From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 21:37:07 +0200
Subject: [Buildroot] [PATCHv2 02/21] fs: declare phony targets as such
In-Reply-To: <1428856685-4403-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413193707.GB29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> This commit improves the filesystem handling code to declare its
> various targets as PHONY when appropriate.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Just a commnet, below...

> diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
> index 308924d..db50812 100644
> --- a/fs/initramfs/initramfs.mk
> +++ b/fs/initramfs/initramfs.mk
> @@ -17,6 +17,8 @@ rootfs-initramfs: $(ROOTFS_INITRAMFS_DEPENDENCIES) $(ROOTFS_INITRAMFS_POST_TARGE
>  rootfs-initramfs-show-depends:
>  	@echo $(ROOTFS_INITRAMFS_DEPENDENCIES)
>  
> +.PHONY: rootfs-initramfs rootfs-initramfs-show-depends

This made me think of the trick we use to force a kernel rebuild with
this newly-created initramfs.

We're using a post-fs target to force the kerbnel rebuild:
    ROOTFS_INITRAMFS_POST_TARGETS += linux-rebuild-with-initramfs

But this rule is not PHONY, and your series does not make it PHONY.
This could be done in a fallow-up patch, and is not a blocker.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  TARGETS_ROOTFS += rootfs-initramfs
>  endif
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 5b44ba4..4ccfce9 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -48,6 +48,8 @@ rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
>  rootfs-iso9660-show-depends:
>  	@echo $(ROOTFS_ISO9660_DEPENDENCIES)
>  
> +.PHONY: rootfs-iso9660 rootfs-iso9660-show-depends
> +
>  ################################################################################
>  #
>  # Toplevel Makefile options
> -- 
> 2.1.0
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
