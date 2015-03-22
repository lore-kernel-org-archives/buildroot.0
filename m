From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:33:06 +0100
Subject: [Buildroot] [PATCH 5/7] pkg-generic: allow full URLs for
 <pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1425147313-17380-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EE0B2.4030008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> The current logic for <pkg>_EXTRA_DOWNLOADS assumes that it is a list
> of files, all hosted at <pkg>_SITE. However, just like for
> <pkg>_PATCH, it may be useful to specify <pkg>_EXTRA_DOWNLOADS entries
> that are hosted on a different site than the package <pkg>_SITE.
> 
> This commit implements this, by re-using the same logic as the one
> used for <pkg>_PATCH.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 7a9da43..85b22de 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -81,7 +81,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
>  	done
>  endif
>  	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
> -	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
> +	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
> +		$(if $(findstring ://,$(p)),\
> +			$(call DOWNLOAD,$(p)),\
> +			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
> +		)\
> +	$(sep))
>  	$(foreach p,$($(PKG)_PATCH),\

 Why not

	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS) $($(PKG)_PATCH),\

and save a few lines?


 Regards,
 Arnout

>  		$(if $(findstring ://,$(p)),\
>  			$(call DOWNLOAD,$(p)),\
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
