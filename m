From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 31 Dec 2018 16:49:14 +0100
Subject: [Buildroot] [PATCH v1 4/5] wpewebkit: new package
In-Reply-To: <20181231154915.32660-1-francois.perrad@gadz.org>
References: <20181231154915.32660-1-francois.perrad@gadz.org>
Message-ID: <20181231154915.32660-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                       |  2 +
 package/Config.in                |  1 +
 package/wpewebkit/Config.in      | 84 ++++++++++++++++++++++++++++++++
 package/wpewebkit/wpewebkit.hash |  8 +++
 package/wpewebkit/wpewebkit.mk   | 61 +++++++++++++++++++++++
 5 files changed, 156 insertions(+)
 create mode 100644 package/wpewebkit/Config.in
 create mode 100644 package/wpewebkit/wpewebkit.hash
 create mode 100644 package/wpewebkit/wpewebkit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c2fabe98..af392f73f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -71,6 +71,7 @@ F:	package/libwpe/
 F:	package/webkitgtk/
 F:	package/woff2/
 F:	package/wpebackend-fdo/
+F:	package/wpewebkit/
 
 N:	Adrien Gallou?t <adrien@gallouet.fr>
 F:	package/bird/
@@ -832,6 +833,7 @@ F:	package/sdl2_mixer/
 F:	package/sdl2_net/
 F:	package/tekui/
 F:	package/wpebackend-fdo/
+F:	package/wpewebkit/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
 F:	utils/scancpan
diff --git a/package/Config.in b/package/Config.in
index e57937d57..95a61da1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1304,6 +1304,7 @@ menu "Graphics"
 	source "package/webp/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
+	source "package/wpewebkit/Config.in"
 	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
 endmenu
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
new file mode 100644
index 000000000..0e82c0370
--- /dev/null
+++ b/package/wpewebkit/Config.in
@@ -0,0 +1,84 @@
+comment "wpewebkit needs an OpenGL ES w/ EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_WPEWEBKIT
+	bool "wpewebkit"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_INSTALL_LIBSTDCPP # icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WPEBACKEND_FDO
+	help
+	  WPE (Web Platform for Embedded) port of the WebKit engine,
+	  to allow embedders to create simple and performant systems
+	  based on Web platform technologies.
+
+	  https://wpewebkit.org/
+
+if BR2_PACKAGE_WPEWEBKIT
+
+config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
+	bool "multimedia support"
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
+	select BR2_PACKAGE_GST1_LIBAV
+	help
+	  This option pulls in all of the required dependencies
+	  to enable multimedia (video/audio) support.
+
+if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
+
+config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
+	bool "use gstreamer-gl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	help
+	  Use the GStreamer GL elements for handling video content.
+	  This is recommended as it improves performance of video
+	  playback. In some target configurations incorrect rendering
+	  might be produced, and disabling this option may help.
+
+endif
+
+config BR2_PACKAGE_WPEWEBKIT_WEBDRIVER
+	bool "WebDriver support"
+	help
+	  Enable support for WebDriver. This will build and install the
+	  WebKitWebDriver program in the target.
+
+endif
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
new file mode 100644
index 000000000..39937a346
--- /dev/null
+++ b/package/wpewebkit/wpewebkit.hash
@@ -0,0 +1,8 @@
+# From https://wpewebkit.org/releases/wpewebkit-2.22.3.tar.xz.sums
+md5 6d0c693ea49a93fc9e701cf784245ea5 wpewebkit-2.22.3.tar.xz
+sha1 d8a22bec787f38939c7922dc43bf27c9144cef74 wpewebkit-2.22.3.tar.xz
+sha256 241f177cded1a4ba3088716650eaaac25588878882170789b3c630ac45dbb2fa wpewebkit-2.22.3.tar.xz
+
+# Hashes for license files:
+sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
+sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce Source/WebCore/LICENSE-LGPL-2.1
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
new file mode 100644
index 000000000..b305e4f07
--- /dev/null
+++ b/package/wpewebkit/wpewebkit.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# wpewebkit
+#
+################################################################################
+
+WPEWEBKIT_VERSION = 2.22.3
+WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
+WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
+WPEWEBKIT_INSTALL_STAGING = YES
+WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
+WPEWEBKIT_LICENSE_FILES = \
+	Source/WebCore/LICENSE-APPLE \
+	Source/WebCore/LICENSE-LGPL-2.1
+WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
+	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
+	libpng libxslt wayland-protocols webp wpebackend-fdo
+
+WPEWEBKIT_CONF_OPTS = \
+	-DPORT=WPE \
+	-DENABLE_API_TESTS=OFF \
+	-DENABLE_MINIBROWSER=OFF
+
+ifeq ($(BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS_JIT),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
+WPEWEBKIT_CONF_OPTS += \
+	-DENABLE_VIDEO=ON \
+	-DENABLE_WEB_AUDIO=ON
+WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
+else
+WPEWEBKIT_CONF_OPTS += \
+	-DENABLE_VIDEO=OFF \
+	-DENABLE_WEB_AUDIO=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
+WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_WEBDRIVER),y)
+WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=ON
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WOFF2),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
+WPEWEBKIT_DEPENDENCIES += woff2
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
