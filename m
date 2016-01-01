From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2016 17:58:15 +0100
Subject: [Buildroot] [PATCH] pkg-generic: improve incorrectly used
 package detection
In-Reply-To: <5686AE04.7020703@gmail.com>
References: <1451606483-29096-1-git-send-email-yann.morin.1998@free.fr>
 <5686AE04.7020703@gmail.com>
Message-ID: <20160101165815.GC3710@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-01-01 17:49 +0100, Romain Naour spake thusly:
> Le 01/01/2016 01:01, Yann E. MORIN a ?crit :
> > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > Currently, the check that packages we build are indeed enabled is done
> > at the time a package is configured.
> > 
> > This can come quite late in the build process, and does not provide
> > direct knowledge of the real culprit for the incorrect dependency.
> > 
> > However, we can improve these two issues quite easily, albeit at the
> > expense of a very slightly more complicated make code.
> > 
> > First, the check can not be done at the time we define the package, i.e.
> > in the inner-generic-pacakge, because all its dependencies might have
> > not been parsed yet, so we can't yet know whether it is enabled or not
> > (because we can't match the package name of the dependency to its
> > Kconfig variable yet).
> > 
> > But then, we know we have all packages definitions after we scanned the
> > the bundled packages, kernel, bootloaders and toolchains, as well as the
> > br2-external tree (if any).
> > 
> > So, at this location, we iterate through the list of enabled packages,
> > and check that the packages they each depend on are indeed enabled.
> > 
> > This allows us to:
> >  1- do the check very early, before any build action,
> >  2- report on the exact offending package very easily.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> While testing this patch with some packages enabled (efl + enlightenment), I get:
> 
> make[1]: execvp: /bin/sh: Liste d'arguments trop longue
> package/pkg-generic.mk:200: recipe for target
> 'output/build/skeleton-undefined/.stamp_configured' failed
> 
> Any idea ?

Yes, this patch is not good. I've sent an updated version:
    https://patchwork.ozlabs.org/patch/561998/

This new version is entirely using Makefile code, so it should not
suffer from this limitation.

Regards,
Yann E. MORIN.

> Best regards,
> Romain
> > 
> > ---
> > Changes v2 -> v3:  (Yann)
> >   - completely drop the reverse dependency list
> >   - drop the pre-configure check
> >   - make it Makefile code
> >   - print the offending package
> >   - drop Thomas' SoB, as I rewrote it entirely and completely
> >     differently
> > 
> > Changes v1 -> v2:  (Yann)
> >   - recursively scan the reverse list of dependencies to find all the
> >     potential cuplrits, not only the first-level ones
> > ---
> >  Makefile               | 28 ++++++++++++++++++++++++++++
> >  package/pkg-generic.mk | 14 --------------
> >  2 files changed, 28 insertions(+), 14 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 71ace68..9139e81 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -434,6 +434,34 @@ include fs/common.mk
> >  
> >  include $(BR2_EXTERNAL)/external.mk
> >  
> > +# Now we are sure we have all the packages scanned and defined. We now
> > +# check for each package in the list of enabled packages, that all its
> > +# dependencies are indeed enabled.
> > +#
> > +# Only trigger the check for default builds. If the user forces building
> > +# a package, even if not enabled in the configuration, we want to accept
> > +# it.
> > +#
> > +ifeq ($(MAKECMDGOALS),)
> > +
> > +define CHECK_ONE_DEPENDENCY
> > +ifeq ($$($(2)_TYPE),target)
> > +ifeq ($$($(2)_IS_VIRTUAL),)
> > +ifneq ($$($$($(2)_KCONFIG_VAR)),y)
> > +$$(error $$($(2)_NAME) is in the dependency chain of $$($(1)_NAME) that \
> > +has added it to its _DEPENDENCIES variable without selecting it or \
> > +depending on it from Config.in)
> > +endif
> > +endif
> > +endif
> > +endef
> > +
> > +$(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
> > +	$(foreach dep,$(call UPPERCASE,$($(pkg)_FINAL_ALL_DEPENDENCIES)),\
> > +		$(eval $(call CHECK_ONE_DEPENDENCY,$(pkg),$(dep))$(sep))))
> > +
> > +endif
> > +
> >  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> >  	$(HOST_DIR) $(BINARIES_DIR)
> >  
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 9e88423..1e024d3 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -182,20 +182,6 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
> >  
> >  # Configure
> >  $(BUILD_DIR)/%/.stamp_configured:
> > -# Only trigger the check for default builds. If the user forces
> > -# building a package, even if not enabled in the configuration, we
> > -# want to accept it.
> > -ifeq ($(MAKECMDGOALS),)
> > -	@if test "$($(PKG)_TYPE)" = "target" \
> > -		-a "$($(PKG)_IS_VIRTUAL)" != "YES" \
> > -		-a -z "$($($(PKG)_KCONFIG_VAR))" ; \
> > -	then \
> > -		echo "ERROR: $($(PKG)_NAME) is in the dependency chain of a package that has" ; \
> > -		echo "added it to its _DEPENDENCIES variable (directly or indirectly)" ; \
> > -		echo "without selecting it from Config.in." ; \
> > -		exit 1 ; \
> > -	fi
> > -endif
> >  	@$(call step_start,configure)
> >  	@$(call MESSAGE,"Configuring")
> >  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
