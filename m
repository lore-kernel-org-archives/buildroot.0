From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Apr 2015 22:29:47 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <1429134935-11241-2-git-send-email-petr.vorel@gmail.com>
References: <1429134935-11241-1-git-send-email-petr.vorel@gmail.com>
 <1429134935-11241-2-git-send-email-petr.vorel@gmail.com>
Message-ID: <55301BBB.4090705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/04/15 23:55, Petr Vorel wrote:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/Config.in                            |  1 +
>  package/linux-backports/Config.in            | 36 ++++++++++++++
>  package/linux-backports/linux-backports.hash |  2 +
>  package/linux-backports/linux-backports.mk   | 73 ++++++++++++++++++++++++++++
>  4 files changed, 112 insertions(+)
>  create mode 100644 package/linux-backports/Config.in
>  create mode 100644 package/linux-backports/linux-backports.hash
>  create mode 100644 package/linux-backports/linux-backports.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 34b6017..c8e24a7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -365,6 +365,7 @@ endif
>  	source "package/iucode-tool/Config.in"
>  	source "package/kbd/Config.in"
>  	source "package/lcdproc/Config.in"
> +	source "package/linux-backports/Config.in"

 I would say that this package fits better in the linux extensions menu. Even if
you just consider this package as a set of kernel modules, I think that from a
users perspective it fits better together with the kernel. But also, if you ever
want to add the possibility to link the backported drivers in the kernel itself
(which I believe is supported by backports), then you really need it to be a
kernel extension.

 The opinion of other developers may differ, though.


>  	source "package/lirc-tools/Config.in"
>  	source "package/lm-sensors/Config.in"
>  	source "package/lshw/Config.in"
> diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
> new file mode 100644
> index 0000000..c108b59
> --- /dev/null
> +++ b/package/linux-backports/Config.in
> @@ -0,0 +1,36 @@
> +config BR2_PACKAGE_LINUX_BACKPORTS
> +	bool "Linux kernel driver backports"

 This package should depend on BR2_LINUX_KERNEL, with the appropriate comment.
However, if it moves to the kernel extension then that's implicit.

> +	help
> +	  The backports package includes many Linux drivers from recent
> +	  kernels, backported to older ones.
> +
> +	  https://backports.wiki.kernel.org
> +
> +if BR2_PACKAGE_LINUX_BACKPORTS
> +
> +choice
> +	prompt "Linux kernel driver backports configuration"
> +	default BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> +	bool "Using a defconfig"
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
> +	bool "Using a custom config file"
> +
> +endchoice
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG
> +	string "Defconfig name"
> +	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> +	help
> +          Name of the backports defconfig file to use. The defconfig is located
> +          in defconfigs/ directory in the backports tree.
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the kernel configuration file

 s/kernel/backports/

> +
> +endif
> diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
> new file mode 100644
> index 0000000..6b8cb4f
> --- /dev/null
> +++ b/package/linux-backports/linux-backports.hash
> @@ -0,0 +1,2 @@
> +# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v3.19-rc1/sha256sums.asc
> +sha256 d782422d664b84128154fc5d0e9b8cd04bb208e53546d68856ad3f7f53f7de98  backports-3.19-rc1-1.tar.xz
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> new file mode 100644
> index 0000000..f49cd7d
> --- /dev/null
> +++ b/package/linux-backports/linux-backports.mk
> @@ -0,0 +1,73 @@
> +LINUX_BACKPORTS_VERSION  = 3.19-rc1

 We prefer "stable" versions rather than rc's.

> +LINUX_BACKPORTS_REVISION = 1
> +LINUX_BACKPORTS_SOURCE   = backports-$(LINUX_BACKPORTS_VERSION)-$(LINUX_BACKPORTS_REVISION).tar.xz
> +LINUX_BACKPORTS_SITE     = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION)
> +LINUX_BACKPORTS_DEPENDENCIES = linux

 If it's a kernel extension this will be implicit.

> +
> +LINUX_BACKPORTS_MAKE_FLAGS = \
> +	$(TARGET_MAKE_ENV) \
> +	$(LINUX_MAKE_FLAGS) \
> +	KLIB_BUILD=$(LINUX_DIR) \
> +	KLIB=$(TARGET_DIR)
> +
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +LINUX_BACKPORTS_SOURCE_CONFIG = $(@D)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
> +else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +LINUX_BACKPORTS_SOURCE_CONFIG = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
> +endif
> +
> +define LINUX_BACKPORTS_CONFIGURE_CMDS
> +	$(INSTALL) -m 0644 $(LINUX_BACKPORTS_SOURCE_CONFIG) $(@D)/.config
> +	$(LINUX_BACKPORTS_MAKE_FLAGS) $(MAKE) -C $(@D) olddefconfig

 LINUX_MAKE_FLAGS are normally passed as arguments to make. So I'd remove
TARGET_MAKE_ENV from LINUX_BACKPORTS_MAKE_FLAGS and turn the make commands into

	$(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_FLAGS) \
		...

 That said, we now have a kconfig package infrastructure and this package should
make use of it. Then these commands are no longer needed, but you do have to
define LINUX_BACKPORTS_KCONFIG_OPTS = LINUX_BACKPORTS_MAKE_FLAGS

> +endef
> +
> +define LINUX_BACKPORTS_BUILD_CMDS
> +	$(LINUX_BACKPORTS_MAKE_FLAGS) $(MAKE) -C $(@D)
> +endef
> +
> +define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
> +	$(LINUX_BACKPORTS_MAKE_FLAGS) $(MAKE) -C $(LINUX_DIR) M=$(@D) \
> +		INSTALL_MOD_DIR=backports \
> +		modules_install
> +endef
> +
> +$(eval $(generic-package))
> +

 Replace with $(kconfig-package), remove all the following and just set
LINUX_BACKPORTS_KCONFIG_EDITORS and LINUX_BACKPORTS_KCONFIG_FILE.

 Regards,
 Arnout


> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS),y)
> +linux-backports-menuconfig linux-backports-xconfig linux-backports-gconfig linux-backports-nconfig: linux-backports-configure
> +	$(MAKE) $(LINUX_BACKPORTS_MAKE_FLAGS) -C $(LINUX_BACKPORTS_DIR) \
> +		$(subst linux-backports-,,$@)
> +	rm -f $(LINUX_BACKPORTS_DIR)/.stamp_{built,target_installed,images_installed}
> +
> +linux-backports-savedefconfig: linux-backports-configure
> +	$(MAKE) $(LINUX_BACKPORTS_MAKE_FLAGS) -C $(LINUX_BACKPORTS_DIR) \
> +		$(subst linux-backports-,,$@)
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +linux-backports-update-config: linux-backports-configure $(LINUX_BACKPORTS_DIR)/.config
> +	cp -f $(LINUX_BACKPORTS_DIR)/.config $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
> +
> +linux-backports-update-defconfig: linux-backports-savedefconfig
> +	cp -f $(LINUX_BACKPORTS_DIR)/defconfig $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
> +else
> +linux-backports-update-config: ;
> +linux-backports-update-defconfig: ;
> +endif
> +endif
> +
> +# Checks to give errors that the user can understand
> +ifeq ($(filter source,$(MAKECMDGOALS)),)
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
> +$(error No kernel defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
> +$(error No kernel configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
> +endif
> +endif
> +
> +endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
