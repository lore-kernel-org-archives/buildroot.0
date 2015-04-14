From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Apr 2015 00:27:46 +0200
Subject: [Buildroot] [PATCHv2 19/21] pkg-generic: introduce a
 <pkg>_ALL_DOWNLOADS variable and factorize code
In-Reply-To: <1428856685-4403-20-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D9462.1020202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:38, Thomas Petazzoni wrote:
> Now, both the download and source-check code are iterating over
> <pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS elements, figuring
> out whether they contain full URLs or not. Instead of doing this
> repeatdly, this patch introduces an internal <pkg>_ALL_DOWNLOADS
> variable, which contains the list of everything that needs to be
> downloaded, with URLs already expanded to take into account <pkg>_SITE
> if needed.
> 
> This allows to simplify quite significantly the .stamp_download and
> source-check implementation.

 Nice!

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

with make perl

 Regards,
 Arnout

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d2ed605..7dc1cb8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -72,25 +72,13 @@ endif
>  $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  # Only show the download message if it isn't already downloaded
> -	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
> +	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
>  		if test ! -e $(DL_DIR)/`basename $$p` ; then \
>  			$(call MESSAGE,"Downloading") ; \
>  			break ; \
>  		fi ; \
>  	done
> -	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
> -	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
> -		$(if $(findstring ://,$(p)),\
> -			$(call DOWNLOAD,$(p)),\
> -			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
> -		)\
> -	$(sep))
> -	$(foreach p,$($(PKG)_PATCH),\
> -		$(if $(findstring ://,$(p)),\
> -			$(call DOWNLOAD,$(p)),\
> -			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
> -		)\
> -	$(sep))
> +	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  	$(Q)mkdir -p $(@D)
>  	$(Q)touch $@
> @@ -359,6 +347,11 @@ ifndef $(2)_EXTRA_DOWNLOADS
>   endif
>  endif
>  
> +$(2)_ALL_DOWNLOADS = \
> +	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
> +		$$(if $$(findstring ://,$$(p)),$$(p),\
> +			$$($(2)_SITE:/=)/$$(p)))
> +
>  ifndef $(2)_SITE
>   ifdef $(3)_SITE
>    $(2)_SITE = $$($(3)_SITE)
> @@ -572,10 +565,7 @@ $(1)-show-version:
>  
>  $(1)-source-check:
>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> -	$$(foreach p,$$($(2)_SOURCE) $$($(2)_EXTRA_DOWNLOADS) $$($(2)_PATCH),\
> -		$$(if $$(findstring ://,$$(p)),\
> -			$$(call SOURCE_CHECK,$$(p)),\
> -			$$(call SOURCE_CHECK,$$($(2)_SITE:/=)/$$(p))))
> +	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
>  else
>  	test -d $$($(2)_OVERRIDE_SRCDIR)
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
