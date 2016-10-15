From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 16:58:23 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
 from the legal-info
In-Reply-To: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJDzgm9f0o2xNbeQq53zem3OHOyJ03=G-QWZz=EN_oHmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Oct 15, 2016 at 3:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> It might be necessary to not even mention a package in the output of
> legal-info:
>
>   - virtual packages have virtually nothing to save in the legal-info
>     output;
>
>   - for proprietary packages, it might not even be legal to even
>     mention them, being under NDA or some other such restrictive
>     conditions.
>
> Introduce the new FOO_GEN_LEGAL_INFO variable that a package can set
> to 'NO' (default to 'YES') to indicate that the package should be
> completely ignored from the legal-info output, in which case the
> package is not mentioned in the maniufest, its source archive,

s/maniufest/manifest/

> patches and license files are not saved into legal-info/ .
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
>
> ---
> Note: the name of the variable if up for discussion. However, this will

s/if up/is up/

> most probably never be used in Buildroot itself, but only in local
> proprietary forks or br2-external trees. So we will probably never ever
> see it publicly. So, we do not care much about that variable name...
>

Yann, you mention setting FOO_GEN_LEGAL_INFO=NO could benefit to
virtual packages, but I see no change/patch on the virtual-package
infrastructure. Did I miss something?

> ---
> Changes v6 -> v7:
>   - rename the variable  (Thomas, Luca, Peter)
>   - remove Luca's reviewed/tested-by tags (too much churn since given)
> ---
>  docs/manual/adding-packages-generic.txt | 13 +++++++++++++
>  package/pkg-generic.mk                  | 16 +++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 51408e8..0dccfb4 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -443,6 +443,19 @@ information is (assuming the package name is +libfoo+) :
>    non-opensource packages: Buildroot will not save the source code for this
>    package when collecting the +legal-info+.
>
> +* +LIBFOO_GEN_LEGAL_INFO+ can be set to +YES+ (default) or +NO+ to indicate
> +  that this package should be included or not in the output of the
> +  +legal-info+.  If set to +NO+, that package will be completely excluded
> +  from the output of +legal-info+: it will not be listed in the manifest,
> +  the license files and the sources are not saved (the legal-info related
> +  variables are all ignored: +LIBFOO_LICENSE+, +LIBFOO_LICENSE_FILES+,
> +  +LIBFOO_ACTUAL_SOURCE_TARBALL+, +LIBFOO_ACTUAL_SOURCE_SITE+,
> +  +LIBFOO_REDISTRIBUTE+).
> ++
> +.Note
> +You probably do not want to set it to +NO+ for a package bundled in Buildroot.
> +  It is meant for non-public, confidential, company-proprietary packages.
> +
>  * +LIBFOO_FLAT_STACKSIZE+ defines the stack size of an application built into
>    the FLAT binary format. The application stack size on the NOMMU architecture
>    processors can't be enlarged at run time. The default stack size for the
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 12ae86f..165000c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -502,6 +502,14 @@ endif
>
>  $(2)_REDISTRIBUTE              ?= YES
>
> +ifndef $(2)_GEN_LEGAL_INFO
> + ifdef $(3)_GEN_LEGAL_INFO
> +  $(2)_GEN_LEGAL_INFO = $$($(3)_GEN_LEGAL_INFO)
> + endif
> +endif
> +
> +$(2)_GEN_LEGAL_INFO                    ?= YES
> +
>  $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
>
>  # When a target package is a toolchain dependency set this variable to
> @@ -782,8 +790,10 @@ endif
>
>  # We need to extract and patch a package to be able to retrieve its
>  # license files (if any) and the list of patches applied to it (if
> -# any).
> +# any). But not if we want to ignore that package completely.
> +ifeq ($$($(2)_GEN_LEGAL_INFO),YES)
>  $(1)-legal-info: $(1)-patch
> +endif
>
>  # We only save the sources of packages we want to redistribute, that are
>  # non-overriden (local or true override).
> @@ -796,6 +806,8 @@ endif
>
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:
> +ifeq ($$($(2)_GEN_LEGAL_INFO),YES)
> +
>  # Packages without a source are assumed to be part of Buildroot, skip them.
>         $$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> @@ -843,6 +855,8 @@ endif # other packages
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>         $$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>
> +endif # $(2)_GEN_LEGAL_INFO == YES
> +
>  # add package to the general list of targets if requested by the buildroot
>  # configuration
>  ifeq ($$($$($(2)_KCONFIG_VAR)),y)
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
