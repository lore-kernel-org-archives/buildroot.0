From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 23:02:12 +0200
Subject: [Buildroot] [PATCH 27/30] package/matchbox: xlib-libXcursor is
 an optional dependency
In-Reply-To: <14d4c02b30caadb404949b98238f87ba3b509e40.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <14d4c02b30caadb404949b98238f87ba3b509e40.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543E9D4.7010901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> matchbox selects xlib-libXcursor, but does not build-depend on it.
> 
> But xlib-libXcursor is only an optional dependency.
> 
> Fix that by removing the select, and properly build-depend on it when
> it is enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 While you're at it: configure also has --disable-gconf (we don't have the
package but maybe in the future...) and the script checks for xlib_libXfixes.


 Regards,
 Arnout


> ---
>  package/matchbox/Config.in   | 1 -
>  package/matchbox/matchbox.mk | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index fa186e9..ad68718 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -4,7 +4,6 @@ menuconfig BR2_PACKAGE_MATCHBOX
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_XLIB_LIBXCURSOR
>  	select BR2_PACKAGE_MATCHBOX_LIB
>  	help
>  	  Matchbox is an Open Source base environment for the X Window
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index bce9520..d2c3451 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -38,6 +38,10 @@ else
>  MATCHBOX_CONF_OPTS += --disable-session
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
> +MATCHBOX_DEPENDENCIES += xlib_libXcursor
> +endif
> +
>  $(eval $(autotools-package))
>  
>  # After we called a package infra, w ecan include more files
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
