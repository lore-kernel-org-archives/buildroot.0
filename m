From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Feb 2014 17:28:32 +0100
Subject: [Buildroot] [PATCH v3 1/1] add bootloader option for iso9660
 filesystem image (isolinux)
In-Reply-To: <1391289452-2658-1-git-send-email-jean.sorgemoel@laposte.net>
References: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
 <1391289452-2658-1-git-send-email-jean.sorgemoel@laposte.net>
Message-ID: <20140202172832.709d5395@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean,

Thanks a lot for working on this! Below are just a few comments, this
is not yet a full review.

On Sat,  1 Feb 2014 22:17:32 +0100, jean.sorgemoel at laposte.net wrote:

> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 50b4377..c82915c 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -2,17 +2,92 @@ config BR2_TARGET_ROOTFS_ISO9660
>  	bool "iso image"
>  	depends on (BR2_i386 || BR2_x86_64)
>  	depends on BR2_LINUX_KERNEL

You need to keep the "select BR2_TARGET_ROOTFS_CPIO" because it is
needed for both the Grub and Isolinux support. Both assume that the
root filesystem will be stored in $(BINARIES_DIR)/rootfs.cpio.

> +	help
> +	  Build a bootable iso9660 image
> +
> +choice
> +	prompt "Bootloader"
> +	default BR2_TARGET_ROOTFS_ISO9660_GRUB
> +	depends on BR2_TARGET_ROOTFS_ISO9660

Replace this dependency by enclosing the entire block of Config.in
options in a:

if BR2_TARGET_ROOTFS_ISO9660

...

endif

> +	help
> +	  Select bootloader for iso

We would like to have slightly better help texts, such as:

	  Select the bootloader that should be used for the bootable
	  ISO9660 image.

> +
> +config BR2_TARGET_ROOTFS_ISO9660_GRUB
> +	bool "grub"
>  	select BR2_TARGET_ROOTFS_CPIO
>  	select BR2_TARGET_GRUB
>  	select BR2_TARGET_GRUB_FS_ISO9660
>  	help
> -	  Build a bootable iso9660 image
> +	  Use bootloader Grub.

	  Use the Grub bootloader for the bootable ISO9660 image.

>  
> -config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
> +config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +	bool "isolinux"
> +#	select BR2_TARGET_ROOTFS_INITRAMFS
> +	select BR2_TARGET_ROOTFS_CPIO

As explained above, not needed, since it should be selected both the
Grub and Isolinux support.

> +	select BR2_TARGET_SYSLINUX
> +	select BR2_TARGET_SYSLINUX_ISOLINUX
> +	help
> +	  Use bootloader Isolinux (syslinux).

	  Use the Isolinux bootloader from the syslinux project as the
	  ISO9660 bootable image bootloader.

> +
> +endchoice
> +
> +if BR2_TARGET_ROOTFS_ISO9660_GRUB
> +
> +config BR2_TARGET_ROOTFS_ISO9660_GRUB_BOOT_MENU
>  	string "Boot menu.lst file"
> -	depends on BR2_TARGET_ROOTFS_ISO9660
>  	default "fs/iso9660/menu.lst"

There's a little problem here because you're renaming the
BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU option to
BR2_TARGET_ROOTFS_ISO9660_GRUB_BOOT_MENU. I think this is good for
consistency, but then you need to add some code in Config.in.legacy for
backward compatibility. See
http://git.buildroot.net/buildroot/tree/Config.in.legacy#n1.

>  
> +endif # BR2_TARGET_ROOTFS_ISO9660_GRUB
> +
> +if BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +
> +config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_BOOT_MESSAGE
> +	string "Boot message"
> +	default "fs/iso9660/bootmsg.txt"
> +	help
> +	  Filename is contain boot message

We want a slightly better help text here.

> +
> +config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_CONFIG_FILE
> +	string "Configuration file"
> +	default "fs/iso9660/isolinux.cfg"
> +	help
> +	  isolinux configuration file

Here as well.

> +
> +config BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_EXTRA_FILES
> +	string "Extra files copy on image"
> +	default ""
> +	help
> +	  list of file (binary or other) copy directly on iso
> +	  (separate by space, target directory 'extra')
> +	  ex. :
> +	    $(SYSLINUX_BUILDDIR)com32/hdt/hdt.c32

Why is this specific to the Isolinux case?

> +
> +endif # BR2_TARGET_ROOTFS_ISO9660_ISOLINUX
> +
> +config BR2_TARGET_ROOTFS_ISO9660_JOLIET
> +	bool "Create iso with Joliet format"
> +	help
> +	  Create iso image with Joliet format (long filenames)
> +
> +config BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE
> +	bool "Generate Rock Ridge directory information"
> +	help
> +	  Generate Rock Ridge directory information,
> +	  which includes file mode, uid, gid, etc...
> +
> +config BR2_TARGET_ROOTFS_ISO9660_NAME
> +	string "Volume label"
> +	default "buildroot"
> +	help
> +	  cdrom name
> +
> +config BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
> +	string "Define parameter input charset"
> +	default "iso8859-15"
> +	help
> +	  define parameter input charset
> +	  (see program genisoimage : genisoimage -input-charset help)

These are definitely interesting, but are not at all related to the
addition of Isolinux support. Could you split your patch into a series
of two patches: one adding these additional options, one adding the
Isolinux support?

Also, for each of these options, we can a slightly better help text.
Also, the short description should be more uniform. The option for
Joliet is "Create iso with Joliet format", while your second option is
"Generate Rock Ridge directory information". This is not very
consistent.

