From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 5 Jul 2016 15:44:44 +1000
Subject: [Buildroot] [PATCH v3 1/6] Add support for merged defconfigs
In-Reply-To: <c0854a4a-9e03-0a90-b78d-9d7eebd67cfa@smile.fr>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
 <0fddd32d7ed356b943e1372df20a0d9948ab29ed.1467176798.git.sam.bobroff@au1.ibm.com>
 <c0854a4a-9e03-0a90-b78d-9d7eebd67cfa@smile.fr>
Message-ID: <20160705054444.GA27663@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 01, 2016 at 10:47:30AM +0200, Romain Naour wrote:
> Hi Sam,
> 
> Le 29/06/2016 ? 07:06, Sam Bobroff a ?crit :
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > ---
> > v3:
> > 
> > * Documentation moved to separate patch.
> > * Fixed "make savedefconfig".
> 
> Sorry, I don't see how "make savedefconfig" has been fixed in this patch.
> The patch seems the same as v2.
> 
> With the series applied I get the same error.

Ah, sorry, I managed to lose that change somehow, this part:

+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(CONFIG_DIR)/.merge_config/.config \
+		$$< --defconfig=$$(CONFIG_DIR)/.merge_config/.config $$(CONFIG_CONFIG_IN)

Should have been:

+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(dir $(call FIND_CONFIG_FILE,$2))$1 \
+		$$< --defconfig=$$(CONFIG_DIR)/.merge_config/.config $$(CONFIG_CONFIG_IN)

Which would place the saved defconfig in a file with the name of your merged
defconfig in which ever directory contained the "base" part of the config. I'm
not entirely sure what "make safedefconfig" should really mean for a merged
config but this seemed OK.

But, given that you've decided not to take the set, I won't post a new version. ;-)

Cheers,
Sam.

> Best regards,
> Romain
> 
> > 
> >  Makefile | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 78b44c5..9f3fc92 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -858,6 +858,44 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> >  
> >  .PHONY: defconfig savedefconfig
> >  
> > +# Find the path of a config file that may be either in TOPDIR or BR2_EXTERNAL.
> > +# Missing or duplicate matches must be checked for elsewhere.
> > +define FIND_CONFIG_FILE =
> > +$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(wildcard $(d)/$(1)))
> > +endef
> > +
> > +define CONFIG_FILE_LIST =
> > +$(foreach f,$1,$(call FIND_CONFIG_FILE,$f))
> > +endef
> > +
> > +# Check that each config file is found once and only once.
> > +define CHECK_CONFIG_FILE_LIST =
> > +$(foreach f,$(1),
> > +ifeq "$(words $(call FIND_CONFIG_FILE,$(f)))" "0"
> > +$$(error ERROR: Missing input file: $(f))
> > +else
> > +ifneq "$(words $(call FIND_CONFIG_FILE,$(f)))" "1"
> > +$$(error ERROR: Duplicate input file: $(f))
> > +endif
> > +endif
> > +)
> > +endef
> > +
> > +# To be called by configuration fragments (*.mk) to set up defconfigs built
> > +# by merge_config.sh, via the include that follows:
> > +define merge_config =
> > +$(call CHECK_CONFIG_FILE_LIST,$2 $3)
> > +$(1): $$(BUILD_DIR)/buildroot-config/conf $(call CONFIG_FILE_LIST,$2 $3) outputmakefile
> > +	@mkdir $$(CONFIG_DIR)/.merge_config
> > +	@$$(TOPDIR)/support/kconfig/merge_config.sh -m -O $$(CONFIG_DIR)/.merge_config \
> > +		$(call CONFIG_FILE_LIST,$2 $3)
> > +	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(CONFIG_DIR)/.merge_config/.config \
> > +		$$< --defconfig=$$(CONFIG_DIR)/.merge_config/.config $$(CONFIG_CONFIG_IN)
> > +	@rm -rf $$(CONFIG_DIR)/.merge_config
> > +endef
> > +
> > +$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(eval -include $(d)/*.mk))
> > +
> >  ################################################################################
> >  #
> >  # Cleanup and misc junk
> > 
