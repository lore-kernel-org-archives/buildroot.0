From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 22:26:40 +0200
Subject: [Buildroot] [PATCH 4/8 RFC] package/pkg-golang.mk:
 infrastructure for Go packages
In-Reply-To: <1454369465-4804-5-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
 <1454369465-4804-5-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <20160601222640.30719819@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Feb 2016 00:31:01 +0100, Ludovic Guegan wrote:
> +
> +GO_ENV = PATH=$(BR_PATH) GOPATH=$($PKGDIR)
> +
> +#
> +# If compiling for the target then set GOARCH accordingly.
> +#
> +
> +ifeq ($(4),target)
> +
> +ifeq ($(BR2_i386),y)
> +GOLANG_ARCH = 386
> +endif # i386
> +
> +ifeq ($(BR2_x86_64),y)
> +GOLANG_ARCH = amd64
> +endif # x86_64
> +
> +ifeq ($(BR2_arm),y)
> +GOLANG_ARCH = arm
> +endif # arm
> +
> +GO_ENV += GOARCH=$(GOLANG_ARCH)

This should all be rebased on top of the Go support that has been
merged, which already exposes some environment variables that can be
used to build Go packages.

> +endif # ($(4),target)
> +
> +################################################################################
> +#
> +# Go packages are normally fetch using "go get", unfortunatly this method
> +# fetch the HEAD reference of the package. We use golang-gb in order to
> +# implement reproducible builds.
> +#
> +#  argument 1 is the package name to fetch as specified in the source code
> +#  argument 2 is the revision reference
> +################################################################################
> +
> +define fetch-golang-package
> +	cd $($(PKG)_SRCDIR); \
> +		env -i $(GO_ENV) gb vendor fetch -no-recurse -revision $(2) $(1);
> +endef

This is not good. Fetching additional stuff within a package is not
correct, as it works around the Buildroot download and legal-info
mechanisms. If a Go package has a dependency, then a proper Buildroot
package should be created for it.

> +#
> +# Fetch go package if $($(PKG)_DEPS) is defined
> +#
> +ifdef $(2)_DEPS
> +
> +define $(2)_FETCH_DEPS
> +	mkdir -p $$($$(PKG)_DIR)/{src,vendor}
> +	cd $$($$(PKG)_SRCDIR); env -i $(GO_ENV) gb vendor delete --all
> +	$$($$(PKG)_DEPS)
> +endef
> +
> +$(2)_POST_DOWNLOAD_HOOKS += $(2)_FETCH_DEPS

See my comment above.

> +
> +endif # $(2)_DEPS
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk file.
> +# There is no differences between host and target packages.
> +#
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	$(foreach p,$$($$(PKG)_BUILD_PACKAGES), cd $$($$(PKG)_SRCDIR); \
> +		env -i $(GO_ENV) gb build $(p))

We don't use "env -i" anywhere else in Buildroot, so I don't see why
you're using it everywhere here.

> +endef
> +endif
> +
> +#
> +# The variable $(2)_INSTALL_BINARIES list the binaries to install. Go programs
> +# are named after the last part of their package. If $(2)_INSTALL_BINARIES is
> +# not define, it is created from $(2)_BUILD_PACKAGES. 
> +#
> +ifndef $(2)_INSTALL_BINARIES
> + ifdef $(3)_INSTALL_BINARIES
> +  $(2)_INSTALL_BINARIES = $$($(3)_INSTALL_BINARIES)

So here, if we are a host package, and HOST_<pkg>_INSTALL_BINARIES is
not defined, we inherit the value of <pkg>_INSTALL_BINARIES (i.e the
value of the target package). Looks good.

> + else
> +  $(2)_INSTALL_BINARIES = $(foreach p, $($(2)_BUILD_PACKAGES), $(lastword $(subst /, ,$(p))))

What if $(2)_BUILD_PACKAGES is empty, but not $(3)_BUILD_PACKAGES?
Shouldn't $(2)_BUILD_PACKAGES inherit from $(3)_BUILD_PACKAGES when
$(2)_BUILD_PACKAGES is not defined?

> + endif
> +endif
> +
> +#
> +# Host installation step. Only define it if not already defined by the
> +# package .mk file.
> +#
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +	$(foreach p,$$($$(PKG)_INSTALL_BINARIES), \
> +		$(INSTALL) -m 755 $$($$(PKG)_DIR)/bin/$(p) $(HOST_DIR)/usr/bin)

$(INSTALL) -D -m 0755 <origin> <full destination path>

So Go packages will only ever install programs in $(HOST_DIR)/usr/bin.
They never install icons, data files, configuration files, etc. ?

> +endef
> +endif
> +
> +#
> +# Target installation step. Only define it if not already defined by the
> +# package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +	$(foreach p,$$($$(PKG)_INSTALL_BINARIES), \
> +		$(INSTALL) -m 755 $$($$(PKG)_DIR)/bin/$(p) $(TARGET_DIR)/usr/bin)

Same comments as above.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
