From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 16:17:22 +0200
Subject: [Buildroot] [PATCH v4 2/8] package/pkg-golang: new package
 infrastructure
In-Reply-To: <20180331132736.21105-3-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
 <20180331132736.21105-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180331141722.GF25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Angelo, All,

On 2018-03-31 15:27 +0200, Thomas Petazzoni spake thusly:
> From: Angelo Compagnucci <angelo@amarulasolutions.com>
> 
> This patch adds a new infrastructure for golang based packages.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/Makefile.in   |   1 +
>  package/pkg-golang.mk | 136 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
>  create mode 100644 package/pkg-golang.mk
[--SNIP--]
> +#
> +# The go build/install command installs the binaries inside
> +# gopath/bin/linux_GOARCH/ when cross compilation is enabled. We set
> +# this variable here to be used by packages if needed.
> +#
> +$(2)_BINDIR = $$($(2)_WORKSPACE)/bin/linux_$$(GO_GOARCH)
> +
> +#
> +# Source files in Go should be uncompressed in a precise folder in the

s/uncompressed/extracted/

> +# hierarchy of GOPATH. It usually resolves around
> +# domain/vendor/software. By default, we derive domain/vendor/software
> +# from the upstream URL of the project, but we allow $(2)_SRC_SUBDIR
> +# to be overridden if needed.
> +#
> +$(2)_SRC_DOMAIN = $$(call domain,$($(2)_SITE))

I was a bit surprised not to see the definition of 'domain' here, but it
is infact a generic macro, from the download infra...

OK, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
> +$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
> +
> +$(2)_SRC_SUBDIR ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
> +$(2)_SRC_PATH = $$(@D)/$$($(2)_WORKSPACE)/src/$$($(2)_SRC_SUBDIR)
> +
> +#
> +# Configure step. Only define it if not already defined by the package
> +# .mk file.
> +#
> +ifndef $(2)_CONFIGURE_CMDS
> +define $(2)_CONFIGURE_CMDS
> +	mkdir -p $$(@D)/$$($(2)_WORKSPACE)/bin
> +	mkdir -p $$(dir $$($(2)_SRC_PATH))
> +	ln -sf $$(@D) $$($(2)_SRC_PATH)
> +endef
> +endif
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file. We use the install command instead of build command here
> +# because the install command also moves the package binaries in
> +# <workspace>/bin/linux_GOARCH/. Using the install command also
> +# leverages the go build infrastructure for building and installing
> +# multiple binaries.
> +#
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	$$(foreach d,$$($(2)_BUILD_TARGETS),\
> +		cd $$($(2)_SRC_PATH) && $$($(2)_GO_ENV) $$(GO_BIN) install -v $$($(2)_BUILD_OPTS) ./$$(d)
> +	)
> +endef
> +endif
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +	$$(foreach d,$$($(2)_INSTALL_BINS),\
> +		$(INSTALL) -D -m 0755 $$(@D)/$$($(2)_BINDIR)/$$(d) $(TARGET_DIR)/usr/bin/$$(d)
> +	)
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +
> +endef # inner-golang-package
> +
> +################################################################################
> +# golang-package -- the target generator macro for Go packages
> +################################################################################
> +
> +golang-package = $(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
