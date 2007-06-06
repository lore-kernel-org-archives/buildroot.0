From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Wed, 06 Jun 2007 08:38:54 +0200
Subject: [Buildroot] ALSA tools for build-root
In-Reply-To: <46613FBE.7080709@teamboyce.co.uk>
References: <46613FBE.7080709@teamboyce.co.uk>
Message-ID: <1181111934.25173.88.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2007-06-02 at 11:00 +0100, Rod Boyce wrote:

<cut intro>

I am sorry if I break message threading, I am still getting used to evolution.

> Index: package/Config.in
> ===================================================================
> --- package/Config.in   (revision 18725)
> +++ package/Config.in   (working copy)
> @@ -239,10 +239,11 @@
>           Support for audio libraries and applications
>  
>  if BR2_AUDIO_SUPPORT
> +source "package/alsa-tools/Config.in"
>  source "package/asterisk/Config.in"
>  source "package/libid3tag/Config.in"
>  source "package/libmad/Config.in"
>  source "package/libsndfile/Config.in"
>  source "package/madplay/Config.in"
>  source "package/mpg123/Config.in"
>  endif
> Index: package/alsa-tools/alsa-tools.mk
> ===================================================================
> --- package/alsa-tools/alsa-tools.mk    (revision 0)
> +++ package/alsa-tools/alsa-tools.mk    (revision 0)
> @@ -0,0 +1,134 @@
> +#############################################################
> +#
> +# ALSA Tools
> +#
> +#############################################################
> +ALSA-TOOLS_VERSION := 1.0.14rc3

Perhaps I am just picky, but I prefer all underscore in a variable, i.e. ALSA_TOOLS_VERSION.

> +ALSA-TOOLS_SOURCE := alsa-tools-$(ALSA-TOOLS_VERSION).tar.bz2
> +ALSA-TOOLS_SITE := ftp://ftp.alsa-project.org/pub/tools/
> +ALSA-TOOLS_DIR := $(BUILD_DIR)/$(patsubst %.tar.bz2,%,$(ALSA-TOOLS_SOURCE))

As mentioned on other emails, I do not prefer this way of doing it. I
like the old see-what-you-have way of writing the _DIR variable.

> +ALSA-TOOLS_CAT := $(BZCAT)
> +ALSA-TOOLS_PATH := /usr/lib

WOHA! This should be usr/lib, skip the initial /.

> +ALSA-TOOLS_TGTS := ac3dec as10k1 echomixer envy24control mixartloader pcxhrloader
> +ALSA-TOOLS_TGTS += rmedigicontrol sscape_ctl us428control vxloader
> +# These are going to require custom rules and can't use the defined macro below
> +# ld10k1 sb16_csp qlo10k1 hdspconf hdsploader hdspmixer usx2yloader 

AFAICT you build these no mather what? Should be configurable IMHO.

I can not really see why they have to be treated different from the
other tools.

> +ALSA-TOOLS_TARGETS :=
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_AC3DEC))
> +ALSA-TOOLS_TARGETS += alsa-tools_ac3dec
> +endif

Instead consider:

ALSA-TOOLS_TARGETS_ :=
ALSA-TOOLS_TARGETS_y :=
ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA-TOOLS_AS10K1) += alsa-tools_as10k1

For all the ones below.

> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_AS10K1))
> +ALSA-TOOLS_TARGETS += alsa-tools_as10k1
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_ECHOMIXER))
> +ALSA-TOOLS_TARGETS += alsa-tools_echomixer
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_ENVY24CONTROL))
> +ALSA-TOOLS_TARGETS += alsa-tools_envy24control
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_HDSPCONF))
> +ALSA-TOOLS_TARGETS += alsa-tools_hdspconf
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_HDSPLOADER))
> +ALSA-TOOLS_TARGETS += alsa-tools_hdsploader
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_HDSPMIXER))
> +ALSA-TOOLS_TARGETS += alsa-tools_hdspmixer
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_LD10K1))
> +ALSA-TOOLS_TARGETS += alsa-tools_ld10k1
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_MIXARTLOADER))
> +ALSA-TOOLS_TARGETS += alsa-tools_mixartloader
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_PCXHRLOADER))
> +ALSA-TOOLS_TARGETS += alsa-tools_pcxhrloader
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_QLO10K1))
> +ALSA-TOOLS_TARGETS += alsa-tools_qlo10k1
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_RMEDIGICONTROL))
> +ALSA-TOOLS_TARGETS +=  alsa-tools_rmedigicontrol
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_SB16_CSP))
> +ALSA-TOOLS_TARGETS +=  alsa-tools_sb16_csp
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_SEQ))
> +ALSA-TOOLS_TARGETS += alsa-tools_seq
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_SSCAPE_CTL))
> +ALSA-TOOLS_TARGETS += alsa-tools_sscape_ctl
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_US428CONTROL))
> +ALSA-TOOLS_TARGETS += alsa-tools_us428control
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_USX2YLOADER))
> +ALSA-TOOLS_TARGETS += alsa-tools_usx2yloader
> +endif
> +ifeq (y,$(BR2_PACKAGE_ALSA-TOOLS_VXLOADER))
> +ALSA-TOOLS_TARGETS += alsa-tools_vxloader
> +endif
> +
> +$(DL_DIR)/$(ALSA-TOOLS_SOURCE):
> +       $(WGET) -P $(DL_DIR) $(ALSA-TOOLS_SITE)/$(ALSA-TOOLS_SOURCE)
> +
> +$(ALSA-TOOLS_DIR)/.unpacked: $(DL_DIR)/$(ALSA-TOOLS_SOURCE)
> +       $(ALSA-TOOLS_CAT) $(DL_DIR)/$(ALSA-TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> +       $(CONFIG_UPDATE) $(D@)
> +       touch $@
> +
> +define alsa-mk_target
> +$$(ALSA-TOOLS_DIR)/$(1)/.configured: $$(ALSA-TOOLS_DIR)/.unpacked
> +       (cd $$(ALSA-TOOLS_DIR)/$(1); rm -rf config.cache; \
> +               $$(TARGET_CONFIGURE_OPTS) \
> +               ./configure \
> +               --target=$$(GNU_TARGET_NAME) \
> +               --host=$$(GNU_TARGET_NAME) \
> +               --build=$$(GNU_HOST_NAME) \
> +               --disable-docs \
> +               --prefix=/usr \
> +               --sysconfdir=/etc \
> +               $$(DISABLE_NLS) \
> +       );
> +       touch $$@
> +
> +$$(ALSA-TOOLS_DIR)/$(1)/$(1): $$(ALSA-TOOLS_DIR)/$(1)/.configured
> +       $$(MAKE) CC=$$(TARGET_CC) -C $$(ALSA-TOOLS_DIR)/$(1)
> +
> +$$(STAGING_DIR)/bin/$(1): $$(ALSA-TOOLS_DIR)/$(1)/$(1)
> +       $$(MAKE) prefix=$$(STAGING_DIR)/usr exec_prefix=$$(STAGING_DIR)/usr \
> +               -C $$(ALSA-TOOLS_DIR)/$(1) install

Replace prefix and exec_prefix with DESTDIR=$$(STAGING_DIR) instead.

> +       touch -c $$@
> +
> +$$(TARGET_DIR)/usr/bin/$(1): $$(STAGING_DIR)/bin/$(1)
> +       cp -rdpf $$(STAGING_DIR)/usr/bin/$(1) $$@
> +       -$(STRIP) --strip-unneeded $$@
> +
> +alsa-tools_$(1): $$(TARGET_DIR)/usr/bin/$(1)
> +
> +alsa-tools_$(1)-clean:
> +       -$$(MAKE) -C $$(ALSA-TOOLS_DIR)/$(1) clean
> +
> +endef
> +
> +$(foreach var,$(ALSA-TOOLS_TGTS),$(eval $(call alsa-mk_target,$(var))))
> +
> +alsa-tools: alsa-lib alsa-utils $(ALSA-TOOLS_TARGETS)

And change this to ALSA-TOOLS_TARGETS_y to match the change a bit above
when adding the tools to build.

I guess alsa-tools also depends on ncurses, uclibc and linux26? Better
being to specific IMHO.

> +alsa-tools-source: $(DL_DIR)/$(ALSA-TOOLS_SOURCE)
> +
> +alsa-tools-clean: $(addsuffix -clean,$(ALSA-TOOLS_TARGETS))
> +
> +alsa-tools-dirclean:
> +       rm -rf $(ALSA-TOOLS_DIR) $(ALSA-TOOLS_DIR)
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_PACKAGE_ALSA-TOOLS)),y)
> +TARGETS+=alsa-tools
> +endif
> +
> Index: package/alsa-tools/Config.in
> ===================================================================
> --- package/alsa-tools/Config.in        (revision 0)
> +++ package/alsa-tools/Config.in        (revision 0)
> @@ -0,0 +1,144 @@
> +config BR2_PACKAGE_ALSA-TOOLS
> +       bool "alsa-tools"
> +       default n
> +       help
> +         Tools from Advanced Linux Sound Architecture
> +
> +         http://www.alsa-project.org/
> +
> +
> +config BR2_PACKAGE_ALSA-TOOLS_AC3DEC
> +    bool "ac3dec from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build the ac3 decoder from the ALSA tools package
> +
> +config BR2_PACKAGE_ALSA-TOOLS_AS10K1
> +    bool "as10k1 from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build as10k1 from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +config BR2_PACKAGE_ALSA-TOOLS_ECHOMIXER
> +    bool "echomixer from alsa-tools"
> +    default n
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build the echo mixer from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +config BR2_PACKAGE_ALSA-TOOLS_ENVY24CONTROL
> +    bool "envy24control from alsa-tools"
> +    default n
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build envy24control from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +#config BR2_PACKAGE_ALSA-TOOLS_HDSPCONF
> +#    bool "hdspconf from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build hdspconf from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Commented out? Remove if not used, or fix it so the config option works.

