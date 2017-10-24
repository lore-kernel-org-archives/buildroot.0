From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Oct 2017 22:44:24 +0200
Subject: [Buildroot] [RFC v3 1/4] package/pkg-golang: new package
	infrastructure
In-Reply-To: <CABa6e=qOcvjw2pWR9YDxA=xpzm-7CY59R6yiRsCfeXfJkA6pNg@mail.gmail.com>
References: <1508776814-18723-1-git-send-email-angelo.compagnucci@gmail.com>
 <CABa6e=qOcvjw2pWR9YDxA=xpzm-7CY59R6yiRsCfeXfJkA6pNg@mail.gmail.com>
Message-ID: <CA+TH9VmNk9tan789V7AGM=fhArLyc0z6eDmjsJhVcLmrMVO4TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cam Hutchison,

2017-10-24 21:56 GMT+02:00 Cam Hutchison <cam@camh.ch>:
> On 24 October 2017 at 03:40, Angelo Compagnucci
> <angelo.compagnucci@gmail.com> wrote:
>> This patch adds a new infrastructure for golang based packages.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>> ---
>>  package/Makefile.in   |   1 +
>>  package/pkg-golang.mk | 140 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 141 insertions(+)
>>  create mode 100644 package/pkg-golang.mk
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index a1a5316..60d98d0 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -429,3 +429,4 @@ include package/pkg-kconfig.mk
>>  include package/pkg-rebar.mk
>>  include package/pkg-kernel-module.mk
>>  include package/pkg-waf.mk
>> +include package/pkg-golang.mk
>> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
>> new file mode 100644
>> index 0000000..262f0e0
>> --- /dev/null
>> +++ b/package/pkg-golang.mk
>> @@ -0,0 +1,140 @@
>> +################################################################################
>> +# Golang package infrastructure
>> +#
>> +# This file implements an infrastructure that eases development of
>> +# package .mk files for Go packages. It should be used for all
>> +# packages that are written in go.
>> +#
>> +# See the Buildroot documentation for details on the usage of this
>> +# infrastructure
>> +#
>> +#
>> +# In terms of implementation, this golang infrastructure requires
>> +# the .mk file to only specify metadata information about the
>> +# package: name, version, download URL, etc.
>> +#
>> +# We still allow the package .mk file to override what the different
>> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
>> +# already defined, it is used as the list of commands to perform to
>> +# build the package, instead of the default golang behavior. The
>> +# package can also define some post operation hooks.
>> +#
>> +################################################################################
>> +
>> +################################################################################
>> +# inner-golang-package -- defines how the configuration, compilation and
>> +# installation of a Go package should be done, implements a few hooks to
>> +# tune the build process for Go specificities and calls the generic package
>> +# infrastructure to generate the necessary make targets
>> +#
>> +#  argument 1 is the lowercase package name
>> +#  argument 2 is the uppercase package name, including a HOST_ prefix
>> +#             for host packages
>> +#  argument 3 is the uppercase package name, without the HOST_ prefix
>> +#             for host packages
>> +#  argument 4 is the type (target or host)
>> +################################################################################
>> +
>> +define inner-golang-package
>> +
>> +$(2)_GOPATH ?= gopath
>
> Normally there would not be a GOPATH inside the source directory - it
> is the other way around - a source directory under src/ in GOPATH.

Yes I know, but this way of doing is dictated by the buildroot
internals cause everything related to a package should be done inside
that package build directory.

> Since
> it is being done this way I think "gopath" should be "_gopath" or any
> other name starting with an underscore.
>
> https://golang.org/cmd/go/#hdr-Description_of_package_lists
>
> The last paragraph of that directories starting with an underscore are ignored
> by the go tool. This might help prevent infinite recursion if some tool keeps
> following the directory tree down though "gopath" and back to the source
> directory via the symlink installed by the CONFIGURE_CMD.

Good suggestion, will do!

