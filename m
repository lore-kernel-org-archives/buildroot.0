From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:59:55 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200829145955.6aedeae6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Thu, 13 Aug 2020 14:32:14 -0700
Christian Stewart <christian@paral.in> wrote:

> The Go compiler needs to know the "import path" to the root of package source
> repositories. Previously, this was done by creating a fake _gopath in the build
> directory and symlinking the package source into that path.
> 
> Go has deprecated the GOPATH mechanism in favor of a new approach - Modules -
> which specifies the root import path (and dependencies) in a "go.mod" file.
> 
> This commit moves Buildroot to use the new go.mod approach. Both host and target
> Go packages compile correctly with small tweaks adjusting the build target
> specifier.
> 
> Note: the Go module system will NOT download sources from the Internet due to
> GOPROXY=off and -mod=vendor. All Buildroot packages currently have "vendor"
> directories included with dependencies' source code.
> 
> The environment variables passed to Go during host and target package
> compilation have been fixed to correctly pass CC, CXX, CFLAGS, and so on.
> 
> Reference: https://github.com/golang/go/wiki/Modules
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

So, I have applied the whole series to our next branch, but with some
significant rework. First of all, the series was not bisectable: if you
applied PATCH 1/7 but not the others, things would be broken.

So instead, I did a number of preparation patches in the different Go
packages to set the GOMOD variable, then had the patch switching the
infrastructure to go.mod, and then patched again the packages to drop
anything that was no longer needed (such as <pkg>_WORKSPACE
definitions).

In addition, other changes were done, see below.


> -# For the convienience of target packages.
>  HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
> -HOST_GO_TARGET_ENV = \
> -	GO111MODULE=off \
> -	GOARCH=$(GO_GOARCH) \
> -	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
> +HOST_GO_COMMON_ENV = \
> +	CC=$(HOSTCC_NOCCACHE) \
> +	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> +	CXX=$(HOSTCXX_NOCCACHE) \
> +	GO111MODULE=on \
> +	GOBIN= \
> +	GOFLAGS=-mod=vendor \
> +	GOPATH="$(HOST_GO_GOPATH)" \
> +	GOPROXY=off \
>  	GOROOT="$(HOST_GO_ROOT)" \
> +	GOTOOLDIR="$(HOST_GO_TOOLDIR)" \
> +	PATH=$(BR_PATH)
> +
> +# Used for compiling host packages.
> +HOST_GO_HOST_ENV = \
> +	$(HOST_GO_COMMON_ENV) \
> +	CGO_CFLAGS="$(HOST_CFLAGS)" \
> +	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
> +	CGO_FFLAGS="$(HOST_FCFLAGS)" \
> +	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
> +	GOARCH="" \
> +	GOCACHE="$(HOST_GO_HOST_CACHE)"
> +
> +# Used for compiling the host-go compiler and target packages.
> +HOST_GO_CROSS_ENV = \
> +	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> +	CC_FOR_TARGET="$(TARGET_CC)" \
> +	CXX_FOR_TARGET="$(TARGET_CXX)" \
> +	GOARCH=$(GO_GOARCH) \
> +	GO_ASSUME_CROSSCOMPILING=1
> +
> +# Used for compiling target packages.
> +#
> +# Note: CC and CXX must be set as well as TARGET_ variants.
> +HOST_GO_TARGET_ENV = \
> +	$(HOST_GO_COMMON_ENV) \
> +	$(HOST_GO_CROSS_ENV) \
>  	CC="$(TARGET_CC)" \
>  	CXX="$(TARGET_CXX)" \
> -	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
> +	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> +	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +	CGO_FFLAGS="$(TARGET_FCFLAGS)" \
> +	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
> +	GOCACHE="$(HOST_GO_TARGET_CACHE)"
>  
>  # The go compiler's cgo support uses threads.  If BR2_TOOLCHAIN_HAS_THREADS is
>  # set, build in cgo support for any go programs that may need it.  Note that
> @@ -64,13 +100,6 @@ else
>  HOST_GO_CGO_ENABLED = 0
>  endif
>  
> -HOST_GO_CROSS_ENV = \
> -	CC_FOR_TARGET="$(TARGET_CC)" \
> -	CXX_FOR_TARGET="$(TARGET_CXX)" \
> -	GOARCH=$(GO_GOARCH) \
> -	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> -	GO_ASSUME_CROSSCOMPILING=1

This was *way* too much changes in one patch, and many of those changes
are completely unrelated to the go.mod integration. In addition, I was
not happy with some variables defined in HOST_GO_COMMON_ENV (such as
CC/CXX) being overridden later on in HOST_GO_TARGET_ENV for example.

So I split that up into many more commits, unrelated to the go.mod
integration:

package/go: add a HOST_GO_HOST_ENV variable
https://git.buildroot.org/buildroot/commit/?h=next&id=7c3e3cbcf215c56c378a912a6a6ca40edc61d7ad

package/go: introduce HOST_GO_COMMON_ENV
https://git.buildroot.org/buildroot/commit/?h=next&id=557282a9c046547daade72fe18e233006716d0b2

package/go: pass CFLAGS/CXXFLAGS/LDFLAGS in HOST_GO_TARGET_ENV
https://git.buildroot.org/buildroot/commit/?h=next&id=7a89fa07ee2813a515da91d884ce5920e1ba1887

package/go: re-integrate GO_COMMON_ENV into HOST_GO_COMMON_ENV
https://git.buildroot.org/buildroot/commit/?h=next&id=1a17e4ae996c4c6727a29f049892be5ae57d7e89

package/go: drop GO_TARGET_ENV / GO_HOST_ENV
https://git.buildroot.org/buildroot/commit/?h=next&id=0d26fb58b79c6412c49287923e562ea6c8d950e0

