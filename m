From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Nov 2015 22:48:16 +0100
Subject: [Buildroot] [PATCH 04/21 RFC] core/legal-info: allow ignoring
 packages from the legal-info
In-Reply-To: <5d993adab02ed57f67d14652247fbd31aaae87bc.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <5d993adab02ed57f67d14652247fbd31aaae87bc.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <564BA0A0.4020003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-11-15 23:46, Yann E. MORIN wrote:
> It might be necessary to not even mention a package in the output of
> legal-info:
> 
>   - virtual package have virtually nothing to save in the legal-info
>     output;
> 
>   - for Buildroot itself, host-gcc-initial and host-gcc-final are not
>     real packages, they are just two different steps of the same
>     package, gcc;
> 
>   - for proprietary packages, it might not even be legal to even mention
>     them, being under NDA or some other such restrictive conditions.
> 
> Add the new 'IGNORE' keyword to the _REDISTRIBUTE package variable, so
> that the legal-info infra will simply completely ignore that package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 But see below.

> ---
>  docs/manual/adding-packages-generic.txt | 7 +++++--
>  package/pkg-generic.mk                  | 8 +++++++-
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 1c25c4e..aec398b 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -390,7 +390,8 @@ information is (assuming the package name is +libfoo+) :
>    See xref:legal-info[] for more information.
>    This variable is optional. If it is not defined, a warning will be produced
>    to let you know, and +not saved+ will appear in the +license files+ field
> -  of the manifest file for this package.
> +  of the manifest file for this package (unless +LIBFOO_REDISTRIBUTE+ is
> +  set to +IGNORE+, see below...)
>  
>  * +LIBFOO_ACTUAL_SOURCE_TARBALL+ only applies to packages whose
>    +LIBFOO_SITE+ / +LIBTOO_SOURCE+ pair points to an archive that does
> @@ -414,7 +415,9 @@ information is (assuming the package name is +libfoo+) :
>  * +LIBFOO_REDISTRIBUTE+ can be set to +YES+ (default) or +NO+ to indicate if
>    the package source code is allowed to be redistributed. Set it to +NO+ for
>    non-opensource packages: Buildroot will not save the source code for this
> -  package when collecting the +legal-info+.
> +  package when collecting the +legal-info+. Alternatively, you may set it to
> +  +IGNORE+ so that Buildroot does not even mention that package in the
> +  +legal-info+ output.

 Perhaps add:

This is done automatically for virtual packages.

 Regards,
 Arnout

>  
>  * +LIBFOO_FLAT_STACKSIZE+ defines the stack size of an application built into
>    the FLAT binary format. The application stack size on the NOMMU architecture
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 08f4f31..91c8fea 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -739,10 +739,12 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
>  
>  # If the package declares _LICENSE_FILES, we need to extract it,
>  # for overriden, local or normal remote packages alike, whether
> -# we want to redistribute it or not.
> +# we want to redistribute it or not, but not if we want to ignore it.
> +ifneq ($$($(2)_REDISTRIBUTE),IGNORE)
>  ifneq ($$($(2)_LICENSE_FILES),)
>  $(1)-legal-info: $(1)-patch
>  endif
> +endif
>  
>  # We only save the sources of packages we want to redistribute, that are
>  # non-local, and non-overriden. So only store, in the manifest, the tarball
> @@ -766,6 +768,8 @@ $(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
>  
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:
> +ifneq ($$($(2)_REDISTRIBUTE),IGNORE)
> +
>  # Packages without a source are assumed to be part of Buildroot, skip them.
>  	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> @@ -807,6 +811,8 @@ endif # other packages
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
> +endif # REDISTRIBUTE == IGNORE
> +
>  # add package to the general list of targets if requested by the buildroot
>  # configuration
>  ifeq ($$($$($(2)_KCONFIG_VAR)),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
