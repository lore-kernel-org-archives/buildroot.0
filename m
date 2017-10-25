From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Oct 2017 10:53:19 +0200
Subject: [Buildroot] [RFC v4 1/4] package/pkg-golang: new package
	infrastructure
In-Reply-To: <2217102f-7e55-04c0-3553-af6c7a56f530@mind.be>
References: <1508879672-12957-1-git-send-email-angelo.compagnucci@gmail.com>
 <2217102f-7e55-04c0-3553-af6c7a56f530@mind.be>
Message-ID: <CA+TH9VnnUsm25L-otY_2Y_etDkc4Zvbzcbu98AKigLeSMWpHbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2017-10-25 0:39 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Angelo,
>
>  Incomplete review but at least something you can work with :-)
>
> On 24-10-17 23:14, Angelo Compagnucci wrote:
>> This patch adds a new infrastructure for golang based packages.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> [snip]> +define inner-golang-package
>> +
>> +$(2)_GOPATH ?= _gopath
>
>  Is there ever a need for a package to override this? docker-containerd sets it
> to 'vendor' but I don't think there's a good reason for that.

Yes, there's a reason for that. I converted also the docker-containerd
package and in the following respin of the patch you can see why it is
needed.

>> +
>> +ifndef $(2)_MAKE_ENV
>> +define $(2)_MAKE_ENV
>> +     $$(HOST_GO_TARGET_ENV) \
>> +     GOPATH="$$(@D)/$$($(2)_GOPATH)" \
>> +     CGO_ENABLED=$$(HOST_GO_CGO_ENABLED)
>> +endef
>> +endif
>
>  Don't do it like this, do it like in autotools: these options are always
> provided in the build environment, and $(2)_MAKE_ENV (default empty but no need
> to set it here) comes after it.
>
>  Also, _MAKE_ENV is not a good name since you're not calling make. Just _ENV or
> _BUILD_ENV or _GO_ENV is better.

Will do.

>
>> +
>> +ifdef $(2)_GO_LDFLAGS
>> +     $(2)_BUILD_OPTS += -ldflags "$$($(2)_GO_LDFLAGS)"
>> +endif
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +     $(2)_BUILD_OPTS += -extldflags '-static'
>> +endif
>
>  This is NOT what is currently done for flannel and runc, they put this in the
> -ldflags argument.

Good catch!

>
>> +
>> +ifdef $(2)_GO_TAGS
>> +     $(2)_BUILD_OPTS += -tags "$$($(2)_GO_TAGS)"
>> +endif
>
>  I guess it would make sense to also have
>
> $(2)_GO_TAGS ?= $$($(3)_GO_TAGS)
>
> (i.e. inherit the target tags for the host) though I'm not sure that is always
> going to be relevant.
>
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
>
>  What about host packages?
>
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
>
>  I don't see any differences?
>
>> +# packages.
>> +#
>> +ifndef $(2)_CONFIGURE_CMDS
>> +define $(2)_CONFIGURE_CMDS
>> +     mkdir -p $$(@D)/$$($(2)_GOPATH)/bin
>> +     mkdir -p $$(@D)/$$($(2)_GOPATH)/src/$$($(2)_GO_SRC_PATH)
>> +     ln -sf $$(@D) $$($(2)_SRC_PATH)
>> +endef
>> +endif
>> +
>> +#
>> +# Build step. Only define it if not already defined by the package .mk file.
>> +# There is no differences between host and target packages.
>
>  Really? How is that possible that exactly the same commands sometimes build for
> the host and sometimes for the target?
>
>  Since we currently don't have host-go packages, I think it's better to remove
> support for host-go packages entirely. We can add it when there is an example.

Yes, reasoning on that I think you are right. I'll remove the host part.

>
>> +# We use the install command instead of build command here because the
>> +# install command also moves the package binaries in gopath/bin/linux_GOARCH/.
>> +# Using the install command also leverages the go build infrastructure
>> +# for building and installing multiple binaries.
>> +#
>> +ifndef $(2)_BUILD_CMDS
>> +define $(2)_BUILD_CMDS
>> +     cd $$($(2)_SRC_PATH) && \
>> +             $$($(2)_MAKE_ENV) $(HOST_DIR)/bin/go install \
>> +             -v $$($(2)_BUILD_OPTS)
>> +endef
>> +endif
>> +
>> +#
>> +# Host installation step. Only define it if not already defined by the
>> +# package .mk file.
>> +#
>> +ifndef $(2)_INSTALL_CMDS
>> +define $(2)_INSTALL_CMDS
>> +     $(INSTALL) -D -m 0755 $$($(2)_BINDIR)/$(1) $(HOST_DIR)/usr/bin/
>> +endef
>> +endif
>> +
>> +#
>> +# Target installation step. Only define it if not already defined by the
>> +# package .mk file.
>> +#
>> +ifndef $(2)_INSTALL_TARGET_CMDS
>> +define $(2)_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -D -m 0755 $$($(2)_BINDIR)/$(1) $(TARGET_DIR)/usr/bin/
>
>  There is no guarantee at all that the binary name is the same as the package
> name, so better let the package override it.

Nope. Go mandates[1] that if a package contains only a binary, that
binary will be named as the package unless you overwrite this behavior
with the -o option at build time.
If a package contains multiples main.go files, each binary will be
named with name of the subfolder containing it and -o option is of
source disabled.

> Also, it would be convenient to
> support building multiple binaries like is done now for docker-containerd and
> docker-engine. But I'm all for delaying that to a future patch, let's get this
> thing in first.

Honestly, it's not so common in the go world to have multiple binaries
in the same source tree. I think we should treat this as a corner case
and let the developer doing what it's best. In the follow up of the
series I added also docker-containerd to show how a non standard
package could be implemented.

>
>
>  Regards,
>  Arnout
>
>
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
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

[1] https://golang.org/cmd/go/#hdr-Compile_packages_and_dependencies



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