>
>> +
>> +ifndef $(2)_MAKE_ENV
>> +define $(2)_MAKE_ENV
>> +       $$(HOST_GO_TARGET_ENV) \
>> +       GOPATH="$$(@D)/$$($(2)_GOPATH)" \
>> +       CGO_ENABLED=$$(HOST_GO_CGO_ENABLED)
>> +endef
>> +endif
>> +
>> +ifdef $(2)_GO_LDFLAGS
>> +       $(2)_BUILD_OPTS += -ldflags "$$($(2)_GO_LDFLAGS)"
>> +endif
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +       $(2)_BUILD_OPTS += -extldflags '-static'
>> +endif
>> +
>> +ifdef $(2)_GO_TAGS
>> +       $(2)_BUILD_OPTS += -tags "$$($(2)_GO_TAGS)"
>> +endif
>> +
>> +# Target packages need the Go compiler on the host.
>> +$(2)_DEPENDENCIES += host-go
>> +
>> +#
>> +# The go build/install command installs the binaries inside
>> +# gopath/bin/linux_GOARCH/ when cross compilation is enabled.
>> +# We set this variable here to be used by packages if needed.
>> +#
>> +$(2)_BINDIR = $$(@D)/$$($(2)_GOPATH)/bin/linux_$$(GO_GOARCH)
>> +
>> +#
>> +# Source files in Go should be uncompressed in a precise folder in the
>> +# hierarchy of GOPATH. It usually resolves around domain/vendor/software.
>> +#
>> +$(2)_GO_SRC_PATH ?= $$(call domain,$($(2)_SITE))/$$(firstword $$(subst /, ,$$(call notdomain,$($(2)_SITE))))
>> +$(2)_SRC_PATH  = $$(@D)/$$($(2)_GOPATH)/src/$$($(2)_GO_SRC_PATH)/$(1)
>> +
>> +#
>> +# Configure step. Only define it if not already defined by the package
>> +# .mk file. And take care of the differences between host and target
>> +# packages.
>> +#
>> +ifndef $(2)_CONFIGURE_CMDS
>> +define $(2)_CONFIGURE_CMDS
>> +       mkdir -p $$(@D)/$$($(2)_GOPATH)/bin
>> +       mkdir -p $$(@D)/$$($(2)_GOPATH)/src/$$($(2)_GO_SRC_PATH)
>> +       ln -sf $$(@D) $$($(2)_SRC_PATH)
>> +endef
>> +endif
>> +
>> +#
>> +# Build step. Only define it if not already defined by the package .mk file.
>> +# There is no differences between host and target packages.
>> +# We use the install command instead of build command here because the
>> +# install command also moves the package binaries in gopath/bin/linux_GOARCH/.
>> +# Using the install command also leverages the go build infrastructure
>> +# for building and installing multiple binaries.
>> +#
>> +ifndef $(2)_BUILD_CMDS
>> +define $(2)_BUILD_CMDS
>> +       cd $$($(2)_SRC_PATH) && \
>> +               $$($(2)_MAKE_ENV) $(HOST_DIR)/bin/go install \
>> +               -v $$($(2)_BUILD_OPTS)
>> +endef
>> +endif
>> +
>> +#
>> +# Host installation step. Only define it if not already defined by the
>> +# package .mk file.
>> +#
>> +ifndef $(2)_INSTALL_CMDS
>> +define $(2)_INSTALL_CMDS
>> +       $(INSTALL) -D -m 0755 $$($(2)_BINDIR)/$(1) $(HOST_DIR)/usr/bin/
>> +endef
>> +endif
>> +
>> +#
>> +# Target installation step. Only define it if not already defined by the
>> +# package .mk file.
>> +#
>> +ifndef $(2)_INSTALL_TARGET_CMDS
>> +define $(2)_INSTALL_TARGET_CMDS
>> +       $(INSTALL) -D -m 0755 $$($(2)_BINDIR)/$(1) $(TARGET_DIR)/usr/bin/
>> +endef
>> +endif
>> +
>> +# Call the generic package infrastructure to generate the necessary make
>> +# targets
>> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
>> +
>> +endef # inner-golang-package
>> +
>> +################################################################################
>> +# golang-package -- the target generator macro for Go packages
>> +################################################################################
>> +
>> +golang-package = $(call inner-golang-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
>> +host-golang-package = $(call inner-golang-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
>> +
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
