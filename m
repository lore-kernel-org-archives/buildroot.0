From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Jul 2014 22:32:51 +0200
Subject: [Buildroot] [PATCH v2] legal-info: Add site to legal info
 manifest
In-Reply-To: <1405950391-4211-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1405950391-4211-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20140723203251.GA17249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton, All,

On 2014-07-21 08:46 -0500, Clayton Shotwell spake thusly:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> I would like to propose adding the site to the legal-info manifest
> files. This gives a little more information on where the sources came
> from without adding much overhead. Please note that is is only for
> packages where the source is not local or set with OVERRIDE_SRCDIR.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

After my review, here's my:
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Added a qstrip to the site path to remove any "s that might be added
>     when the path is generated from multiple variables.
> ---
>  Makefile               |    6 +++---
>  package/pkg-generic.mk |    4 +++-
>  package/pkg-utils.mk   |    4 ++--
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 1af51de..6bd18e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -639,9 +639,9 @@ legal-info-clean:
>  legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@$(call MESSAGE,"Collecting legal info")
>  	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
> -	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,TARGET)
> -	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,HOST)
> -	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
> +	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
> +	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
> +	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,not saved,HOST)
>  	@$(call legal-warning,the Buildroot source code has not been saved)
>  	@$(call legal-warning,the toolchain has not been saved)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 395e593..97a7547 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -644,10 +644,12 @@ ifneq ($$($(2)_SITE_METHOD),override)
>  # Packages that have a tarball need it downloaded beforehand
>  $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
>  $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
> +$(2)_MANIFEST_SITE = $$(call qstrip,$$($(2)_SITE))
>  endif
>  endif
>  endif
>  $(2)_MANIFEST_TARBALL ?= not saved
> +$(2)_MANIFEST_SITE ?= not saved
>  
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:
> @@ -685,7 +687,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  endif # redistribute
>  
>  endif # other packages
> -	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$(call UPPERCASE,$(4)))
> +	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$($(2)_MANIFEST_SITE),$$(call UPPERCASE,$(4)))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 99e1f76..89ad9e9 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -105,8 +105,8 @@ define legal-warning-nosource # pkg, {local|override}
>  	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
>  endef
>  
> -define legal-manifest # pkg, version, license, license-files, source, {HOST|TARGET}
> -	echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
> +define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
> +	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
>  endef
>  
>  define legal-license-header # pkg, license-file, {HOST|TARGET}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
