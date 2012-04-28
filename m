From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 18:17:14 +0200
Subject: [Buildroot] [PATCH] Microblaze: Improvements in the build system
In-Reply-To: <4F918C3D.2010105@relinux.de>
References: <4F918C3D.2010105@relinux.de>
Message-ID: <201204281817.16635.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 20 April 2012 18:18:05 Stephan Hoffmann wrote:
[snip]
> diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
> index 378e972..3bac1ea 100644
> --- a/configs/qemu_microblazebe_mmu_defconfig
> +++ b/configs/qemu_microblazebe_mmu_defconfig
> @@ -1,10 +1,4 @@
> -BR2_microblaze=y
>  BR2_microblazebe=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y

 I just noticed now: the definition of the Xilinx toolchain doesn't specify
that it includes C++ (BR2_INSTALL_LIBSTDCPP) or that it is a glibc toolchain.
These things should be select'ed by the 
BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2 config.

[snip]
> +config BR2_LINUX_KERNEL_SIMPLEIMAGE
> +	bool "simpleImage"
> +	help
> +	  simpleImage is the image format used for the
> +	  Microblaze softcore processor.
> +
> +	  The final image name depends on the
> +	  dts file name:
> +	    <name>.dts --> simpleImage.<name>
> +
 This one should depend on microblaze.

 It should also depend on BR2_LINUX_KERNEL_DTS_FILE being defined:
	depends on BR2_LINUX_KERNEL_DTS_FILE != ""

 However, if I understand correctly, the simpleImage is always
built for microblaze and it is the only image format available.
In that case, perhaps it's better to remove the option completely,
or to replace it with a hidden option:

config BR2_LINUX_KERNEL_SIMPLEIMAGE
	bool
	default y if BR2_microblaze

>  config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
>  	bool "custom target"
>  	help
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 16f9916..3e22f5e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -46,6 +46,18 @@ LINUX_MAKE_FLAGS = \
>  # going to be installed in the target filesystem.
>  LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease)
>  
> +# Copy the DTS file into the kernel's dts directory
> +# This is at least needed for Microblaze since the kernel build system links it into the kernel image
> +ifneq ($(BR2_LINUX_KERNEL_DTS_FILE),)
 This won't work.  If the definition is empty, it will be "" so the
condition is still true.  You have to strip it first.

> +  LINUX_KERNEL_CUSTOM_DTS = $(call qstrip, $(BR2_LINUX_KERNEL_DTS_FILE))
 It's more consistent if you use LINUX_KERNEL_DTS_FILE for the stripped
variable.

> +  DTS_NAME = $(shell export file=`basename $(LINUX_KERNEL_CUSTOM_DTS)` && echo $${file%.*})
 Avoid $(shell), especially if you can do it with make functions.  You
probably want

DTS_NAME = $(patsubst %.dts,%,$(notdir $(LINUX_KERNEL_CUSTOM_DTS)))

> +  define LINUX_COPY_DTS
> +    echo "LINUX_KERNEL_CUSTOM_DTS=$(LINUX_KERNEL_CUSTOM_DTS) and DTS_NAME=$(DTS_NAME)" && \
> +	mkdir -p $(KERNEL_ARCH_PATH)/boot/dts && \
> +	cp $(BR2_LINUX_KERNEL_DTS_FILE) $(KERNEL_ARCH_PATH)/boot/dts/ 
 There is no need to connect the commands with && here.  You can just
put them on individual lines.  If one of them fails, the build will be aborted.

 The echo is redundant if you ask me.  If you do put it, add a @ in front.

 Before copying, you should probably remove the target file first (in case
the already existing file is a symlink).

> +  endef
> +endif
> +
>  ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
>  LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
>  else
> @@ -57,6 +69,9 @@ else
>  LINUX_IMAGE_NAME=uImage
>  endif
>  LINUX_DEPENDENCIES+=host-uboot-tools
> +else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
> +LINUX_IMAGE_NAME=simpleImage.$(DTS_NAME)
> +LINUX_DEPENDENCIES+=host-uboot-tools
 Please put spaces around the assignments, even though the surrounding
code doesn't follow the standard.

>  else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
>  LINUX_IMAGE_NAME=bzImage
>  else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
> @@ -90,10 +105,15 @@ else
>  ifeq ($(KERNEL_ARCH),avr32)
>  LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX_IMAGE_NAME)
>  else
> +ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
> +LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).ub
> +else
>  LINUX_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
>  endif
> +endif
>  endif # BR2_LINUX_KERNEL_VMLINUX
>  
> +
>  define LINUX_DOWNLOAD_PATCHES
>  	$(if $(LINUX_PATCHES),
>  		@$(call MESSAGE,"Download additional patches"))
> @@ -117,17 +137,9 @@ endef
>  
>  LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
>  
> +# The microblaze build system always wants mkimage
>  ifeq ($(KERNEL_ARCH),microblaze)
> -# on microblaze, we always want mkimage
>  LINUX_DEPENDENCIES+=host-uboot-tools
 You already have this above in the BR2_LINUX_KERNEL_SIMPLEIMAGE
condition.  It makes much more sense there than it does here.

> -
> -define LINUX_COPY_DTS
> -    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
> -        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
> -    else \
> -        echo "Cannot copy dts file!" ; \
> -    fi
> -endef
>  endif
>  
>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
> @@ -143,8 +155,7 @@ define LINUX_CONFIGURE_CMDS
>  	$(if $(BR2_ARM_EABI),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
>  		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
> -    $(if $(BR2_microblaze),
> -        $(call LINUX_COPY_DTS))
> +        $(call LINUX_COPY_DTS)
 No need for a call here, just $(LINUX_COPY_DTS).  And check the
indentation (one tab).

>  	# As the kernel gets compiled before root filesystems are
>  	# built, we create a fake cpio file. It'll be
>  	# replaced later by the real cpio archive, and the kernel will be
> @@ -231,8 +242,6 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
>  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
>  	# Copy the kernel image to its final destination
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> -	# If there is a .ub file copy it to the final destination
> -	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
>  	$(Q)touch $@
>  
>  # The initramfs building code must make sure this target gets called
> 

 Even though I made a lot of comments here, it definitely looks like
an improvement!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
