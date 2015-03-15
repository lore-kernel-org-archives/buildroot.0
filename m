From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Mar 2015 17:44:57 +0100
Subject: [Buildroot] [PATCH 4/7] pkg-generic: refactor the "Downloading"
 message logic
In-Reply-To: <1425147313-17380-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5505B709.8030402@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 28/02/2015 19:15, Thomas Petazzoni a ?crit :
> In the .stamp_downloaded hook, the logic to decide whether or not to
> display the "Downloading" message is treating the check of
> <pkg>_SOURCE as a special case. But in fact, there is no real reason
> to do so: the existing loop used for <pkg>_PATCH and
> <pkg>_EXTRA_DOWNLOADS could work just as well.
> 
> This commit therefore refactors this piece of code, to have a single
> loop checking <pkg>_SOURCE, <pkg>_PATCH and <pkg>_EXTRA_DOWNLOADS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

>  package/pkg-generic.mk | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 0098b29..7a9da43 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -73,16 +73,12 @@ $(BUILD_DIR)/%/.stamp_downloaded:
>  	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
>  # Only show the download message if it isn't already downloaded
> -	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
> -		$(call MESSAGE,"Downloading") ; \
> -	else \
> -		for p in $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
> -			if test ! -e $(DL_DIR)/`basename $$p` ; then \
> -				$(call MESSAGE,"Downloading") ; \
> -				break ; \
> -			fi ; \
> -		done ; \
> -	fi
> +	$(Q)for p in $($(PKG)_SOURCE) $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
> +		if test ! -e $(DL_DIR)/`basename $$p` ; then \
> +			$(call MESSAGE,"Downloading") ; \
> +			break ; \
> +		fi ; \
> +	done
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
>  	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
> 
