From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 23:50:59 +0200
Subject: [Buildroot] [PATCHv2 18/21] pkg-generic: propagate
 <pkg>_EXTRA_DOWNLOADS from target to host package
In-Reply-To: <1428856685-4403-19-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-19-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D8BC3.9040803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:38, Thomas Petazzoni wrote:
> Just like <pkg>_PATCH, <pkg>_SOURCE or <pkg>_SITE, the
> <pkg>_EXTRA_DOWNLOADS variable of a host package should be
> automatically inferred from the <pkg>_EXTRA_DOWNLOADS value of the
> corresponding target package, unless an explicit value is being
> defined for the host package. This commit implements this for
> <pkg>_EXTRA_DOWNLOADS.

 I'm not so sure about this one. _EXTRA_DOWNLOADS is currently used for the
blackfin toolchains and for perl. Toolchains are target packages so no issue
there, but for perl, we really only need perl-cross for the target perl. At the
moment, host-perl is only built as a dependency of perl so it doesn't hurt to
download perl-cross for host-perl, but it is unnecessary.

 Is there a hidden reason why you want this (i.e. is it required for some later
patch)?

 Regards,
 Arnout
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 13a3843..d2ed605 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -353,6 +353,12 @@ ifndef $(2)_PATCH
>   endif
>  endif
>  
> +ifndef $(2)_EXTRA_DOWNLOADS
> + ifdef $(3)_EXTRA_DOWNLOADS
> +  $(2)_PATCH = $$($(3)_EXTRA_DOWNLOADS)
> + endif
> +endif
> +
>  ifndef $(2)_SITE
>   ifdef $(3)_SITE
>    $(2)_SITE = $$($(3)_SITE)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
