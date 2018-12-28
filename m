From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 28 Dec 2018 02:18:32 +0100
Subject: [Buildroot] [RFC 3/3] wpewebkit: new package
In-Reply-To: <20181223154845.23556-4-francois.perrad@gadz.org>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
 <20181223154845.23556-4-francois.perrad@gadz.org>
Message-ID: <20181228021832.GB14369@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Dec 2018 16:48:45 +0100, Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/wpewebkit/Config.in      | 82 ++++++++++++++++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash |  8 ++++
>  package/wpewebkit/wpewebkit.mk   | 69 +++++++++++++++++++++++++++
>  5 files changed, 161 insertions(+)
>  create mode 100644 package/wpewebkit/Config.in
>  create mode 100644 package/wpewebkit/wpewebkit.hash
>  create mode 100644 package/wpewebkit/wpewebkit.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 93a2bf5ad..491ebcaca 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -829,6 +829,7 @@ F:	package/sdl2_mixer/
>  F:	package/sdl2_net/
>  F:	package/tekui/
>  F:	package/wpebackend-fdo/
> +F:	package/wpewebkit/
>  F:	package/wsapi-fcgi/
>  F:	package/wsapi-xavante/
>  F:	utils/scancpan
> diff --git a/package/Config.in b/package/Config.in
> index e8a676ab0..592f00456 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1303,6 +1303,7 @@ menu "Graphics"
>  	source "package/webp/Config.in"
>  	source "package/woff2/Config.in"
>  	source "package/wpebackend-fdo/Config.in"
> +	source "package/wpewebkit/Config.in"
>  	source "package/zbar/Config.in"
>  	source "package/zxing-cpp/Config.in"
>  endmenu
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> new file mode 100644
> index 000000000..7a020dd05
> --- /dev/null
> +++ b/package/wpewebkit/Config.in
> @@ -0,0 +1,82 @@
> +comment "wpewebkit needs an OpenGL ES w/ EGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
> +
> +config BR2_PACKAGE_WPEWEBKIT
> +	bool "wpewebkit"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on !BR2_BINFMT_FLAT # icu
> +	depends on BR2_INSTALL_LIBSTDCPP # icu
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
> +	depends on BR2_USE_WCHAR # gettext

The BR2_USE_WCHAR dependency is not needed.

> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error

I would like to have here a BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS symbol which
determines whether the package is supported on the target platform. For
inspiration, you can take a look at the overlay:

  https://github.com/Igalia/buildroot-wpe/blob/master/package/wpewebkit/Config.in#L1

Even better: Have a BR2_WEBKIT_ARCH_SUPPORTS symbol with the common
dependencies for both the ?webkitgtk? and ?wpewebkit? packages -- they
basically support the same set of architectures, and the same goes for the
JavaScriptCore JIT compilation support (look at how the ?webkitgtk? package
defines BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT).

> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_HARFBUZZ
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBEPOXY
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> +	select BR2_PACKAGE_WEBP
> +	select BR2_PACKAGE_WEBP_DEMUX
> +	select BR2_PACKAGE_WPEBACKEND_FDO
> +	help
> +	  WPE (Web Platform for Embedded) port of the WebKit engine,
> +	  to allow embedders to create simple and performant systems
> +	  based on Web platform technologies.
> +
> +	  https://wpewebkit.org/
> +
> +if BR2_PACKAGE_WPEWEBKIT
> +
> +config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
> +	bool "multimedia support"
> +	select BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_GST1_PLUGINS_BAD
> +	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
> +	select BR2_PACKAGE_GST1_PLUGINS_GOOD
> +	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
> +	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
> +	select BR2_PACKAGE_GST1_LIBAV
> +	help
> +	  This option pulls in all of the required dependencies
> +	  to enable multimedia (video/audio) support.

This is missing:

  select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
  select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX

In particular these two are needed to properly support video playback using
Media Source Extensions (MSE) which e.g. video sites like YouTube need
nowadays.

