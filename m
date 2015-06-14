From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 16:52:25 +0200
Subject: [Buildroot] [PATCHv2 02/15] fs/iso9660: convert to the
 filesystem infrastructure
In-Reply-To: <1433802108-14351-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614145225.GD3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> This commit converts the iso9660 logic to the common rootfs
> infrastructure. What previously prevented it from being converted is
> that the iso9660 logic needed to remove a temporary folder after the
> image has been created.
> 
> However, since Buildroot typically keeps build artefacts around, this
> commit changes the logic to keep this temporary folder around. Thanks
> to this change, converting to the common rootfs infrastructure becomes
> possible.
> 
> In addition, the temporary folder is renamed from $(BUILD_DIR)/iso9660
> to the more descriptive $(BUILD_DIR)/rootfs-iso9660.tmp.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/iso9660/iso9660.mk | 68 +++++++++++++++++++++++----------------------------
>  1 file changed, 31 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index 4ccfce9..35b0fe5 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -2,59 +2,53 @@
>  #
>  # Build the iso96600 root filesystem image
>  #
> -# Cannot be converted to the ROOTFS_TARGET infrastructure, because of
> -# the temporary construction in ISO9660_TARGET_DIR.
> -#
>  ################################################################################
>  
> -ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
> +ISO9660_TARGET_DIR = $(BUILD_DIR)/rootfs-iso9660.tmp
>  ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
>  
>  ROOTFS_ISO9660_DEPENDENCIES = grub host-cdrkit host-fakeroot linux rootfs-cpio
>  
> -$(BINARIES_DIR)/rootfs.iso9660: $(ROOTFS_ISO9660_DEPENDENCIES)
> -	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
> -	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
> -		$(ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
> -	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_MENU) \
> -		$(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> -ifeq ($(BR2_TARGET_GRUB_SPLASH),)
> -	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> -else
> +ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
> +define ROOTFS_ISO9660_SPLASHSCREEN
>  	$(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
>  		$(ISO9660_TARGET_DIR)/splash.xpm.gz
> +endef
> +else
> +define ROOTFS_ISO9660_SPLASHSCREEN
> +	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +endef
>  endif
> -	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
> +
>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
> +define ROOTFS_ISO9660_INITRD
>  	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +endef
>  else
> +define ROOTFS_ISO9660_INITRD
>  	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
>  		$(ISO9660_TARGET_DIR)/initrd
> +endef
>  endif
> -	# Use fakeroot to pretend all target binaries are owned by root
> -	rm -f $(FAKEROOT_SCRIPT)
> -	echo "chown -h -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> -	# Use fakeroot so mkisofs believes the previous fakery
> -	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
> -		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
> -		>> $(FAKEROOT_SCRIPT)
> -	chmod a+x $(FAKEROOT_SCRIPT)
> -	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
> -	- at rm -f $(FAKEROOT_SCRIPT)
> -	- at rm -rf $(ISO9660_TARGET_DIR)
>  
> -rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
> +define ROOTFS_ISO9660_PREPARATION
> +	$(RM) -rf $(ISO9660_TARGET_DIR)
> +	mkdir -p $(ISO9660_TARGET_DIR)
> +	$(INSTALL) -D -m 0644 $(GRUB_DIR)/stage2/stage2_eltorito \
> +		$(ISO9660_TARGET_DIR)/boot/grub/stage2_eltorito
> +	$(INSTALL) -D -m 0644 $(ISO9660_BOOT_MENU) \
> +		$(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	$(INSTALL) -D -m 0644 $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
> +	$(ROOTFS_ISO9660_SPLASHSCREEN)
> +	$(ROOTFS_ISO9660_INITRD)
> +endef
>  
> -rootfs-iso9660-show-depends:
> -	@echo $(ROOTFS_ISO9660_DEPENDENCIES)
> +ROOTFS_ISO9660_PRE_GEN_HOOKS += ROOTFS_ISO9660_PREPARATION
>  
> -.PHONY: rootfs-iso9660 rootfs-iso9660-show-depends
> +define ROOTFS_ISO9660_CMD
> +	$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito \
> +		-no-emul-boot -boot-load-size 4 -boot-info-table \
> +		-o $@ $(ISO9660_TARGET_DIR)
> +endef
>  
> -################################################################################
> -#
> -# Toplevel Makefile options
> -#
> -################################################################################
> -ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
> -TARGETS_ROOTFS += rootfs-iso9660
> -endif
> +$(eval $(call ROOTFS_TARGET,iso9660))
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
