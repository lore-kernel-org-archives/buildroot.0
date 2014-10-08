From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Oct 2014 22:01:38 +0200
Subject: [Buildroot] [PATCH 3/7 v2] package/freerdp: add missing
	dependency
In-Reply-To: <35304aa84aa03868090a87e415cb996f56b0ce72.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
 <35304aa84aa03868090a87e415cb996f56b0ce72.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMLjD7vNgCj+1wRohYVTJfzLq9TXqDaODhF7Ukw0bniRLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Oct 7, 2014 at 12:35 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> To build the server, FreeRDP needs the Xdamage library.
>
> It seems we were (un)lucky so far, because the server is not built (by
> default?), even if Xdamage is enabled.

You are talking about the content of freerdp/server directory here?
If so, according to the CMake code, the server build is disabled by
default, so you should also do:
FREERDP_CONF_OPTS += -DWITH_SERVER=ON

>
> Add this missing dependency.

Checking carefully the CMake code, it seems that only Xshm is required
for the client, all other X-features are just recommended.

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/freerdp/Config.in  | 1 +
>  package/freerdp/freerdp.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
> index 81a67ea..23d0b0f 100644
> --- a/package/freerdp/Config.in
> +++ b/package/freerdp/Config.in
> @@ -17,5 +17,6 @@ config BR2_PACKAGE_FREERDP_NEEDS_XLIBS
>         select BR2_PACKAGE_XLIB_LIBXT
>         select BR2_PACKAGE_XLIB_LIBXEXT
>         select BR2_PACKAGE_XLIB_LIBXCURSOR
> +       select BR2_PACKAGE_XLIB_LIBXDAMAGE
>
>  endif
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 49347fa..b50fd1e 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -14,7 +14,7 @@ FREERDP_LICENSE_FILES = LICENSE
>  FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
>
>  ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
> -FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
> +FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor xlib_libXdamage
>  FREERDP_CONF_OPTS += -DWITH_X11=ON
>  else
>  FREERDP_CONF_OPTS += -DWITH_X11=OFF
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
