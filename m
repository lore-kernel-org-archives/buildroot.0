From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 22:10:50 +0200
Subject: [Buildroot] [PATCH 08/20] packages: add infrastructure for
 virtual packages
In-Reply-To: <19c0bbf58268a2133297840b8763d415ad5a4ef0.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <19c0bbf58268a2133297840b8763d415ad5a4ef0.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <533F11CA.5040304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/14 21:27, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The virtual-package infrastructure allows to easily define a
> virtual package in a single line:
> 
>     $ cat package/some-virtual-package/some-virtual-package.mk
>     $(eval $(virtual-package))
> 
> And that's all. :-)
> 
> Thanks to ?ric for his work on the manual, that prompted the
> idea for this virtual-package infrastructure! ;-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/Makefile.in    |  1 +
>  package/pkg-virtual.mk | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 package/pkg-virtual.mk
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 454f614..c5cdf5a 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -362,4 +362,5 @@ include package/pkg-cmake.mk
>  include package/pkg-luarocks.mk
>  include package/pkg-perl.mk
>  include package/pkg-python.mk
> +include package/pkg-virtual.mk
>  include package/pkg-generic.mk
> diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
> new file mode 100644
> index 0000000..9b206ea
> --- /dev/null
> +++ b/package/pkg-virtual.mk
> @@ -0,0 +1,66 @@
> +################################################################################
> +# Virtual package infrastructure
> +#
> +# This file implements an infrastructure that eases development of
> +# package .mk files for virtual packages. It should be used for all
> +# virtual packages.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this virtual infrastructure requires
> +# the .mk file to only call the 'virtual-package' macro.
> +#
> +################################################################################
> +
> +
> +################################################################################
> +# inner-virtual-package -- defines the dependency rules of the virtual
> +# package against its provider.
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including an HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +# Note: putting this comment here rather than in the define block, otherwise
> +# make would try to expand the $(error ...) in the comment, which is not
> +# really what we want.

 That could be avoided by $$-quoting it inside the comment as well :-)

> +# We need to use second-expansion for the $(error ...) call, below,
> +# so it is not evaluated now, but as part of the generated make code.
> +
> +define inner-virtual-package
> +
> +# Ensure the virtual package has an implementation defined.
> +ifeq ($(BR2_PACKAGE_HAS_$(2)),y)

 Even though it is not strictly necessary (it will anyway be eval'ed
immediately after expansion), I think it's better to consistently use $$
everywhere (except for $(1) etc. of course). Currently it's not done
consistently in package-generic but it would be better to make it
consistent here.

> +ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2))),)
> +$$(error No implementation selected for virtual package $(1). Configuration error)

 I think "Configuration error" is a bit vague, but I can't think of
anything better.

> +endif
> +endif
> +
> +# A virtual package does not have any source associated
> +$(2)_SOURCE =
> +
> +# This must be repeated from inner-generic-package, otherwise we get an empty
> +# _DEPENDENCIES
> +$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
> +	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +
> +# Add dependency against the provider
> +$(2)_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2)))
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))

 I don't really see the need to call inner-generic-package here. Isn't it
sufficient to do:

ifeq ($$(BR2_PACKAGE_HAS_$(2)),y)
ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)
$$(error No implementation selected for virtual package $(1).
Configuration error)
endif
endif

$(1): $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))

 We don't need all the rest of the package infrastructure, do we? We
don't need to download any sources, we don't need legal info for the
virtual package, etc. etc. There's also no need to create stamp files


> +
> +endef
> +
> +################################################################################
> +# virtual-package -- the target generator macro for virtual packages
> +################################################################################
> +
> +virtual-package = $(call inner-virtual-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> +host-virtual-package = $(call inner-virtual-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)

 Note that with the simplification above, you only need the first two
arguments to the inner-virtual-package macro.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
