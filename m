From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 08 Jun 2015 23:09:39 +0200
Subject: [Buildroot] [PATCH 01/11] package-infra: add helper to build
 kernel modules
In-Reply-To: <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
 <7f37dfb955f969acf85ea5044c1c4020096d2270.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <55760493.1070807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/07/15 00:20, Yann E. MORIN wrote:
> The Linux kernel offers a nice and easy-to-use infra to build
> out-of-tree kernel modules.
> 
> Currently, we have quite a few packages that build kernel modules, and
> most dupliacte (or rewrite) the same code over-and-over again.

 duplicate

> 
> Introduce a new infrastructure that provides helpers to build kernel
> modules, so packages do not have to duplicate/rewrite that.
> 
> The infrastrucutre, unlike any other package infra, is not standalone.

 infrastructure

> It needs another package infra to be used. This is so that packages that
> provide both userland and kernel modules can be built easily. So, this
> infra only defines post-build and post-install hooks, that will build
> the kernel modules after the rest of the package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Makefile.in          |  1 +
>  package/pkg-kernel-module.mk | 94 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 package/pkg-kernel-module.mk
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index c02d31f..180fd46 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -398,3 +398,4 @@ include package/pkg-virtual.mk
>  include package/pkg-generic.mk
>  include package/pkg-kconfig.mk
>  include package/pkg-rebar.mk
> +include package/pkg-kernel-module.mk

 I think we should at some point put this either in alphabetical or some other
logical order. But for now, it's chaos anyway so OK to just add at the end.

> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> new file mode 100644
> index 0000000..2a2a2cb
> --- /dev/null
> +++ b/package/pkg-kernel-module.mk
> @@ -0,0 +1,94 @@
> +################################################################################
> +# kernel module infrastructure for building Linux kernel modules
> +#
> +# This file implements an frastructure that eases development of package .mk

 infrastructure

> +# files for out-of-tree Linux kernel modules. It should be used for all
> +# packages that build a Linux kernel module.

 Well, as you say in the cover text, there are a few packages with awkward build
systems that can't use this infra.

> +#
> +# In terms of implementation, this infrastructure requires the .mk file to
> +# only specify metadata information about the package: name, version,
> +# download URL, etc.

 I think this is another cut&paste from pkg-generic that is not appropriate.

> +#
> +# It defines post-build and post-install hooks, so that packages can both
> +# build user-space (with any of the other *-package infra) and/or build
> +# kernel modules.
> +#
> +# As such, it is to be used in conjunction with another *-package infra,
> +# like so:
> +#
> +#   $(eval $(kernel-module))
> +#   $(eval $(generic-package))
> +#
> +# Note: if the caller needs access to the kernel modules (either after they
> +# are built or after they are installed), it will have to define its own
> +# post-build/install hooks after calling kernel-module, but before calling
> +# the other *-package infra, like so:
> +#
> +#   $(eval $(kernel-module))
> +#   define FOO_MOD_TWEAK
> +#   	# do something
> +#   endef
> +#   FOO_POST_BUILD_HOOKS += FOO_MOD_TWEAK
> +#   $(eval $(generic-package))

 That is not so nice, but I don't see a better alternative.

> +#
> +# Note: this infra does not check that the kernel is enabled; it is expected
> +# to be enforced at the Kconfig level with proper 'depends on'.
> +################################################################################
> +
> +################################################################################
> +# inner-kernel-module -- generates the make targets needed to support building
> +# a kernel module
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (always 'target')

 $(2) is the only one that is used...

> +################################################################################
> +
> +define inner-kernel-module
> +
> +# The kernel must be built first.
> +$(2)_DEPENDENCIES += linux
> +
> +# Duplicate that from pkg-generic because we need it now
> +ifndef $(2)_MAKE
> +  $(2)_MAKE = $(MAKE)
> +endif

 I don't see why this is needed... The defines below will only be expanded when
the rule is executed (otherwise $(PKG) would not even be defined), so the
definition from pkg-generic is enough, no?

> +
> +ifndef $(2)_MODULE_SUBDIRS
> +  $(2)_MODULE_SUBDIRS = .
> +endif
> +
> +# Build the kernel module(s)
> +define $(2)_KERNEL_MODULES_BUILD
> +	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
> +		@$$(call MESSAGE,"Building kernel module '$$(d)'")$$(sep) \

 I think that "Building kernel module '.'" looks a bit weird... But again, I
can't think of an alternative.

> +		$$($$(PKG)_MAKE) -C $$(LINUX_DIR) \

 Missing $(LINUX_MAKE_ENV) (or at least TARGET_MAKE_ENV, but I think
LINUX_MAKE_ENV is more appropriate even if it just adds BR_BINARIES_DIR).


> +			$$(LINUX_MAKE_FLAGS) \
> +			$$($(2)_MODULE_MAKE_OPTS) \
> +			M=$$($(2)_DIR)/$$(d) \

 We usually use $(@D) instead of $(2)_DIR.

> +			modules$$(sep))
> +endef
> +$(2)_POST_BUILD_HOOKS += $(2)_KERNEL_MODULES_BUILD
> +
> +# Install the kernel module(s)
> +define $(2)_KERNEL_MODULES_INSTALL
> +	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
> +		@$$(call MESSAGE,"Installing kernel module '$$(d)'")$$(sep) \
> +		$$($$(PKG)_MAKE) -C $$(LINUX_DIR) \
> +			$$(LINUX_MAKE_FLAGS) \
> +			$$($(2)_MODULE_MAKE_OPTS) \
> +			M=$$($(2)_DIR)/$$(d) \
> +			modules_install$$(sep))
> +endef
> +$(2)_POST_INSTALL_TARGET_HOOKS += $(2)_KERNEL_MODULES_INSTALL
> +
> +endef
> +
> +################################################################################
> +# kernel-module -- the target generator macro for kernel module packages
> +################################################################################
> +
> +kernel-module = $(call inner-kernel-module,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)

 $(2) is the only one used, so just

kernel-module = $(call inner-kernel-module,$(call UPPERCASE,$(pkgname)))


 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