> +
>  comment "iso image needs a Linux kernel to be built"
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on !BR2_LINUX_KERNEL
> diff --git a/fs/iso9660/bootmsg.txt b/fs/iso9660/bootmsg.txt
> new file mode 100644
> index 0000000..e67951b
> --- /dev/null
> +++ b/fs/iso9660/bootmsg.txt
> @@ -0,0 +1,4 @@
> +Buildroot isolinux boot
> +  buildroot) launch linux
> +  harddrive) Hard Drive (first partition)
> +
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index a6a9c95..c39d244 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -8,8 +8,16 @@
>  ################################################################################
>  
>  ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
> -ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
> +ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_GRUB_BOOT_MENU))
> +ISO9660_TARGET_DIR_EXTRA = $(ISO9660_TARGET_DIR)/extra
> +QUOTE = "
> +ISO9660_LIST_EXTRA = $(subst $(QUOTE),,$(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_EXTRA_FILES))

We already have the qstrip function for that, so:

ISO9660_LIST_EXTRA = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_EXTRA_FILES))

>  
> +define copy_files_isolinux_image_extra
> +	cp $(1) $(ISO9660_TARGET_DIR_EXTRA);
> +endef

Why is this a separate function?

> +
> +# Build ISO9660 with bootloader Grub
>  $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
>  	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
>  	mkdir -p $(ISO9660_TARGET_DIR)
> @@ -31,8 +39,15 @@ endif
>  	rm -f $(FAKEROOT_SCRIPT)
>  	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
>  	# Use fakeroot so mkisofs believes the previous fakery
> -	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
> -		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
> +	echo "$(HOST_DIR)/usr/bin/genisoimage " \
> +		"$(GENISOIMAGE_OPTION) " \
> +		"-b boot/grub/stage2_eltorito " \
> +		"-no-emul-boot " \
> +		"-boot-load-size 4 " \
> +		"-boot-info-table " \
> +		"-input-charset $(BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET) " \
> +		"-V $(BR2_TARGET_ROOTFS_ISO9660_NAME) " \
> +		"-o $@ $(ISO9660_TARGET_DIR)" \
>  		>> $(FAKEROOT_SCRIPT)
>  	chmod a+x $(FAKEROOT_SCRIPT)
>  	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
> @@ -41,11 +56,65 @@ endif
>  
>  rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
>  
> +# Build ISO9660 with bootloader ISOLINUX
> +$(BINARIES_DIR)/rootfs.isolinux.iso9660: host-cdrkit host-fakeroot linux syslinux rootfs-cpio
> +	@$(call MESSAGE,"Generating root filesystem image rootfs.isolinux.iso9660")
> +	@mkdir -p $(ISO9660_TARGET_DIR)
> +	@mkdir -p $(ISO9660_TARGET_DIR_EXTRA)
> +
> +	@cp $(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_BOOT_MESSAGE) $(ISO9660_TARGET_DIR)
> +
> +	@cp $(BINARIES_DIR)/isolinux.bin $(ISO9660_TARGET_DIR)
> +	@cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)
> +	@cp $(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX_CONFIG_FILE) $(ISO9660_TARGET_DIR)/isolinux.cfg
> +
> +ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
> +	@$(SED) '/INITRD/d'  $(ISO9660_TARGET_DIR)/isolinux.cfg
> +else
> +	@cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
> +endif
> +
> +	@$(foreach file, $(ISO9660_LIST_EXTRA), $(call copy_files_isolinux_image_extra, $(file) ) )
> +
> +	# Use fakeroot to pretend all target binaries are owned by root
> +	rm -f $(FAKEROOT_SCRIPT)
> +	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> +	# Use fakeroot so mkisofs believes the previous fakery
> +	echo "$(HOST_DIR)/usr/bin/genisoimage " \
> +		"$(GENISOIMAGE_OPTION) " \
> +		"-b isolinux.bin " \
> +		"-no-emul-boot " \
> +		"-c boot.cat " \
> +		"-boot-load-size 4 " \
> +		"-boot-info-table " \
> +		"-input-charset $(BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET) " \
> +		"-V $(BR2_TARGET_ROOTFS_ISO9660_NAME) " \
> +		"-o $@ $(ISO9660_TARGET_DIR)" \
> +		>> $(FAKEROOT_SCRIPT)
> +	chmod a+x $(FAKEROOT_SCRIPT)
> +	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
> +	- at rm -f $(FAKEROOT_SCRIPT)
> +	- at rm -rf $(ISO9660_TARGET_DIR)

We really don't want to duplicate this between the Grub case and the
Isolinux case. They should be common, with just a variable that defines
the value to be passed to genisoimage -b option.

> +
> +rootfs-isolinux-iso9660: $(BINARIES_DIR)/rootfs.isolinux.iso9660
> +
>  ################################################################################
>  #
>  # Toplevel Makefile options
>  #
>  ################################################################################
> -ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB),y)
>  TARGETS += rootfs-iso9660
>  endif
> +
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
> +TARGETS += rootfs-isolinux-iso9660
> +endif

As explained above, there should be only one target for both.

> +
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_JOLIET),y)
> +GENISOIMAGE_OPTION += -J
> +endif
> +
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE),y)
> +GENISOIMAGE_OPTION += -R
> +endif

These should be *before* the rootfs-iso9660 target. Also, please name
the variable GENISOIMAGE_OPTS.

> diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
> new file mode 100644
> index 0000000..f4887e4
> --- /dev/null
> +++ b/fs/iso9660/isolinux.cfg
> @@ -0,0 +1,10 @@
> +display bootmsg.txt
> +default buildroot
> +timeout 20
> +prompt 1
> +LABEL buildroot
> +  KERNEL bzImage
> +  INITRD initrd
> +
> +LABEL harddrive
> +  LOCALBOOT 0x80

Again, thanks a lot for this work!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
