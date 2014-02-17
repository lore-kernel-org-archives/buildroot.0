From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 07:47:40 +0100
Subject: [Buildroot] [PATCH v4 1/2] add option for iso9660 filesystem
 image
In-Reply-To: <1391557760-22893-1-git-send-email-jean.sorgemoel@laposte.net>
References: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
 <1391557760-22893-1-git-send-email-jean.sorgemoel@laposte.net>
Message-ID: <5301B08C.5010307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jean,

 Thanks for your update! Sorry for the late response, the 2014.02 release
is keeping us busy...

 Your patch looks pretty good, even though I still have many (rather
small) comments.

On 05/02/14 00:49, jean.sorgemoel at laposte.net wrote:
> From: jean <jean.sorgemoel@laposte.net>
> 
> detail : (module fs/iso9660)
>   option to copy file(s) on iso
>   option to create iso with long filenames (Joliet format)
>   option to create iso with POSIX file system (file mode, uid, gid, ...)
>   define volume label
>   define parameter input charset (for genisoimage)
> 
> Signed-off-by: jean <jean.sorgemoel@laposte.net>

 Please use your full name for Signed-off-by. Remember that Signed-off-by
is a legal statement, so using anything other than your full real name is
pointless.

 In follow-up patches, please include a patch changelog, separated by ---
from the commit message itself. Alternatively, you can include the
changelog in a cover letter.

> ---
>  fs/iso9660/Config.in  |   46 ++++++++++++++++++++++++++++++++++++-
>  fs/iso9660/iso9660.mk |   61 +++++++++++++++++++++++++++++++++++++------------
>  2 files changed, 92 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
> index 50b4377..9faa93f 100644
> --- a/fs/iso9660/Config.in
> +++ b/fs/iso9660/Config.in
> @@ -8,10 +8,54 @@ config BR2_TARGET_ROOTFS_ISO9660
>  	help
>  	  Build a bootable iso9660 image
>  
> +if BR2_TARGET_ROOTFS_ISO9660
> +
>  config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
>  	string "Boot menu.lst file"
> -	depends on BR2_TARGET_ROOTFS_ISO9660
>  	default "fs/iso9660/menu.lst"
> +	help
> +	  Grub configuration
> +	  Define menu, commands and options for grub
> +
> +config BR2_TARGET_ROOTFS_ISO9660_EXTRA_FILES
> +	string "Extra files copy on image"
> +	default ""
> +	help
> +	  list of file (binary or other) copy directly on iso
> +	  (separate by space, target directory 'extra')
> +	  ex. :
> +	    $(SYSLINUX_BUILDDIR)com32/hdt/hdt.c32
> +	    $(SYSLINUX_BUILDDIR)com32/modules/reboot.c32

 Why limit this to files only, and why would you put it in the 'extra'
directory? Better to use the approach of BR2_ROOTFS_OVERLAY. You can also
reuse its help text:

"""
  Specify a list of directories that are copied over the iso9660
  filesystem, next to the kernel and initrd images.

  They are copied as-is into the iso9660 filesystem, excluding files
  ending with ~ and .git, .svn and .hg directories.
"""

 The prompt would then be "iso9660 filesystem overlay directories".

> +
> +config BR2_TARGET_ROOTFS_ISO9660_JOLIET
> +	bool "Create iso with Joliet format (long filenames)"
> +	help
> +	  Generate iso image with Joliet directory records.
> +	  Use Unicode and each path component can be up 64
> +	  Unicode characters long.
> +
> +config BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE
> +	bool "Create iso with Rock Ridge extensions (POSIX Filesystem)"

 Filesystem -> filesystem

> +	default y

 Why default this to y? It was not y before and it's not needed for the
default kernel+initrd layout.

> +	help
> +	  Generate iso image with Rock Ridge directory information,
> +	  POSIX file system (file mode, uid, gid, ...)

 ... directory information, which makes it a POSIX filesystem...

> +
> +config BR2_TARGET_ROOTFS_ISO9660_NAME
> +	string "Volume label"
> +	default "buildroot"

 I think this should default to empty, like it was before.

> +	help
> +	  cdrom name
> +
> +config BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
> +	string "Define parameter input charset (genisoimage)"
> +	default "iso8859-15"
> +	help
> +	  Defines the local character set you are using on your
> +	  machine.
> +	  (see program genisoimage : genisoimage -input-charset help)

 This description and its default don't seem appropriate to me.

	string "Input filename character encoding"
	default "utf8"
	help
	  The character encoding with which the names of the files that
	  will be copied into the iso9660 filesystem are encoded. For the
	  RockRidge directory, the same encoding will be used. For the
	  Joliet directory, it will be converted to UTF-16.

 However, I wonder how useful this option is. Why would you put files
with non-ASCII characters in the name into the iso9660 filesystem? Also,
does this make sense at all unless either RockRidge or Joliet is used?

