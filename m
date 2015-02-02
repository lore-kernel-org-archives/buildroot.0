From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 22:47:03 +0100
Subject: [Buildroot] [RFC 2/4] legal-info: allow to declare the actual
 sources for binary packages
In-Reply-To: <1420199015-16907-3-git-send-email-luca@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <1420199015-16907-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <54CFF057.2060000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/01/15 12:43, Luca Ceresoli wrote:
> The FOO_SITE/FOO_SOURCE variables usually point to a tarball containing
> source code.
> 
> For the downloaded external toolchains this is not true, the "source"
> tarball actually contains binaries. This is fine for making Buildroot
> work, but for legal-info we really want to ship real source code, not
> binaries.
> 
> Luckily, some (hopefully all) toolchain vendors publish a downloadable
> tarball containing the source code counterpart for their binary
> packages.
> 
> Here we allow the user to declare the URL of this other tarball in the
> pair of variables FOO_ACTUAL_SOURCE_TARBALL (by default equal to
> FOO_SOURCE) and FOO_ACTUAL_SOURCE_SITE (by default equal to FOO_SITE).
> If the "actual source" package can be downloaded from the same
> directory as the binary package, then only FOO_ACTUAL_SOURCE_TARBALL
> needs to be set.
> 
> Note this change is not strictly toolchain-specific: it might be useful
> for other packages that happen to ship binaries in the same way.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It is adding even more complexity to the already too complex legal-info target,
but it doesn't look too bad. Although I would indeed prefer a pre-legal-info
hook. But even that wouldn't be enough, because the source reference in the
manifest would still be wrong...


 Some minor comments below.

> ---
>  Makefile               |  1 -
>  package/pkg-generic.mk | 23 ++++++++++++++++++-----
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5e0b4f2..9f96016 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -640,7 +640,6 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
>  	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,not saved,HOST)
>  	@$(call legal-warning,the Buildroot source code has not been saved)
> -	@$(call legal-warning,the toolchain has not been saved)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>  
>  legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 38ef581..7a477af 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -648,12 +648,18 @@ ifneq ($$($(2)_SITE_METHOD),local)
>  ifneq ($$($(2)_SITE_METHOD),override)
>  # Packages that have a tarball need it downloaded beforehand
>  $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> -$(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
> -$(2)_MANIFEST_SITE = $$(call qstrip,$$($(2)_SITE))
>  endif
>  endif
>  endif
>  
> +# If FOO_ACTUAL_SOURCE_TARBALL is explicitly defined, it means FOO_SOURCE is
> +# indeed a binary (e.g. external toolchain) and FOO_ACTUAL_SOURCE_TARBALL/_SITE
> +# point to the actual sources tarball. Use the actual sources for legal-info.
> +# For msot packages the FOO_SITE/FOO_SOURCE pair points to real source code,
> +# so these are the defaults for FOO_ACTUAL_*.
> +$(2)_ACTUAL_SOURCE_TARBALL ?= $$($(2)_SOURCE)
> +$(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
> +
>  # legal-info: produce legally relevant info.
>  $(1)-legal-info:
>  # Packages without a source are assumed to be part of Buildroot, skip them.
> @@ -684,13 +690,20 @@ else
>  # Other packages
>  
>  ifeq ($$($(2)_REDISTRIBUTE),YES)
> +ifeq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
> +	@$(call legal-warning,the toolchain source code has not been saved)

 So, this only works for the toolchain :-)

 If you keep this approach rather than the pre-legal-info-hook, then you
probably want to use $(1) instead of toolchain. 'toolchain-external' should be
sufficiently understandable.

> +else
> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
> +	$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE:/=)/$$($(2)$($(PKG)_SITE:/=)_ACTUAL_SOURCE_TARBALL))

 I think the $($(PKG)_SITE:/=) construct was just introduced because for some
packages, the _SITE ends with a / and that should be stripped, and we were too
lazy to fix the packages. Hm, looks like all the the external toolchain _SITEs
end with a /...


 Regards,
 Arnout

> +endif
>  # Copy the source tarball (just hardlink if possible)
> -	@cp -l $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
> -	   cp $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
> +	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +endif # ($$($(2)_ACTUAL_SOURCE_TARBALL),)
>  endif # redistribute
>  
>  endif # other packages
> -	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$($(2)_MANIFEST_SITE),$$(call UPPERCASE,$(4)))
> +	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call UPPERCASE,$(4)))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
