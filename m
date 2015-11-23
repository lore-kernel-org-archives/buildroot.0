From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 21:26:49 +0100
Subject: [Buildroot] [PATCH 08/51] core/legal-info: allow ignoring
 packages from the legal-info
In-Reply-To: <2462093e5e97e8e420b7119ac6ca6078e39f4621.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <2462093e5e97e8e420b7119ac6ca6078e39f4621.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <20151123212649.794b7583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Can you give your opinion on the semantic/usage of the
<pkg>_REDISTRIBUTE variable.

I am personally not a big fan of the non-boolean behavior introduced by
this patch for this variable. With this patch, <pkg>_REDISTRIBUTE
switches from a normal YES/NO boolean variable to a weird tristate
variable YES/IGNORE/NO.

I have already stated my opinion that there should be two boolean
variables instead:

 * One which allows the package to indicate if the package should be
   mentioned in the legal-info or not.

 * One which allows the package to indicate if the package "source"
   should be saved to the legal-info or not. Of course, this variable
   is ignored if the first one is set to "NO".

This is IMO a lot clearer than a single variable with the YES/IGNORE/NO
values.

Peter ?

Thomas

On Mon, 23 Nov 2015 15:47:38 +0100, Yann E. MORIN wrote:
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
>  
>  * +LIBFOO_FLAT_STACKSIZE+ defines the stack size of an application built into
>    the FLAT binary format. The application stack size on the NOMMU architecture
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5414bc6..98db3ba 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -747,10 +747,12 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
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
> @@ -774,6 +776,8 @@ $(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
>  
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:
> +ifneq ($$($(2)_REDISTRIBUTE),IGNORE)
> +
>  # Packages without a source are assumed to be part of Buildroot, skip them.
>  	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> @@ -816,6 +820,8 @@ endif # other packages
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
> +endif # REDISTRIBUTE == IGNORE
> +
>  # add package to the general list of targets if requested by the buildroot
>  # configuration
>  ifeq ($$($$($(2)_KCONFIG_VAR)),y)



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
