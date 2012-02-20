From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Feb 2012 10:45:42 +0100
Subject: [Buildroot] [PATCH v2] Add Device Tree and simpleImage support
In-Reply-To: <1329684060-20751-1-git-send-email-Spenser309@gmail.com>
References: <1329684060-20751-1-git-send-email-Spenser309@gmail.com>
Message-ID: <201202201045.42247.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 19 February 2012 21:41:00 Spenser Gilliland wrote:
> This patch adds device tree and simpleImage support to buildroot.  When the simpleImage Kernel binary image type is selected, the user has can select either an in tree device tree source file or an out of tree device tree source file.
> 
> This triggers the kernel to build the simpleImage.<dt> target and copy the resulting binary to the output/images directory.  Additionally, if the install dtb option is selected the <dt>.dtb file is copied to the output directory.

 Please wrap the commit message at 80 columns.

 The simpleImage support should be split off from the DTS support in a 
separate patch.

> Signed-off-by: Spenser Gilliland <Spenser309@gmail.com>
[snip]
> +#
> +# Device Tree Support
> +#
> +
> +choice 
> +	prompt "Device Tree Blob"
> +	default BR2_LINUX_KERNEL_USE_DTS
> +	depends on BR2_LINUX_KERNEL_SIMPLEIMAGE 

 DTS is available for (almost) all architectures, so I don't think we
needs a depends here.  Certainly not on simpleImage.

> +
> +config BR2_LINUX_KERNEL_USE_DTS
> +	bool "Use an in kernel device tree"
> +
> +config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> +	bool "Use a custom device tree"
> +
> +endchoice
> +
> +config BR2_LINUX_KERNEL_MAKE_DTB
> +	bool
> +	default y if BR2_LINUX_KERNEL_USE_DTS || BR2_LINUX_KERNEL_USE_CUSTOM_DTS	
> +
> +config BR2_LINUX_KERNEL_INSTALL_DTS
> +	bool "Copy device tree blob to the output directory"
> +	depends on BR2_LINUX_KERNEL_MAKE_DTB
> +	help
> +	  This copies the device tree blob to the images
> +	  directory.

 I don't think this is necessary; the dtb is pretty small so you can just
copy it to the images directory unconditionally.

 If you do keep this config, call it INSTALL_DTB and fix the description
to 'to the images directory'.

> +
> +config BR2_LINUX_KERNEL_DTS
> +	string "Dts Name"
> +	depends on BR2_LINUX_KERNEL_USE_DTS
> +	help
> +	  Name of device tree source file in tree to use
> +	  without the trailing .dts

 Maybe point out where it can be found: arch/<arch>/boot/dts/

> +
> +config BR2_LINUX_KERNEL_CUSTOM_DTS
> +	string "Dts file path"
> +	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS 
> +	help
> +	  Path to the custom dts file.
> +
> +
>  config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
>  	string "Kernel image target name"
>  	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
> diff --git a/linux/linux.mk b/linux/linux.mk
> index ae236d4..1fb4ece 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -67,6 +67,9 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
>  LINUX_IMAGE_NAME=vmlinux
>  else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
>  LINUX_IMAGE_NAME=vmlinuz
> +else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
> +# Image name is set once the dts is known

 If you move the DTS stuff before these conditions, then you don't
need a special case for simpleImage here.

> +LINUX_DEPENDENCIES+=host-uboot-tools
>  endif
>  endif
>  
> @@ -118,6 +121,35 @@ endef
>  LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
>  
>  
> +ifneq ($(BR2_LINUX_KERNEL_CUSTOM_DTS),)
> +LINUX_KERNEL_CUSTOM_DTS = $(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_DTS))
> +DTS_NAME = $(shell export file=`basename $(LINUX_KERNEL_CUSTOM_DTS)` && echo $${file%.*})

 Doesn't this work?
DTS_NAME = $(patsubst %.dts,%,$(notdir $(LINUX_KERNEL_CUSTOM_DTS)))

> +define LINUX_COPY_DTS
> +   echo "LINUX_KERNEL_CUSTOM_DTS=$(LINUX_KERNEL_CUSTOM_DTS) and DTS_NAME=$(DTS_NAME)" && \

 I guess this line was there for debugging and is redundant now?

> +	mkdir -p $(KERNEL_ARCH_PATH)/boot/dts && \
> +	cp $(BR2_LINUX_KERNEL_CUSTOM_DTS) $(KERNEL_ARCH_PATH)/boot/dts/ 
> +endef
> +endif
> +
> +ifeq ($(BR2_LINUX_KERNEL_USE_DTS),y)
> +DTS_NAME = $(call qstrip, $(BR2_LINUX_KERNEL_DTS))
> +endif
> +
> +ifeq ($(BR2_LINUX_KERNEL_MAKE_DTB),y)
> +define LINUX_MAKE_DTB
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) scripts/dtc/ && \

 Is that correct?  Shouldn't that be scripts/dtc/dtc ?

 Also, there's no reason to use && to connect the steps here: make 
implicitly terminates command execution if any command fails.

> +    scripts/dtc/dtc -O dtb -o $(KERNEL_ARCH_PATH)/boot/$(DTS_NAME).dtb \
 There's something wrong with the indentation here.

> +      -b 0 -p 1024 $(KERNEL_ARCH_PATH)/boot/dts/$(DTS_NAME).dts
> +endef
> +define LINUX_INSTALL_DTB
> +	cp $(KERNEL_ARCH_PATH)/boot/$(DTS_NAME).dtb $(BINARIES_DIR)
> +endef
> +endif
> +
> +ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
> +LINUX_IMAGE_NAME = simpleImage.$(DTS_NAME)
> +endif
> +
>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
> @@ -125,6 +157,8 @@ KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
>  endif
>  
>  define LINUX_CONFIGURE_CMDS
> +	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> +		$(call LINUX_COPY_DTS))
 Why is this a $(call)?  You're not passing any parameters...  Also, the
$(if) is redundant since LINUX_COPY_DTS will just be empty if it's not 
true.

>  	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>  	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> @@ -158,17 +192,22 @@ define LINUX_BUILD_CMDS
>  	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
>  		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
>  	fi
> +	$(if $(BR2_LINUX_KERNEL_MAKE_DTB),
> +		$(call LINUX_MAKE_DTB))

 Same here.

>  endef
>  
>  
>  ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
>  define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
>  	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
> +
 No need to add an empty line here.
>  endef
>  endif
>  
>  define LINUX_INSTALL_IMAGES_CMDS
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> +	$(if $(BR2_LINUX_KERNEL_INSTALL_DTB),
> +		$(call LINUX_INSTALL_DTB))

 Again redundant $(if) and $(call).

>  endef
>  
>  define LINUX_INSTALL_TARGET_CMDS
> @@ -215,6 +254,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
>  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
>  	# Copy the kernel image to its final destination
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> +	# If there is a .ub file copy it to the final destination
> +	test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)

 Maybe add a comment here explaining with a .ub file is.

 Is this only relevant for initramfs builds?

>  	$(Q)touch $@
>  
>  # The initramfs building code must make sure this target gets called
> 


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
