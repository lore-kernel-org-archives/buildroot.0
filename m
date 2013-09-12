From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 12 Sep 2013 16:53:36 -0500
Subject: [Buildroot] Fwd:  [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <CAC2S8kiHUwNFprvvYd85UEGjDJhEX0Jgtb4e7Pd1vwwFGF7m_w@mail.gmail.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAC2S8kiHUwNFprvvYd85UEGjDJhEX0Jgtb4e7Pd1vwwFGF7m_w@mail.gmail.com>
Message-ID: <OF01C3E7FE.7941F7CC-ON86257BE4.0077887C-86257BE4.007843E4@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While utilizing this patch, I found the following that should be fixed

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/12/2013 
04:39 PM:

> diff --git a/Makefile b/Makefile
> index fc55b87..1014399 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -47,7 +47,6 @@ export HOSTARCH := $(shell uname -m | \
> 
>  # absolute path
>  TOPDIR:=$(shell pwd)
> -CONFIG_CONFIG_IN=Config.in
>  CONFIG=support/kconfig
>  DATE:=$(shell date +%Y%m%d)
> 
> @@ -339,6 +338,10 @@ include boot/common.mk
>  include linux/linux.mk
>  include system/system.mk
> 
> +ifneq ($(BR2_EXTERNAL),)
> +include $(BR2_EXTERNAL)/external.mk
> +endif
> +
>  TARGETS+=target-finalize
> 
>  ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> @@ -622,6 +625,18 @@ $(BUILD_DIR)/buildroot-config/%onf:
>         mkdir -p $(@D)/lxdialog
>         $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)"
> obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
> 
> +CONFIG_CONFIG_IN=$(BUILD_DIR)/buildroot-config/toplevel.in
> +
> +# This is intentionally a virtual target so that the file gets
> +# regenerated everytime this target is invoked.
> +toplevelin-generate:
> +       mkdir -p $(dir $(CONFIG_CONFIG_IN))
> +       echo "mainmenu \"Buildroot $$BR2_VERSION Configuration\"" >
> $(CONFIG_CONFIG_IN)
> +       echo "source \"Config.in\"" >> $(CONFIG_CONFIG_IN)
> +ifneq ($(BR2_EXTERNAL),)
> +       echo "source \"$$BR2_EXTERNAL/Config.in\"" >> 
$(CONFIG_CONFIG_IN)
> +endif
> +
>  DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))

Each command above should have a @ symbol since the commands print out 
every
time. As follows:

+toplevelin-generate:
+       @mkdir -p $(dir $(CONFIG_CONFIG_IN))
+       @echo "mainmenu \"Buildroot $$BR2_VERSION Configuration\"" >
$(CONFIG_CONFIG_IN)
+       @echo "source \"Config.in\"" >> $(CONFIG_CONFIG_IN)
+ifneq ($(BR2_EXTERNAL),)
+       @echo "source \"$$BR2_EXTERNAL/Config.in\"" >> $(CONFIG_CONFIG_IN)
+endif
+

>  # We don't want to fully expand BR2_DEFCONFIG here, so Kconfig will
> @@ -631,10 +646,12 @@ COMMON_CONFIG_ENV = \
>         KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
>         KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
>         KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
> -       BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
> +       BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
> +       BR2_EXTERNAL=$(BR2_EXTERNAL)
> 
>  COMMON_CONFIG_DEPS = \
> -       outputmakefile
> +       outputmakefile \
> +       toplevelin-generate
> 
>  xconfig: $(BUILD_DIR)/buildroot-config/qconf $(COMMON_CONFIG_DEPS)
>         @mkdir -p $(BUILD_DIR)/buildroot-config
> @@ -718,6 +735,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
> $(COMMON_CONFIG_DEPS)
>         @mkdir -p $(BUILD_DIR)/buildroot-config
>         @$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@
> $(CONFIG_CONFIG_IN)
> 
> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf
> $(BR2_EXTERNAL)/configs/%_defconfig $(COMMON_CONFIG_DEPS)
> +       @mkdir -p $(BUILD_DIR)/buildroot-config
> +       @$(COMMON_CONFIG_ENV) $<
> --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
> +
>  savedefconfig: $(BUILD_DIR)/buildroot-config/conf $(COMMON_CONFIG_DEPS)
>         @mkdir -p $(BUILD_DIR)/buildroot-config
>         @$(COMMON_CONFIG_ENV) $< \
> @@ -829,7 +850,7 @@ endif
>         @echo '  make V=0|1             - 0 => quiet build (default),
> 1 => verbose build'
>         @echo '  make O=dir             - Locate all output files in
> "dir", including .config'
>         @echo
> -       @$(foreach b, $(sort $(notdir $(wildcard
> $(TOPDIR)/configs/*_defconfig))), \
> +       @$(foreach b, $(sort $(notdir $(wildcard
> $(TOPDIR)/configs/*_defconfig $(BR2_EXTERNAL)/configs/*_defconfig))),
> \
>           printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
>         @echo
>         @echo 'See docs/README, or generate the Buildroot manual for
> further details'
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 4906bc8..8e0ab30 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,6 +1,6 @@
>  manual-update-lists:
>         $(Q)$(call MESSAGE,"Updating the manual lists...")
> -       $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build 
\
> +       $(Q)BR2_DEFCONFIG="" BR2_EXTERNAL="$(BR2_EXTERNAL)"
> TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
>                 $(TOPDIR)/support/scripts/gen-manual-lists.py
> 
> 
> 
################################################################################
> --
> 1.8.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130912/3f5ae746/attachment.html>
