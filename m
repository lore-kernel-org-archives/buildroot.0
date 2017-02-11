From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 11 Feb 2017 22:16:20 +0100
Subject: [Buildroot] [PATCH 1/4] core: add generic support for lz
	archives
In-Reply-To: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
References: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
Message-ID: <CAAXf6LXPLcVSVXjzvzNBsvisp1H0E4YtAVDAeJuuQqj6NBz9fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Fri, Feb 10, 2017 at 6:52 AM, Baruch Siach <baruch@tkos.co.il> wrote:
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
>           Command to be used to extract a xz'ed file to stdout.
>           Default is "xzcat"
>
> +config BR2_LZCAT
> +       string "lzcat command"
> +       default "lzip -d -c"
> +       help
> +         Command to be used to extract a lzip'ed file to stdout.
> +         Default is "lzip -d -c"
> +
>  config BR2_TAR_OPTIONS
>         string "Tar options"
>         default ""
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
>  .PHONY:        $(1) \
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

suitable-extractor and host-extractor now render different output for
a given file which makes no sense in general for functions named like
this. You only need the different output to decide whether extra
dependency checks need to be done, not to determine what the extractor
is.

Also, the list of extensions is kind of 'magic' and not immediately
linked with the changes in support/dependencies (this was already true
with the original situation, true). It would be great if the
exceptions could be steered from the check-host-foo.mk files directly,
which is the conceptually right place: when that file exists it will
take over all checking, if it does not then the checking is done in
the standard DL_TOOLS_DEPENDENCIES.

I thought hard on a way to attack the problem without needing to know
the extensions and more in line with the original change, but it is
not easy due to the fact that XZCAT and such can contain spaces which
does not fit well with make.
For clarity, I wanted to let check-host-xz.mk append to a new variable, e.g.
    DL_TOOLS_DEPENDENCIES_PRECHECKED_VARS += $(XZCAT)
and in pkg-generic.mk use this list to drive the exceptions:
    ifeq (,$$(filter $$(call
suitable-extractor,$$($(2)_SOURCE)),$$(DL_TOOLS_DEPENDENCIES_PRECHECKED_VARS)))
    DL_TOOLS_DEPENDENCIES += $$(firstword $$(call
suitable-extractor,$$($(2)_SOURCE)))
    endif
This could work if we first replace all spaces with another character,
both when appending to DL_TOOLS_DEPENDENCIES_PRECHECKED_VARS as in the
first argument of the filter function.
But perhaps it makes things too complex.

An alternative is to stick closer to your proposal, but with some changes:
- let check-host-foo.mk define the list of extensions that it handles
instead of the magic list, e.g.
  EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz
- rename host-extractor to something else, e.g. extractor-dependency
- perhaps it makes sense to let extractor-dependency handle the
$(firstword) call

Given my input, what do you think?

Separate note: it could make sense to split this patch in two: one to
refactor the handing of the dependencies, and a second one to cover
lz7.

Best regards,
Thomas