> +#config BR2_PACKAGE_ALSA-TOOLS_HDSPLOADER
> +#    bool "hdsploader from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build hdsploader from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Same as above.

> +#config BR2_PACKAGE_ALSA-TOOLS_HDSPMIXER
> +#    bool "hdspmixer from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build hdspmixer from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Same as above.

> +#config BR2_PACKAGE_ALSA-TOOLS_LD10K1
> +#    bool "ld10k1 from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build ld10k1 from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Same as above.

> +config BR2_PACKAGE_ALSA-TOOLS_MIXARTLOADER
> +    bool "mixartloader from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build mixartloader from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +config BR2_PACKAGE_ALSA-TOOLS_PCXHRLOADER
> +    bool "pcxhrloader from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build pcxhrloader from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +#config BR2_PACKAGE_ALSA-TOOLS_QLO10K1
> +#    bool "qlo10k1 from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build qlo10k1 from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Same as above.

> +config BR2_PACKAGE_ALSA-TOOLS_RMEDIGICONTROL
> +    bool "rmedigicontrol from alsa-tools"
> +    default n
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build rmedigicontrol from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +#config BR2_PACKAGE_ALSA-TOOLS_SB16_CSP
> +#    bool "sb16_csp from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build sb16_csp from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Same as above.

> +config BR2_PACKAGE_ALSA-TOOLS_SSCAPE_CTL
> +    bool "sscape_ctl from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build sscape_ctl from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +config BR2_PACKAGE_ALSA-TOOLS_US428CONTROL
> +    bool "us428control from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build us428control from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +
> +#config BR2_PACKAGE_ALSA-TOOLS_USX2YLOADER
> +#    bool "usx2yloader from alsa-tools"
> +#    default n
> +#      depends on BR2_PACKAGE_ALSA-TOOLS
> +#    help
> +#      Build usx2yloader from the ALSA tools package
> +#      WARNING unless you know what this is you do not need it

Same as above.

> +config BR2_PACKAGE_ALSA-TOOLS_VXLOADER
> +    bool "vxloader from alsa-tools"
> +    default y
> +       depends on BR2_PACKAGE_ALSA-TOOLS
> +    help
> +      Build vxloader from the ALSA tools package
> +      WARNING unless you know what this is you do not need it
> +

Overall I think your patch looks good. I only use alsa-lib and
alsa-utils and are really no expert in alsa-tools.

-- 
Best regards,
Hans-Christian Egtvedt
