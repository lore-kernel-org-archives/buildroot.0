From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Sep 2013 23:04:13 +0200
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52322C4D.4060202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Thomas,

  It's funny how people can change their mind...

  I've put Tzu-Jung Lee in CC, who wrote something similar a while ago.

On 08/09/13 15:15, Thomas Petazzoni wrote:
> This commit adds support for an environment variable named
> BR2_EXTERNAL, which the user can point to a directory outside of
> Buildroot that contains root filesystem overlays, kernel configuration
> files, package recipes, defconfigs, etc. It allows users to keep their
> specific Buildroot customizations outside of the Buildroot tree.
>
> BR2_EXTERNAL allows:

  I would split this into three separate patches for the three separate 
features. I think (1) and (3) are a lot less controversial than (2).

>
>   (1) To use $(BR2_EXTERNAL) in all Buildroot configuration options
>       that take a path as argument. This allows to reference a root
>       filesystem overlay, a kernel configuration file, a Barebox
>       configuration file located in the BR2_EXTERNAL directory.

  Note to list: this was already possible before, of course, the 
difference is that now this path will be stored in the .config.

  There is one small issue with this: I don't think that all the use 
cases support relative paths. Ideally, the Makefile should be smart 
enough to prepend $(TOPDIR) if it doesn't start with a /.


>   (2) To store external package or makefile logic, since the
>       BR2_EXTERNAL/external.mk file is automatically included by the
>       Makefile logic, and the BR2_EXTERNAL/Config.in file is
>       automatically included, and appears in the top-level menu. The
>       typical usage would be to create a BR2_EXTERNAL/package/
>       directory to contain package definitions.

  I'm not really convinced by the principle. The external.mk is exactly 
the same as the local override .mk; the Config.in appears at the very end 
of the top-level menu. Instead, I think we should enforce the buildroot 
hierarchy in the external dir, i.e.

source <path-to-external-dir>/package/Config.in

at the top of package/Config.in, and

-include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))

in the top-level Makefile.

  Of course, that Config.in thing is a lot trickier because it's almost 
impossible to refer to the output directory from the Config.in.

>   (3) To store defconfig files under BR2_EXTERNAL/configs/. They will
>       be visible in 'make help' and usable through 'make
>       <someboard>_defconfig'.

  That's a great idea.


> In terms of implementation, it is relatively straightforward:
>
>   * A BR2_EXTERNAL kconfig variable is added, which is set to the value
>     of the BR2_EXTERNAL environment variable.
>
>   * The top-level Config.in file given to kconfig is no longer the main
>     Config.in in the Buildroot sources, but instead a toplevel.in file
>     generated in the output directory, which includes the top-level
>     Buildroot Config.in file and the BR2_EXTERNAL/Config.in file if
>     provided. Since is needed because the kconfig 'source' statement
>     errors out if the included file doesn't exist. I have written
>     patches that add support for an 'isource' statement in kconfig
>     (that silently ignores the inclusion if the pointed file doesn't
>     exist), but keeping feature patches against kconfig doesn't seem
>     like a good idea.

  It took me a while to realize that that was _not_ the approach you had 
taken...

>     Note that the "mainmenu" statement is part of
>     this generated file, because it must be the first statement seen in
>     the toplevel Config.in file passed to kconfig.
>
>   * The BR2_EXTERNAL/external.mk makefile gets included.
>
>   * The BR2_EXTERNAL environment variable gets passed in the
>     environment of kconfig and when executing the kconfiglib-based
>     Python script that updates the manual, so that the references to
>     the BR2_EXTERNAL variable within Config.in files can be resolved.

  So this means that the external packages will appear in the package 
list in the manual? I'm not sure if that is what you typically want.


