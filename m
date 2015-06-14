From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 17:49:32 +0200
Subject: [Buildroot] [PATCHv2 13/15] fs/iso9660: add hybrid image support
In-Reply-To: <1433802108-14351-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614154932.GL3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> This commit adds a new option, which allows, when isolinux is used as
> the bootloader, to generate an "hybrid" ISO image. Such images can
> either be booted from CD-ROM or from USB keys. It simply uses the
> isohybrid tool provided by syslinux.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/Config.in  | 9 +++++++++
>  fs/iso9660/iso9660.mk | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 97925b9..6f057ea 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -58,6 +58,15 @@ config BR2_TARGET_ROOTFS_ISO9660_INITRD
>  	  contain a kernel image, an initrd image (unless an initramfs
>  	  linked into the kernel is used) and the bootloader.
>  
> +config BR2_TARGET_ROOTFS_ISO9660_HYBRID
> +	bool "Build hybrid image"
> +	depends on BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +	help
> +	  Enable this option to build an hybrid image, i.e an image
> +	  which can either be booted from a CD-ROM or from a device
> +	  which BIOS considers a hard disk or ZIP disk, e.g. a USB key
> +	  or similar.
> +
>  endif
>  
>  comment "iso image needs a Linux kernel and one of grub or isolinux to be built"
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 588e07b..4f4abea 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -140,4 +140,12 @@ define ROOTFS_ISO9660_CMD
>  		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
>  endef
>  
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
> +define ROOTFS_ISO9660_GEN_HYBRID
> +	$(HOST_DIR)/usr/bin/isohybrid -t 0x96 $@
> +endef
> +
> +ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_GEN_HYBRID
> +endif
> +
>  $(eval $(call ROOTFS_TARGET,iso9660))
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
