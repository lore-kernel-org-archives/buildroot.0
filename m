From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Dec 2020 19:07:12 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/delve: new package
In-Reply-To: <20201216080013.547261-6-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
 <20201216080013.547261-6-christian@paral.in>
Message-ID: <20201216190712.1cafcd0b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

PLEASE try to trim down your CC list! I am definitely not interested in Go
related packages!

Regards,
Peter


On Wed, 16 Dec 2020 00:00:13 -0800, Christian Stewart <christian@paral.in> wrote:

> Delve is a debugger for the Go programming language.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/delve/Config.in  | 18 ++++++++++++++++++
>  package/delve/delve.hash |  3 +++
>  package/delve/delve.mk   | 21 +++++++++++++++++++++
>  5 files changed, 44 insertions(+)
>  create mode 100644 package/delve/Config.in
>  create mode 100644 package/delve/delve.hash
>  create mode 100644 package/delve/delve.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f33f88df43..7ede0cc0f1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -505,6 +505,7 @@ F:	linux/linux-ext-aufs.mk
>  F:	package/aufs/
>  F:	package/aufs-util/
>  F:	package/batman-adv/
> +F:	package/delve/
>  F:	package/docker-cli/
>  F:	package/docker-containerd/
>  F:	package/docker-engine/
> diff --git a/package/Config.in b/package/Config.in
> index 39c91645ad..b97937f841 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -88,6 +88,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/cache-calibrator/Config.in"
>  	source "package/clinfo/Config.in"
>  	source "package/dacapo/Config.in"
> +	source "package/delve/Config.in"
>  	source "package/dhrystone/Config.in"
>  	source "package/dieharder/Config.in"
>  	source "package/dmalloc/Config.in"
> diff --git a/package/delve/Config.in b/package/delve/Config.in
> new file mode 100644
> index 0000000000..008f00d789
> --- /dev/null
> +++ b/package/delve/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_DELVE
> +	bool "delve"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # go, cgo
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # go
> +	depends on BR2_USE_MMU # go
> +	help
> +	  Delve is a debugger for the Go programming language.
> +
> +	  https://github.com/go-delve/delve
> +
> +comment "delve needs a glibc toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_MMU
> diff --git a/package/delve/delve.hash b/package/delve/delve.hash
> new file mode 100644
> index 0000000000..e8bb9c37ad
> --- /dev/null
> +++ b/package/delve/delve.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  f8bbaecdfc9d1ff6148900d3dea44b6dd06a7f0197be4e9a75c289b7f62682ab  delve-1.5.0.tar.gz
> +sha256	778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
> diff --git a/package/delve/delve.mk b/package/delve/delve.mk
> new file mode 100644
> index 0000000000..d524db374f
> --- /dev/null
> +++ b/package/delve/delve.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# delve
> +#
> +################################################################################
> +
> +DELVE_VERSION = 1.5.0
> +DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
> +
> +DELVE_LICENSE = MIT
> +DELVE_LICENSE_FILES = LICENSE
> +
> +DELVE_DEPENDENCIES = host-pkgconf
> +
> +DELVE_TAGS = cgo
> +
> +DELVE_BUILD_TARGETS = cmd/dlv
> +
> +DELVE_INSTALL_BINS = $(notdir $(DELVE_BUILD_TARGETS))
> +
> +$(eval $(golang-package))
