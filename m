From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 14 Feb 2017 14:42:34 +0100
Subject: [Buildroot] [PATCH v3 1/5] package: refactor listing of
	extractor dependencies
In-Reply-To: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
Message-ID: <CAAXf6LXFZbgxn_hBHRwL_ciDxnd=F+ZizLyCqBYgGqdK+=WgiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 12, 2017 at 9:15 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Don't special case $(XZCAT) when constructing DL_TOOLS_DEPENDENCIES. The next
> commit will introduce another extractor that automatically builds when not
> installed. Introduce EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS that lists
> archive extensions for which the extractor is already checked in
> support/dependencies/check-host-foo.mk. Use this in the newly introduced
> extractor-dependency to populate DL_TOOLS_DEPENDENCIES.
>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3: new patch; split from the next as preparatory cleanup (Thomas DS)
> ---
>  package/pkg-generic.mk                   | 8 +-------
>  package/pkg-utils.mk                     | 7 +++++++
>  support/dependencies/check-host-xzcat.mk | 1 +
>  3 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3ca71b03b9df..e8a8021e3c37 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -926,13 +926,7 @@ else ifeq ($$($(2)_SITE_METHOD),cvs)
>  DL_TOOLS_DEPENDENCIES += cvs
>  endif # SITE_METHOD
>
> -# $(firstword) is used here because the extractor can have arguments, like
> -# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
> -# Do not add xzcat to the list of required dependencies, as it gets built
> -# automatically if it isn't found.
> -ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
> -DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
> -endif
> +DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>
>  # Ensure all virtual targets are PHONY. Listed alphabetically.
>  .PHONY:        $(1) \
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index c5d4080c72f4..4821456da5b0 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -45,6 +45,13 @@ INFLATE.tar  = cat
>  # suitable-extractor(filename): returns extractor based on suffix
>  suitable-extractor = $(INFLATE$(suffix $(1)))
>
> +# extractor-dependency(filename): returns extractor for 'filename' if the
> +# extractor is a dependency. If we build the extractor return nothing.
> +# $(firstword) is used here because the extractor can have arguments, like
> +# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
> +extractor-dependency = $(firstword$(INFLATE$(filter-out \

There needs to be a space after 'firstword', otherwise this gets
expanded to $(firstword.gz) for example, which is empty.

With that fixed:

Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