> +if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
> +
> +config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
> +	bool "use gstreamer-gl"
> +	default y
> +	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
> +	help
> +	  Use the GStreamer GL elements for handling video content.
> +	  This is recommended as it improves performance of video
> +	  playback. In some target configurations incorrect rendering
> +	  might be produced, and disabling this option may help.
> +
> +endif
> +
> +config BR2_PACKAGE_WPEWEBKIT_WEBDRIVER
> +	bool "WebDriver support"
> +	help
> +	  Enable support for WebDriver. This will build and install the
> +	  WebKitWebDriver program in the target.
> +

I would also have options to make support for XSLT, WOFF2, and WebCrypto
optional explicitly instead of choosing them in ?wpewebkit.mk? depending on
whether the required package(s) have been manually selected. That would avoid
situations in which, for example, a build mysteriously fails to load a WOFF2
Web font due to the ?woff2? package not being manually selected at build time
(because it is not implied in any way that it is needed for WPE WebKit to
support WOFF2 fonts).

> +endif
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> new file mode 100644
> index 000000000..39937a346
> --- /dev/null
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -0,0 +1,8 @@
> +# From https://wpewebkit.org/releases/wpewebkit-2.22.3.tar.xz.sums
> +md5 6d0c693ea49a93fc9e701cf784245ea5 wpewebkit-2.22.3.tar.xz
> +sha1 d8a22bec787f38939c7922dc43bf27c9144cef74 wpewebkit-2.22.3.tar.xz
> +sha256 241f177cded1a4ba3088716650eaaac25588878882170789b3c630ac45dbb2fa wpewebkit-2.22.3.tar.xz
> +
> +# Hashes for license files:
> +sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
> +sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce Source/WebCore/LICENSE-LGPL-2.1
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> new file mode 100644
> index 000000000..fb30326d6
> --- /dev/null
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -0,0 +1,69 @@
> +################################################################################
> +#
> +# wpewebkit
> +#
> +################################################################################
> +
> +WPEWEBKIT_VERSION = 2.22.3
> +WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
> +WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
> +WPEWEBKIT_INSTALL_STAGING = YES
> +WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
> +WPEWEBKIT_LICENSE_FILES = \
> +	Source/WebCore/LICENSE-APPLE \
> +	Source/WebCore/LICENSE-LGPL-2.1
> +WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
> +	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libpng \
> +	wayland-protocols webp wpebackend-fdo
> +
> +WPEWEBKIT_CONF_OPTS = \
> +	-DPORT=WPE \
> +	-DENABLE_API_TESTS=OFF \
> +	-DENABLE_MINIBROWSER=OFF
> +
> +ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
> +WPEWEBKIT_CONF_OPTS += \
> +	-DENABLE_VIDEO=ON \
> +	-DENABLE_WEB_AUDIO=ON
> +WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
> +else
> +WPEWEBKIT_CONF_OPTS += \
> +	-DENABLE_VIDEO=OFF \
> +	-DENABLE_WEB_AUDIO=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
> +WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
> +WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WPEWEBKIT_WEBDRIVER),y)
> +WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=ON
> +else
> +WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBTASN1),y)
> +WPEWEBKIT_CONF_OPTS += -DENABLE_SUBTLE_CRYPTO=ON
> +WPEWEBKIT_DEPENDENCIES += libtasn1
> +else
> +WPEWEBKIT_CONF_OPTS += -DENABLE_SUBTLE_CRYPTO=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXSLT),y)
> +WPEWEBKIT_CONF_OPTS += -DENABLE_XSLT=ON
> +WPEWEBKIT_DEPENDENCIES += libxslt
> +else
> +WPEWEBKIT_CONF_OPTS += -DENABLE_XSLT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WOFF2),y)
> +WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
> +WPEWEBKIT_DEPENDENCIES += woff2
> +else
> +WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
> +endif
> +
> +$(eval $(cmake-package))
> -- 
> 2.17.1

Best regards,

-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181228/55a32f48/attachment.asc>
