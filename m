From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:44:37 +0200
Subject: [Buildroot] [PATCH] pkg-generic: substitute colon and space out
	of PKG_VERSION
In-Reply-To: <1429737867-1754-1-git-send-email-arnout@mind.be>
References: <1429737867-1754-1-git-send-email-arnout@mind.be>
Message-ID: <55382455.5040408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 23:24, Arnout Vandecappelle (Essensium/Mind) wrote:
> Using a colon or a space in a make target doesn't work, so they have to
> be filtered out of the PKG_VERSION variable just like the / currently
> already is.
> 
> This will be needed for date-based CVS versions.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d1a1811..eeccf5b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -322,17 +322,19 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
>  # sanitize the package version that is used in paths, directory and file names.
>  # Forward slashes may appear in the package's version when pointing to a
>  # version control system branch or tag, for example remotes/origin/1_10_stable.
> +# Similar for spaces and colons (:) that may appear in date-based revisions for
> +# CVS.
>  ifndef $(2)_VERSION
>   ifdef $(3)_VERSION
>    $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> -  $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
> +  $(2)_VERSION := $$(subst $(space),_,$$(subst :,_,$$(subst /,_,$$(strip $$($(3)_VERSION)))))

 Hold it, something is wrong here, because the host version gets an extra _
appended...

 D'oh, $(space) should be $$(space) :-(

 Regards,
 Arnout

>   else
>    $(2)_VERSION = undefined
>    $(2)_DL_VERSION = undefined
>   endif
>  else
>    $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
> -  $(2)_VERSION := $$(strip $$(subst /,_,$$($(2)_VERSION)))
> +  $(2)_VERSION := $$(subst $$(space),_,$$(subst :,_,$$(subst /,_,$$(strip $$($(2)_VERSION)))))
>  endif
>  
>  $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
