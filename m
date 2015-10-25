From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 13:56:24 +0100
Subject: [Buildroot] [PATCH v5 02/36] package/libevas-generic-loaders:
 move to package directory
In-Reply-To: <1445720476-21517-3-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025125624.GD3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> As for expedite package, there is no advantage for efl related
> packages to share the same version number anymore
> (except for efl and libelementary).
> 
> Also, we usually do not have a sub-directory for a family of related
> packages which doen't share the same version number, so move
> libevas-generic-loaders to package directory.
> Libevas-generic-loaders appear now in "Libraries" -> "Graphics" in
> the Kconfig menu.
> 
> While at it, remove BR2_USE_WCHAR dependency since the efl package
> already depend on it.

Are you sure that libevas-generic-loaders does not itself depend on
wchar?

If it does, then please keep the dependency, even if it is automatically
inherited through the dependency on EFL. This is so, in case EFL loses
its dependency on wchar, libevas-generic-loaders would still have its
own.

If it is not needed, then:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v5: Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
> v4: improve the commit log (ThomasP)
>     move libevas-generic-loaders to "Libraries" -> "Graphics" (ThomasP)
>     fix package comment dependency on BR2_USE_MMU
> ---
>  package/Config.in                                                   | 1 +
>  package/efl/Config.in                                               | 1 -
>  package/{efl => }/libevas-generic-loaders/Config.in                 | 6 +++---
>  .../{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk    | 0
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/{efl => }/libevas-generic-loaders/Config.in (79%)
>  rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (100%)
> 
> diff --git a/package/Config.in b/package/Config.in
> index c3b9a7a..8ecb2df 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -819,6 +819,7 @@ menu "Graphics"
>  	source "package/libdri2/Config.in"
>  	source "package/libdrm/Config.in"
>  	source "package/libexif/Config.in"
> +	source "package/libevas-generic-loaders/Config.in"
>  	source "package/libfm/Config.in"
>  	source "package/libfm-extra/Config.in"
>  	source "package/libfreeimage/Config.in"
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index cb91660..7ce5a36 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -16,7 +16,6 @@ source "package/efl/libeet/Config.in"
>  source "package/efl/libefreet/Config.in"
>  source "package/efl/libeio/Config.in"
>  source "package/efl/libevas/Config.in"
> -source "package/efl/libevas-generic-loaders/Config.in"
>  source "package/efl/libembryo/Config.in"
>  source "package/efl/libedje/Config.in"
>  source "package/efl/libethumb/Config.in"
> diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
> similarity index 79%
> rename from package/efl/libevas-generic-loaders/Config.in
> rename to package/libevas-generic-loaders/Config.in
> index 3f7581f..d0c3cf4 100644
> --- a/package/efl/libevas-generic-loaders/Config.in
> +++ b/package/libevas-generic-loaders/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
>  	bool "libevas generic loaders"
>  	select BR2_PACKAGE_LIBEINA
>  	select BR2_PACKAGE_ZLIB
> +	depends on BR2_PACKAGE_EFL
>  	help
>  	  These are additional "generic" loaders for Evas that are
>  	  stand-alone executables that evas may run from its generic
> @@ -15,15 +16,14 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>  	bool "SVG loader"
>  	select BR2_PACKAGE_LIBRSVG
>  	select BR2_PACKAGE_CAIRO
> -	depends on BR2_USE_WCHAR # librsvg -> glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
>  	depends on BR2_ARCH_HAS_ATOMICS # cairo
>  	help
>  	  This option enables the Evas generic SVG loader
>  
> -comment "SVG loader needs a toolchain w/ wchar, threads, C++"
> +comment "SVG loader needs a toolchain w/ threads, C++"
>  	depends on BR2_ARCH_HAS_ATOMICS
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
>  
>  endif
> diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
> similarity index 100%
> rename from package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
> rename to package/libevas-generic-loaders/libevas-generic-loaders.mk
> -- 
> 2.4.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
