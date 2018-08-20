From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Aug 2018 16:44:53 +0200
Subject: [Buildroot] [PATCH v3 1/2] core/legal-info: Change order of
 legal-manifest parameters
In-Reply-To: <20180820141217.17322-1-sojkam1@fel.cvut.cz>
References: <87h8jpcf9k.fsf@steelpick.2x.cz>
 <20180820141217.17322-1-sojkam1@fel.cvut.cz>
Message-ID: <20180820144453.GH15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michal, All,

On 2018-08-20 16:12 +0200, Michal Sojka spake thusly:
> From: Michal Sojka <sojka@merica.cz>
> 
> The last parameter {HOST|TARGET} is now first. With this change,
> adding new columns to the legal manifest file (as in the next commit)
> will be slightly easier to review.
> 
> Signed-off-by: Michal Sojka <sojka@merica.cz>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile               | 6 +++---
>  package/pkg-generic.mk | 2 +-
>  package/pkg-utils.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f79d39fd26..3d8106e201 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -781,9 +781,9 @@ legal-info-clean:
>  legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
>  	@$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
> -	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
> -	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
> -	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
> +	@$(call legal-manifest,TARGET,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE)
> +	@$(call legal-manifest,HOST,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE)
> +	@$(call legal-manifest,HOST,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved)
>  	@$(call legal-warning,the Buildroot source code has not been saved)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>  
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 91b61c6de0..6c9592123d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -936,7 +936,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  endif # redistribute
>  
>  endif # other packages
> -	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call UPPERCASE,$(4)))
> +	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index c3acc22b17..8d5ea234e4 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -79,8 +79,8 @@ define legal-warning-nosource # pkg, {local|override}
>  	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
>  endef
>  
> -define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
> -	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
> +define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, source, url
> +	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)"' >>$(LEGAL_MANIFEST_CSV_$(1))
>  endef
>  
>  define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
> -- 
> 2.18.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
