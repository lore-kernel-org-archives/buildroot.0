From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 01:02:19 +0100
Subject: [Buildroot] [PATCH 1/1] mender-grubenv: new package
In-Reply-To: <20190319190145.52354-1-aduskett@gmail.com>
References: <20190319190145.52354-1-aduskett@gmail.com>
Message-ID: <009dbf6f-e82f-17c0-54a1-679a5c3eed30@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/03/2019 20:01, aduskett at gmail.com wrote:
[snip]
> +config BR2_PACKAGE_MENDER_GRUBENV
> +	bool "mender-grubenv"
> +	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # grub2

 These two are already handled by the dependency on grub2.

> +	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS

 Why?

 A dependency on mender itself might make sense as well.

> +	depends on BR2_TARGET_GRUB2
> +	help
> +	  Contains the boot scripts and tools used by Mender to
> +	  integrate with the GRUB bootloader.
> +
> +	  The following Grub modules must be selected for this package:
> +	  loadenv hashsum echo halt gcry_sha256 test

 Do they have to be built-in? We install all grub modules, but there is a
limited list of builtin options (the ones that are needed to be able to find the
rest of the modules).

> +
> +	  https://github.com/mendersoftware/grub-mender-grubenv
> +
> +if BR2_PACKAGE_MENDER_GRUBENV
> +
> +config BR2_PACKAGE_MENDER_GRUBENV_DEFINES
> +	string "path to grubenv defines"
> +	default package/mender-grubenv/mender_grubenv_defines
> +	help
> +	  Specify a path to the mender grubenv defines file.
> +	  The example file sets the following:
> +	  mender_rootfsa_part=2
> +	  mender_rootfsb_part=3
> +	  mender_kernel_root_base=/dev/vda

 That's a bit an unfortunate choice for the default, since it is very unlikely
to be correct. I think in practice /dev/mmcblk0p would be a more sensible
default. Indeed, that doesn't work in qemu, but it will work on most systems
that really use mender.

> +	  mender_grub_storage_device=hd0
> +	  kernel_imagetype=bzImage
> +
> +	  WARNING:
> +	  Using the default mender_grubenv_defines file may cause your
> +	  system to not boot properly, as it has only been tested on
> +	  QEMU based systems!
> +
> +endif
> +
> +comment "mender-grubenv needs a grub2 bootloader and a toolchain w/ wchar"
> +	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> +	depends on !BR2_USE_WCHAR
> diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
> new file mode 100644
> index 0000000000..b74286d1b8
> --- /dev/null
> +++ b/package/mender-grubenv/mender-grubenv.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 e50cc18a844e3fd1edef7af9224733b0338a34d51f1186ee19803ef7af1a5065 1.3.0.tar.gz
> +sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
> diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
> new file mode 100644
> index 0000000000..fecd49d05f
> --- /dev/null
> +++ b/package/mender-grubenv/mender-grubenv.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# mender-grubenv
> +#
> +################################################################################
> +
> +MENDER_GRUBENV_VERSION = 1.3.0
> +MENDER_GRUBENV_SITE = https://github.com/mendersoftware/grub-mender-grubenv/archive

 It's not an uploaded tarball so please use the github helper.

> +MENDER_GRUBENV_SOURCE = $(MENDER_GRUBENV_VERSION).tar.gz
> +MENDER_GRUBENV_LICENSE = Apache2.0
> +MENDER_GRUBENV_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
> +MENDER_GRUBENV_ENV_DIR = /boot/grub
> +else
> +MENDER_GRUBENV_ENV_DIR = /boot/efi/EFI/BOOT

 This assumes that the efi partition will be mounted on /boot/efi. Will that be
the case?

 It would be nice if this condition would be handled somehow from grub2.mk
itself, but I'm not sure if that would be useful in practice.

