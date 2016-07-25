From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jul 2016 23:25:02 +0200
Subject: [Buildroot] [PATCH 13/16 v3] core: add support for multiple
 br2-external trees
In-Reply-To: <c881f465-12bb-6f38-ce21-fdc743b137fa@gmail.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <09adf1c5d8cfad3134cbfc4d9d319099122d2219.1468750623.git.yann.morin.1998@free.fr>
 <c881f465-12bb-6f38-ce21-fdc743b137fa@gmail.com>
Message-ID: <20160725212502.GB5958@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-07-24 22:25 +0200, Romain Naour spake thusly:
> Hi Yann,
> 
> Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> > Currently, we only support at most one br2-external tree. Being able
> > to use more than one br2-external tree can be very useful.
> > 
> > A use-case would be for having a br2-external to contain the basic
> > packages, basic board defconfigs and board files, provided by one team
> > responsible for the "board-bringup", while other teams consume that
> > br2-external as a base, and complements it each with their own set of
> > packages, defconfigs and extra board files.
> > 
> > Another use-case would be for third-parties to provide their own
> > Buildroot packaging in a br2-external tree, along-side the archives for
> > their stuff.
> > 
> > Finally, another use-case is to be able to add FLOSS packages in a
> > br2-external tree, and proprietary packages in another. This allows
> > to not touch the Buildroot tree at all, and still be able to get in
> > compliance by providing only that br2-external tree(s) that contains
> > FLOSS packages, leaving aside the br2-external tree(s) with the
> > proprietary bits.
> > 
> > What we do is to treat BR2_EXTERNAL as a space-separated list of paths,
> > which we iterate to construct:
> > 
> >   - the list of all br2-external IDs, BR_EXTERNAL_IDS
>                                           ^
> There are several occurrence of BR_EXTERNAL_IDS instead of BR2_EXTERNAL_IDS.
> 
> Did you named BR_EXTERNAL_IDS to avoid confusion between BR2_EXTERNAL_ID and
> BR2_EXTERNAL_IDS.
> 
> Ha ok, BR_ variables are Buildroot internal variables not saved in .config file,
> right ?

Mostly, yes.

BR2_ variables are user-defined, either variables from the .config (i.e.
from kconfig), variables from the environment, variables from variables
on the command line or variables we pass to the user.

BR_ variables are internal variables, thus-prefixed to avoid
namespace-clashing.

