From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Apr 2014 16:41:09 +0200
Subject: [Buildroot] [PATCH 08/20] packages: add infrastructure for
 virtual packages
In-Reply-To: <533F11CA.5040304@mind.be>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <19c0bbf58268a2133297840b8763d415ad5a4ef0.1394482605.git.yann.morin.1998@free.fr>
 <533F11CA.5040304@mind.be>
Message-ID: <20140405144109.GA3177@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On 2014-04-04 22:10 +0200, Arnout Vandecappelle spake thusly:
> On 10/03/14 21:27, Yann E. MORIN wrote:
> > The virtual-package infrastructure allows to easily define a
> > virtual package in a single line:
[--SNIP--]
> > +# Note: putting this comment here rather than in the define block, otherwise
> > +# make would try to expand the $(error ...) in the comment, which is not
> > +# really what we want.
> 
>  That could be avoided by $$-quoting it inside the comment as well :-)

I've tried, but that's just ugly...

> > +# We need to use second-expansion for the $(error ...) call, below,
> > +# so it is not evaluated now, but as part of the generated make code.
> > +
> > +define inner-virtual-package
> > +
> > +# Ensure the virtual package has an implementation defined.
> > +ifeq ($(BR2_PACKAGE_HAS_$(2)),y)
> 
>  Even though it is not strictly necessary (it will anyway be eval'ed
> immediately after expansion), I think it's better to consistently use $$
> everywhere (except for $(1) etc. of course). Currently it's not done
> consistently in package-generic but it would be better to make it
> consistent here.

OK.

> > +ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2))),)
> > +$$(error No implementation selected for virtual package $(1). Configuration error)
> 
>  I think "Configuration error" is a bit vague, but I can't think of
> anything better.

Well, that's mostly a developper's message. The message is here to ensure
the developper does not forget to set the _PROVIDES option.

When the configuration options are properly set, the user will never see
that error message.

> > +endif
> > +endif
> > +
> > +# A virtual package does not have any source associated
> > +$(2)_SOURCE =
> > +
> > +# This must be repeated from inner-generic-package, otherwise we get an empty
> > +# _DEPENDENCIES
> > +$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
> > +	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> > +
> > +# Add dependency against the provider
> > +$(2)_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2)))
> > +
> > +# Call the generic package infrastructure to generate the necessary
> > +# make targets
> > +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> 
>  I don't really see the need to call inner-generic-package here. Isn't it
> sufficient to do:
> 
> ifeq ($$(BR2_PACKAGE_HAS_$(2)),y)
> ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)
> $$(error No implementation selected for virtual package $(1).
> Configuration error)
> endif
> endif
> 
> $(1): $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))
> 
>  We don't need all the rest of the package infrastructure, do we? We
> don't need to download any sources, we don't need legal info for the
> virtual package, etc. etc. There's also no need to create stamp files

I do not want o duplicate the logic in generic-package. For example:

  - with the now-possible parallel build, all packages must depend on
    'toolchain', which I'd have to add here;

  - clean-for-rebuild on a virtual package will eventually trigger a
    rebuild of all packages that depend on it (IIUC);

  - show-dpeends and graph-depends are interesting for virtual packages;

  - I can already think of a case where I'd need to run a post-install
    hook for a virtual package.

> > +
> > +endef
> > +
> > +################################################################################
> > +# virtual-package -- the target generator macro for virtual packages
> > +################################################################################
> > +
> > +virtual-package = $(call inner-virtual-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> > +host-virtual-package = $(call inner-virtual-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> 
>  Note that with the simplification above, you only need the first two
> arguments to the inner-virtual-package macro.

Maybe, but I would prefer we keep the same arguments when calling inner
functions, so all types of packages are handled the same. If we are to
add (or remove) an argument in the future, it will be much easier to do.

Plus the reasons expresed above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
