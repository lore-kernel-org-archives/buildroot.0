From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Jun 2021 06:10:25 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/go: use host compiler when
 go-bootstrap unsupported
In-Reply-To: <20210622024337.3009417-1-christian@paral.in>
References: <20210622024337.3009417-1-christian@paral.in>
Message-ID: <875yy6a926.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Tue, Jun 22 2021, Christian Stewart wrote:

> All Go compiler versions > 1.4.x (old) are written in Go, and require a existing
> compiled Go version to use to build from source.
>
> https://golang.org/doc/install/source#bootstrapFromSource
>
> The process for "bootstrapping" the Go compiler in Buildroot is:
>
> 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
> 2. Build go-bootstrap (which is Go 1.4.x and written in C)
> 3. Build go 1.16.x (written in Go) using go-bootstrap.
>
> The problem is that step 2 - build go-bootstrap - does not work on 64-bit arm.
> The Go compiler from 1.4.x is compatible with x86, x86_64, and arm (32 bit).
>
> This means that arm64 host machines will skip building Go and all go-based
> packages like Docker.
>
> This patch instead uses the host Go compiler to bootstrap host-go when
> BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS is not set. This is similar to how
> the host GCC is used to bootstrap the Buildroot toolchain.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go-bootstrap/go-bootstrap.mk | 6 ++++++
>  package/go/Config.in.host            | 2 --
>  package/go/go.mk                     | 4 ++++
>  3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
> index 6710e31561..8324a67795 100644
> --- a/package/go-bootstrap/go-bootstrap.mk
> +++ b/package/go-bootstrap/go-bootstrap.mk
> @@ -17,7 +17,13 @@ GO_BOOTSTRAP_LICENSE_FILES = LICENSE
>  # host-go-bootstrap.
>  HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
>  
> +# If we do not support this architecture with go-bootstrap, depend on the host
> +# Go compiler to bootstrap the host-go compiler instead.
> +ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS),y)
>  HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_VERSION)
> +else
> +HOST_GO_BOOTSTRAP_ROOT = /usr/lib/go

I think we need a check for host go existence and maybe also version under
support/dependencies/.

baruch

> +endif
>  
>  # The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
>  # here.  See https://github.com/golang/go/issues/11685.
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index e82ab6e81a..c07605dd02 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -2,7 +2,6 @@
>  config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
>  	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
>  		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
>  		|| BR2_mips64 || BR2_mips64el || BR2_s390x
> @@ -22,4 +21,3 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	bool
>  	default y
> -	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 4252691343..5f501d2d8c 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -12,7 +12,11 @@ GO_LICENSE = BSD-3-Clause
>  GO_LICENSE_FILES = LICENSE
>  GO_CPE_ID_VENDOR = golang
>  
> +# Depend on the host Go compiler if go-bootstrap is not available.
> +ifeq ($(BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS),y)
>  HOST_GO_DEPENDENCIES = host-go-bootstrap
> +endif
> +
>  HOST_GO_GOPATH = $(HOST_DIR)/usr/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/usr/share/host-go-cache
>  HOST_GO_ROOT = $(HOST_DIR)/lib/go


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
