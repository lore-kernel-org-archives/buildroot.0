From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri, 15 Aug 2014 12:49:52 +0000
Subject: [Buildroot] [PATCH v4 1/4] cairo: Add dependency on atomic
	intrinsics
In-Reply-To: <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <In-Reply-To:
 <CAAXf6LURyGxEfQR+3g6xriwqUeE1E91Oav2X=r_C3YD66JzpEA@mail.gmail.com>
 <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356D0C207@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Any news on this and my submission to the manual (https://patchwork.ozlabs.org/patch/376259/)?

Anton


> -----Original Message-----
> From: Anton Kolesov [mailto:Anton.Kolesov at synopsys.com]
> Sent: 08 August 2014 19:09
> To: buildroot at uclibc.org
> Cc: Anton Kolesov; Alexey Brodkin
> Subject: [PATCH v4 1/4] cairo: Add dependency on atomic intrinsics
> 
> Cairo requires GCC built-in atomic functions which are architecture specific
> and may not be implemented.
> 
> This fixes:
> http://autobuild.buildroot.net/results/fadfaa9916724d310d0dda555a1db31b
> ee1601d0/
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> ---
>  package/cairo/Config.in                        | 4 ++++
>  package/efl/libevas-generic-loaders/Config.in  | 6 ++++--
>  package/gstreamer/gst-plugins-good/Config.in   | 4 ++++
>  package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
>  package/libgtk2/Config.in                      | 5 +++--
>  package/librsvg/Config.in                      | 6 ++++--
>  package/libsvg-cairo/Config.in                 | 4 ++++
>  package/pango/Config.in                        | 5 +++--
>  package/webkit/Config.in                       | 6 ++++--
>  package/weston/Config.in                       | 4 ++++
>  10 files changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/package/cairo/Config.in b/package/cairo/Config.in
> index 0c87a29..103aa0d 100644
> --- a/package/cairo/Config.in
> +++ b/package/cairo/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_CAIRO
>  	bool "cairo"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
>  	select BR2_PACKAGE_PIXMAN
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> @@ -13,6 +14,9 @@ config BR2_PACKAGE_CAIRO
> 
>  	  http://cairographics.org/
> 
> +comment "cairo needs a toolchain w/ atomic intrinsics"
> +	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +
>  if BR2_PACKAGE_CAIRO
> 
>  config BR2_PACKAGE_CAIRO_PS
> diff --git a/package/efl/libevas-generic-loaders/Config.in
> b/package/efl/libevas-generic-loaders/Config.in
> index 23b9f77..c7145d5 100644
> --- a/package/efl/libevas-generic-loaders/Config.in
> +++ b/package/efl/libevas-generic-loaders/Config.in
> @@ -17,10 +17,12 @@ config
> BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
>  	depends on BR2_USE_WCHAR # librsvg -> glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # librsvg -> glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	help
>  	  This option enables the Evas generic SVG loader
> 
> -comment "SVG loader needs a toolchain w/ wchar, threads, C++"
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> || !BR2_INSTALL_LIBSTDCPP
> +comment "SVG loader needs a toolchain w/ wchar, threads, C++, atomic
> intrinsics"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> 
>  endif
> diff --git a/package/gstreamer/gst-plugins-good/Config.in
> b/package/gstreamer/gst-plugins-good/Config.in
> index 3ec93cf..2e81a6a 100644
> --- a/package/gstreamer/gst-plugins-good/Config.in
> +++ b/package/gstreamer/gst-plugins-good/Config.in
> @@ -178,9 +178,13 @@ config
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
> 
>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO
>  	bool "cairo"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
> 
> +comment "cairo needs a toolchain w/ atomic intrinsics"
> +	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +
>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC
>  	bool "flac (libFLAC)"
>  	depends on BR2_USE_WCHAR # flac
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in
> b/package/gstreamer1/gst1-plugins-good/Config.in
> index 7159c5a..aa45ba7 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -274,11 +274,15 @@ config
> BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
> 
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
>  	bool "cairo"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
>  	help
>  	  Cairo-based elements
> 
> +comment "cairo needs a toolchain w/ atomic intrinsics"
> +	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC
>  	bool "flac (libFLAC)"
>  	depends on BR2_USE_WCHAR # flac
> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
> index 5239c25..ce70256 100644
> --- a/package/libgtk2/Config.in
> +++ b/package/libgtk2/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_LIBGTK2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	help
>  	  The GTK+ version 2 graphical user interface library
> 
> @@ -32,8 +33,8 @@ config BR2_PACKAGE_LIBGTK2_DEMO
> 
>  endif
> 
> -comment "libgtk2 needs a toolchain w/ wchar, threads, C++"
> +comment "libgtk2 needs a toolchain w/ wchar, threads, C++, atomic
> intrinsics"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_XORG7
>  	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS ||
> !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
> index 5dd4c58..e1dbf4f 100644
> --- a/package/librsvg/Config.in
> +++ b/package/librsvg/Config.in
> @@ -10,12 +10,14 @@ config BR2_PACKAGE_LIBRSVG
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	help
>  	  The rsvg library is an efficient renderer for Scalable
>  	  Vector Graphics (SVG) pictures.
> 
>  	  http://librsvg.sourceforge.net/
> 
> -comment "librsvg needs a toolchain w/ wchar, threads, C++"
> +comment "librsvg needs a toolchain w/ wchar, threads, C++, atomic
> intrinsics"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> || !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> diff --git a/package/libsvg-cairo/Config.in b/package/libsvg-cairo/Config.in
> index 9577c69..a1a8401 100644
> --- a/package/libsvg-cairo/Config.in
> +++ b/package/libsvg-cairo/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBSVG_CAIRO
>  	bool "libsvg-cairo"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_SVG
>  	select BR2_PACKAGE_LIBSVG
> @@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBSVG_CAIRO
>  	  rendering library.
> 
>  	  http://cairographics.org
> +
> +comment "cairo needs a toolchain w/ atomic intrinsics"
> +	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> diff --git a/package/pango/Config.in b/package/pango/Config.in
> index 70f4fd3..6dee251 100644
> --- a/package/pango/Config.in
> +++ b/package/pango/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PANGO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # freetype support
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_CAIRO
> @@ -21,7 +22,7 @@ config BR2_PACKAGE_PANGO
> 
>  	  http://www.pango.org/
> 
> -comment "pango needs a toolchain w/ wchar, threads, C++"
> +comment "pango needs a toolchain w/ wchar, threads, C++, atomic
> intrinsics"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> || \
> -		!BR2_INSTALL_LIBSTDCPP
> +		!BR2_INSTALL_LIBSTDCPP ||
> !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> diff --git a/package/webkit/Config.in b/package/webkit/Config.in
> index b7f903c..f42a96f 100644
> --- a/package/webkit/Config.in
> +++ b/package/webkit/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_WEBKIT
>  	depends on BR2_PACKAGE_LIBGTK2
>  	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # icu
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_ENCHANT
>  	select BR2_PACKAGE_HARFBUZZ
> @@ -41,8 +42,9 @@ config BR2_PACKAGE_WEBKIT
> 
>  	  http://webkit.org/
> 
> -comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
> +comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads,
> atomic intrinsics"
>  	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP
> || \
> -		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
>  	depends on BR2_USE_MMU
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index aaef405..f927c5f 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_WESTON
>  	depends on !BR2_avr32 # wayland
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # cairo
>  	# Runtime dependency
>  	select BR2_PACKAGE_XKEYBOARD_CONFIG
>  	# Make sure at least one compositor is selected.
> @@ -27,6 +28,9 @@ config BR2_PACKAGE_WESTON
> 
>  	  http://wayland.freedesktop.org/
> 
> +comment "weston needs a toolchain w/ atomic intrinsics"
> +	depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +
>  if BR2_PACKAGE_WESTON
> 
>  # Helper to make sure at least one compositor is selected.
> --
> 1.8.4.1
