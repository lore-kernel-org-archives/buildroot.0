From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 23:10:55 +0100
Subject: [Buildroot] [PATCH 4/5] Microblaze: build kernel with device
 tree
In-Reply-To: <4F5CD7C9.40505@relinux.de>
References: <4F5CD7C9.40505@relinux.de>
Message-ID: <20120312231055.5ba3a3be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 11 Mar 2012 17:50:17 +0100,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> Device Tree and SimpleImage will be handled in buildroot in the
> future. Until then, this patch is needed.
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>

I am not yet familiar with how the device tree blob is generated, but I
don't like the fact that this patch is Microblaze specific. Other
architectures such as ARM or PowerPC have device tree support, and I
think the build procedure of the device tree blob is the same
regardless of the architecture.

> +config BR2_LINUX_KERNEL_DTS_FILE
> +    string "Device Tree dts file location"
> +    depends on BR2_microblaze

 or ARM or PowerPC

> +    help
> +      Path from where the dts file has to be copied
> +      The final "custom target" name depends on the
> +      dts file name:
> +          <name>.dts --> simpleImage.<name>

This option should allow to set either a dts file that is outside the
kernel tree, or a dts file that is inside the kernel tree. Or maybe we
need two different options.

> +ifeq ($(KERNEL_ARCH),microblaze)
> +# on microblaze, we always want mkimage
> +LINUX_DEPENDENCIES+=host-uboot-tools

Can't you create a new kernel image type (along
BR2_LINUX_KERNEL_UIMAGE, BR2_LINUX_KERNEL_BZIMAGE,
BR2_LINUX_KERNEL_ZIMAGE, etc.) which would add this dependency?


> +define LINUX_COPY_DTS
> +    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
> +        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
> +    else \
> +        echo "Cannot copy dts file!" ; \
> +    fi
> +endef
> +endif

The macro should probably bail out with an exit 1 if it fails. Also the
macro shouldn't be microblaze specific. Shouldn't we be calling the
Device Tree Compiler directly instead?

>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
> @@ -131,6 +143,8 @@ define LINUX_CONFIGURE_CMDS
>  	$(if $(BR2_ARM_EABI),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
>  		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
> +    $(if $(BR2_microblaze),
> +        $(call LINUX_COPY_DTS))

The if is not needed, the LINUX_COPY_DTS is already defined
conditionally.

>  	# As the kernel gets compiled before root filesystems are
>  	# built, we create a fake cpio file. It'll be
>  	# replaced later by the real cpio archive, and the kernel will be
> @@ -215,6 +229,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
>  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
>  	# Copy the kernel image to its final destination
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> +	# If there is a .ub file copy it to the final destination
> +	test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)

What is this .ub file?

In other words: I agree with the goal of support the device tree in the
kernel build process, but I'm not yet satisfied with this current
proposal. Can we try to improve this?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
