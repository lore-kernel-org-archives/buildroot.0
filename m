From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 14 Feb 2013 18:53:08 +0100
Subject: [Buildroot] [PATCH 1/2] Busybox: save a copy of the config file
In-Reply-To: <1359303072-1947-1-git-send-email-sho@relinux.de>
References: <510550FA.10502@relinux.de>
 <1359303072-1947-1-git-send-email-sho@relinux.de>
Message-ID: <511D2484.6080309@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

since this patch is obsolete I set it to Rejected on patchwork.

Regards

Stephan

Am 27.01.2013 17:11, schrieb Stephan Hoffmann:
> "make busybox-xconfig" stores the changes made in the build
> directory. Calling "make clean && make" later discards and
> replaces them with the default values. This is not what a
> user expects.
>
> This patch saves a copy of the modified config file as
> $(TOPDIR)/busybox-config and retrieves it from there after
> "make clean". $(TOPDIR)/busybox-config is removed when a new
> defconfig is made.
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  Makefile                   |    2 ++
>  package/busybox/busybox.mk |   20 ++++++++++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6f8ed0e..95ed683 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -673,10 +673,12 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  
>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
> +	rm -f $(TOPDIR)/busybox-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
>  
>  %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
>  	@mkdir -p $(BUILD_DIR)/buildroot-config
> +	rm -f $(TOPDIR)/busybox-config
>  	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>  
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 9154c08..b81a4f5 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -33,6 +33,9 @@ BUSYBOX_CFLAGS_busybox += -ltirpc
>  endif
>  
>  BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
> +# Place to save configuration when "make clean" is issued
> +BUSYBOX_CONFIG_SAVE = $(TOPDIR)/busybox-config
> +
>  # Allows the build system to tweak CFLAGS
>  BUSYBOX_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
> @@ -47,8 +50,9 @@ BUSYBOX_MAKE_OPTS = \
>  	CONFIG_PREFIX="$(TARGET_DIR)" \
>  	SKIP_STRIP=y
>  
> +# Name the local variable different from environment to be able to distinguish later
>  ifndef BUSYBOX_CONFIG_FILE
> -	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
> +	LOCAL_BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
>  endif
>  
>  define BUSYBOX_PERMISSIONS
> @@ -126,9 +130,19 @@ define BUSYBOX_NETKITTELNET
>  endef
>  endif
>  
> +ifndef BUSYBOX_CONFIG_FILE
> +# Keep a local copy of the config file to preserve changes over "make clean"
> +define BUSYBOX_COPY_CONFIG
> +	test ! -f $(BUSYBOX_CONFIG_SAVE) && \
> +		cp -f $(LOCAL_BUSYBOX_CONFIG_FILE) $(BUSYBOX_CONFIG_SAVE); \
> +	cp -f $(BUSYBOX_CONFIG_SAVE) $(BUSYBOX_BUILD_CONFIG)
> +endef
> +else
> +# When the environmant variable is present we always want to use this config file
>  define BUSYBOX_COPY_CONFIG
>  	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
>  endef
> +endif
>  
>  # Disable shadow passwords support if unsupported by the C library
>  ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
> @@ -220,8 +234,10 @@ $(eval $(generic-package))
>  busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
>  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
>  		$(subst busybox-,,$@)
> +	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_SAVE)
>  	rm -f $(BUSYBOX_DIR)/.stamp_built
>  	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
>  
>  busybox-update-config:
> -	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
> +	cp -f $(BUSYBOX_BUILD_CONFIG) $(LOCAL_BUSYBOX_CONFIG_FILE)
> +


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
