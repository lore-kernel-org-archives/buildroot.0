From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 May 2019 00:28:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
In-Reply-To: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
References: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
Message-ID: <20190517002828.GB29253@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 May 2019 22:12:20 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5b3c7a3e7828107eaa9dad49ba2650466277d891 added a
> BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency to wpebackend-fdo but forget
> to add it to wpewebkit
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/49e04166de68358e69bce580b29ba3a25b313acf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wpewebkit/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 04ebe5452b..15db924829 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -35,10 +35,11 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
>  		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
>  
> -comment "wpewebkit needs an OpenGL ES w/ EGL backend"
> +comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
> +	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
> +		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
>
>  config BR2_PACKAGE_WPEWEBKIT
>  	bool "wpewebkit"
> @@ -51,6 +52,7 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_USE_WCHAR # icu, libsoup
>  	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>  	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG

This is not correct. The short version of the story is tat WPE WebKit
itself does not require Wayland, only wpebackend-fdo uses Wayland.

The long storey: WPE WebKit itself uses generic interfaces from libwpe,
and the programs which use WPE WebKit are responsible for instructing
libwpe to load a "WPE backend plug-in" which provides a concrete
implementation of its interfaces. One such backend is provided by
wpebackend-fdo. This "FDO backend" is what actually requires Wayland,
but there are others which do not require Wayland. For example the
RDK backend [1] can be configured to use dispmanx on the RaspberryPi
directly, or the Vivante i.MX6 proprietary driver ? no Wayland
involved!

Regards,
?Adri?n

---
[1] https://github.com/WebPlatformForEmbedded/WPEBackend-rdk
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190517/6da2781b/attachment.asc>
