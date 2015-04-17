From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 21:35:49 +0200
Subject: [Buildroot] [PATCH 1/1] Added linux drivers backports project
In-Reply-To: <1429263629-13708-2-git-send-email-vorel@jablocom.com>
References: <1429263629-13708-1-git-send-email-vorel@jablocom.com>
 <1429263629-13708-2-git-send-email-vorel@jablocom.com>
Message-ID: <55316095.5090902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 11:40, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 In the future, please give your patch a version number (by giving the argument
-v3 or --subject-prefix='PATCH v3' to git send-email or format-patch). Also
include a changelog below your SoB, separated by --- (you can do this while
amending your commit).

[snip]

> +LINUX_BACKPORTS_MAKE_OPTS = \
> +	$(TARGET_MAKE_ENV) \

 This should be in LINUX_BACKPORTS_MAKE_ENV instead of _OPTS.

 Actually, kconfig-package should probably do a default assignment for
LINUX_BACKPORTS_MAKE_ENV, but since it doesn't you have to do it explicitly.

> +	$(LINUX_MAKE_FLAGS) \
> +	KLIB_BUILD=$(LINUX_DIR) \
> +	KLIB=$(TARGET_DIR)
> +
> +
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
> +LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
> +else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
> +LINUX_BACKPORTS_KCONFIG_FILE = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
> +endif
> +
> +define LINUX_BACKPORTS_BUILD_CMDS
> +	$(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
> +		-C $(@D)

 This would fit on a single line.

 However, ince below you're calling modules_install directly, would it be
possible/reasonable to do the build in the same way? It's always nice if the
different CMDS definitions look the same. So

	$(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
		-C $(LINUX_DIR) M=$(@D) \
		modules

 But if the backports build system does some extra magic (NOT kconfig stuff, but
other magic), then of course you shouldn't do this.

> +endef
> +
> +define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
> +	$(LINUX_BACKPORTS_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
> +		-C $(LINUX_DIR) M=$(@D) \
> +		INSTALL_MOD_DIR=backports \
> +		modules_install
> +endef
> +
> +LINUX_BACKPORTS_KCONFIG_EDITORS = menuconfig xconfig gconfig

 No nconfig? Not that it matters much...


 Regards,
 Arnout

> +LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
> +
> +$(eval $(kconfig-package))
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