> +endif
> +
> +# These grub modules must be built for the grub scripts to work properly.
> +# Without them, the system will not boot.
> +MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test
> +MENDER_GRUBENV_MODULES_MISSING = \
> +	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
> +		$(MENDER_GRUBENV_MANDATORY_MODULES))

 If they really need to be built in, it's great to have this check.

> +
> +ifeq ($(BR2_PACKAGE_MENDER_GRUBENV),y)
> +ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
> +$(error The following grub2 modules must be enabled for mender-grubenv to \
> +	work: $(MENDER_GRUBENV_MANDATORY_MODULES))

 Would be more relevant to report the missing modules here.

> +endif
> +endif
> +
> +define MENDER_GRUBENV_BUILD_CMDS
> +	cp -dpfr $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV_DEFINES)) \
> +		$(@D)/mender_grubenv_defines

 Small nit: this part seems more appropriate for the configure step.

> +	$(TARGET_MAKE_ENV) ENV_DIR=$(MENDER_GRUBENV_ENV_DIR) $(MAKE) -C $(@D)

 Small nit: since the same env is used again in the install step, it's better to
define a variable for it:

MENDER_GRUBENV_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	ENV_DIR=$(MENDER_GRUBENV_ENV_DIR)

 Also, I'd expect that TARGET_CONFIGURE_OPTS needs to be added to the
environment. Hm, it actually doesn't build anything so it's not strictly needed.
But it's a good habit :-)

> +endef
> +
> +define MENDER_GRUBENV_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) ENV_DIR=$(MENDER_GRUBENV_ENV_DIR) $(MAKE) \
> +		DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/mender-grubenv/mender_grubenv_defines b/package/mender-grubenv/mender_grubenv_defines
> new file mode 100644
> index 0000000000..6cc4d5c92e
> --- /dev/null
> +++ b/package/mender-grubenv/mender_grubenv_defines
> @@ -0,0 +1,32 @@
> +################################################################################
> +# Mandatory
> +################################################################################
> +# Warning: This file is an example and should be customized to fit your needs!
> +
> +# Partition index of root filesystem A
> +mender_rootfsa_part=2
> +
> +# Partition index of root filesystem B
> +mender_rootfsb_part=3
> +
> +# Device file corresponding to the root filesystem partitions, without index.
> +mender_kernel_root_base=/dev/vda
> +
> +# Name of the storage device containing root filesystem partitions in GRUB
> +# format.
> +mender_grub_storage_device=hd0
> +
> +# Type of kernel (bzImage or zImage)
> +kernel_imagetype=bzImage
> +
> +# Type of initrd image.
> +# Note: An initrd image is not strictly necessary, and the system will boot and
> +#       update without a initrd image.
> +initrd_imagetype=initrd.img
> +
> +################################################################################
> +# Mandatory on ARM
> +################################################################################
> +
> +# Basename of DTB that should be loaded by the bootloader.
> +# kernel_devicetree=kernel.dtb

 AFAICS, this is just a copy of the example, with the vda change and the
kernel.dtb commented out.

 I don't think this is such a great idea...

 I think it makes more sense to not provide our own, but instead copy the
example if BR2_PACKAGE_MENDER_GRUBENV_DEFINES is empty.


 Also, it might make sense to automatically update some of the values while
copying. E.g. the kernel_imagetype can be derived from LINUX_IMAGE_NAME (but
only if a kernel is actually built). But that would anyway be for a follow-up patch.

> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 5ab2304e49..a1b96656db 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -3,8 +3,9 @@ config BR2_PACKAGE_MENDER
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_UBOOT_TOOLS # runtime
> -	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
> +	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
> +	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime

 This is a bit meh, because uboot is not necessarily built as part of Buildroot.
But yeah, in that case the user can still select uboot tools manually.

 This change really should be a separate patch though.

 Regards,
 Arnout

> +	select BR2_PACKAGE_MENDER_GRUBENV if BR2_TARGET_GRUB2 # runtime
>  	help
>  	  Mender is an open source over-the-air (OTA) software updater
>  	  for embedded Linux devices. Mender comprises a client
> 
