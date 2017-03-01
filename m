From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Mar 2017 21:21:10 +0100
Subject: [Buildroot] [PATCH] fs/iso9660: doesn't support (grub2) EFI
In-Reply-To: <20170301200542.19418-1-arnout@mind.be>
References: <73760f82-95af-ba23-7f23-3e2e79136ca4@mind.be>
 <20170301200542.19418-1-arnout@mind.be>
Message-ID: <20170301202110.GF3578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-03-01 21:05 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The iso9660 generation for grub2 assumes that grub-eltorito.img is
> available. However, this image is only available for the i386-pc target
> (i.e. legacy BIOS). An EFI-bootable iso9660 requires a different layout.
> 
> Since we currently can't generate the EFI-bootable iso9660 layout,
> require the i386-pc target to be selected in grub.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: arnaud.miche at orange.com

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 2482e44e31..d162586f38 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -3,7 +3,7 @@ config BR2_TARGET_ROOTFS_ISO9660
>  	depends on (BR2_i386 || BR2_x86_64)
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_TARGET_GRUB || \
> -		BR2_TARGET_GRUB2 || \
> +		BR2_TARGET_GRUB2_I386_PC || \
>  		BR2_TARGET_SYSLINUX_ISOLINUX
>  	select BR2_LINUX_KERNEL_INSTALL_TARGET \
>  	       if (!BR2_TARGET_ROOTFS_ISO9660_INITRD && !BR2_TARGET_ROOTFS_INITRAMFS)
> @@ -33,7 +33,7 @@ config BR2_TARGET_ROOTFS_ISO9660_GRUB
>  
>  config BR2_TARGET_ROOTFS_ISO9660_GRUB2
>  	bool "grub2"
> -	depends on BR2_TARGET_GRUB2
> +	depends on BR2_TARGET_GRUB2_I386_PC
>  	help
>  	  Use Grub 2 as the bootloader for the ISO9660 image. Make
>  	  sure to enable the 'iso9660' module in
> @@ -82,7 +82,7 @@ config BR2_TARGET_ROOTFS_ISO9660_HYBRID
>  
>  endif
>  
> -comment "iso image needs a Linux kernel and one of grub, grub2 or isolinux to be built"
> +comment "iso image needs a Linux kernel and one of grub, grub2 i386-pc or isolinux to be built"
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on !BR2_LINUX_KERNEL || \
> -		!(BR2_TARGET_GRUB || BR2_TARGET_GRUB2 || BR2_TARGET_SYSLINUX_ISOLINUX)
> +		!(BR2_TARGET_GRUB || BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_SYSLINUX_ISOLINUX)
> -- 
> 2.11.0
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
