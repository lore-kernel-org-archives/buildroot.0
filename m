From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Feb 2017 15:11:44 +0100
Subject: [Buildroot] [PATCH 1/4] core: add generic support for lz
	archives
In-Reply-To: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
References: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
Message-ID: <20170210151144.18cca691@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri, 10 Feb 2017 07:52:13 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> This commit teaches the generic code how to extract .tar.lz archives. When
> lzip is not installed on the host, host-lzip gets built automatically.
> 
> To avoid the dependency checker complain about missing host lzip (in addition
> to xzcat) add a new host-extractor function that only returns extractors we
> expect to be host installed. Use host-extractor output to feed the dependency
> checker.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: add host-extractor to fix host lzip check
> ---
>  Config.in                               |  7 +++++++
>  Makefile                                |  1 +
>  package/pkg-generic.mk                  |  6 +-----
>  package/pkg-utils.mk                    |  5 +++++
>  support/dependencies/check-host-lzip.mk |  4 ++++
>  support/dependencies/check-host-lzip.sh | 14 ++++++++++++++
>  6 files changed, 32 insertions(+), 5 deletions(-)
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
> index 3ca71b03b9df..b45d1109ca4f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -928,11 +928,7 @@ endif # SITE_METHOD
>  
>  # $(firstword) is used here because the extractor can have arguments, like
>  # ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
> -# Do not add xzcat to the list of required dependencies, as it gets built
> -# automatically if it isn't found.
> -ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
> -DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
> -endif
> +DL_TOOLS_DEPENDENCIES += $$(firstword $$(call host-extractor,$$($(2)_SOURCE)))
>  
>  # Ensure all virtual targets are PHONY. Listed alphabetically.
>  .PHONY:	$(1) \
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index c5d4080c72f4..1c091a43d36c 100644
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
> @@ -45,6 +46,10 @@ INFLATE.tar  = cat
>  # suitable-extractor(filename): returns extractor based on suffix
>  suitable-extractor = $(INFLATE$(suffix $(1)))
>  
> +# host-extractor(filename): same as suitable-extractor, but filter out
> +# extractors we build when the host lacks one.
> +host-extractor = $(INFLATE$(filter-out .lz .lzma .xz,$(suffix $(1))))
> +
>  # check-deprecated-variable -- throw an error on deprecated variables
>  # example:
>  #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
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

Works for my testcase/ddrescue, you can add my

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