This dramatically helps understanding what each step is doing, rather
than having one massive change in all those variables that is really
difficult to follow/review.

>  else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  # host-go can still be used to build packages for the host. No need to set all
>  # the arch stuff since we will not be cross-compiling.
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 2494ce028c..2d80e99619 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -23,21 +23,11 @@
>  
>  GO_BIN = $(HOST_DIR)/bin/go
>  
> -# We pass an empty GOBIN, otherwise "go install: cannot install
> -# cross-compiled binaries when GOBIN is set"
> -GO_COMMON_ENV = \
> -	PATH=$(BR_PATH) \
> -	GOBIN= \
> -	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
> -
> -GO_TARGET_ENV = \
> -	$(HOST_GO_TARGET_ENV) \
> -	$(GO_COMMON_ENV)
> -
> -GO_HOST_ENV = \
> -	CGO_CFLAGS="$(HOST_CFLAGS)" \
> -	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
> -	$(GO_COMMON_ENV)
> +# Used when compiling host packages.
> +GO_HOST_ENV = $(HOST_GO_HOST_ENV)
> +
> +# Used when compiling target packages.
> +GO_TARGET_ENV =	$(HOST_GO_TARGET_ENV)

This got a bit changed by the patch mentioned above.

> +# $(2)_GOMOD is the root Go module path for the project, inferred if not set.
> +# If the go.mod file does not exist, one is written with this root path.
> +# Replaces the old GOPATH/symlink mechanism for setting the root import path.

It doesn't make much sense to have a comment about how it was before,
so I dropped this last line (suggested by Arnout).

> +$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
> +
> +# Correctly configure the go.mod and go.sum files for the module system.
> +# Note: Go is configured to use the "vendor" dir and not make network calls.
> +define $(2)_APPLY_EXTRACT_GOMOD
> +	if [ -f $$($(2)_PKGDIR)/go.mod ]; then \
> +		cp $$($(2)_PKGDIR)/go.mod $$(@D)/go.mod; \
> +		if [ -f $$(@D)/go.sum ]; then \
> +			rm $$(@D)/go.sum; \
> +		fi; \
> +	fi; \

There are no packages so far that provide their go.mod in their package
directory, so I dropped this.

> +	if [ -f $$($(2)_PKGDIR)/go.sum ]; then \
> +		cp $$($(2)_PKGDIR)/go.sum $$(@D)/go.sum; \
> +	fi

There are no packages so far that provide their go.sum in their package
directory, so I dropped this.

> +	if [ ! -f $$(@D)/go.mod ] && [ -n "$$($(2)_GOMOD)" ]; then \

The $(2)_GOMOD variable cannot be empty, so this second part of the
test was not needed, I dropped it.

> +		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
> +	fi
>  endef
> -endif
> +
> +$(2)_POST_EXTRACT_HOOKS += $(2)_APPLY_EXTRACT_GOMOD

After discussion with Arnout/Yann, we moved this to a POST_PATCH_HOOKS.

>  
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> @@ -111,26 +110,24 @@ endif
>  # Build package for target
>  define $(2)_BUILD_CMDS
>  	$$(foreach d,$$($(2)_BUILD_TARGETS),\
> -		cd $$($(2)_SRC_PATH); \
> +		cd $$(@D); \
>  		$$(GO_TARGET_ENV) \
> -			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>  			$$($(2)_GO_ENV) \
>  			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
>  			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
> -			./$$(d)
> +			$$(d)

Instead of this, I did:

			$$($(2)_GOMOD)/$$(d)

as it avoids repeating the GOMOD in the BUILD_TARGETS of all packages.

Also, you had forgotten to update the Buildroot manual to take into
account the changes that happened in the infrastructure.

Overall, the series looks like this:

7c3e3cbcf215c56c378a912a6a6ca40edc61d7ad package/go: add a HOST_GO_HOST_ENV variable
557282a9c046547daade72fe18e233006716d0b2 package/go: introduce HOST_GO_COMMON_ENV
7a89fa07ee2813a515da91d884ce5920e1ba1887 package/go: pass CFLAGS/CXXFLAGS/LDFLAGS in HOST_GO_TARGET_ENV
1a17e4ae996c4c6727a29f049892be5ae57d7e89 package/go: re-integrate GO_COMMON_ENV into HOST_GO_COMMON_ENV
0d26fb58b79c6412c49287923e562ea6c8d950e0 package/go: drop GO_TARGET_ENV / GO_HOST_ENV
01c5e0ed72007433160d858a8c06cc84eafc120c package/docker-containerd: define <pkg>_GOMOD variable
edb06ecf3b378f191d5ba36ba872d8a627b2eb53 package/docker-engine: define <pkg>_GOMOD variable
b80bcd7ffa5a815334ead9c99c6b938c4d6b5a7b package/docker-cli: define <pkg>_GOMOD variable
7afd262da0e2a8fee0ebd33049619346de660cb5 package/go: implement go modules integration
302bb3347cff943977042b0bf53194c797c9a41b package/runc: drop <pkg>_WORKSPACE variable
a7ed0ae6cca1b86f03b81d461ae18fbac28df262 package/docker-containerd: drop <pkg>_WORKSPACE variable
cfcf745e10f354c419e305f3ac334764becdeff9 package/docker-engine: drop <pkg>_SRC_SUBDIR variable
913fac5bb1c9e38bd38637ea0271a1c513529a67 package/docker-proxy: drop <pkg>_WORKSPACE variable
92584815bace88b0c0548d7ab7796854c92aaa99 package/mender-artifact: drop custom GOFLAGS
a289fc8b69b71a4ab0585e23e2004c01db821e2e docs/manual/adding-packages-golang.txt: update following go.mod integration

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
