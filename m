From: Herve Codina <herve.codina@bootlin.com>
Date: Wed, 7 Jul 2021 13:48:28 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210706195048.GO2521@scaer>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer>
Message-ID: <20210707134828.7feafbd2@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 6 Jul 2021 21:50:48 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +# Make sure python _sysconfigdata*.py files only reference the current
> > +# per-package directory.
> > +
> > +# $1: package name (lower case)
> > +# $2: staging or host directory of the package
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define fixup-python-files
> > +	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
> > +		-name "_sysconfigdata*.py" -print0 | xargs -0 --no-run-if-empty \
> > +		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
> > +	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
> > +		-name "_sysconfigdata*.pyc" -delete  
> 
> Those two find commands are not equivalent to the original ones.
> 
> Before, we had:
>     find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* [...]
> 
> After, we'd have, after replacing $(2):
>     find $(HOST_DIR) \( -path '$(HOST_DIR)/lib/python*' -o -path '$(HOST_DIR)/usr/lib/python*' \) [...]
>     find $(STAGING_DIR) \( -path '$(STAGING_DIR)/lib/python*' -o -path '$(STAGING_DIR)/usr/lib/python*' \) [...]
> 
> So this is slightly different... I don't get why you needed to duplicate
> the calls, calling the macro twice... And even then, it would have still
> been simpler to pass the two locations as starting points to find:
> 
>     find $(HOST_DIR)/lib/python* $(HOST_DIR)/usr/lib/python* [...]
>     find $(STAGING_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* [...]
> 
> But really, $(HOST_DIR)/usr is just a symlink to . so there is no reason
> to search it. Also, previously $(STAGING_DIR)/lib/ was not in the search
> list, but now it is...
> 
> > +endef
> > +endif
> > +
> >  # Functions to collect statistics about installed files
> >  
> >  # $(1): base directory to search in
> > @@ -254,6 +269,8 @@ $(BUILD_DIR)/%/.stamp_configured:
> >  	@$(call pkg_size_before,$(HOST_DIR),-host)
> >  	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
> >  	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
> > +	$(call fixup-python-files,$(NAME),$(HOST_DIR))
> > +	$(call fixup-python-files,$(NAME),$(STAGING_DIR))
> >  	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))  
> 
> Even if the libtool fixups are not moved to the new _POST_PREPARE_HOOKS,
> I still find it sad that we do not leverage those new hooks for the new
> fixups... :-/
> 
> But since I said "OK-ish" in my previous review, I am going to stand by
> it. A little reluctantly still... :-/
> 
> But then, re-reading the above about the two find commands: if you had
> just moved the macro out of pkg-python.mk and into here, and just added:
>     $(2)_POST_PREPARE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA
> 
> Then that would have been much simpler: 1) you would not have changed
> the breadth of the search, and 2) you would have used the new hooks.
> 
> Oh, but you need the package name, that is passed as $(1)? No problem,
> it is already available as $($(PKG)_NAME), like was done in the original
> fixup macro (see below).
> 


Well,

These finds are now called for all packages and .../lib/python* can be not
present. In this case, find fails.
Using '-path' avoid this failure if files/dirs are not present.

I wanted to mimic fixup-libtool-files.
And so performed 2 calls. One for HOST_DIR and the other for STAGING_DIR.

For HOST_DIR, the previous find searched in $(HOST_DIR)/lib,
for STAGING_DIR, it searched in $(STAGING_DIR)/usr/lib,

That's why I wrote the macro with 
-path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*'

We can simplify the call using:
  $(Q)find $(2) -path '$(2)/usr/lib/python*' -name ...
This assumes:
(1) python stuff will not install anything in $(STAGING_DIR)/lib/python*
(2) $(HOST_DIR)/usr will always be a symlink to $(HOST_DIR)/.


-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
