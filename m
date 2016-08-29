From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Aug 2016 00:11:16 +0200
Subject: [Buildroot] [PATCH 13/16 v3] core: add support for multiple
 br2-external trees
In-Reply-To: <20160827222006.5f36e71f@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <09adf1c5d8cfad3134cbfc4d9d319099122d2219.1468750623.git.yann.morin.1998@free.fr>
 <20160827222006.5f36e71f@free-electrons.com>
Message-ID: <20160829221116.GB5829@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 22:20 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:33 +0200, Yann E. MORIN wrote:
> 
> > What we do is to treat BR2_EXTERNAL as a space-separated list of paths,
> > which we iterate to construct:
> 
> As discussed on IRC, is the space-separated list the best choice? Most
> environment variables that contain paths in Unix are colon-separated
> instead (PATH, LD_LIBRARY_PATH, PKG_CONFIG_PATH, etc, etc.)
> 
> Making it space-separated makes it a bit annoying IMO.

Already changed here; will be part of the next spin.

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
> 
> This is really long and not so pretty to look at. Perhaps all the
> "validation" aspects can be handled in the shell script that generates
> the .br2-external.in Config.in snippet?

Well, at first I thought that mught be a good idea.

However, we also need to generate makefile-level variables, so that each
br2-external tree can access its files:

    BR2_EXTERNAL_$$(_BR_EXT_ID) := $$(_BR_EXT_DIR)

is something we can not offload to a shell script; it has to be done in
the Makefile.

One solution to offload that to a script, would be to generate another
makefile fragment, and I'm pretty sure you would not like it much.

However, there might be a solution that is not too complex: we already
generate $(BASE_DIR)/.br-external, today with a simple echo. But we
could turn it into:

    BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
    -include $(BR2_EXTERNAL_FILE)

    $(BR2_EXTERNAL_FILE):
        support/scripts/mk-br-external -x "$(BR2_EXTERNAL)" -m -o $(@)

    BR2_KCONFIG_SNIPPET = $(BUILD_DIR)/.br2-external.in
    $(BR2_KCONFIG_SNIPPET):
        support/scripts/mk-br-external -x "$(BR2_EXTERNAL)" -k -o $(@)

And then have support/scripts/mk-br-external bail out if BR2_EXTERNAL is
incorrect, which would have make error out when generating .br-external.

Otherwise, it would:

  - for BR2_EXTERNAL_FILE, store the value of BR2_EXTERNAL like we do
    for now, plus generate the needed variables BR2_EXTERNAL_$(ID) ;

  - for BR2_KCONFIG_SNIPPET, generate the Kconfig fragment which is
    currently done in the makefile code (your comment below).

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
> > @@ -895,12 +921,25 @@BR2_EXTERNAL_FILE $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
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
> 
> This is really where you want to start having a helper shell script IMO.
> 
> > -ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
> > +ifneq ($(wildcard $(patsubst %,%/configs/*_defconfig,$(BR2_EXTERNAL))),)
> 
> Everywhere you use a patsubst like this, a foreach would be more
> appropriate I believe:
> 
> ifneq ($(wildcard $(foreach d,$(BR2_EXTERNAL),$(d)/configs/*_defconfig))

Ok, can do.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
