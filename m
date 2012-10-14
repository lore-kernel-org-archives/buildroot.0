From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 14 Oct 2012 20:37:11 +0200
Subject: [Buildroot] [PATCH 08/13] Store BR2_DEFCONFIG in .config,
 and use it to update the original input
In-Reply-To: <20121013231427.17317.48487.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231427.17317.48487.stgit@localhost>
Message-ID: <CAAXf6LWfKpM+d8JVopuujn-hhMTuapys2mst0n4eD8H3zM=J2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Oct 14, 2012 at 1:14 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> defconfig file after updating the configuration.

The patch title+description are awkwardly split.

>
> Also use $(PROJECT_DIR) by default.
>
> As a side-effect of this change, the *config options have been moved out
> of the BR2_HAVE_DOT_CONFIG condition.  Also, the defconfig and savedefconfig
> targets do need to include .config now, which makes them slightly slower.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in |   13 +++++++++++++
>  Makefile  |   22 +++++++++++++---------
>  2 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index 8cefcc6..4111409 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -29,6 +29,19 @@ config BR2_PROJECT_DIR
>           This option is used to set defaults for many other configuration
>           variables.  Each one of those can still be overridden individually.
>
> +config BR2_DEFCONFIG_FROM_ENV
> +       string
> +       option env="BR2_DEFCONFIG"
> +
> +config BR2_DEFCONFIG
> +       string "Location to save buildroot config"
> +       default "$(PROJECT_DIR)/buildroot.config" if BR2_PROJECT_DIR != ""
> +       default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
> +       default "defconfig"
> +       help
> +         When running 'make savedefconfig', the defconfig file will be saved
> +         in this location.
> +
>  menu "Build options"
>
>  menu "Commands"
> diff --git a/Makefile b/Makefile
> index d6136ed..cbaa0c4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -56,7 +56,7 @@ DATE:=$(shell date +%Y%m%d)
>  export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
>
>  noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
> -       defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
> +       %_defconfig allyesconfig allnoconfig silentoldconfig release \
>         randpackageconfig allyespackageconfig allnopackageconfig \
>         source-check print-version
>
> @@ -97,6 +97,7 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  endif
>
>  PROJECT_DIR = $(realpath $(call qstrip,$(BR2_PROJECT_DIR)))
> +DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
>
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
> @@ -545,6 +546,8 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>
>  all: menuconfig
>
> +endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> +
>  # configuration
>  # ---------------------------------------------------------------------------
>
> @@ -560,6 +563,7 @@ COMMON_CONFIG_ENV = \
>         KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
>         KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
>         BR2_PROJECT_DIR=$(PROJECT_DIR) \
> +       BR2_DEFCONFIG=$(DEFCONFIG) \
>         BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
>
>  xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
> @@ -626,24 +630,24 @@ silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>         @mkdir -p $(BUILD_DIR)/buildroot-config
>         $(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
>
> -defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> -       @mkdir -p $(BUILD_DIR)/buildroot-config
> -       @$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
> -
>  %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
>         @mkdir -p $(BUILD_DIR)/buildroot-config
>         @$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>
> +defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> +       @mkdir -p $(BUILD_DIR)/buildroot-config
> +       @$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
> +
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>         @mkdir -p $(BUILD_DIR)/buildroot-config
> -       @$(COMMON_CONFIG_ENV) $< --savedefconfig=$(CONFIG_DIR)/defconfig $(CONFIG_CONFIG_IN)
> +       @$(COMMON_CONFIG_ENV) $< \
> +               --savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
> +               $(CONFIG_CONFIG_IN)
>
>  # check if download URLs are outdated
>  source-check:
>         $(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
>
> -endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
> -
>  #############################################################
>  #
>  # Cleanup and misc junk
> @@ -757,5 +761,5 @@ print-version:
>
>  include docs/manual/manual.mk
>
> -.PHONY: $(noconfig_targets)
> +.PHONY: $(noconfig_targets) defconfig savedefconfig
>
>

Regardless of whether the PROJECT_DIR is accepted or not, I like some
of the patches of the set.
I have proposed a patch similar to this one in the past, so obviously
I'm in favor of this idea of being able to easily save also the
buildroot config directly in the right location.

For busybox, uclibc, etc. it was already possible in one step (make
update-busybox-config) while for buildroot .config it was in two
steps: make savedefconfig && mv defconfig configs/....

Best regards,
Thomas
