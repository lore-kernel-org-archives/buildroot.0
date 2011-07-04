From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 4 Jul 2011 23:52:26 +0200
Subject: [Buildroot] [PATCH 04/28] linux: use the defconfig mechanism
	after tuning the config
In-Reply-To: <d229ee1a851d8ad8123580893b7834260e4472a1.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <d229ee1a851d8ad8123580893b7834260e4472a1.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107042352.26931.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:21 Thomas Petazzoni wrote:
> Currently, the kernel configuration mechanism works as follows for
> custom configuration files:
[--SNIP--]
> Therefore, the configuration process when a configuration file is
> given is now the following one :
[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  linux/linux.mk |   40 ++++++++++++++++++++++++----------------
>  1 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2bb32cb..d142ab2 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -105,21 +105,28 @@ $(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
>  	done
>  	$(Q)touch $@
>  
> +# As we are tweaking the kernel configuration file, we want to run a
> +# silent oldconfig pass on the configuration file after having done
> +# our tweaks. The normal 'oldconfig' target prompts the user for new
> +# values that appeared, which hangs the build. Therefore, what we do
> +# is that we create a new defconfig file called buildroot_defconfig,
> +# which we tweak, and then use as the basis for the kernel
> +# configuration. This temporary defconfig file is removed right after.
> +KERNEL_DEFCONFIG_NAME = buildroot_defconfig
> +KERNEL_DEFCONFIG_PATH = $(KERNEL_ARCH_PATH)/configs/$(KERNEL_DEFCONFIG_NAME)
>  
>  # Configuration
>  $(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
>  	@$(call MESSAGE,"Configuring kernel")
>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
> -	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
> +	cp $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig $(KERNEL_DEFCONFIG_PATH)
>  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
> -	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> -	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) buildroot_defconfig
> -	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> +	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(KERNEL_DEFCONFIG_PATH)
>  endif
>  ifeq ($(BR2_ARM_EABI),y)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(KERNEL_DEFCONFIG_PATH))
>  else
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config)
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(KERNEL_DEFCONFIG_PATH))
>  endif
>  ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  	# As the kernel gets compiled before root filesystems are
> @@ -127,21 +134,22 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
>  	# replaced later by the real list, and the kernel will be
>  	# rebuilt using the linux26-rebuild-with-initramfs target.
>  	touch $(BINARIES_DIR)/rootfs.initramfs
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
> -	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(@D)/.config)
> -	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(@D)/.config)
> -	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(@D)/.config)
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(KERNEL_DEFCONFIG_PATH))
> +	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.initramfs\",$(KERNEL_DEFCONFIG_PATH))
> +	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0,$(KERNEL_DEFCONFIG_PATH))
> +	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0,$(KERNEL_DEFCONFIG_PATH))
> +	$(call KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(KERNEL_DEFCONFIG_PATH))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(KERNEL_DEFCONFIG_PATH))
>  endif
>  ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(KERNEL_DEFCONFIG_PATH))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(KERNEL_DEFCONFIG_PATH))
>  endif
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> -	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config)
> +	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(KERNEL_DEFCONFIG_PATH))
>  endif
> -	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
> +	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(KERNEL_DEFCONFIG_NAME)
> +	rm $(KERNEL_DEFCONFIG_PATH)
>  	$(Q)touch $@
>  
>  # Compilation. We make sure the kernel gets rebuilt when the
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
