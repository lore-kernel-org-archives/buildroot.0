From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 21:41:12 +0100
Subject: [Buildroot] [PATCH 2/5] webkitgtk: new package
In-Reply-To: <1459020911-20593-3-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
 <1459020911-20593-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160326214112.0dff04cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Mar 2016 16:35:08 -0300, Gustavo Zacarias wrote:

> +config BR2_PACKAGE_WEBKITGTK
> +	bool "webkitgtk"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_PACKAGE_LIBGTK3
> +	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_ENCHANT
> +	select BR2_PACKAGE_HARFBUZZ
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBSECRET
> +	select BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_WEBP
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
> +	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_LIBGTK3_X11
> +	help
> +	  WebKit is an open source, standards compliant web browser engine.
> +
> +	  http://www.webkitgtk.org/
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> new file mode 100644
> index 0000000..d4e6ab5
> --- /dev/null
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -0,0 +1,83 @@
> +################################################################################
> +#
> +# webkitgtk
> +#
> +################################################################################
> +
> +WEBKITGTK_VERSION = 2.12.0
> +WEBKITGTK_SITE = http://www.webkitgtk.org/releases
> +WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
> +WEBKITGTK_INSTALL_STAGING = YES
> +WEBKITGTK_LICENSE = LGPLv2.1+ BSD-2c

Is it an "and" (in which case they should be comma separated) or an
"or" (in which case it should be "LGPLv2.1+ or BSD-2c") ? If it's an
"and", are the parts under each license identifiable ?

> +WEBKITGTK_LICENSE_FILES = \
> +	Source/WebCore/LICENSE-APPLE \
> +	Source/WebCore/LICENSE-LGPL-2.1
> +WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
> +	enchant harfbuzz icu jpeg libgtk3 libsecret libsoup \
> +	libxml2 libxslt sqlite webp \
> +	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
> +	$(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)

And those two X11 dependencies already taken care of by libgtk3 ? Why
only libXcomposite and libXdamage handled here and not the other ones ?
Are they really useful for Wayland ?

> +WEBKITGTK_CONF_OPTS = \
> +	-DENABLE_API_TESTS=OFF \
> +	-DENABLE_GEOLOCATION=OFF \
> +	-DENABLE_GTKDOC=OFF \
> +	-DENABLE_INTROSPECTION=OFF \
> +	-DENABLE_MINIBROWSER=ON \
> +	-DENABLE_SPELLCHECK=ON \
> +	-DPORT=GTK \
> +	-DUSE_LIBNOTIFY=OFF \
> +	-DUSE_LIBHYPHEN=OFF
> +
> +# ARM needs NEON for JIT
> +# i386 & x86_64 don't seem to have any special requirements
> +ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
> +WEBKITGTK_CONF_OPTS += \
> +	-DENABLE_VIDEO=ON \
> +	-DENABLE_WEB_AUDIO=ON
> +WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
> +else
> +WEBKITGTK_CONF_OPTS += \
> +	-DENABLE_VIDEO=OFF \
> +	-DENABLE_WEB_AUDIO=OFF
> +endif
> +
> +# Only one target platform can be built, assume X11 > Wayland
> +
> +# GTK3-X11 target mandates OpenGL from newer libgtk3 versions
> +ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> +WEBKITGTK_CONF_OPTS += \
> +	-DENABLE_ACCELERATED_2D_CANVAS=ON \
> +	-DENABLE_GLES2=OFF \
> +	-DENABLE_OPENGL=ON \
> +	-DENABLE_X11_TARGET=ON
> +WEBKITGTK_DEPENDENCIES += libgl \
> +	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt

You're again handling libX* dependencies here, so I guess there is some
duplication/issue here.

> +# It can use libgtk2 for npapi plugins
> +ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=ON
> +WEBKITGTK_DEPENDENCIES += libgtk2
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=OFF
> +endif
> +else # !X11
> +# GTK3-WAYLAND target mandates EGL from newer libgtk3 versions
> +ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
> +WEBKITGTK_DEPENDENCIES += libegl
> +# GLES support is optional
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> +WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
> +WEBKITGTK_DEPENDENCIES += libgles
> +else
> +WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
> +endif
> +endif
> +endif
> +
> +$(eval $(cmake-package))

Otherwise, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