> +
> +endif # BR2_TARGET_ROOTFS_ISO9660
>  
>  comment "iso image needs a Linux kernel to be built"
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
> index a6a9c95..2f20f5b 100644
> --- a/fs/iso9660/iso9660.mk
> +++ b/fs/iso9660/iso9660.mk
> @@ -9,32 +9,57 @@
>  
>  ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
>  ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))

 Since you define BOOTLOADER_SRC_CFG below, this variable has become
redundant.

> +ISO9660_TARGET_DIR_EXTRA = $(ISO9660_TARGET_DIR)/extra

 As I said, I don't see a reason to keep the extra/

> +ISO9660_LIST_EXTRA = $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_EXTRA_FILES))
> +
> +BOOTLOADER_BIN = $(GRUB_DIR)/stage2/stage2_eltorito
> +BOOTLOADER_DIR = $(ISO9660_TARGET_DIR)/boot/grub/
> +BOOTLOADER_SRC_CFG = $(ISO9660_BOOT_MENU)
> +BOOTLOADER_DST_CFG = $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +KERNEL_DST = $(ISO9660_TARGET_DIR)/kernel
> +ELTORITO_BOOT = boot/grub/stage2_eltorito

 All these variables should get an ISO9660_ prefix.

>  
>  $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
>  	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
> -	mkdir -p $(ISO9660_TARGET_DIR)
> -	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
> -	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
> -	cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	@mkdir -p $(ISO9660_TARGET_DIR)
> +	@mkdir -p $(BOOTLOADER_DIR)
> +	@mkdir -p $(ISO9660_TARGET_DIR_EXTRA)
> +
> +	@cp $(BOOTLOADER_BIN) $(BOOTLOADER_DIR)
> +	@cp $(BOOTLOADER_SRC_CFG) $(BOOTLOADER_DST_CFG)
> +	@cp $(LINUX_IMAGE_PATH) $(KERNEL_DST)
> +
>  ifeq ($(BR2_TARGET_GRUB_SPLASH),)
> -	$(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	@$(SED) '/^splashimage/d' $(BOOTLOADER_DST_CFG)
>  else
> -	cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
> -endif
> -	cp $(LINUX_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel
> +	@cp boot/grub/splash.xpm.gz $(ISO9660_TARGET_DIR)/
> +endif # BR2_TARGET_GRUB_SPLASH
> +
>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
> -	$(SED) '/initrd/d'  $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> +	@$(SED) '/initrd/d'  $(BOOTLOADER_DST_CFG)
>  else
> -	cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) $(ISO9660_TARGET_DIR)/initrd
> -endif
> +	@cp $(BINARIES_DIR)/rootfs.cpio$(ROOTFS_CPIO_COMPRESS_EXT) \
> +		$(ISO9660_TARGET_DIR)/initrd
> +endif # BR2_TARGET_ROOTFS_INITRAMFS
> +
> +	@$(foreach file, $(ISO9660_LIST_EXTRA), \
> +		cp $(file) $(ISO9660_TARGET_DIR_EXTRA)/ ; )

 This should use rsync:

        @$(foreach d, $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_EXTRA)),\
                $(call MESSAGE,"Copying overlay $(d)"); \
                rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
                        --chmod=Du+w --exclude .empty --exclude '*~' \
                        $(d)/ $(ISO9660_TARGET_DIR)$(sep))

> +
>  	# Use fakeroot to pretend all target binaries are owned by root
>  	rm -f $(FAKEROOT_SCRIPT)
>  	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
>  	# Use fakeroot so mkisofs believes the previous fakery
> -	echo "$(HOST_DIR)/usr/bin/genisoimage -R -b boot/grub/stage2_eltorito -no-emul-boot " \
> -		"-boot-load-size 4 -boot-info-table -o $@ $(ISO9660_TARGET_DIR)" \
> +	echo "$(HOST_DIR)/usr/bin/genisoimage " \
> +		"$(GENISOIMAGE_OPTS) " \
> +		"-b $(ELTORITO_BOOT) " \
> +		"-no-emul-boot " \
> +		"-boot-load-size 4 " \
> +		"-boot-info-table " \
> +		"-input-charset $(BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET) " \
> +		"-V $(BR2_TARGET_ROOTFS_ISO9660_NAME) " \

 You need to qstrip the variable.


 Regards,
 Arnout

> +		"-o $@ $(ISO9660_TARGET_DIR)" \
>  		>> $(FAKEROOT_SCRIPT)
> -	chmod a+x $(FAKEROOT_SCRIPT)
> +	@chmod a+x $(FAKEROOT_SCRIPT)
>  	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
>  	- at rm -f $(FAKEROOT_SCRIPT)
>  	- at rm -rf $(ISO9660_TARGET_DIR)
> @@ -49,3 +74,11 @@ rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
>  ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
>  TARGETS += rootfs-iso9660
>  endif
> +
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_JOLIET),y)
> +GENISOIMAGE_OPTS += -J
> +endif
> +
> +ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE),y)
> +GENISOIMAGE_OPTS += -R
> +endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