>   * The 'make help' and 'make %_defconfig' targets are updated to take
>     into account the defconfig files stored under
>     BR2_EXTERNAL/configs/.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   Config.in             |  6 ++++--
>   Makefile              | 29 +++++++++++++++++++++++++----
>   docs/manual/manual.mk |  2 +-
>   3 files changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index cb246a4..7e253c6 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -1,7 +1,5 @@
>   #
>
> -mainmenu "Buildroot $BR2_VERSION Configuration"
> -
>   config BR2_HAVE_DOT_CONFIG
>   	bool
>   	default y
> @@ -14,6 +12,10 @@ config BR2_HOSTARCH
>   	string
>   	option env="HOSTARCH"
>
> +config BR2_EXTERNAL
> +	string
> +	option env="BR2_EXTERNAL"
> +
>   # Hidden boolean selected by pre-built packages for x86, when they
>   # need to run on x86-64 machines (example: pre-built external
>   # toolchains, binary tools like SAM-BA, etc.).
> diff --git a/Makefile b/Makefile
> index fc55b87..1014399 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -47,7 +47,6 @@ export HOSTARCH := $(shell uname -m | \
>
>   # absolute path
>   TOPDIR:=$(shell pwd)
> -CONFIG_CONFIG_IN=Config.in
>   CONFIG=support/kconfig
>   DATE:=$(shell date +%Y%m%d)
>
> @@ -339,6 +338,10 @@ include boot/common.mk
>   include linux/linux.mk
>   include system/system.mk
>
> +ifneq ($(BR2_EXTERNAL),)
> +include $(BR2_EXTERNAL)/external.mk
> +endif
> +
>   TARGETS+=target-finalize
>
>   ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> @@ -622,6 +625,18 @@ $(BUILD_DIR)/buildroot-config/%onf:
>   	mkdir -p $(@D)/lxdialog
>   	$(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
>
> +CONFIG_CONFIG_IN=$(BUILD_DIR)/buildroot-config/toplevel.in
> +
> +# This is intentionally a virtual target so that the file gets
> +# regenerated everytime this target is invoked.
> +toplevelin-generate:

  I guess you mean phony target. You should also add
.PHONY: toplevelin-generate
for the (unlikely) case that someone creates a file with this name.

  BTW I don't like the target's name. generate-config-dot-in maybe?

> +	mkdir -p $(dir $(CONFIG_CONFIG_IN))
> +	echo "mainmenu \"Buildroot $$BR2_VERSION Configuration\"" > $(CONFIG_CONFIG_IN)
> +	echo "source \"Config.in\"" >> $(CONFIG_CONFIG_IN)
> +ifneq ($(BR2_EXTERNAL),)
> +	echo "source \"$$BR2_EXTERNAL/Config.in\"" >> $(CONFIG_CONFIG_IN)

  $(BR2_EXTERNAL) would be a lot more readable than $$BR2_EXTERNAL IMHO. 
Then you can also put it in single quotes and remove the \.

> +endif
> +
>   DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
>
>   # We don't want to fully expand BR2_DEFCONFIG here, so Kconfig will
> @@ -631,10 +646,12 @@ COMMON_CONFIG_ENV = \
>   	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
>   	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
>   	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
> -	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
> +	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
> +	BR2_EXTERNAL=$(BR2_EXTERNAL)

  There is one tricky issue:

cd ~/src/myproject/output
make -C ~/src/buildroot O=$PWD menuconfig
Hack hack hack
Hm, I need an external dir...
BR2_EXTERNAL=.. make menuconfig
=> BR2_EXTERNAL will point to ~/src instead of ~/src/myproject

  I.e., it doesn't work well for relative paths.

  I don't know if there is an elegant way to solve that.


>   COMMON_CONFIG_DEPS = \
> -	outputmakefile
> +	outputmakefile \
> +	toplevelin-generate
>
>   xconfig: $(BUILD_DIR)/buildroot-config/qconf $(COMMON_CONFIG_DEPS)
>   	@mkdir -p $(BUILD_DIR)/buildroot-config
> @@ -718,6 +735,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
>   	@mkdir -p $(BUILD_DIR)/buildroot-config
>   	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
>
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig $(COMMON_CONFIG_DEPS)
> +	@mkdir -p $(BUILD_DIR)/buildroot-config
> +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)

  This should be in a
ifneq ($(BR2_EXTERNAL),)


  Regards,
  Arnout

> +
>   savedefconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
>   	@mkdir -p $(BUILD_DIR)/buildroot-config
>   	@$(COMMON_CONFIG_ENV) $< \
> @@ -829,7 +850,7 @@ endif
>   	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>   	@echo '  make O=dir             - Locate all output files in "dir", including .config'
>   	@echo
> -	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
> +	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig $(BR2_EXTERNAL)/configs/*_defconfig))), \
>   	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
>   	@echo
>   	@echo 'See docs/README, or generate the Buildroot manual for further details'
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 4906bc8..8e0ab30 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,6 +1,6 @@
>   manual-update-lists:
>   	$(Q)$(call MESSAGE,"Updating the manual lists...")
> -	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
> +	$(Q)BR2_DEFCONFIG="" BR2_EXTERNAL="$(BR2_EXTERNAL)" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
>   		$(TOPDIR)/support/scripts/gen-manual-lists.py
>
>   ################################################################################
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
