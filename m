From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 00:17:15 +0100
Subject: [Buildroot] [v3,
	1/4] barebox: prepare for secondary config build
In-Reply-To: <1453329821-3167-2-git-send-email-pieter@boesman.nl>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-2-git-send-email-pieter@boesman.nl>
Message-ID: <56D0DCFB.8060601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/16 23:43, Pieter Smith wrote:
> No functional changes, but prepares barebox for building with two
> configurations (similar to package/gcc).
> 
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>  boot/barebox/Config.in                | 71 +++++++++++++++++++-----------
>  boot/barebox/barebox-1/barebox-1.hash |  1 +
>  boot/barebox/barebox-1/barebox-1.mk   | 81 +++++++++++++++++++++++++++++++++++
>  boot/barebox/barebox.mk               | 61 +-------------------------
>  4 files changed, 129 insertions(+), 85 deletions(-)
>  create mode 120000 boot/barebox/barebox-1/barebox-1.hash
>  create mode 100644 boot/barebox/barebox-1/barebox-1.mk
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 39cb5d2..ed120af 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -64,9 +64,52 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
>  
>  endif
>  
[snip]
>  
>  choice
> -	prompt "Barebox configuration"
> +	prompt "Number of Barebox configurations"
> +	default BR2_TARGET_BAREBOX_SINGLE_CONFIG
> +
> +config BR2_TARGET_BAREBOX_ONE_CONFIG
> +	select BR2_TARGET_BAREBOX_1
> +	bool "Build 1 config"
> +	help
> +	  Build only one barebox config.
> +	  Useful for building the traditional TPL (Tertiary Program
> +	  Loader).
> +
> +endchoice

 There is no need for this choice. You always need barebox-1 anyway. So you can
actually keep the Config.in as it is, and add the second barebox configuration
at the end.

> +
> +config BR2_TARGET_BAREBOX_1
> +	bool "Barebox configuration 1"
> +	default y
> +
> +if BR2_TARGET_BAREBOX_1
> +
> +choice
> +	prompt "Type of configuration"
>  	default BR2_TARGET_BAREBOX_USE_DEFCONFIG
>  
>  config BR2_TARGET_BAREBOX_USE_DEFCONFIG
> @@ -78,7 +121,7 @@ config BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
>  endchoice
>  
>  config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
> -	string "board defconfig"
> +	string "Board defconfig"

 Why change the capitalisation? Should be a separate patch.

>  	depends on BR2_TARGET_BAREBOX_USE_DEFCONFIG
>  	help
>  	  Name of the board for which Barebox should be built, without
> @@ -97,28 +140,6 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
>  	  A space-separated list of configuration fragment files,
>  	  that will be merged to the main Barebox configuration file.
>  
[snip]
> diff --git a/boot/barebox/barebox-1/barebox-1.mk b/boot/barebox/barebox-1/barebox-1.mk
> new file mode 100644
> index 0000000..3374ece
> --- /dev/null
> +++ b/boot/barebox/barebox-1/barebox-1.mk
> @@ -0,0 +1,81 @@
> +################################################################################
> +#
> +# barebox-1
> +#
> +################################################################################
> +
> +BAREBOX_1_VERSION = $(BAREBOX_VERSION)
> +BAREBOX_1_SITE = $(BAREBOX_SITE)
> +BAREBOX_1_SITE_METHOD = $(BAREBOX_SITE_METHOD)
> +BAREBOX_1_SOURCE = $(BAREBOX_SOURCE)
> +BAREBOX_1_DEPENDENCIES = $(BAREBOX_DEPENDENCIES)
> +BAREBOX_1_LICENSE = $(BAREBOX_LICENSE)
> +BAREBOX_1_LICENSE_FILES = $(BAREBOX_LICENSE_FILES)
> +BAREBOX_1_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
> +BAREBOX_1_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
> +BAREBOX_1_MAKE_ENV = $(BAREBOX_MAKE_ENV)

 MAKE_FLAGS and MAKE_ENV are only used in the commands below, so no need to
define a barebox-1 version.

> +BAREBOX_1_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)

 This is just YES, it's a bit silly to add an extra variable for that.

