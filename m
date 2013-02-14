From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 14 Feb 2013 18:51:51 +0100
Subject: [Buildroot] [PATCH 2/2] Linux: save a copy of the config file
In-Reply-To: <1359303072-1947-2-git-send-email-sho@relinux.de>
References: <510550FA.10502@relinux.de>
 <1359303072-1947-2-git-send-email-sho@relinux.de>
Message-ID: <511D2437.3010403@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

since this patch is obsolete I removed it from patchwork.

Regards

Stephan

Am 27.01.2013 17:11, schrieb Stephan Hoffmann:
> "make linux-xconfig" stores the changes made in the build
> directory. Calling "make clean && make" later discards and
> replaces them with the default values. This is not what a
> user expects.
>
> This patch saves a copy of the modified config file as
> $(TOPDIR)/linux-config and retrieves it from there after
> "make clean". $(TOPDIR)/linux-config is removed when a new
> defconfig is made.
>
> For convenience we also copy the defconfig file to
> $(TOPDIR)/linux-defconfig after a "make linux-savedefconfig"
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  Makefile       |    2 ++
>  linux/linux.mk |   15 ++++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 95ed683..af820ce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -674,11 +674,13 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	rm -f $(TOPDIR)/busybox-config
> +	rm -f $(TOPDIR)/linux-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
>  
>  %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
>  	rm -f $(TOPDIR)/busybox-config
> +	rm -f $(TOPDIR)/linux-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>  
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 91a9f50..18609b5 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -155,8 +155,17 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
>  KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
>  endif
>  
> +# If we have a seved config file from a prevuios run we use this instead of the default one
> +define LINUX_GET_SAVED_CONFIG
> +	if [ -f $(TOPDIR)/linux-config ] ; then \
> +		cp $(TOPDIR)/linux-config $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig; \
> +	else \
> +		cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig; \
> +	fi
> +endef
> +
>  define LINUX_CONFIGURE_CMDS
> -	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> +	$(call LINUX_GET_SAVED_CONFIG)
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>  	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>  	$(if $(BR2_ARM_EABI),
> @@ -184,6 +193,7 @@ define LINUX_CONFIGURE_CMDS
>  	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>  	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
> +	cp $(@D)/.config $(TOPDIR)/linux-config
>  endef
>  
>  ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
> @@ -272,11 +282,14 @@ ifeq ($(BR2_LINUX_KERNEL),y)
>  linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
>  	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
>  		$(subst linux-,,$(subst linux26-,,$@))
> +	# copy the config file for later reference
> +	cp $(LINUX_DIR)/.config $(TOPDIR)/linux-config
>  	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
>  
>  linux-savedefconfig linux26-savedefconfig: dirs linux-configure
>  	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
>  		$(subst linux-,,$(subst linux26-,,$@))
> +	cp $(LINUX_DIR)/defconfig $(TOPDIR)/linux-defconfig
>  
>  ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
>  linux-update-config linux26-update-config: linux-configure $(LINUX_DIR)/.config


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
