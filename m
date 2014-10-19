From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 12:23:08 +0200
Subject: [Buildroot] [PATCH v2 1/3] infra: Move --enable/--disable-debug
 to package/Makefile.in
In-Reply-To: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413712743-21832-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019102308.GO4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-19 11:59 +0200, Bernd Kuhls spake thusly:
> A lot of packages ignored BR2_ENABLE_DEBUG. This patch simplifies the handling of
> this option by adding the corresponding configure option to the global Makefile
> for target packages.
> 
> For host packages --disable-debug is added to the global Makefile.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

You forgot to propagate my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: no changes
> 
>  package/Makefile.in                                       |    2 +-
>  package/alsa-lib/alsa-lib.mk                              |    4 ----
>  package/atk/atk.mk                                        |    3 +--
>  package/directfb/directfb.mk                              |    1 -
>  package/ffmpeg/ffmpeg.mk                                  |    6 ------
>  package/gamin/gamin.mk                                    |    1 -
>  package/gstreamer/gst-plugins-good/gst-plugins-good.mk    |    1 -
>  package/gstreamer1/gst1-libav/gst1-libav.mk               |    5 +----
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   |    1 -
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk |    3 +--
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk |    1 -
>  package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk |    5 +----
>  package/gstreamer1/gstreamer1/gstreamer1.mk               |    1 -
>  package/gtk2-engines/gtk2-engines.mk                      |    1 -
>  package/lesstif/lesstif.mk                                |    1 -
>  package/libglib2/libglib2.mk                              |    1 -
>  package/libgtk2/libgtk2.mk                                |    7 ++-----
>  package/libndp/libndp.mk                                  |    1 -
>  package/libsoc/libsoc.mk                                  |    1 -
>  package/lzma/lzma.mk                                      |    1 -
>  package/openobex/openobex.mk                              |    1 -
>  package/openvpn/openvpn.mk                                |    2 +-
>  package/pango/pango.mk                                    |    4 +---
>  package/pkg-autotools.mk                                  |    2 ++
>  package/rsync/rsync.mk                                    |    1 -
>  package/xbmc/xbmc.mk                                      |    1 -
>  package/xenomai/xenomai.mk                                |    3 +--
>  27 files changed, 12 insertions(+), 49 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ab59b54..02ddaa7 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -370,7 +370,7 @@ endif
>  ifeq ($(BR2_ENABLE_DEBUG),y)
>  ENABLE_DEBUG := --enable-debug
>  else
> -ENABLE_DEBUG :=
> +ENABLE_DEBUG := --disable-debug
>  endif
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index ebc506e..1f2b60c 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -49,10 +49,6 @@ ifneq ($(BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS),y)
>  ALSA_LIB_CONF_OPTS += --disable-old-symbols
>  endif
>  
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> -ALSA_LIB_CONF_OPTS += --enable-debug
> -endif
> -
>  ifeq ($(BR2_avr32),y)
>  ALSA_LIB_CFLAGS += -DAVR32_INLINE_BUG
>  endif
> diff --git a/package/atk/atk.mk b/package/atk/atk.mk
> index 690770b..18fe688 100644
> --- a/package/atk/atk.mk
> +++ b/package/atk/atk.mk
> @@ -41,8 +41,7 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
>  		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
>  		gl_cv_c_restrict=no ac_cv_prog_F77=no
>  
> -ATK_CONF_OPTS =  --disable-glibtest --enable-explicit-deps=no \
> -		--disable-debug
> +ATK_CONF_OPTS =  --disable-glibtest --enable-explicit-deps=no
>  
>  ATK_DEPENDENCIES = libglib2 host-pkgconf
>  
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index eb0328c..7f1c8d7 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -144,7 +144,6 @@ endif
>  
>  HOST_DIRECTFB_DEPENDENCIES = host-pkgconf host-libpng
>  HOST_DIRECTFB_CONF_OPTS = \
> -		--disable-debug \
>  		--disable-multi \
>  		--enable-png \
>  		--with-gfxdrivers=none \
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index af4e1f6..166b5ce 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -66,12 +66,6 @@ FFMPEG_CONF_OPTS = \
>  
>  FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
>  
> -ifeq ($(BR2_ENABLE_DEBUG),y)
> -FFMPEG_CONF_OPTS += --enable-debug
> -else
> -FFMPEG_CONF_OPTS += --disable-debug
> -endif
> -
>  ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
>  FFMPEG_CONF_OPTS += --enable-gpl
>  else
> diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
> index 2a85b75..443dd48 100644
> --- a/package/gamin/gamin.mk
> +++ b/package/gamin/gamin.mk
> @@ -10,7 +10,6 @@ GAMIN_AUTORECONF = YES
>  GAMIN_INSTALL_STAGING = YES
>  GAMIN_LICENSE = LGPLv2+
>  GAMIN_LICENSE_FILES = COPYING
> -GAMIN_CONF_OPTS = --disable-debug
>  
>  # python support broken
>  GAMIN_CONF_OPTS += --without-python
> diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
> index 4ab5371..2c2706a 100644
> --- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
> +++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
> @@ -9,7 +9,6 @@ GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
>  GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
>  
>  GST_PLUGINS_GOOD_CONF_OPTS = \
> -		--disable-debug \
>  		--disable-examples \
>  		--disable-directsound \
>  		--disable-sunaudio \
> diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
> index b903da2..6fdf091 100644
> --- a/package/gstreamer1/gst1-libav/gst1-libav.mk
> +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
> @@ -10,10 +10,7 @@ GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
>  
>  GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
>  
> -GST1_LIBAV_CONF_EXTRA_OPTS = \
> -	--cross-prefix=$(TARGET_CROSS) \
> -	--target-os=linux \
> -	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
> +GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index cf4648d..a8dbd53 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -18,7 +18,6 @@ GST1_PLUGINS_BAD_GETTEXTIZE = YES
>  
>  GST1_PLUGINS_BAD_CONF_OPTS = \
>  	--disable-examples \
> -	--disable-debug \
>  	--disable-valgrind \
>  	--disable-directsound \
>  	--disable-wsapi \
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index bc19bac..15368a2 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -23,8 +23,7 @@ GST1_PLUGINS_BASE_CONF_OPTS = \
>  	--disable-oggtest \
>  	--disable-vorbistest \
>  	--disable-freetypetest \
> -	--disable-valgrind \
> -	--disable-debug
> +	--disable-valgrind
>  
>  # Options which require currently unpackaged libraries
>  GST1_PLUGINS_BASE_CONF_OPTS += \
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index 0167e4f..7c40b99 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -11,7 +11,6 @@ GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
>  GST1_PLUGINS_GOOD_LICENSE = LGPLv2.1+
>  
>  GST1_PLUGINS_GOOD_CONF_OPTS = \
> -	--disable-debug \
>  	--disable-valgrind \
>  	--disable-examples \
>  	--disable-directsound \
> diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> index 656189d..3455832 100644
> --- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> +++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
> @@ -11,10 +11,7 @@ GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
>  # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
>  GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
>  
> -GST1_PLUGINS_UGLY_CONF_OPTS = \
> -	--disable-examples \
> -	--disable-debug \
> -	--disable-valgrind
> +GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
>  
>  GST_PLUGINS_BAD1_CONF_OPTS += \
>  	--disable-a52dec \
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index 9d49e6d..be84d5b 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -25,7 +25,6 @@ GSTREAMER1_CONF_OPTS = \
>  	--disable-examples \
>  	--disable-tests \
>  	--disable-failing-tests \
> -	--disable-debug \
>  	--disable-valgrind \
>  	--disable-benchmarks \
>  	--disable-check \
> diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
> index 11cd7aa..e89b978 100644
> --- a/package/gtk2-engines/gtk2-engines.mk
> +++ b/package/gtk2-engines/gtk2-engines.mk
> @@ -71,7 +71,6 @@ GTK2_ENGINES_CONF_OPTS = \
>  		--x-libraries=$(STAGING_DIR)/usr/lib \
>  		--disable-glibtest \
>  		--enable-explicit-deps=no \
> -		--disable-debug \
>  		--enable-clearlooks \
>  		--disable-crux \
>  		--disable-hc \
> diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
> index bc046c5..6ce2339 100644
> --- a/package/lesstif/lesstif.mk
> +++ b/package/lesstif/lesstif.mk
> @@ -16,7 +16,6 @@ LESSTIF_LICENSE_FILES = COPYING.LIB
>  LESSTIF_CONF_OPTS = \
>  	--with-gnu-ld \
>  	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
> -	--enable-debug=no \
>  	--enable-production=yes	\
>  	--enable-build-tests=no \
>  	--no-recursion
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index dfcf610..d7836a5 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -63,7 +63,6 @@ endif
>  
>  HOST_LIBGLIB2_CONF_OPTS = \
>  		--disable-gtk-doc \
> -		--enable-debug=no \
>  		--disable-dtrace \
>  		--disable-systemtap \
>  		--disable-gcov \
> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> index 9e79e60..7bd7b4e 100644
> --- a/package/libgtk2/libgtk2.mk
> +++ b/package/libgtk2/libgtk2.mk
> @@ -69,9 +69,7 @@ LIBGTK2_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
>  		ac_cv_prog_F77=no \
>  		ac_cv_path_CUPS_CONFIG=no
>  
> -LIBGTK2_CONF_OPTS = --disable-glibtest \
> -		--enable-explicit-deps=no \
> -		--disable-debug
> +LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
>  
>  LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
>  
> @@ -164,8 +162,7 @@ HOST_LIBGTK2_CONF_OPTS = \
>  		--without-libtiff \
>  		--without-libjpeg \
>  		--with-gdktarget=none \
> -		--disable-cups \
> -		--disable-debug
> +		--disable-cups
>  
>  define HOST_LIBGTK2_BUILD_CMDS
>   $(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
> diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
> index 413c3da..c40a017 100644
> --- a/package/libndp/libndp.mk
> +++ b/package/libndp/libndp.mk
> @@ -10,6 +10,5 @@ LIBNDP_LICENSE = LGPLv2.1+
>  LIBNDP_LICENSE_FILES = COPYING
>  LIBNDP_AUTORECONF = YES
>  LIBNDP_INSTALL_STAGING = YES
> -LIBNDP_CONF_OPTS = --disable-debug
>  
>  $(eval $(autotools-package))
> diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
> index eb2a3ff..3253c50 100644
> --- a/package/libsoc/libsoc.mk
> +++ b/package/libsoc/libsoc.mk
> @@ -10,6 +10,5 @@ LIBSOC_LICENSE = LGPLv2.1
>  LIBSOC_LICENSE_FILES = COPYING
>  LIBSOC_AUTORECONF = YES
>  LIBSOC_INSTALL_STAGING = YES
> -LIBSOC_CONF_OPTS = --disable-debug
>  
>  $(eval $(autotools-package))
> diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
> index 4d4e82e..90f0771 100644
> --- a/package/lzma/lzma.mk
> +++ b/package/lzma/lzma.mk
> @@ -7,7 +7,6 @@
>  LZMA_VERSION = 4.32.7
>  LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
>  LZMA_SITE = http://tukaani.org/lzma
> -LZMA_CONF_OPTS = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
>  
>  $(eval $(host-autotools-package))
>  
> diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
> index 90f1765..82bfd43 100644
> --- a/package/openobex/openobex.mk
> +++ b/package/openobex/openobex.mk
> @@ -16,7 +16,6 @@ OPENOBEX_AUTORECONF = YES
>  OPENOBEX_INSTALL_STAGING = YES
>  
>  OPENOBEX_CONF_OPTS += \
> -	$(if $(BR2_ENABLE_DEBUG),--enable-debug) \
>  	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
>  	$(if $(BR2_PACKAGE_OPENOBEX_SYSLOG),--enable-syslog) \
>  	$(if $(BR2_PACKAGE_OPENOBEX_DUMP),--enable-dump)
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 6b904ef..2ab29b8 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -18,7 +18,7 @@ OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
>  
>  ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
>  OPENVPN_CONF_OPTS += --enable-small --disable-plugins \
> -	--disable-debug --disable-eurephia
> +	--disable-eurephia
>  endif
>  
>  # BusyBox 1.21+ places the ip applet in the "correct" place
> diff --git a/package/pango/pango.mk b/package/pango/pango.mk
> index bc2eb20..46490c1 100644
> --- a/package/pango/pango.mk
> +++ b/package/pango/pango.mk
> @@ -40,9 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
>  		ac_use_included_regex=no gl_cv_c_restrict=no \
>  		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
>  
> -PANGO_CONF_OPTS = --enable-explicit-deps=no \
> -	--disable-debug \
> -	--disable-gtk-doc-html
> +PANGO_CONF_OPTS = --enable-explicit-deps=no --disable-gtk-doc-html
>  
>  PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
>  	host-pkgconf \
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 3c5430f..80adc8b 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -146,6 +146,7 @@ define $(2)_CONFIGURE_CMDS
>  		$$(DISABLE_NLS) \
>  		$$(DISABLE_LARGEFILE) \
>  		$$(DISABLE_IPV6) \
> +		$$(ENABLE_DEBUG) \
>  		$$(SHARED_STATIC_LIBS_OPTS) \
>  		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
>  	)
> @@ -172,6 +173,7 @@ define $(2)_CONFIGURE_CMDS
>  		--disable-doc \
>  		--disable-docs \
>  		--disable-documentation \
> +		--disable-debug \
>  		--with-xmlto=no \
>  		--with-fop=no \
>  		--disable-dependency-tracking \
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index 8887b67..70fae85 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -10,7 +10,6 @@ RSYNC_LICENSE = GPLv3+
>  RSYNC_LICENSE_FILES = COPYING
>  RSYNC_DEPENDENCIES = zlib popt
>  RSYNC_CONF_OPTS = \
> -	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
>  	--with-included-zlib=no \
>  	--with-included-popt=no
>  
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 0101ad7..86a9721 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -42,7 +42,6 @@ XBMC_CONF_ENV = \
>  XBMC_CONF_OPTS +=  \
>  	--with-arch=$(BR2_ARCH) \
>  	--disable-crystalhd \
> -	--disable-debug \
>  	--disable-dvdcss \
>  	--disable-hal \
>  	--disable-joystick \
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index a1697d3..740a40b 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -19,8 +19,7 @@ XENOMAI_INSTALL_STAGING = YES
>  XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
>  XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
>  
> -XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install \
> -	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
> +XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
>  
>  define XENOMAI_REMOVE_DEVFILES
>  	for i in xeno-config xeno-info wrap-link.sh ; do \
> -- 
> 1.7.10.4
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
