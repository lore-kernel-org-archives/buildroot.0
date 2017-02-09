From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 9 Feb 2017 21:26:12 +0100
Subject: [Buildroot] [PATCH 3/7] core: add generic support for lz
 archives
In-Reply-To: <0fe191c3ce1294b21d01067eac0ec83e543ec97c.1486669818.git.baruch@tkos.co.il>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
 <0fe191c3ce1294b21d01067eac0ec83e543ec97c.1486669818.git.baruch@tkos.co.il>
Message-ID: <20170209212612.6ef24427@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,


On Thu,  9 Feb 2017 21:50:14 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> This commit teaches the generic code how to extract .tar.lz archives. When
> lzip is not installed on the host, host-lzip gets built automatically.
> 

On my host there is no lzip installed, with your patches applied I get the following
error message:

which: no lzip in (/home/seiderer/Work/build_arm_qt5_stdcpp11_001/host/usr/bin)
You must install '/home/seiderer/Work/build_arm_qt5_stdcpp11_001/host/usr/bin/lzip' on your build machine
support/dependencies/dependencies.mk:22: recipe for target 'core-dependencies' failed
make[1]: *** [core-dependencies] Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

Regards,
Peter


> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Config.in                               |  7 +++++++
>  Makefile                                |  1 +
>  package/pkg-generic.mk                  |  8 +++-----
>  package/pkg-utils.mk                    |  1 +
>  support/dependencies/check-host-lzip.mk |  4 ++++
>  support/dependencies/check-host-lzip.sh | 14 ++++++++++++++
>  6 files changed, 30 insertions(+), 5 deletions(-)
>  create mode 100644 support/dependencies/check-host-lzip.mk
>  create mode 100755 support/dependencies/check-host-lzip.sh
> 
> diff --git a/Config.in b/Config.in
> index ccd777e8bb00..bd8f0d1a10ee 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -158,6 +158,13 @@ config BR2_XZCAT
>  	  Command to be used to extract a xz'ed file to stdout.
>  	  Default is "xzcat"
>  
> +config BR2_LZCAT
> +	string "lzcat command"
> +	default "lzip -d -c"
> +	help
> +	  Command to be used to extract a lzip'ed file to stdout.
> +	  Default is "lzip -d -c"
> +
>  config BR2_TAR_OPTIONS
>  	string "Tar options"
>  	default ""
> diff --git a/Makefile b/Makefile
> index df3b64eb03ec..b4550e098958 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -431,6 +431,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>  ZCAT := $(call qstrip,$(BR2_ZCAT))
>  BZCAT := $(call qstrip,$(BR2_BZCAT))
>  XZCAT := $(call qstrip,$(BR2_XZCAT))
> +LZCAT := $(call qstrip,$(BR2_LZCAT))
>  TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>  
>  # packages compiled for the host go here
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3ca71b03b9df..303dda090daa 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -928,11 +928,9 @@ endif # SITE_METHOD
>  
>  # $(firstword) is used here because the extractor can have arguments, like
>  # ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
> -# Do not add xzcat to the list of required dependencies, as it gets built
> -# automatically if it isn't found.
> -ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
> -DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
> -endif
> +# Remove xzcat/lzip from the list of required dependencies, as they get built
> +# automatically if they're not found.
> +DL_TOOLS_DEPENDENCIES += $$(filter-out xzcat lzip,$$(firstword $$(call suitable-extractor,$$($(2)_SOURCE))))
>  
>  # Ensure all virtual targets are PHONY. Listed alphabetically.
>  .PHONY:	$(1) \
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index c5d4080c72f4..bc926dadeffd 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -36,6 +36,7 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
>  # Define extractors for different archive suffixes
>  INFLATE.bz2  = $(BZCAT)
>  INFLATE.gz   = $(ZCAT)
> +INFLATE.lz   = $(LZCAT)
>  INFLATE.lzma = $(XZCAT)
>  INFLATE.tbz  = $(BZCAT)
>  INFLATE.tbz2 = $(BZCAT)
> diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
> new file mode 100644
> index 000000000000..32ab9f4daffe
> --- /dev/null
> +++ b/support/dependencies/check-host-lzip.mk
> @@ -0,0 +1,4 @@
> +ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
> +DEPENDENCIES_HOST_PREREQ += host-lzip
> +LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
> +endif
> diff --git a/support/dependencies/check-host-lzip.sh b/support/dependencies/check-host-lzip.sh
> new file mode 100755
> index 000000000000..4f8a2ba3de5b
> --- /dev/null
> +++ b/support/dependencies/check-host-lzip.sh
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +
> +candidate="$1"
> +
> +lzip=`which $candidate 2>/dev/null`
> +if [ ! -x "$lzip" ]; then
> +	lzip=`which lzip 2>/dev/null`
> +	if [ ! -x "$lzip" ]; then
> +		# echo nothing: no suitable lzip found
> +		exit 1
> +	fi
> +fi
> +
> +echo $lzip
