From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 14 Jan 2020 10:56:47 -0600
Subject: [Buildroot] [PATCH v2 1/6] package/go: implement go modules
 integration
In-Reply-To: <20200111041355.21705-1-christian@paral.in>
References: <20200111041355.21705-1-christian@paral.in>
Message-ID: <18bb82ad-f3fd-d360-ee60-b3d1c4743057@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

I tested this with a HOST Go package that i've got for git-lfs that I 
haven't submitted yet and it needed a couple of tweaks.

lmk your thoughts

On 1/10/20 10:13 PM, Christian Stewart wrote:
> This commit moves from the GOPATH mechanism to the new GO111MODULE approach for
> Go based packages. Old Go packages compile with small tweaks. All Golang
> packages currently in Buildroot have been build-tested after the change.
>
> The Go module system replaces the GOPATH mechanism by allowing the Go tool to
> work with packages correctly without a GOPATH tree.
>
> Reference: https://github.com/golang/go/wiki/Modules
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   package/go/go.mk      |  6 +++++-
>   package/pkg-golang.mk | 43 ++++++++++++++++++++++++++-----------------
>   2 files changed, 31 insertions(+), 18 deletions(-)
>
> diff --git a/package/go/go.mk b/package/go/go.mk
> index a0f796c21b..46acda7dd0 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -15,6 +15,8 @@ HOST_GO_DEPENDENCIES = host-go-bootstrap
>   HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
>   HOST_GO_ROOT = $(HOST_DIR)/lib/go
>   HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
> +# used for the Go module and build cache
> +HOST_GO_GOPATH = $(DL_DIR)/go-module
>   
>   ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
>   
> @@ -46,10 +48,12 @@ endif
>   # For the convienience of target packages.
>   HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
>   HOST_GO_TARGET_ENV = \
> -	GO111MODULE=off \
> +	GO111MODULE=on \
>   	GOARCH=$(GO_GOARCH) \
>   	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
> +	GOPROXY=off \
>   	GOROOT="$(HOST_GO_ROOT)" \
> +	GOPATH="$(HOST_GO_GOPATH)" \
>   	CC="$(TARGET_CC)" \
>   	CXX="$(TARGET_CXX)" \
>   	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
I did some additional factoring out here so that shared variables for 
Host and Target packages only need to be updated in one place

 ?HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 ?HOST_GO_TARGET_ENV = \
-?????? GO111MODULE=on \
 ??????? GOARCH=$(GO_GOARCH) \
 ??????? GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 ??????? GOPROXY=off \
 ??????? GOROOT="$(HOST_GO_ROOT)" \
-?????? GOPATH="$(HOST_GO_GOPATH)" \
 ??????? CC="$(TARGET_CC)" \
 ??????? CXX="$(TARGET_CXX)" \
 ??????? GOTOOLDIR="$(HOST_GO_TOOLDIR)"
@@ -83,17 +81,18 @@ endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS

 ?# The go build system is not compatible with ccache, so use
 ?# HOSTCC_NOCCACHE.? See https://github.com/golang/go/issues/11685.
+HOST_GO_HOST_ENV = \
+??????? GOCACHE=$(HOST_GO_HOST_CACHE) \
+??????? CC=$(HOSTCC_NOCCACHE) \
+??????? CXX=$(HOSTCXX_NOCCACHE)
+
 ?HOST_GO_MAKE_ENV = \
-?????? GO111MODULE=off \
-?????? GOCACHE=$(HOST_GO_HOST_CACHE) \
+?????? $(GO_HOST_ENV) \
 ??????? GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 ??????? GOROOT_FINAL=$(HOST_GO_ROOT) \
 ??????? GOROOT="$(@D)" \
 ??????? GOBIN="$(@D)/bin" \
 ??????? GOOS=linux \
-?????? CC=$(HOSTCC_NOCCACHE) \
-?????? CXX=$(HOSTCXX_NOCCACHE) \
-?????? CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
 ??????? $(HOST_GO_CROSS_ENV)

> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 2494ce028c..7fbf44b1c7 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -60,6 +60,7 @@ $(2)_WORKSPACE ?= _gopath
>   
 ?GO_COMMON_ENV = \
 ??????? PATH=$(BR_PATH) \
 ??????? GOBIN= \
-?????? CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
+?????? CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+?????? GOPATH="$(HOST_GO_GOPATH)" \
+?????? GO111MODULE=on

 ?GO_TARGET_ENV = \
 ??????? $(HOST_GO_TARGET_ENV) \
 ??????? $(GO_COMMON_ENV)

 ?GO_HOST_ENV = \
+?????? $(HOST_GO_HOST_ENV) \
 ??????? CGO_CFLAGS="$(HOST_CFLAGS)" \
 ??????? CGO_LDFLAGS="$(HOST_LDFLAGS)" \
 ??????? $(GO_COMMON_ENV)

>   $(2)_BUILD_OPTS += \
>   	-ldflags "$$($(2)_LDFLAGS)" \
> +	-mod=vendor \
>   	-tags "$$($(2)_TAGS)" \
>   	-trimpath \
>   	-p $(PARALLEL_JOBS)
> @@ -79,25 +80,34 @@ endif
>   
>   $(2)_INSTALL_BINS ?= $(1)
>   
> -# Source files in Go should be extracted in a precise folder in the hierarchy
> -# of GOPATH. It usually resolves around domain/vendor/software. By default, we
> -# derive domain/vendor/software from the upstream URL of the project, but we
> -# allow $(2)_SRC_SUBDIR to be overridden if needed.
> +# Source files in Go usually use an import path resolved around
> +# domain/vendor/software. We infer domain/vendor/software from the upstream URL
> +# of the project. $(2)_GOMOD can be overridden.
>   $(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
>   $(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
>   $(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
>   
> -$(2)_SRC_SUBDIR ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
> -$(2)_SRC_PATH = $$(@D)/$$($(2)_WORKSPACE)/src/$$($(2)_SRC_SUBDIR)
> -
> -# Configure step. Only define it if not already defined by the package .mk
> -# file.
> -ifndef $(2)_CONFIGURE_CMDS
> -define $(2)_CONFIGURE_CMDS
> -	mkdir -p $$(dir $$($(2)_SRC_PATH))
> -	ln -sf $$(@D) $$($(2)_SRC_PATH)
> +$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
> +
> +# Correctly configure the go.mod and go.sum files for the module system.
> +# TODO: Perform the "go mod vendor" download step.
> +# Today, we still only support modules with a vendor/ tree in the source.
> +define $(2)_APPLY_EXTRACT_GOMOD
> +	if [ -f $$($(2)_PKGDIR)/go.mod ]; then \
> +		cp $$($(2)_PKGDIR)/go.mod $$(@D)/go.mod; \
> +		if [ -f $$(@D)/go.sum ]; then \
> +			rm $$(@D)/go.sum; \
> +		fi; \
> +	fi; \
> +	if [ -f $$($(2)_PKGDIR)/go.sum ]; then \
> +		cp $$($(2)_PKGDIR)/go.sum $$(@D)/go.sum; \
> +	fi
> +	if [ ! -f $$(@D)/go.mod ] && [ -n "$$($(2)_GOMOD)" ]; then \
> +		printf "module $$($(2)_GOMOD)\n" > $$(@D)/go.mod; \
> +	fi
>   endef
> -endif
> +
> +$(2)_POST_EXTRACT_HOOKS += $(2)_APPLY_EXTRACT_GOMOD
>   
>   # Build step. Only define it if not already defined by the package .mk
>   # file.
> @@ -111,13 +121,12 @@ endif
>   # Build package for target
>   define $(2)_BUILD_CMDS
>   	$$(foreach d,$$($(2)_BUILD_TARGETS),\
> -		cd $$($(2)_SRC_PATH); \
> +		cd $$(@D); \
>   		$$(GO_TARGET_ENV) \
> -			GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>   			$$($(2)_GO_ENV) \
>   			$$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
>   			-o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
> -			./$$(d)
> +			$$(d)
>   	)
>   endef
>   else

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
