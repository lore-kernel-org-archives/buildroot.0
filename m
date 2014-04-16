From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:33:24 +0200
Subject: [Buildroot] [PATCH] legal-info: Add site to legal info manifest
In-Reply-To: <1396903522-10063-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1396903522-10063-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20140416193324.032638ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

Could you have a look at this proposal from Clayton regarding the legal
infrastructure?

Thanks a lot,

Thomas

On Mon,  7 Apr 2014 15:45:22 -0500, Clayton Shotwell wrote:
> I would like to propose adding the site to the legal-info manifest
> files. This gives a little more information on where the sources came
> from without adding much overhead. Please note that is is only for
> packages where the source is not local or set with OVERRIDE_SRCDIR.
> 
> This patch works for the most part. The only issue I see with it occurs
> when the SITE for a package uses one of the common url macros such as
> BR2_GNU_MIRROR. The legal info manifest ends up having an extra set of
> double quotes in the site string.
> 
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
>  Makefile               |    6 +++---
>  package/pkg-generic.mk |    4 +++-
>  package/pkg-utils.mk   |    4 ++--
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 41c51c6..31edf9a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -638,9 +638,9 @@ legal-info-clean:
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
> index 339c3eb..eff021b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -561,10 +561,12 @@ ifneq ($$($(2)_SITE_METHOD),override)
>  # Packages that have a tarball need it downloaded and extracted beforehand
>  $(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
>  $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
> +$(2)_MANIFEST_SITE = $$($(2)_SITE)
>  endif
>  endif
>  endif
>  $(2)_MANIFEST_TARBALL ?= not saved
> +$(2)_MANIFEST_SITE ?= not saved
>  
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:
> @@ -599,7 +601,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  endif # redistribute
>  
>  endif # other packages
> -	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(4)))
> +	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$($(2)_MANIFEST_SITE),$(call UPPERCASE,$(4)))
>  endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
>  	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
>  
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 91a1981..42d5820 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -109,8 +109,8 @@ define legal-warning-pkg-savednothing # pkg, {local|override}
>  	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
>  endef
>  
> -define legal-manifest # pkg, version, license, license-files, source, {HOST|TARGET}
> -	echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
> +define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
> +	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
>  endef
>  
>  define legal-license-header # pkg, license-file, {HOST|TARGET}



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
