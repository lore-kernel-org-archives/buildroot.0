From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2015 23:20:31 +0200
Subject: [Buildroot] [PATCH 05/12] fs/iso9660: rename all variables to
 use the ROOTFS_ISO9660 prefix
In-Reply-To: <1433430330-2166-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150605212031.GE3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-04 17:05 +0200, Thomas Petazzoni spake thusly:
> For consistency reasons, this commit renames all internal variables of
> iso9660.mk to use the ROOTFS_ISO9660 prefix.
> 
> While we're at it, replace a useless ':=' by '='.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/iso9660.mk | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 6a04fe6..0c7ef3b 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -4,39 +4,39 @@
>  #
>  ################################################################################
>  
> -ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
> -ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
> +ROOTFS_ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
> +ROOTFS_ISO9660_BOOT_MENU = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
>  
>  ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
>  
>  ifeq ($(BR2_TARGET_GRUB_SPLASH),)
>  define ROOTFS_ISO9660_SPLASHSCREEN
> -	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
>  endef
>  else
>  define ROOTFS_ISO9660_SPLASHSCREEN
>  	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
> -		$(ISO9660_TARGET_DIR)/splash.xpm.gz
> +		$(ROOTFS_ISO9660_TARGET_DIR)/splash.xpm.gz
>  endef
>  endif
>  
>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  define ROOTFS_ISO9660_INITRD
> -	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	$(SED) '/initrd/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
>  endef
>  else
>  define ROOTFS_ISO9660_INITRD
>  	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
> -		$(ISO9660_TARGET_DIR)/initrd
> +		$(ROOTFS_ISO9660_TARGET_DIR)/initrd
>  endef
>  endif
>  
>  define ROOTFS_ISO9660_PREPARATION
>  	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
> -		$(ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
> -	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_MENU) \
> -		$(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> -	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
> +		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
> +	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
> +		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ROOTFS_ISO9660_TARGET_DIR)/kernel
>  	$(ROOTFS_ISO9660_SPLASHSCREEN)
>  	$(ROOTFS_ISO9660_INITRD)
>  endef
> @@ -46,11 +46,11 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
>  define ROOTFS_ISO9660_CMD
>  	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
>  		-no-emul-boot -boot-load-size 4 -boot-info-table \
> -		-o $@ $(ISO9660_TARGET_DIR)
> +		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
>  endef
>  
>  define ROOTFS_ISO9660_REMOVE_TEMPDIR
> -	$(RM) -rf $(ISO9660_TARGET_DIR)
> +	$(RM) -rf $(ROOTFS_ISO9660_TARGET_DIR)
>  endef
>  
>  ROOTFS_ISO9660_POST_GEN_HOOKS += ROOTFS_ISO9660_REMOVE_TEMPDIR
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
