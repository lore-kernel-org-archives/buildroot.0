From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:19:18 +0200
Subject: [Buildroot] [PATCH v3 1/1] mender-grubenv: new package
In-Reply-To: <20190606155215.117770-1-aduskett@gmail.com>
References: <20190606155215.117770-1-aduskett@gmail.com>
Message-ID: <113835ea-8fec-8c49-2aeb-59affea06301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/06/2019 17:52, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Mender-grubenv contains the boot scripts and tools used by Mender to
> integrate with the Grub2 bootloader.
> 
> The user must select the following Grub modules for this package:
> loadenv, hashsum, echo, halt, gcry_sha256, and test.
> 
> Because this patch also includes a grub version of fw_printenv and fw_setenv,
> package/mender/Config.in must be changed as well at the same time, because if
> both uboot-tools and this package are selected, during startup, mender calls
> the uboot-tools version of fw_printenv and fails to start.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

[snip]
> diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
> new file mode 100644
> index 0000000000..7d5f7f0861
> --- /dev/null
> +++ b/package/mender-grubenv/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_MENDER_GRUBENV
> +	bool "mender-grubenv"
> +	depends on BR2_PACKAGE_MENDER # runtime
> +	# grubenv provides it's own fw_printenv.
> +	depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
> +	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS

 Architecture dependencies (i.e., the ones that should not be mentioned in a
comment, and are not package dependencies) should come first. I'm sure that's
documented somewhere :-P

> +	depends on BR2_TARGET_GRUB2

 This is also a runtime dependency.

> +	help
> +	  Contains the boot scripts and tools used by Mender to
> +	  integrate with the GRUB bootloader.
> +
> +	  The following Grub modules must be selected for this package:
> +	  loadenv hashsum echo halt gcry_sha256 test
> +
> +	  https://github.com/mendersoftware/grub-mender-grubenv
> +
> +if BR2_PACKAGE_MENDER_GRUBENV
> +
> +config BR2_PACKAGE_MENDER_GRUBENV_DEFINES
> +	string "path to grubenv defines"
> +	help
> +	  Specify a path to the mender grubenv defines file.
> +	  If no path is specified, the example file in the source
> +	  directory will be used.
> +
> +	  The example file in the source directory sets the following:
> +	  mender_rootfsa_part=2
> +	  mender_rootfsb_part=3
> +	  mender_kernel_root_base=/dev/mmcblk0p
> +	  mender_grub_storage_device=hd0
> +	  kernel_imagetype=bzImage
> +
> +endif
> +
> +comment "mender-grubenv needs a grub2 bootloader and a toolchain w/ wchar"
> +	depends on BR2_PACKAGE_MENDER
> +	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
> +	depends on !BR2_TARGET_GRUB2 || !BR2_USE_WCHAR

 wchar is not in the dependencies above. I guess this was inherited from
selecting grub2 instead of depending on it at some point. I just removed it. And
I checked in the package itself - there doesn't seem anything that directly
depends on wchar.

> +
> +comment "mender-grubenv does not work with uboot-tools fw_printenv"
> +	depends on BR2_PACKAGE_MENDER

 The architecture dependency should be repeated here. Otherwise, the user may
see this comment, remove fwprintenv, come back and mender-grubenv has just
disappeared.

> +	depends on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
> diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
> new file mode 100644
> index 0000000000..1b1eaa758a
> --- /dev/null
> +++ b/package/mender-grubenv/mender-grubenv.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 e50cc18a844e3fd1edef7af9224733b0338a34d51f1186ee19803ef7af1a5065 mender-grubenv-1.3.0.tar.gz
> +sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
> diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
> new file mode 100644
> index 0000000000..e5724d7855
> --- /dev/null
> +++ b/package/mender-grubenv/mender-grubenv.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# mender-grubenv
> +#
> +################################################################################
> +
> +MENDER_GRUBENV_VERSION = 1.3.0
> +MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
> +MENDER_GRUBENV_LICENSE = Apache-2.0
> +MENDER_GRUBENV_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
> +MENDER_GRUBENV_ENV_DIR = /boot/grub
> +else
> +MENDER_GRUBENV_ENV_DIR = /boot/efi/EFI/BOOT
> +endif
> +
> +MENDER_GRUBENV_MAKE_ENV = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(TARGET_MAKE_ENV) \
> +	ENV_DIR=$(MENDER_GRUBENV_ENV_DIR)
> +
> +MENDER_GRUBENV_DEFINES = \
> +	$(or $(call qstrip,$(BR2_PACKAGE_MENDER_GRUBENV_DEFINES)),\
> +		$(@D)/mender_grubenv_defines.example)
> +
> +# These grub modules must be built in for the grub scripts to work properly.
> +# Without them, the system will not boot.
> +MENDER_GRUBENV_MANDATORY_MODULES=loadenv hashsum echo halt gcry_sha256 test
> +MENDER_GRUBENV_MODULES_MISSING = \
> +	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES)),\
> +		$(MENDER_GRUBENV_MANDATORY_MODULES))
> +
> +ifeq ($(BR2_PACKAGE_MENDER_GRUBENV),y)

 This lacks a check on $(BR_BUILDING). I don't remember what exactly it is
needed for, but it is needed for sure :-)

> +ifneq ($(MENDER_GRUBENV_MODULES_MISSING),)
> +$(error The following missing grub2 modules must be enabled for mender-grubenv \
> +	to work: $(MENDER_GRUBENV_MODULES_MISSING))
> +endif
> +endif
> +
> +define MENDER_GRUBENV_CONFIGURE_CMDS
> +	cp -dpfr  $(MENDER_GRUBENV_DEFINES) $(@D)/mender_grubenv_defines

 This is just a single file, so a recursive copy seems a bit strange. Also, I
don't think we want -p at all. So I replaced this with $(INSTALL) -m 0644.

> +endef
> +
> +define MENDER_GRUBENV_BUILD_CMDS
> +	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define MENDER_GRUBENV_INSTALL_TARGET_CMDS
> +	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index db1a5caa43..5cb3a3f2e0 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -4,8 +4,8 @@ config BR2_PACKAGE_MENDER
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_XZ
> -	select BR2_PACKAGE_UBOOT_TOOLS # runtime
> -	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
> +	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
> +	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime

 I believe that mender needs *a* fw_printenv. So, if the boot loader is U-Boot,
it needs uboot-tools, and if the boot loader is grub2, it needs mender-grubenv.

 The problem is that we may be building U-Boot outside of Buildroot. Therefore,
BR2_TARGET_UBOOT is not a sufficient condition to know if we're using U-Boot or
grub.

 I don't think there's a good solution for that, so I left this as is. But if
you come up with something, feel free to suggest it.

 I've applied with all the changes mentioned above, thanks.

 Regards,
 Arnout
>  	help
>  	  Mender is an open source over-the-air (OTA) software updater
>  	  for embedded Linux devices. Mender comprises a client
> 
