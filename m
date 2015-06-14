From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 17:25:01 +0200
Subject: [Buildroot] [PATCHv2 09/15] fs/iso9660: introduce new variables
In-Reply-To: <1433802108-14351-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614152501.GG3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> In preparation to the introduction of the support for other
> bootloaders that Grub, this commit introduces two new variables:
> 
>  - ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH, which gives the full path to
>    the bootloader configuration file
> 
>  - ROOTFS_ISO9660_BOOT_IMAGE, which gives the relative path of the
>    main bootloader image, as needed by genisoimage's -b option.
> 
> There are no functional changes made, as the variables are for now
> always set to the same value.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/iso9660.mk | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 723fe94..2e695b0 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -44,13 +44,17 @@ else
>  ROOTFS_ISO9660_TARGET_DIR = $(TARGET_DIR)
>  endif
>  
> +ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
> +	$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/stage2_eltorito
> +
>  define ROOTFS_ISO9660_PREPARATION
>  	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
>  		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
>  	$(INSTALL) -D -m 0644 $(ROOTFS_ISO9660_BOOT_MENU) \
> -		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
>  	$(SED) "s%__KERNEL_PATH__%/boot/$(LINUX_IMAGE_NAME)%" \
> -		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
>  endef
>  
>  ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
> @@ -58,13 +62,13 @@ ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
>  # Splash screen disabling
>  ifeq ($(BR2_TARGET_GRUB_SPLASH),)
>  define ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
> -	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	$(SED) '/^splashimage/d' $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
>  endef
>  ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_DISABLE_SPLASHSCREEN
>  endif
>  
>  define ROOTFS_ISO9660_DISABLE_EXTERNAL_INITRD
> -	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	$(SED) '/__INITRD_PATH__/d'  $(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
>  endef
>  
>  ifeq ($(ROOTFS_ISO9660_USE_INITRD),YES)
> @@ -97,7 +101,7 @@ define ROOTFS_ISO9660_COPY_INITRD
>  	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
>  		$(ROOTFS_ISO9660_TARGET_DIR)/boot/initrd
>  	$(SED) "s%__INITRD_PATH__%/boot/initrd%" \
> -		$(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +		$(ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH)
>  endef
>  ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_COPY_INITRD
>  endif
> @@ -110,7 +114,7 @@ endif # ROOTFS_ISO9660_USE_INITRD
>  
>  
>  define ROOTFS_ISO9660_CMD
> -	$(HOST_DIR)/usr/bin/genisoimage -J -R -b boot/grub/stage2_eltorito \
> +	$(HOST_DIR)/usr/bin/genisoimage -J -R -b $(ROOTFS_ISO9660_BOOT_IMAGE) \
>  		-no-emul-boot -boot-load-size 4 -boot-info-table \
>  		-o $@ $(ROOTFS_ISO9660_TARGET_DIR)
>  endef
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
