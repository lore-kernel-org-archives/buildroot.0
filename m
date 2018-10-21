From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 21 Oct 2018 11:30:06 +0100
Subject: [Buildroot] [PATCH v4 2/2] core/legal-info: Add package
 dependencies with licenses to the manifest
In-Reply-To: <20180822124014.23046-2-sojkam1@fel.cvut.cz>
References: <20180822124014.23046-1-sojkam1@fel.cvut.cz>
 <20180822124014.23046-2-sojkam1@fel.cvut.cz>
Message-ID: <984c79bb-dc84-efec-1e92-60c77d6d3b7b@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 22/08/18 14:40, Michal Sojka wrote:
> From: Michal Sojka <sojka@merica.cz>
> 
> This adds one column to the legal-info manifest table. It contains the
> dependencies of the given package and their licenses. This information
> is useful when assessing license compatibility of the packages and
> their libraries.
> 
> An example of the content of the new column for the MPD package is
> shown below:
> 
>     "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)] boost
>     [BSL-1.0] libid3tag [GPL-2.0+] libmad [GPL-2.0+] libogg
>     [BSD-3-Clause] libvorbis [BSD-3-Clause] libzlib [Zlib]
>     skeleton-init-common [unknown] skeleton-init-sysv [unknown] sqlite
>     [Public domain] toolchain-external-linaro-arm [unknown]"
> 
> [Credits to Yann E. MORIN <yann.morin.1998@free.fr> for suggesting a
> few simplifications.]
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile               |  4 ++--
>  package/pkg-generic.mk | 10 +++++++++-
>  package/pkg-utils.mk   | 15 +++++++++++++--
>  3 files changed, 24 insertions(+), 5 deletions(-)
> 
> Changes between v3 and v4:
> * Added comment to legal-deps macro as suggested by Yann E. MORIN.
> 
> diff --git a/Makefile b/Makefile
> index 3d8106e201..d6809642bd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -781,8 +781,8 @@ legal-info-clean:
>  legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
>  	@$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
> -	@$(call legal-manifest,TARGET,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE)
> -	@$(call legal-manifest,HOST,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE)
> +	@$(call legal-manifest,TARGET,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSES)
> +	@$(call legal-manifest,HOST,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSES)
>  	@$(call legal-manifest,HOST,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved)
>  	@$(call legal-warning,the Buildroot source code has not been saved)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6c9592123d..a3bedb660f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -609,6 +609,14 @@ $(2)_FINAL_ALL_DEPENDENCIES = \
>  		$$($(2)_FINAL_DEPENDENCIES) \
>  		$$($(2)_FINAL_EXTRACT_DEPENDENCIES) \
>  		$$($(2)_FINAL_PATCH_DEPENDENCIES))
> +$(2)_FINAL_RECURSIVE_DEPENDENCIES = \
> +	$$(sort \
> +		$$(foreach p,\
> +			$$($(2)_FINAL_ALL_DEPENDENCIES),\
> +			$$(p)\
> +			$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES)\
> +		)\
> +	)
>  
>  $(2)_INSTALL_STAGING		?= NO
>  $(2)_INSTALL_IMAGES		?= NO
> @@ -936,7 +944,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  endif # redistribute
>  
>  endif # other packages
> -	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE))
> +	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 8d5ea234e4..e9666e2da7 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -79,8 +79,8 @@ define legal-warning-nosource # pkg, {local|override}
>  	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
>  endef
>  
> -define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, source, url
> -	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)"' >>$(LEGAL_MANIFEST_CSV_$(1))
> +define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, source, url, dependencies
> +	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(1))
>  endef
>  
>  define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
> @@ -95,3 +95,14 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
>  	} && \
>  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
>  endef
> +
> +non-virtual-deps = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
> +
> +# Returns the list of recursive dependencies and their licensing terms
> +# for the package specified in parameter (in lowercase). If that
> +# package is a target package, remove host packages from the list.
> +legal-deps = \
> +    $(foreach p,\
> +        $(filter-out $(if $(1:host-%=),host-%),\
> +            $(call non-virtual-deps,\
> +                $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
> 

It took a while to me to understand the "host-" related magic. I would
have loved seeing an explanatory comment like:

# $(if $(1:host-%=),host-%) returns:
# - "host-%" if $1 begins with "host-"
# - "" otherwise

But maybe it's just me getting rusty on the Make syntax :) so, with or
without a comment added:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
