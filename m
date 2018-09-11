From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 11 Sep 2018 23:00:24 +0200
Subject: [Buildroot] [PATCH 1/1] feh: libcurl is optional not mandatory
In-Reply-To: <20180911203447.19297-1-fontaine.fabrice@gmail.com>
References: <20180911203447.19297-1-fontaine.fabrice@gmail.com>
Message-ID: <20180911210023.GA30108@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>

> ---
>  package/feh/Config.in |  1 -
>  package/feh/feh.mk    | 14 +++++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)

> diff --git a/package/feh/Config.in b/package/feh/Config.in
> index 19b4abe0e3..277ec891b3 100644
> --- a/package/feh/Config.in
> +++ b/package/feh/Config.in
> @@ -8,7 +8,6 @@ config BR2_PACKAGE_FEH
>  	select BR2_PACKAGE_IMLIB2_PNG
>  	select BR2_PACKAGE_IMLIB2_JPEG
>  	select BR2_PACKAGE_IMLIB2_X
> -	select BR2_PACKAGE_LIBCURL
>  	help
>  	  feh is an X11 image viewer aimed mostly at console users.

> diff --git a/package/feh/feh.mk b/package/feh/feh.mk
> index 0bbec23111..c611c39ddc 100644
> --- a/package/feh/feh.mk
> +++ b/package/feh/feh.mk
> @@ -7,17 +7,25 @@
>  FEH_VERSION = 2.26
>  FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
>  FEH_SITE = http://feh.finalrewind.org
> -FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
> +FEH_DEPENDENCIES = imlib2 libpng xlib_libXinerama xlib_libXt
>  FEH_LICENSE = MIT
>  FEH_LICENSE_FILES = COPYING

> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +FEH_DEPENDENCIES += libcurl
> +FEH_MAKE_OPTS += curl=1
This is the default, so it could be omitted, but I suppose it's good to specify it (can change in the future).

> +else
> +FEH_MAKE_OPTS += curl=0
> +endif
...

BTW the same applies to Xinerama/XRandR ? it's not
mandatory either (remove BR2_PACKAGE_XLIB_LIBXINERAMA, use xinerama={0,1}).


Kind regards,
Petr