> +
> +ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
> +BAREBOX_1_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
> +else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
> +BAREBOX_1_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
> +endif
> +
> +BAREBOX_1_KCONFIG_FRAGMENT_FILES = $(BAREBOX_KCONFIG_FRAGMENT_FILES)
> +BAREBOX_1_KCONFIG_EDITORS = $(BAREBOX_KCONFIG_EDITORS)
> +BAREBOX_1_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
> +
> +ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
> +define BAREBOX_1_BUILD_BAREBOXENV_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
> +		$(@D)/scripts/bareboxenv.c
> +endef
> +endif
> +
> +ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
> +BAREBOX_1_ENV_NAME = $(notdir $(call qstrip,\
> +	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
> +define BAREBOX_1_BUILD_CUSTOM_ENV
> +	$(@D)/scripts/bareboxenv -s \
> +		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
> +		$(@D)/$(BAREBOX_1_ENV_NAME)
> +endef
> +define BAREBOX_1_INSTALL_CUSTOM_ENV
> +	cp $(@D)/$(BAREBOX_1_ENV_NAME) $(BINARIES_DIR)
> +endef
> +endif
> +
> +define BAREBOX_1_BUILD_CMDS
> +	$(BAREBOX_1_BUILD_BAREBOXENV_CMDS)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_1_MAKE_FLAGS) -C $(@D)
> +	$(BAREBOX_1_BUILD_CUSTOM_ENV)
> +endef

 BAREBOX_1_BUILD_CMDS and BAREBOX_2_BUILD_CMDS are very similar. You can
refactor them as follows (I think):

define BAREBOX_BUILD_CMDS
	$($(PKG)_BUILD_BAREBOXENV_CMDS)
	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
	$($(PKG)_BUILD_CUSTOM_ENV)
endef
BAREBOX_1_BUILD_CMDS = $(BAREBOX_BUILD_CMDS)
BAREBOX_2_BUILD_CMDS = $(BAREBOX_BUILD_CMDS)

 Since BAREBOX_2_BUILD_BAREBOXENV_CMDS isn't defined, that line will just
disappear, leaving just the make command for barebox-2.

 Same for the others below.

 Note that introducing the $(PKG) bits should be a separate patch, not together
with the move to barebox-1.

> +
> +define BAREBOX_1_INSTALL_IMAGES_CMDS
> +	if test -h $(@D)/barebox-flash-image ; then \
> +		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
> +	else \
> +		cp $(@D)/barebox.bin $(BINARIES_DIR);\
> +	fi
> +	$(BAREBOX_1_INSTALL_CUSTOM_ENV)
> +endef
> +
> +ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
> +define BAREBOX_1_INSTALL_TARGET_CMDS
> +	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
> +endef
> +endif
> +
> +# Checks to give errors that the user can understand
> +# Must be before we call to kconfig-package
> +ifeq ($(BR2_TARGET_BAREBOX_2)$(BR_BUILDING),yy)

 BAREBOX_1 here.

> +# We must use the user-supplied kconfig value, because
> +# BAREBOX_1_KCONFIG_DEFCONFIG will at least contain the
> +# trailing _defconfig
> +ifeq ($(or $(BAREBOX_1_KCONFIG_FILE),$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
> +$(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
> +endif
> +endif
> +
> +$(eval $(kconfig-package))

 I wonder if it wouldn't be possible to keep barebox.mk unchanged, and just add
at the end (after the kconfig-package):

include boot/barebox/barebox-2/barebox-2.mk

 That's not entirely similar to gcc, but it's more consistent with what it
means. You always have the barebox package, and you have an optional extra
barebox-2 package which is a kind of submodule of barebox. Note however that we
currently don't have this pattern at all, so it could be controversial. But I
think it will simplify the patch a lot, and also simplify the logic.

 So in that case, you'd have a first patch that adds the required refactorings
in barebox.mk so the same variables are useable for barebox-2, and a second
patch that adds barebox-2 (and patches 3 and 4 stay the same of course).


 This is complicated stuff, thanks for working on this, and sorry that it's
taking so long!

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
