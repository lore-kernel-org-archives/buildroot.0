From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Apr 2013 08:18:37 +0200
Subject: [Buildroot] [PATCH 2/2] Add $(PKG_NAME) in name of downloaded
 patches
In-Reply-To: <1359620310-13640-2-git-send-email-jezz@sysmic.org>
References: <8398960.ALrh5xOxZ9@sagittae>
 <1359620310-13640-1-git-send-email-jezz@sysmic.org>
 <1359620310-13640-2-git-send-email-jezz@sysmic.org>
Message-ID: <517A1C3D.1010009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/01/13 09:18, J?r?me Pouiller wrote:
> Until now, patch was downloaded without be renamed. $(DL_DIR) quickly become a
> mess.

  Not really... There is just a chance that the patch isn't named 
according to the package name, which could lead to conflicts between 
patch names. But currently there is not a single patch for which the 
patch name differs from the archive name.

> Downloaded patches are now named
> $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).

  How about adding a new function, CLEAN_DOWNLOAD_NAME, that does

$($(PKG)_NAME)-$($(PKG)_VERSION)-$(patsubst \
   $($(PKG)_VERSION)-%,%,$(patsubst $($(PKG)_NAME)-%,%,$(1)))

  so that the names don't get too long in the usual case?

  The same could also be applied to the package archives.

  But really I think it's making things more complex without being 
necessary in practice. I don't expect this situation of conflicting names 
is likely to occur.

  Regards,
  Arnout

>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>   package/pkg-generic.mk |    7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index fbc2bb9..f2bf40a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -42,8 +42,8 @@ endif
>   	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
>   	$(foreach p,$($(PKG)_PATCH),\
>   		$(if $(findstring ://,$(p)),\
> -			$(call DOWNLOAD,$(p)),\
> -			$(call DOWNLOAD,$($(PKG)_SITE)/$(p))\
> +			$(call DOWNLOAD,$(p),$($(PKG)_NAME)-$($(PKG)_VERSION)-$(notdir $(p))),\
> +			$(call DOWNLOAD,$($(PKG)_SITE)/$(p),$($(PKG)_NAME)-$($(PKG)_VERSION)-$(notdir $(p)))\
>   		)\
>   	$(sep))
>   	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
> @@ -90,7 +90,8 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
>   $(BUILD_DIR)/%/.stamp_patched:
>   	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
>   	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
> -	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
> +	$(foreach p,$($(PKG)_PATCH),\
> +	  support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_NAME)-$($(PKG)_VERSION)-$(notdir $(p))$(sep))
>   	$(Q)( \
>   	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
>   	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
