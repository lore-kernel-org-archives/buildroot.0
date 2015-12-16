From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Dec 2015 00:44:33 +0100
Subject: [Buildroot] [PATCH 05/13 v2] core/pkg-generic: add variable to
 store the package rawname-version
In-Reply-To: <4640c83000bc6b54c6949415dc94a50187766f15.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <4640c83000bc6b54c6949415dc94a50187766f15.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <5671F761.5050809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-12-15 19:35, Yann E. MORIN wrote:
> Introduce a new per-package variable to store the 'rawname-version'
> tuple, instead of computing it every time we need it.

 It's of course still computed every time we need it because it's a
recursively-expanded variable. So this is just an abbreviation.

> 
> Currently, it's only a single location, but follw-up patches will

 follow-up

> introduce more use of it.
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/pkg-generic.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 832045e..784c39c 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -388,6 +388,7 @@ else
>   $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
>  endif
>  $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
> +$(2)_RAWNAME_VERSION = $$($(2)_RAWNAME)-$$($(2)_VERSION)

 There used to be a variable 'NAMEVER'. I think that that's a more appropriate name.

 Regardless of this, you can add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  
>  ifdef $(3)_OVERRIDE_SRCDIR
>    $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
> @@ -424,7 +425,7 @@ ifndef $(2)_SOURCE
>   ifdef $(3)_SOURCE
>    $(2)_SOURCE = $$($(3)_SOURCE)
>   else
> -  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
> +  $(2)_SOURCE			?= $$($(2)_RAWNAME_VERSION).tar.gz
>   endif
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
