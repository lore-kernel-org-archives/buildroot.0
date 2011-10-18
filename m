From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 21:05:35 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201110182105.35457.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 18 October 2011 16:14:54, Gustavo Zacarias wrote:
> Add FOO_MIRROR support for packages that have different URLs to fetch
> from, for redundancy or when they move to an obsolete/old directory when
> a new version pops up.
> Only implement for WGET methods.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Makefile.package.in |   26 +++++++++++++++++++++++---
>  1 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index b5ef57b..b9b5181 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -207,10 +207,12 @@ endef
> 
>  # DOWNLOAD -- Download helper. Will try to download source from:
>  # 1) BR2_PRIMARY_SITE if enabled
>  # 2) Download site
> 
> -# 3) BR2_BACKUP_SITE if enabled
> +# 3) Download mirror
> +# 4) BR2_BACKUP_SITE if enabled
> 
>  #
>  # Argument 1 is the source location
>  # Argument 2 is the source filename
> 
> +# Argument 3 is the mirror location

 Argument 3 will be $($(PKG)_MIRROR) in all calls, so there is no need to
make it an argument.  Just use $($(PKG)_MIRROR) directly, like it is done
for $($(PKG)_SITE_METHOD).

> 
>  #
>  # E.G. use like this:
>  # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
> @@ -229,6 +231,15 @@ define DOWNLOAD
>  			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
>  		esac ; \
>  	fi ; \
> +	if test -n "$(3)" ; then \

 You can easily support $($(PKG)_MIRRORS) (plural) with
for mirror in $($(PKG)_MIRRORS); do \
... $$mirror ...
done

 This will simply skip the loop if $(3) is empty.

> +		case "$($(PKG)_SITE_METHOD)" in \
> +			git) exit ;; \
> +			svn) exit ;; \
> +			bzr) exit ;; \
> +			file) exit ;; \
> +			*) $(call $(DL_MODE)_WGET,$(3),$(2)) && exit ;; \
> +		esac ; \

 Is there a need to check for $($(PKG)_SITE_METHOD) at all?  This is not
done for the BR2_BACKUP_SITE after all.

> +	fi ; \
>  	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
>  		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
>  	fi ; \
> @@ -266,8 +277,8 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
>  		$(call MESSAGE,"Downloading")
>  endif
> -	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE)))
> -	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
> +	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE),$($(PKG)_MIRROR)))
> +	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH),$($(PKG)_MIRROR)))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
>  	$(Q)mkdir -p $(@D)
> @@ -463,6 +474,15 @@ ifndef $(2)_SITE
>   endif
>  endif
>  
> +ifndef $(2)_MIRROR
> + ifdef $(3)_MIRROR
> +  $(2)_MIRROR = $($(3)_MIRROR)
> + else
> +  $(2)_MIRROR			?= \
> +	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)

 Err... Either it is a sourceforge package and then this will already be the
normal URL, or it is not and then this will just fail.  Or am I missing
something?

> + endif
> +endif
> +
>  ifndef $(2)_SITE_METHOD
>   ifdef $(3)_SITE_METHOD
>    $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
> 


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
