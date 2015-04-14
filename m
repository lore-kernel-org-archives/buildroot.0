From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 23:36:37 +0200
Subject: [Buildroot] [PATCHv2 15/21] pkg-generic: don't use DL_MODE in
 .stamp_downloaded
In-Reply-To: <1428856685-4403-16-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D8865.9040506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:37, Thomas Petazzoni wrote:
> The .stamp_downloaded target is now only being used to really
> download, and no longer for other activities like "source check" or
> "external deps". So the check on DL_MODE being equal to DOWNLOAD is no
> longer necessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/pkg-generic.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d432a2e..13a3843 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -71,7 +71,6 @@ endif
>  # Retrieve the archive
>  $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
> -ifeq ($(DL_MODE),DOWNLOAD)
>  # Only show the download message if it isn't already downloaded
>  	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
>  		if test ! -e $(DL_DIR)/`basename $$p` ; then \
> @@ -79,7 +78,6 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  			break ; \
>  		fi ; \
>  	done
> -endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
>  	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
>  		$(if $(findstring ://,$(p)),\
> @@ -94,10 +92,8 @@ endif
>  		)\
>  	$(sep))
>  	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
> -ifeq ($(DL_MODE),DOWNLOAD)
>  	$(Q)mkdir -p $(@D)
>  	$(Q)touch $@
> -endif
>  
>  # Unpack the archive
>  $(BUILD_DIR)/%/.stamp_extracted:
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