So yes, BR_EXTERNAL_IDS is an internal variable, so is not BR2_-prefixed.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> 
> > 
> >   - the per-br2-external tree BR2_EXTERNAL_$(ID) variables, which points
> >     to the actual location of the corresponding tree,
> > 
> >   - EXTRA_ENV which now needs to contain all BR2_EXTERNAL_$(ID)
> >     variables, and thus needs to be set early.
> > 
> > Once we have all those variables, we replace references to BR2_EXTERNAL
> > with either:
> > 
> >   - a $(patsubst ...) to include the external.mk files (and docs),
> >     or
> > 
> >   - a $(foreach ...) iteration to generate other Makefile code.
> > 
> > To be noted: we also use $(foreach ...) in the kconfig-snippet
> > generating rule, because it is cleaner than doing so in the shell
> > 
> > Finally, we double-quote $(BR2_EXTERNAL) when assigning it to
> > environment variables.
> > 
> > Now, when more than one br2-external tree is used, each gets its own
> > sub-menu in the "User-provided options" menu. The sub-menu is labelled
> > with that br2-external tree's ID (prefixed with 'BR2_EXTERNAL_') and the
> > sub-menu's first item is a comment with the path to that br2-external
> > tree.
> > 
> > If there's only one br2-external tree, then there is no sub-menu, but
> > we still add the comment with the path to the br2-external tree (which
> > we did not have previously). If the br2-external tree has an ID, it is
> > displayed as well as a comment.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > 
> > ---
> > Changes v3 -> v4:
> >   - drop check for file existence  (Thomas)
> >   - fix check for empty ID  (Thomas)
> >   - simpler code to check number of br2-external trees
> > ---
> >  Makefile            | 99 +++++++++++++++++++++++++++++++++++++----------------
> >  package/Makefile.in |  2 +-
> >  2 files changed, 70 insertions(+), 31 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 67334e5..7b3542c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -145,32 +145,57 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
> >  # The value of BR2_EXTERNAL is stored in .br-external in the output directory.
> >  # On subsequent invocations of make, it is read in. It can still be overridden
> >  # on the command line, therefore the file is re-created every time make is run.
> > -#
> > -# If the br2-external tree defines its ID, then export the path in the
> > -# BR2_EXTERNAL_$(ID) variable.
> >  
> >  BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
> >  -include $(BR2_EXTERNAL_FILE)
> > -ifneq ($(BR2_EXTERNAL),)
> > -  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
> > -  ifeq ($(_BR2_EXTERNAL),)
> > -    $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
> > -  endif
> > -  override BR2_EXTERNAL := $(_BR2_EXTERNAL)
> > -  ifneq ($(wildcard $(BR2_EXTERNAL)/external.id),)
> > -    BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
> > -    ifeq ($(BR2_EXTERNAL_ID),)
> > -      $(error $(BR2_EXTERNAL) has no ID (in file 'external.id'))
> > -    endif
> > -    BR2_EXTERNAL_$(BR2_EXTERNAL_ID) = $(BR2_EXTERNAL)
> > -  endif
> > -  BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
> > -endif
> >  
> > -# This needs to be *after* we compute BR_EXTERNAL, above.
> >  .PHONY: $(BR2_EXTERNAL_FILE)
> >  $(BR2_EXTERNAL_FILE):
> > -	@echo BR2_EXTERNAL ?= $(BR_EXTERNAL) >$@
> > +	@echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) >$@
> > +
> > +# Those two variables need to be defined as simply-expanded variables, they
> > +# can't be recursively-expanded, because the values they are assigned change
> > +# with each iteration of the foreach, below.
> > +BR_EXTERNAL_IDS :=
> > +EXTRA_ENV :=
> > +
> > +# If there is no or one br2-external trees used, then we don't require (but
> > +# accept) an ID; otherwise (i.e. there are two or more br2-external trees)
> > +# we require they do all define their ID.
> > +ifeq ($(filter-out 0 1,$(words $(BR2_EXTERNAL))),)
> > +BR2_EXTERNAL_NEED_ID := loose
> > +else
> > +BR2_EXTERNAL_NEED_ID := strict
> > +endif
> > +
> > +# Validate the br2-external tree passed as $(1):
> > +# - check the directory actually exists
> > +# - check if we need and have a non-empty ID
> > +# - check the ID is not a duplicate
> > +# - set variables for later use
> > +define BR2_EXTERNAL_VALIDATE
> > +  _BR_EXT_DIR := $$(shell cd $(1) >/dev/null 2>&1 && pwd)
> > +  ifeq ($$(_BR_EXT_DIR),)
> > +    $$(error BR2_EXTERNAL='$(1)' does not exist, relative to $$(TOPDIR))
> > +  endif
> > +  _BR_EXT_ID := $$(shell cat $$(_BR_EXT_DIR)/external.id 2>/dev/null)
> > +  ifeq ($$(_BR_EXT_ID),)
> > +    ifeq ($(BR2_EXTERNAL_NEED_ID),strict)
> > +      $$(error BR2_EXTERNAL='$(1)' has no ID (in file 'external.id'),\
> > +               mandatory to use more than one br2-external tree at once)
> > +    endif # BR2_EXTERNAL_NEED_ID strict
> > +  endif # No ID
> > +  ifneq ($$(filter $$(_BR_EXT_ID),$$(BR_EXTERNAL_IDS)),)
> > +    $$(error Duplicate ID '$$(_BR_EXT_ID)' in '$(1)', previously defined in '$$(BR2_EXTERNAL_$$(_BR_EXT_ID))')
> > +  endif
> > +  ifneq ($$(_BR_EXT_ID),)
> > +    BR2_EXTERNAL_$$(_BR_EXT_ID) := $$(_BR_EXT_DIR)
> > +    BR_EXTERNAL_IDS += $$(_BR_EXT_ID)
> > +    EXTRA_ENV += BR2_EXTERNAL_$$(_BR_EXT_ID)=$$(_BR_EXT_DIR)
> > +  endif # _BR_EXT_ID not empty
> > +endef # BR2_EXTERNAL_VALIDATE
> > +
> > +$(eval $(foreach d,$(BR2_EXTERNAL),$(call BR2_EXTERNAL_VALIDATE,$(d))$(sep)))
> >  
> >  # To make sure that the environment variable overrides the .config option,
> >  # set this before including .config.
> > @@ -469,9 +494,10 @@ include fs/common.mk
> >  # If the br2-external tree defines its ID, then the BR2_EXTERNAL_$(ID)
> >  # variable is also present in .config, so it is quoted. We must unquote
> >  # it before feeding it to the br2-external makefile.
> > -BR2_EXTERNAL_$(BR2_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)))
> > +$(eval $(foreach id,$(BR_EXTERNAL_IDS),\
> > +	BR2_EXTERNAL_$(id) := $(call qstrip,$(BR2_EXTERNAL_$(id)))$(sep)))
> >  # Nothing to include if no BR2_EXTERNAL tree in use
> > -include $(BR2_EXTERNAL_MK)
> > +include $(patsubst %,%/external.mk,$(BR2_EXTERNAL))
> >  
> >  # Now we are sure we have all the packages scanned and defined. We now
> >  # check for each package in the list of enabled packages, that all its
> > @@ -787,7 +813,7 @@ COMMON_CONFIG_ENV = \
> >  	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
> >  	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
> >  	BR2_CONFIG=$(BR2_CONFIG) \
> > -	BR2_EXTERNAL=$(BR2_EXTERNAL) \
> > +	BR2_EXTERNAL="$(BR2_EXTERNAL)" \
> >  	HOST_GCC_VERSION="$(HOSTCC_VERSION)" \
> >  	BUILD_DIR=$(BUILD_DIR) \
> >  	SKIP_LEGACY=
> > @@ -895,12 +921,25 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> >  	$(Q)if [ -n '$(BR2_EXTERNAL)' ]; then \
> >  		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
> >  		printf 'menu "User-provided options"\n\n'; \
> > -		if [ -z "$(BR2_EXTERNAL_ID)" ]; then \
> > +		if [ -z "$(call strip,$(BR_EXTERNAL_IDS))" ]; then \
> > +			printf 'comment "%s"\n\n' $(BR2_EXTERNAL); \
> >  			printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
> >  		else \
> > -			printf 'config BR2_EXTERNAL_%s\n' $(BR2_EXTERNAL_ID); \
> > -			printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
> > -			printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(BR2_EXTERNAL_ID); \
> > +			$(foreach id,$(BR_EXTERNAL_IDS),\
> > +				for i in $$(seq 1 80); do printf '#'; done; printf '\n\n'; \
> > +				if [ $(words $(call strip,$(BR_EXTERNAL_IDS))) -gt 1 ]; then \
> > +					printf 'menu "BR2_EXTERNAL_%s"\n\n' $(id); \
> > +				else \
> > +					printf 'comment "BR2_EXTERNAL_%s"\n\n' $(id); \
> > +				fi; \
> > +				printf 'comment "%s"\n\n' $(BR2_EXTERNAL_$(id)); \
> > +				printf 'config BR2_EXTERNAL_%s\n' $(id); \
> > +				printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(id)); \
> > +				printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(id); \
> > +				if [ $(words $(call strip,$(BR_EXTERNAL_IDS))) -gt 1 ]; then \
> > +					printf 'endmenu # BR2_EXTERNAL_%s\n\n' $(id); \
> > +				fi; ) \
> > +			for i in $$(seq 1 80); do printf '#'; done; printf '\n\n'; \
> >  		fi; \
> >  		printf 'endmenu # User-provided options\n'; \
> >  	fi >$@
> > @@ -1004,10 +1043,10 @@ list-defconfigs:
> >  	@echo 'Built-in configs:'
> >  	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
> >  	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> > -ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
> > +ifneq ($(wildcard $(patsubst %,%/configs/*_defconfig,$(BR2_EXTERNAL))),)
> >  	@echo
> >  	@echo 'User-provided configs:'
> > -	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
> > +	@$(foreach b, $(sort $(notdir $(wildcard $(patsubst %,%/configs/*_defconfig,$(BR2_EXTERNAL))))), \
> >  	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
> >  endif
> >  	@echo
> > @@ -1029,7 +1068,7 @@ print-version:
> >  	@echo $(BR2_VERSION_FULL)
> >  
> >  include docs/manual/manual.mk
> > --include $(BR2_EXTERNAL)/docs/*/*.mk
> > +-include $(patsubst %,%/docs/*/*.mk,$(BR2_EXTERNAL))
> >  
> >  .PHONY: $(noconfig_targets)
> >  
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index afd5d3a..fe8ee68 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -319,7 +319,7 @@ EXTRA_ENV = \
> >  	PATH=$(BR_PATH) \
> >  	BR2_DL_DIR=$(BR2_DL_DIR) \
> >  	BUILD_DIR=$(BUILD_DIR) \
> > -	BR2_EXTERNAL=$(BR2_EXTERNAL)
> > +	BR2_EXTERNAL="$(BR2_EXTERNAL)"
> >  
> >  ################################################################################
> >  # settings we need to pass to configure
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
