From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Apr 2015 00:09:08 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-generic: prepend downloaded patches
 w/ package
In-Reply-To: <1429462679-4769-2-git-send-email-fhunleth@troodon-software.com>
References: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
 <1429462679-4769-2-git-send-email-fhunleth@troodon-software.com>
Message-ID: <55357904.1080608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 18:57, Frank Hunleth wrote:
> This change prepends the package name to all downloaded patch files to
> avoid name collisions between patches in different packages.
> 
> Specifically, it fixes an issue where the official kernel and u-boot patches
> on the Intel Edison were named upstream_to_edison.patch.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

 Actually, the same issue also sometimes exists for _SOURCE and
_EXTRA_DOWNLOADS. So we should add the package prefix to all of them.

 Also, a few packages (e.g. cache-calibrator, nanocom) don't have a version in
their download filename, so that should ideally be added as well.

 Ideally, the package and version parts should only be added if they're not
already present.

 So I really would like to have an automatic calculation of the downloaded
filename. For instance, adding a function to calculate it:

download-filename = $(DL_DIR)/$(if $(findstring
$(pkgname),$(1)),,$(pkgname)-)$(if $(findstring
$($(PKG)_VERSION),$(1)),,$($(PKG)_VERSION)-)$(1)

 And then, wherever a downloaded file is used:

$(call download-filename,...)


 Regards,
 Arnout

> ---
>  package/pkg-generic.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d1a1811..f63f553 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -73,12 +73,18 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
>  # Only show the download message if it isn't already downloaded
> -	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
> +	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_EXTRA_DOWNLOADS) ; do \
>  		if test ! -e $(DL_DIR)/`basename $$p` ; then \
>  			$(call MESSAGE,"Downloading") ; \
>  			break ; \
>  		fi ; \
>  	done
> +	$(Q)for p in $($(PKG)_PATCH) ; do \
> +		if test ! -e $(DL_DIR)/$(RAWNAME)-`basename $$p` ; then \
> +			$(call MESSAGE,"Downloading") ; \
> +			break ; \
> +		fi ; \
> +	done
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
>  	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
> @@ -89,8 +95,8 @@ endif
>  	$(sep))
>  	$(foreach p,$($(PKG)_PATCH),\
>  		$(if $(findstring ://,$(p)),\
> -			$(call DOWNLOAD,$(p)),\
> -			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
> +			$(call DOWNLOAD,$(p),$(RAWNAME)-$(notdir $(p))),\
> +			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p),$(RAWNAME)-$(notdir $(p)))\
>  		)\
>  	$(sep))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
> @@ -147,7 +153,7 @@ $(BUILD_DIR)/%/.stamp_patched:
>  	@$(call step_start,patch)
>  	@$(call MESSAGE,"Patching")
>  	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
> -	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
> +	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(RAWNAME)-$(notdir $(p))$(sep))
>  	$(Q)( \
>  	for D in $(PATCH_BASE_DIRS); do \
>  	  if test -d $${D}; then \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
