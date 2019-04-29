From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 29 Apr 2019 21:45:29 +0200
Subject: [Buildroot] [DRAFT v1 2/7] package/gst1-plugins-base: convert to
 meson build
In-Reply-To: <20190429194534.25743-1-ps.report@gmx.net>
References: <20190429194534.25743-1-ps.report@gmx.net>
Message-ID: <20190429194534.25743-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gst1-plugins-base/gst1-plugins-base.mk    | 243 +++++++++---------
 1 file changed, 123 insertions(+), 120 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 60f2d4856b..41df49eaa5 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -12,267 +12,270 @@ GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+

 GST1_PLUGINS_BASE_CONF_OPTS = \
-	--disable-examples \
-	--disable-valgrind \
-	--disable-introspection
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dgtk_doc=disabled \
+	-Dintrospection=disabled

 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BASE_CONF_OPTS += \
-	--disable-cdparanoia \
-	--disable-libvisual \
-	--disable-iso-codes
+	-Dcdparanoia=disabled \
+	-Dlibvisual=disabled \
+	-Diso-codes=disabled

 GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1

-# These plugins are listed in the order from ./configure --help
+# checked for by gst-libs/gst/tag/meson.build
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GST1_PLUGINS_BASE_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-orc
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-opengl
+GST1_PLUGINS_BASE_GL_API += opengl
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += libgl libglu
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-opengl
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl=disabled
 endif

+# ToDo: gl-graphene, gl-jpeg, gl-png
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-gles2
+GST1_PLUGINS_BASE_GL_API += gles2
 GST1_PLUGINS_BASE_DEPENDENCIES += libgles
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-gles2
 endif

+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_api=$(shell echo $(GST1_PLUGINS_BASE_GL_API) | tr ' ' ',')
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-glx
+GST1_PLUGINS_BASE_GL_PLATFORM += glx
 GST1_PLUGINS_BASE_DEPENDENCIES += xorgproto xlib_libXrender
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-glx
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-egl
+GST1_PLUGINS_BASE_GL_PLATFORM += egl
 GST1_PLUGINS_BASE_DEPENDENCIES += libegl
-GST1_PLUGINS_BASE_CONF_ENV += \
-	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-egl
+# ToDo:
+#GST1_PLUGINS_BASE_CONF_ENV += \
+#	CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`" \
+#	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs egl`"
 endif

+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_platform=$(shell echo $(GST1_PLUGINS_BASE_GL_PLATFORM) | tr ' ' ',')
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-x11
+GST1_PLUGINS_BASE_GL_WINSYS += x11
 GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-x11
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-wayland
+GST1_PLUGINS_BASE_GL_WINSYS += wayland
 GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-wayland
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-dispmanx
+GST1_PLUGINS_BASE_GL_WINSYS += dispmanx
 GST1_PLUGINS_BASE_DEPENDENCIES += rpi-userland
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-dispmanx
 endif

+GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_winsys=$(shell echo $(GST1_PLUGINS_BASE_GL_WINSYS) | tr ' ' ',')
+
+# These plugins are listed in the order from meson_options.txt
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-adder
+GST1_PLUGINS_BASE_CONF_OPTS += -Dadder=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-adder
+GST1_PLUGINS_BASE_CONF_OPTS += -Dadder=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-app
+GST1_PLUGINS_BASE_CONF_OPTS += -Dapp=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-app
+GST1_PLUGINS_BASE_CONF_OPTS += -Dapp=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-audioconvert
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudioconvert=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudioconvert=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOMIXER),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiomixer
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudiomixer=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiomixer
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudiomixer=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudiorate=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiorate
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudiorate=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiotestsrc
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudioresample=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudioresample=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-compositor
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudiotestsrc=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-compositor
+GST1_PLUGINS_BASE_CONF_OPTS += -Daudiotestsrc=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-encoding
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dcompositor=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-encoding
+GST1_PLUGINS_BASE_CONF_OPTS += -Dcompositor=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-videoconvert
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dencoding=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-videoconvert
+GST1_PLUGINS_BASE_CONF_OPTS += -Dencoding=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-gio
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgio=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-gio
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgio=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-overlaycomposition
+GST1_PLUGINS_BASE_CONF_OPTS += -Doverlaycomposition=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-overlaycomposition
+GST1_PLUGINS_BASE_CONF_OPTS += -Doverlaycomposition=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-playback
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-playback
-endif
+# ToDo: pbtypes

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-audioresample
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dplayback=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioresample
+GST1_PLUGINS_BASE_CONF_OPTS += -Dplayback=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_RAWPARSE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-rawparse
+GST1_PLUGINS_BASE_CONF_OPTS += -Drawparse=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-rawparse
+GST1_PLUGINS_BASE_CONF_OPTS += -Drawparse=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-subparse
+GST1_PLUGINS_BASE_CONF_OPTS += -Dsubparse=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-subparse
+GST1_PLUGINS_BASE_CONF_OPTS += -Dsubparse=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-tcp
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtcp=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-tcp
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtcp=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-typefind
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtypefind=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-typefind
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtypefind=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-videotestsrc
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvert=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-videotestsrc
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoconvert=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-videorate
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideorate=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-videorate
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideorate=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-videoscale
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoscale=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-videoscale
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideoscale=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-volume
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-volume
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST1_PLUGINS_BASE_DEPENDENCIES += zlib
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideotestsrc=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-zlib
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvideotestsrc=disabled
 endif

-ifeq ($(BR2_PACKAGE_XORG7),y)
-GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST1_PLUGINS_BASE_CONF_OPTS += \
-	--enable-x \
-	--enable-xshm \
-	--enable-xvideo
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvolume=enabled
 else
-GST1_PLUGINS_BASE_CONF_OPTS += \
-	--disable-x \
-	--disable-xshm \
-	--disable-xvideo
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvolume=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dalsa=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += alsa-lib
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-alsa
+GST1_PLUGINS_BASE_CONF_OPTS += -Dalsa=disabled
 endif

-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-ivorbis
-GST1_PLUGINS_BASE_DEPENDENCIES += tremor
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dogg=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += libogg
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-ivorbis
+GST1_PLUGINS_BASE_CONF_OPTS += -Dogg=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-opus
+GST1_PLUGINS_BASE_CONF_OPTS += -Dopus=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += opus
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-opus
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-ogg
-GST1_PLUGINS_BASE_DEPENDENCIES += libogg
-else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-ogg
+GST1_PLUGINS_BASE_CONF_OPTS += -Dopus=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-pango
+GST1_PLUGINS_BASE_CONF_OPTS += -Dpango=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += pango
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-pango
+GST1_PLUGINS_BASE_CONF_OPTS += -Dpango=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-theora
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtheora=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += libtheora
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-theora
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtheora=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtremor=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += tremor
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dtremor=disabled
 endif

 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS),y)
-GST1_PLUGINS_BASE_CONF_OPTS += --enable-vorbis
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvorbis=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += libvorbis
 else
-GST1_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
+GST1_PLUGINS_BASE_CONF_OPTS += -Dvorbis=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST1_PLUGINS_BASE_CONF_OPTS += \
+	-Dx11=enabled \
+	-Dxshm=enabled \
+	-Dxvideo=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
+else
+GST1_PLUGINS_BASE_CONF_OPTS += \
+	-Dx11=disabled \
+	-Dxshm=disabled \
+	-Dxvideo=disabled
 endif

-$(eval $(autotools-package))
+$(eval $(meson-package))
--
2.21.0
