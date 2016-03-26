From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:35:08 -0300
Subject: [Buildroot] [PATCH 2/5] webkitgtk: new package
In-Reply-To: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1459020911-20593-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the latest 2.12.x upstream stable branch.

Both 2.4.x and 2.12.x can live side-by-side, however only the latest
stable branch/releases are security-maintained, so add it unslotted.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                |  1 +
 package/webkitgtk/Config.in      | 77 +++++++++++++++++++++++++++++++++++++
 package/webkitgtk/webkitgtk.hash |  4 ++
 package/webkitgtk/webkitgtk.mk   | 83 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 package/webkitgtk/Config.in
 create mode 100644 package/webkitgtk/webkitgtk.hash
 create mode 100644 package/webkitgtk/webkitgtk.mk

diff --git a/package/Config.in b/package/Config.in
index 3c8976e..1cc5f47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -943,6 +943,7 @@ menu "Graphics"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
 	source "package/webkit/Config.in"
+	source "package/webkitgtk/Config.in"
 	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
 	source "package/zbar/Config.in"
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
new file mode 100644
index 0000000..e662fed
--- /dev/null
+++ b/package/webkitgtk/Config.in
@@ -0,0 +1,77 @@
+config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	bool
+	# ARM needs BLX, so v5t+, BE completely untested so disabled
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
+	default y if BR2_i386 || BR2_x86_64
+	# Disabled on MIPS big endian due to sigbus
+	default y if BR2_mipsel || BR2_mips64el
+	# Disabled on PowerPC pending runtime testing
+	# Disabled on SuperH because of segfault
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+
+comment "webkitgtk needs libgtk3 and an (e)glibc toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_WEBKITGTK
+	bool "webkitgtk"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_ENCHANT
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBSECRET
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_LIBGTK3_X11
+	help
+	  WebKit is an open source, standards compliant web browser engine.
+
+	  http://www.webkitgtk.org/
+
+if BR2_PACKAGE_WEBKITGTK
+
+config BR2_PACKAGE_WEBKITGTK_HTTPS
+	bool "HTTPS support"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	select BR2_PACKAGE_LIBSOUP_SSL
+	help
+	  Enable HTTPS protocol support.
+
+config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
+	bool "multimedia support"
+	select BR2_PACKAGE_GSTREAMER1
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
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	select BR2_PACKAGE_GST1_LIBAV
+	help
+	  This option pulls in all of the required dependencies
+	  to enable multimedia (video/audio) support.
+
+endif
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
new file mode 100644
index 0000000..15bc05e
--- /dev/null
+++ b/package/webkitgtk/webkitgtk.hash
@@ -0,0 +1,4 @@
+# From http://www.webkitgtk.org/releases/webkitgtk-2.12.0.tar.xz.sha1
+sha1	05b498e45ad361003918822e81c66c9c39728263	webkitgtk-2.12.0.tar.xz
+# Calculated based on the hash above
+sha256	a68604f8fd1bcb247d647709290226289b90c16acb1f3730538b688db8df5ea6	webkitgtk-2.12.0.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
new file mode 100644
index 0000000..d4e6ab5
--- /dev/null
+++ b/package/webkitgtk/webkitgtk.mk
@@ -0,0 +1,83 @@
+################################################################################
+#
+# webkitgtk
+#
+################################################################################
+
+WEBKITGTK_VERSION = 2.12.0
+WEBKITGTK_SITE = http://www.webkitgtk.org/releases
+WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
+WEBKITGTK_INSTALL_STAGING = YES
+WEBKITGTK_LICENSE = LGPLv2.1+ BSD-2c
+WEBKITGTK_LICENSE_FILES = \
+	Source/WebCore/LICENSE-APPLE \
+	Source/WebCore/LICENSE-LGPL-2.1
+WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
+	enchant harfbuzz icu jpeg libgtk3 libsecret libsoup \
+	libxml2 libxslt sqlite webp \
+	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
+	$(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
+WEBKITGTK_CONF_OPTS = \
+	-DENABLE_API_TESTS=OFF \
+	-DENABLE_GEOLOCATION=OFF \
+	-DENABLE_GTKDOC=OFF \
+	-DENABLE_INTROSPECTION=OFF \
+	-DENABLE_MINIBROWSER=ON \
+	-DENABLE_SPELLCHECK=ON \
+	-DPORT=GTK \
+	-DUSE_LIBNOTIFY=OFF \
+	-DUSE_LIBHYPHEN=OFF
+
+# ARM needs NEON for JIT
+# i386 & x86_64 don't seem to have any special requirements
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
+WEBKITGTK_CONF_OPTS += \
+	-DENABLE_VIDEO=ON \
+	-DENABLE_WEB_AUDIO=ON
+WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
+else
+WEBKITGTK_CONF_OPTS += \
+	-DENABLE_VIDEO=OFF \
+	-DENABLE_WEB_AUDIO=OFF
+endif
+
+# Only one target platform can be built, assume X11 > Wayland
+
+# GTK3-X11 target mandates OpenGL from newer libgtk3 versions
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+WEBKITGTK_CONF_OPTS += \
+	-DENABLE_ACCELERATED_2D_CANVAS=ON \
+	-DENABLE_GLES2=OFF \
+	-DENABLE_OPENGL=ON \
+	-DENABLE_X11_TARGET=ON
+WEBKITGTK_DEPENDENCIES += libgl \
+	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
+# It can use libgtk2 for npapi plugins
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=ON
+WEBKITGTK_DEPENDENCIES += libgtk2
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=OFF
+endif
+else # !X11
+# GTK3-WAYLAND target mandates EGL from newer libgtk3 versions
+ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
+WEBKITGTK_DEPENDENCIES += libegl
+# GLES support is optional
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
+WEBKITGTK_DEPENDENCIES += libgles
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
+endif
+endif
+endif
+
+$(eval $(cmake-package))
-- 
2.7.3
