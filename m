From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 15 Mar 2015 17:44:29 +0100
Subject: [Buildroot] [PATCH 2/7] pkg-generic: fix the logic showing the
 "Downloading" message
In-Reply-To: <1425147313-17380-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5505B6ED.6050204@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 28/02/2015 19:15, Thomas Petazzoni a ?crit :
> Even though the .stamp_downloaded target is executed for each package
> being built, the pkg-generic tries to not display the "Downloading"
> message when there is in fact nothing to download.
> 
> Unfortunately, the logic was incorrect for the patch download: it
> forgot the fact that <pkg>_PATCH can contain either file names (in
> which case we assume the patch should be downloaded from <pkg>_SITE),
> or full URLs. The latter case was not properly handled, as we were
> checking if $(DL_DIR)/<full URL> existed, while we should be testing
> if $(DL_DIR)/`basename <full URL>` exists.
> 
> This patch fixes that, which makes sure the "Downloading" message is
> displayed only when necessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1b09955..1482194 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -77,7 +77,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  		$(call MESSAGE,"Downloading") ; \
>  	else \
>  		for p in $($(PKG)_PATCH) ; do \
> -			if test ! -e $(DL_DIR)/$$p ; then \
> +			if test ! -e $(DL_DIR)/`basename $$p` ; then \
>  				$(call MESSAGE,"Downloading") ; \
>  				break ; \
>  			fi ; \
> 
