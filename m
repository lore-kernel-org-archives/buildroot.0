From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 23:46:34 +0200
Subject: [Buildroot] [PATCH v5 1/1] Added linux drivers backports project
In-Reply-To: <1429477605-9329-1-git-send-email-petr.vorel@gmail.com>
References: <1429477605-9329-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <553573BA.7040805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 23:06, Petr Vorel wrote:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Still a few minor things below.

 BTW, it's often a good idea to put people who already reviewed your patch in Cc
(just add a Cc: line below the Sob, recent git format-patch will automatically
add the Cc to the mail).

> ---
> Changes v4->v5:
> * Added changes made by Thomas Petazzoni in Sun, 19 Apr 2015 11:03:26 +0200.
> 
> Changes v3->v4:
> * Define LINUX_BACKPORTS_MAKE_ENV instead of LINUX_BACKPORTS_MAKE_OPTS, remove TARGET_MAKE_ENV from it.
> * Add nconfig to LINUX_BACKPORTS_KCONFIG_EDITORS.
> * Clean formating of build commands.
> ---
>  package/Config.in                            |  1 +
>  package/linux-backports/Config.in            | 40 +++++++++++++++++++++
>  package/linux-backports/linux-backports.hash |  2 ++
>  package/linux-backports/linux-backports.mk   | 54 ++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+)
>  create mode 100644 package/linux-backports/Config.in
>  create mode 100644 package/linux-backports/linux-backports.hash
>  create mode 100644 package/linux-backports/linux-backports.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 319f01a..cdd946c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -365,6 +365,7 @@ endif
>  	source "package/iucode-tool/Config.in"
>  	source "package/kbd/Config.in"
>  	source "package/lcdproc/Config.in"
> +	source "package/linux-backports/Config.in"
>  	source "package/lirc-tools/Config.in"
>  	source "package/lm-sensors/Config.in"
>  	source "package/lshw/Config.in"
> diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
> new file mode 100644
> index 0000000..7853ba6
> --- /dev/null
> +++ b/package/linux-backports/Config.in
> @@ -0,0 +1,40 @@
> +comment "linux-backports needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS
> +	bool "linux-backports"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  The backports package includes many Linux drivers from recent
> +	  kernels, backported to older ones.

 In one of your earlier mails, you mentioned the kernel version dependencies.
These should be mentioned here. In this case, I think it is something like:

	  This version of linux-backports supports kernels starting from 3.0.

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

 Please wrap help text lines at 72 columns.

> +          in defconfigs/ directory in the backports tree.
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the backports configuration file
> +
> +endif
> diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
> new file mode 100644
> index 0000000..42ea0b3
> --- /dev/null
> +++ b/package/linux-backports/linux-backports.hash
> @@ -0,0 +1,2 @@
> +# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v3.18.1/sha256sums.asc
> +sha256 ff3d4d5192c4d57d7415dfcd60e02ea4fa21e0de224ae0ce2b5b9f2e9c815783  backports-3.18.1-1.tar.xz
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> new file mode 100644
> index 0000000..73179a6
> --- /dev/null
> +++ b/package/linux-backports/linux-backports.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# linux-backports
> +#
> +################################################################################
> +
> +LINUX_BACKPORTS_VERSION_MAJOR = 3.18.1
> +LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
> +LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
> +LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
> +LINUX_BACKPORTS_DEPENDENCIES = linux
> +
> +LINUX_BACKPORTS_MAKE_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \
> +	KLIB_BUILD=$(LINUX_DIR) \
> +	KLIB=$(TARGET_DIR)
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
> +else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +LINUX_BACKPORTS_KCONFIG_FILE = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
> +endif

 As mentioned in the v4 review, the following should be added:

# backports configure needs a configured kernel
$(LINUX_BACKPORTS_KCONFIG_FILE): linux


> +
> +define LINUX_BACKPORTS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
> +endef
> +
> +define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
> +		-C $(LINUX_DIR) M=$(@D) \
> +		INSTALL_MOD_DIR=backports \
> +		modules_install
> +endef
> +
> +LINUX_BACKPORTS_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
> +LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
> +
> +$(eval $(kconfig-package))
> +
> +# Checks to give errors that the user can understand
> +ifeq ($(filter source,$(MAKECMDGOALS)),)

 Thomas, is your series going to extend this with source-check and external-deps?

 Or let's just apply [1] and remove this entire block...


 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/459378/

> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
> +$(error No linux-backports defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
> +$(error No linux-backports configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
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
