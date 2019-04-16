From: Anisse Astier <anisse@astier.eu>
Date: Tue, 16 Apr 2019 17:48:42 +0200
Subject: [Buildroot] [PATCH v2] package/go: fix building host go
 toolchain when target isn't supported
In-Reply-To: <20190415204951.18744-1-arnout@mind.be>
References: <20190415204951.18744-1-arnout@mind.be>
Message-ID: <20190416154842.7om7ktsvcaws7jlo@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for taking the time to test and improve this,

On Mon, Apr 15, 2019 at 10:49:51PM +0200, Arnout Vandecappelle (Essensium/Mind) wrote:
> From: Anisse Astier <anisse@astier.eu>

This version is much better than my initial attempt, you should not
preserve original authorship here.

> 
> The go toolchain can cross-compile by default. So most of the time,
> building a toolchain that supports a target, allows us to also build go
> binaries for the host. This is how support for host go packages was
> added: we use the same toolchain that was initially built only for
> target.
> 
> But we might want to build a go binary for the host, when compiling a
> target for which go isn't supported. Then, building host-go will fail:
> by default, we build go for a specific target, and give the toolchain
> bootstrap scripts the cross compiler we'll use.
> 
> This change modifies this behaviour: we only assume the go toolchain is
> cross-capable if we know the current target is supported. Otherwise this
> is a simple host go tool. We don't need to set any of the options needed
> for cross-compilation in that case.
> 
> Thus, only set all the target-specific go options under a condition that
> the target arch is supported. The only option we still set is
> HOST_GO_CGO_ENABLED, and we always set it to enabled.
> 
> It was also considered to create a separate package to build the
> go-for-host compiler which would be used for host-go-packages, but that
> would lead to a lot of duplication and is completely unnecessary.
> 
> Fixes:
> http://autobuild.buildroot.net/results/98b9c7aaff2af4d19adfedac00b768d92530ce94
> http://autobuild.buildroot.net/results/bed228995ce3778720f991df9b41345a7c724a46
> http://autobuild.buildroot.net/results/3b3ea148165b96513ea511ee0d4adb334a6afac8
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Anisse Astier <anisse@astier.eu>

I didn't get a chance to test it yet, I'll report back if I get the
chance.

> ---
> v2 [Arnout]:
> - revert the condition (ifeq instead of ifneq)
> - move GOARCH and GOARM to HOST_GO_CROSS_ENV
> - don't set empty variables
> - don't set GOARCH at all in the host-only case
> - *do* set HOST_GO_CGO_ENABLED in the host-only case (it should not
>   depend on threads on the target)
> - add a small comment to the host-only case
> - use HOST_GO_CROSS_ENV in HOST_GO_MAKE_ENV instead of in the command
> - while we're at it, move CGO_ENABLED to HOST_GO_CROSS_ENV as well

I think you mean move CGO_ENABLED to HOST_GO_MAKE_ENV. The change is
correct though.

Regards,

Anisse


> 
> I was about to apply with some small changes, but the changes were
> getting bigger and bigger so I felt I had to resubmit for review.
> ---
>  package/go/go.mk | 37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index c27f161f48..8df02cc68d 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -11,6 +11,13 @@ GO_SOURCE = go$(GO_VERSION).src.tar.gz
>  GO_LICENSE = BSD-3-Clause
>  GO_LICENSE_FILES = LICENSE
>  
> +HOST_GO_DEPENDENCIES = host-go-bootstrap
> +HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
> +HOST_GO_ROOT = $(HOST_DIR)/lib/go
> +HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
> +
> +ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
> +
>  ifeq ($(BR2_arm),y)
>  GO_GOARCH = arm
>  ifeq ($(BR2_ARM_CPU_ARMV5),y)
> @@ -36,11 +43,6 @@ else ifeq ($(BR2_mips64el),y)
>  GO_GOARCH = mips64le
>  endif
>  
> -HOST_GO_DEPENDENCIES = host-go-bootstrap
> -HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
> -HOST_GO_ROOT = $(HOST_DIR)/lib/go
> -HOST_GO_TARGET_CACHE = $(HOST_DIR)/usr/share/go-cache
> -
>  # For the convienience of target packages.
>  HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
>  HOST_GO_TARGET_ENV = \
> @@ -62,6 +64,19 @@ else
>  HOST_GO_CGO_ENABLED = 0
>  endif
>  
> +HOST_GO_CROSS_ENV = \
> +	CC_FOR_TARGET="$(TARGET_CC)" \
> +	CXX_FOR_TARGET="$(TARGET_CXX)" \
> +	GOARCH=$(GO_GOARCH) \
> +	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> +	GO_ASSUME_CROSSCOMPILING=1
> +
> +else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +# host-go can still be used to build packages for the host. No need to set all
> +# the arch stuff since we will not be cross-compiling.
> +HOST_GO_CGO_ENABLED = 1
> +endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +
>  # The go build system is not compatible with ccache, so use
>  # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
>  HOST_GO_MAKE_ENV = \
> @@ -71,21 +86,15 @@ HOST_GO_MAKE_ENV = \
>  	GOROOT_FINAL=$(HOST_GO_ROOT) \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> -	GOARCH=$(GO_GOARCH) \
> -	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
>  	GOOS=linux \
>  	CC=$(HOSTCC_NOCCACHE) \
>  	CXX=$(HOSTCXX_NOCCACHE) \
> -	GO_ASSUME_CROSSCOMPILING=1
> -
> -HOST_GO_TARGET_CC = \
> -	CC_FOR_TARGET="$(TARGET_CC)" \
> -	CXX_FOR_TARGET="$(TARGET_CXX)"
> +	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> +	$(HOST_GO_CROSS_ENV)
>  
>  define HOST_GO_BUILD_CMDS
>  	cd $(@D)/src && \
> -		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
> -		./make.bash $(if $(VERBOSE),-v)
> +		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
>  endef
>  
>  define HOST_GO_INSTALL_CMDS
> -- 
> 2.20.1
> 
