From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Jun 2015 23:25:19 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <55760493.1070807@mind.be>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
 <55760493.1070807@mind.be>
Message-ID: <20150608212519.GC3590@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-08 23:09 +0200, Arnout Vandecappelle spake thusly:
> On 06/07/15 00:20, Yann E. MORIN wrote:
> > The Linux kernel offers a nice and easy-to-use infra to build
> > out-of-tree kernel modules.
> > 
> > Currently, we have quite a few packages that build kernel modules, and
> > most dupliacte (or rewrite) the same code over-and-over again.
> 
>  duplicate
> 
> > 
> > Introduce a new infrastructure that provides helpers to build kernel
> > modules, so packages do not have to duplicate/rewrite that.
> > 
> > The infrastrucutre, unlike any other package infra, is not standalone.
> 
>  infrastructure

Will fix both.

> > It needs another package infra to be used. This is so that packages that
> > provide both userland and kernel modules can be built easily. So, this
> > infra only defines post-build and post-install hooks, that will build
> > the kernel modules after the rest of the package.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/Makefile.in          |  1 +
> >  package/pkg-kernel-module.mk | 94 ++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 95 insertions(+)
> >  create mode 100644 package/pkg-kernel-module.mk
> > 
> > diff --git a/package/Makefile.in b/package/Makefile.in
> > index c02d31f..180fd46 100644
> > --- a/package/Makefile.in
> > +++ b/package/Makefile.in
> > @@ -398,3 +398,4 @@ include package/pkg-virtual.mk
> >  include package/pkg-generic.mk
> >  include package/pkg-kconfig.mk
> >  include package/pkg-rebar.mk
> > +include package/pkg-kernel-module.mk
> 
>  I think we should at some point put this either in alphabetical or some other
> logical order. But for now, it's chaos anyway so OK to just add at the end.

Yup, the rule so far has been "append new infra". So I did the same...

> > diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> > new file mode 100644
> > index 0000000..2a2a2cb
> > --- /dev/null
> > +++ b/package/pkg-kernel-module.mk
> > @@ -0,0 +1,94 @@
> > +################################################################################
> > +# kernel module infrastructure for building Linux kernel modules
> > +#
> > +# This file implements an frastructure that eases development of package .mk
> 
>  infrastructure

Yup.

> > +# files for out-of-tree Linux kernel modules. It should be used for all
> > +# packages that build a Linux kernel module.
> 
>  Well, as you say in the cover text, there are a few packages with awkward build
> systems that can't use this infra.

Will rephrase.

> > +#
> > +# In terms of implementation, this infrastructure requires the .mk file to
> > +# only specify metadata information about the package: name, version,
> > +# download URL, etc.
> 
>  I think this is another cut&paste from pkg-generic that is not appropriate.

Yup, will remove.

> > +#
> > +# It defines post-build and post-install hooks, so that packages can both
> > +# build user-space (with any of the other *-package infra) and/or build
> > +# kernel modules.
> > +#
> > +# As such, it is to be used in conjunction with another *-package infra,
> > +# like so:
> > +#
> > +#   $(eval $(kernel-module))
> > +#   $(eval $(generic-package))
> > +#
> > +# Note: if the caller needs access to the kernel modules (either after they
> > +# are built or after they are installed), it will have to define its own
> > +# post-build/install hooks after calling kernel-module, but before calling
> > +# the other *-package infra, like so:
> > +#
> > +#   $(eval $(kernel-module))
> > +#   define FOO_MOD_TWEAK
> > +#   	# do something
> > +#   endef
> > +#   FOO_POST_BUILD_HOOKS += FOO_MOD_TWEAK
> > +#   $(eval $(generic-package))
> 
>  That is not so nice, but I don't see a better alternative.
> 
> > +#
> > +# Note: this infra does not check that the kernel is enabled; it is expected
> > +# to be enforced at the Kconfig level with proper 'depends on'.
> > +################################################################################
> > +
> > +################################################################################
> > +# inner-kernel-module -- generates the make targets needed to support building
> > +# a kernel module
> > +#
> > +#  argument 1 is the lowercase package name
> > +#  argument 2 is the uppercase package name, including a HOST_ prefix
> > +#             for host packages
> > +#  argument 3 is the uppercase package name, without the HOST_ prefix
> > +#             for host packages
> > +#  argument 4 is the type (always 'target')
> 
>  $(2) is the only one that is used...

Already fixed locally, see:
    http://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/kernel-modules&id=37668dc37654cdcb9e874e62ba994990f8835486

> > +################################################################################
> > +
> > +define inner-kernel-module
> > +
> > +# The kernel must be built first.
> > +$(2)_DEPENDENCIES += linux
> > +
> > +# Duplicate that from pkg-generic because we need it now
> > +ifndef $(2)_MAKE
> > +  $(2)_MAKE = $(MAKE)
> > +endif
> 
>  I don't see why this is needed... The defines below will only be expanded when
> the rule is executed (otherwise $(PKG) would not even be defined), so the
> definition from pkg-generic is enough, no?

That's what I thought, too, but encountered an error in the beginings of
this infra. I'll retest without that.

> > +ifndef $(2)_MODULE_SUBDIRS
> > +  $(2)_MODULE_SUBDIRS = .
> > +endif
> > +
> > +# Build the kernel module(s)
> > +define $(2)_KERNEL_MODULES_BUILD
> > +	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
> > +		@$$(call MESSAGE,"Building kernel module '$$(d)'")$$(sep) \
> 
>  I think that "Building kernel module '.'" looks a bit weird... But again, I
> can't think of an alternative.

Neither do I. I'll see if I can do something about that...

> > +		$$($$(PKG)_MAKE) -C $$(LINUX_DIR) \
> 
>  Missing $(LINUX_MAKE_ENV) (or at least TARGET_MAKE_ENV, but I think
> LINUX_MAKE_ENV is more appropriate even if it just adds BR_BINARIES_DIR).
> 
> 
> > +			$$(LINUX_MAKE_FLAGS) \
> > +			$$($(2)_MODULE_MAKE_OPTS) \
> > +			M=$$($(2)_DIR)/$$(d) \
> 
>  We usually use $(@D) instead of $(2)_DIR.

Ack.

> > +			modules$$(sep))
> > +endef
> > +$(2)_POST_BUILD_HOOKS += $(2)_KERNEL_MODULES_BUILD
> > +
> > +# Install the kernel module(s)
> > +define $(2)_KERNEL_MODULES_INSTALL
> > +	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
> > +		@$$(call MESSAGE,"Installing kernel module '$$(d)'")$$(sep) \
> > +		$$($$(PKG)_MAKE) -C $$(LINUX_DIR) \
> > +			$$(LINUX_MAKE_FLAGS) \
> > +			$$($(2)_MODULE_MAKE_OPTS) \
> > +			M=$$($(2)_DIR)/$$(d) \
> > +			modules_install$$(sep))
> > +endef
> > +$(2)_POST_INSTALL_TARGET_HOOKS += $(2)_KERNEL_MODULES_INSTALL
> > +
> > +endef
> > +
> > +################################################################################
> > +# kernel-module -- the target generator macro for kernel module packages
> > +################################################################################
> > +
> > +kernel-module = $(call inner-kernel-module,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> 
>  $(2) is the only one used, so just
> 
> kernel-module = $(call inner-kernel-module,$(call UPPERCASE,$(pkgname)))

Yup, already done. ;-)

Thanks! :-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
