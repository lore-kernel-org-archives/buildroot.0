From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 22 Jun 2016 09:18:38 +1000
Subject: [Buildroot] [PATCH v2 1/5] Add support for merged defconfigs
In-Reply-To: <791eb285-cf6c-03a8-5770-a0eedc1ec8ed@gmail.com>
References: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
 <c73b253513733e4a145fb71a1eebf82987107939.1466484997.git.sam.bobroff@au1.ibm.com>
 <791eb285-cf6c-03a8-5770-a0eedc1ec8ed@gmail.com>
Message-ID: <20160621231838.GA2392@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 22, 2016 at 12:09:14AM +0200, Romain Naour wrote:
> Hi Sam, All,
> 
> Thanks for this new series!
> 
> I tested it by merging qemu_arm_vexpress_defconfig as base configuration file
> with a arm_toolchain.config and efl.config partial configuration files.
> The merged defconfig is named efl_on_arm_defconfig.
> 
> I think it's a "must have" for 2016.08.
> 
> Some comments bellow.
> 
> Le 21/06/2016 ? 06:56, Sam Bobroff a ?crit :
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > ---
> >  Makefile                             | 38 +++++++++++++++++++++++
> >  docs/manual/adding-board-support.txt |  3 ++
> >  docs/manual/appendix.txt             |  1 +
> >  docs/manual/merged-defconfigs.txt    | 60 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 102 insertions(+)
> >  create mode 100644 docs/manual/merged-defconfigs.txt
> 
> I would be good to split in two commits the Makefile changes and the documentation.

Will do.

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
> 
> There is a problem here with make savedefconfig since BR2_DEFCONFIG =
> $$(CONFIG_DIR)/.merge_config/.config and .merge_config directory is removed with
> the last command.
> 
> I get:
> *** Error while saving defconfig to: test/efl-1.17.1-merged/.merge_config/.config
> 
> BR2_DEFCONFIG should be set to configs/efl_on_arm_defconfig

Ah, I'll take a look at that.

> I need more time to continue the review and testing.

Thanks for the review :-) I'll wait for more comments before I send v3.

> Best regards,
> Romain Naour
> 
> > +
> > +$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(eval -include $(d)/*.mk))
> > +
> >  ################################################################################
> >  #
> >  # Cleanup and misc junk
> > diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
> > index f6d74ae..086a67e 100644
> > --- a/docs/manual/adding-board-support.txt
> > +++ b/docs/manual/adding-board-support.txt
> > @@ -24,6 +24,9 @@ savedefconfig+. This will generate a minimal +defconfig+ file at the
> >  root of the Buildroot source tree. Move this file into the +configs/+
> >  directory, and rename it +<boardname>_defconfig+.
> >  
> > +It is also possible to create configurations by specifying differences from
> > +an existing configuration. See xref:merged-defconfigs[].
> > +
> >  It is recommended to use as much as possible upstream versions of the
> >  Linux kernel and bootloaders, and to use as much as possible default
> >  kernel and bootloader configurations. If they are incorrect for your
> > diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
> > index 87a20bd..9abc37e 100644
> > --- a/docs/manual/appendix.txt
> > +++ b/docs/manual/appendix.txt
> > @@ -3,6 +3,7 @@
> >  
> >  include::makedev-syntax.txt[]
> >  include::makeusers-syntax.txt[]
> > +include::merged-defconfigs.txt[]
> >  
> >  
> >  // Automatically generated lists:
> > diff --git a/docs/manual/merged-defconfigs.txt b/docs/manual/merged-defconfigs.txt
> > new file mode 100644
> > index 0000000..e1f50fd
> > --- /dev/null
> > +++ b/docs/manual/merged-defconfigs.txt
> > @@ -0,0 +1,60 @@
> > +// -*- mode:doc -*- ;
> > +// vim: set syntax=asciidoc:
> > +
> > +[[merged-defconfigs]]
> > +== Merged configurations
> > +
> > +Buildroot supports the use of the Linux kernel's +merge_config.sh+ script to
> > +create configurations by merging a set of partial configurations (or overlays)
> > +on top of a base configuration. This may be useful when there are several
> > +configurations that are specializations of a single generic configuration.
> > +
> > +Files in the +configs/+ directory with the extension
> > ++.mk+ will be read by the top level Makefile and the Make function
> > ++merge_config+ can be used within them to define new merged configurations.
> > +
> > +The merge_config function takes three parameters: the first is the name of the
> > +new configuration (which should end with +_defconfig+), the second is the name
> > +of the base configuration file and the third is a space separated list of the
> > +partial configuration files to merge from the +configs/+ directory. All files
> > +should be specified relative to the +configs/+ directory and the name of the
> > +Make fragment file should match the name of the configuration it creates.
> > +
> > +The new configuration can be selected as if it were a normal configuration, i.e. with
> > ++make foo_defconfig+.
> > +
> > +Partial configurations have the same format as full configuration
> > +files except that they contain only a subset of values. They can be created by
> > +starting with a normal configuration file and deleting lines as appropriate.
> > +
> > +External configuration files from the +$(BR2_EXTERNAL)/configs+ directory are fully
> > +supported, and merge configurations may freely refer to files from either
> > +location.
> > +
> > +Example:
> > +
> > +If configs/foo_defconfig contains:
> > +-----
> > +BR2_TARGET_GENERIC_HOSTNAME="buildroot"
> > +-----
> > +
> > +And configs/bar_defconfig.mk contains:
> > +-----
> > +$(eval $(call merge_config,bar_defconfig,foo_defconfig,b.config))
> > +-----
> > +
> > +And configs/b.config contains:
> > +-----
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to BAR"
> > +-----
> > +
> > +After running the command:
> > +-----
> > +make bar_defconfig
> > +-----
> > +
> > +The resulting .config file would contain:
> > +-----
> > +BR2_TARGET_GENERIC_HOSTNAME="buildroot"
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to BAR"
> > +-----
> > 
