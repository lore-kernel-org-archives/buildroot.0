From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:41:48 +0200
Subject: [Buildroot] [PATCH 23/30] package/matchbox: drop useless
 dependencies
In-Reply-To: <0f88fac02eba1f18605db80731bfb130d00721cb.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <0f88fac02eba1f18605db80731bfb130d00721cb.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543E50C.2080602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> xlib-libXft is only needed when building a 'standalone' matchbox, which
> means not using matchbox-lib.
> 
> But we *are* building matchbox-lib, and we do not support the standalone
> mode (and probably won't, as even upstream says it is ugly, by lack of
> theming).
> 
> Similarly, xlib-libXext is only used for its 'xsync' extension, for
> which support is entirely commented-out in matchbox.
> 
> So, drop the dependency on xlib-libXft, and make it explicit we're not
> building either standalone modes; drop xlib-libXext.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/matchbox/Config.in   | 1 -
>  package/matchbox/matchbox.mk | 6 +++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 9d8d060..fa186e9 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -4,7 +4,6 @@ menuconfig BR2_PACKAGE_MATCHBOX
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
>  	select BR2_PACKAGE_MATCHBOX_LIB
>  	help
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index 4ec3fb5..bce9520 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -11,7 +11,11 @@ MATCHBOX_LICENSE = GPLv2+
>  MATCHBOX_LICENSE_FILES = COPYING
>  
>  MATCHBOX_DEPENDENCIES = matchbox-lib
> -MATCHBOX_CONF_OPTS = --enable-expat --disable-composite
> +MATCHBOX_CONF_OPTS = \
> +	--enable-expat \
> +	--disable-composite \
> +	--disable-standalone \
> +	--disable-standalone-xft

 So, is the dependency on xlib_libXft a few lines lower still relevant? If so,
comment on it in the commit message.

 Regards,
 Arnout

>  
>  # Workaround bug in configure script
>  MATCHBOX_CONF_ENV = expat=yes
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
