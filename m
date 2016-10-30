From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:30:43 +0100
Subject: [Buildroot] [PATCH 02/10] core: add waf-package infra
In-Reply-To: <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <6556713514fd3c751384c5ea655420dba5e8876a.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <519685b5-583b-895e-7803-182c4a86ba6a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> This new waf-package infrastructure simplifies writing waf-based
> packages. It can be used by our six current such packages, plus a
> later-incoming one by Romain.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Tested with aubio package which will be added latter]
Tested-by: Romain Naour <romain.naour@gmail.com>

> ---
>  package/Makefile.in |   1 +
>  package/pkg-waf.mk  | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 package/pkg-waf.mk
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 5d591e9..dd18d2b 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -398,3 +398,4 @@ include package/pkg-generic.mk
>  include package/pkg-kconfig.mk
>  include package/pkg-rebar.mk
>  include package/pkg-kernel-module.mk
> +include package/pkg-waf.mk
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> new file mode 100644
> index 0000000..b36f47a
> --- /dev/null
> +++ b/package/pkg-waf.mk
> @@ -0,0 +1,119 @@
> +################################################################################
> +# WAF package infrastructure
> +#
> +# This file implements an infrastructure that eases development of package
> +# .mk files for WAF packages. It should be used for all packages that use
> +# WAF as their build system.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this WAF infrastructure requires the .mk file
> +# to only specify metadata information about the package: name, version,
> +# download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different steps
> +# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
> +# it is used as the list of commands to perform to build the package,
> +# instead of the default WAF behaviour. The package can also define some
> +# post operation hooks.
> +#
> +################################################################################
> +
> +################################################################################
> +# inner-waf-package -- defines how the configuration, compilation and
> +# installation of a waf package should be done, implements a few hooks
> +# to tune the build process for waf specifities and calls the generic
> +# package infrastructure to generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +define inner-waf-package
> +
> +# If the package does not have its own waf, use our own.
> +ifeq ($$($(2)_BUNDLED_WAF),NO)
> +# Dependency on host-python is done by host-waf
> +$(2)_DEPENDENCIES += host-waf
> +$(2)_WAF = $(HOST_DIR)/usr/bin/waf
> +else
> +# We need host-python to run the package's waf
> +$(2)_DEPENDENCIES += host-python
> +$(2)_WAF = ./waf
> +endif
> +
> +ifndef $(2)_MAKE
> + ifdef $(3)_MAKE
> +  $(2)_MAKE = $$($(3)_MAKE)
> + else
> +  $(2)_MAKE ?= $$(MAKE)
> + endif
> +endif
> +
> +#
> +# Configure step. Only define it if not already defined by the package
> +# .mk file.
> +#
> +ifndef $(2)_CONFIGURE_CMDS
> +define $(2)_CONFIGURE_CMDS
> +	cd $$(@D) && \
> +	$$(TARGET_CONFIGURE_OPTS) \
> +	$$($(2)_CONF_ENV) \
> +	$$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) configure \
> +		--prefix=/usr \
> +		--libdir=/usr/lib \
> +		$$($(2)_CONF_OPTS)
> +endef
> +endif
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	cd $$(@D) && \
> +	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
> +endef
> +endif
> +
> +#
> +# Staging installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_STAGING_CMDS
> +define $(2)_INSTALL_STAGING_CMDS
> +	cd $$(@D) && \
> +	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> +		install --destdir=$$(STAGING_DIR)
> +endef
> +endif
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +	cd $$(@D) && \
> +	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
> +		install --destdir=$$(TARGET_DIR)
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +
> +endef
> +
> +################################################################################
> +# waf-package -- the target generator macro for WAF packages
> +################################################################################
> +
> +waf-package = $(call inner-waf-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> 
