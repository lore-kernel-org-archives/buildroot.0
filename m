From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:51:04 +0200
Subject: [Buildroot] [PATCH 10/13] webkitgtk24: remove deprecated package
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |   9 ++
 DEVELOPERS                                         |   1 -
 package/Config.in                                  |   1 -
 package/webkitgtk24/0001-fix-ppc32.patch           |  34 ------
 ...etty-quotes-in-licence-break-Python-stdin.patch |  36 ------
 package/webkitgtk24/Config.in                      |  83 --------------
 package/webkitgtk24/webkitgtk24.hash               |   4 -
 package/webkitgtk24/webkitgtk24.mk                 | 124 ---------------------
 8 files changed, 9 insertions(+), 283 deletions(-)
 delete mode 100644 package/webkitgtk24/0001-fix-ppc32.patch
 delete mode 100644 package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch
 delete mode 100644 package/webkitgtk24/Config.in
 delete mode 100644 package/webkitgtk24/webkitgtk24.hash
 delete mode 100644 package/webkitgtk24/webkitgtk24.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a372052..0c47992 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_WEBKITGTK24
+	bool "webkitgtk 2.4.x removed"
+	select BR2_LEGACY
+	help
+	  This legacy package only existed because some other packages
+	  depended on that specific version of webkitgtk. However, the
+	  other packages have been fixed. webkitgtk 2.4 is full of
+	  security issues so it needs to be removed.
+
 config BR2_PACKAGE_TORSMO
 	bool "torsmo removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e702b2a..71b0456 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -715,7 +715,6 @@ F:	package/vorbis-tools/
 F:	package/wavpack/
 F:	package/wayland-protocols/
 F:	package/webkitgtk/
-F:	package/webkitgtk24/
 F:	package/whois/
 F:	package/wireshark/
 F:	package/wpan-tools/
diff --git a/package/Config.in b/package/Config.in
index 0a17ce0..cdaf9e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1012,7 +1012,6 @@ menu "Graphics"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
 	source "package/webkitgtk/Config.in"
-	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
 	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
diff --git a/package/webkitgtk24/0001-fix-ppc32.patch b/package/webkitgtk24/0001-fix-ppc32.patch
deleted file mode 100644
index c655a0e..0000000
--- a/package/webkitgtk24/0001-fix-ppc32.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From https://bugs.webkit.org/show_bug.cgi?id=130837
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura webkitgtk-2.4.8/Source/WebKit2/Platform/IPC/Connection.h webkitgtk-2.4.8-ppc/Source/WebKit2/Platform/IPC/Connection.h
---- webkitgtk-2.4.8/Source/WebKit2/Platform/IPC/Connection.h	2015-01-07 06:45:43.000000000 -0300
-+++ webkitgtk-2.4.8-ppc/Source/WebKit2/Platform/IPC/Connection.h	2015-04-20 01:55:41.554547510 -0300
-@@ -216,7 +216,11 @@
- 
-     Client* m_client;
-     bool m_isServer;
-+#if CPU(PPC)
-+    uint64_t m_syncRequestID;
-+#else
-     std::atomic<uint64_t> m_syncRequestID;
-+#endif
- 
-     bool m_onlySendMessagesAsDispatchWhenWaitingForSyncReplyWhenProcessingSuchAMessage;
-     bool m_shouldExitOnSyncMessageSendFailure;
-diff -Nura webkitgtk-2.4.8/Source/WebKit2/UIProcess/StatisticsRequest.cpp webkitgtk-2.4.8-ppc/Source/WebKit2/UIProcess/StatisticsRequest.cpp
---- webkitgtk-2.4.8/Source/WebKit2/UIProcess/StatisticsRequest.cpp	2015-01-07 06:45:43.000000000 -0300
-+++ webkitgtk-2.4.8-ppc/Source/WebKit2/UIProcess/StatisticsRequest.cpp	2015-04-20 01:55:41.555547544 -0300
-@@ -44,7 +44,11 @@
- 
- uint64_t StatisticsRequest::addOutstandingRequest()
- {
-+#if CPU(PPC)
-+    static int64_t uniqueRequestID;
-+#else
-     static std::atomic<int64_t> uniqueRequestID;
-+#endif
- 
-     uint64_t requestID = ++uniqueRequestID;
-     m_outstandingRequests.add(requestID);
diff --git a/package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch b/package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch
deleted file mode 100644
index df51078..0000000
--- a/package/webkitgtk24/0003-Pretty-quotes-in-licence-break-Python-stdin.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Pretty quotes in licence break Python stdin.
-
-This patch was submitted upstream in this bug report:
-
-https://bugs.webkit.org/show_bug.cgi?id=128971
-
-[Vincent: tweak the patch to make it apply on Buildroot]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-Pretty quotes in licence break Python stdin.
-
-https://bugs.webkit.org/show_bug.cgi?id=128971
-
---- a/Source/WebCore/xml/XMLViewer.css	2014-01-23 16:49:58.000000000 +0000
-+++ b/Source/WebCore/xml/XMLViewer.css
-@@ -14,7 +14,7 @@
-  * distribution.
-  *
-  * THIS SOFTWARE IS PROVIDED BY GOOGLE INC. AND ITS CONTRIBUTORS
-- * ?AS IS? AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-  * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL GOOGLE INC.
-  * OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
---- a/Source/WebCore/xml/XMLViewer.js	2014-01-23 16:49:58.000000000 +0000
-+++ b/Source/WebCore/xml/XMLViewer.js
-@@ -15,7 +15,7 @@
-  * distribution.
-  *
-  * THIS SOFTWARE IS PROVIDED BY GOOGLE INC. AND ITS CONTRIBUTORS
-- * ?AS IS? AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-  * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL GOOGLE INC.
-  * OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
deleted file mode 100644
index bba3a2b..0000000
--- a/package/webkitgtk24/Config.in
+++ /dev/null
@@ -1,83 +0,0 @@
-config BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
-	bool
-	# ARM needs BLX, so v5t+, BE completely untested so disabled
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
-	default y if BR2_i386 || BR2_x86_64
-	# Disabled on MIPS big endian due to sigbus
-	default y if BR2_mipsel || BR2_mips64el
-	# Disabled on PowerPC pending runtime testing
-	# Disabled on SuperH because of segfault
-	depends on BR2_USE_MMU # libglib2
-
-comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL, gcc >=4.8"
-	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_PACKAGE_XORG7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_USE_MMU
-	depends on BR2_DEPRECATED_SINCE_2016_05
-
-config BR2_PACKAGE_WEBKITGTK24
-	bool "webkitgtk 2.4.x"
-	depends on BR2_DEPRECATED_SINCE_2016_05
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)
-	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_ENCHANT
-	select BR2_PACKAGE_HARFBUZZ
-	select BR2_PACKAGE_ICU
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBSECRET
-	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_WEBP
-	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_HAS_LIBGL || \
-		(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL)
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_HAS_LIBGL || \
-		(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL)
-	help
-	  WebKit is an open source, standards compliant web browser engine.
-
-	  http://www.webkitgtk.org/
-
-if BR2_PACKAGE_WEBKITGTK24
-
-config BR2_PACKAGE_WEBKITGTK24_HTTPS
-	bool "HTTPS support"
-	select BR2_PACKAGE_CA_CERTIFICATES # runtime
-	select BR2_PACKAGE_LIBSOUP_SSL
-	help
-	  Enable HTTPS protocol support.
-
-config BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA
-	bool "multimedia support"
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
-	select BR2_PACKAGE_GST1_PLUGINS_GOOD
-	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
-	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
-	select BR2_PACKAGE_GST1_LIBAV
-	help
-	  This option pulls in all of the required dependencies
-	  to enable basic multimedia (video/audio) support.
-
-endif
diff --git a/package/webkitgtk24/webkitgtk24.hash b/package/webkitgtk24/webkitgtk24.hash
deleted file mode 100644
index d3a9cca..0000000
--- a/package/webkitgtk24/webkitgtk24.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://www.webkitgtk.org/releases/webkitgtk-2.4.10.tar.xz.sha1
-sha1	7fe2fe07ed21d00d8a8483d68c13a8c7ff0ff320	webkitgtk-2.4.10.tar.xz
-# Calculated based on the hash above
-sha256	33fda4b20d7fec2d6e9399ba03ef3f6d2a733c628bd77d397880c44e4bf7c614	webkitgtk-2.4.10.tar.xz
diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
deleted file mode 100644
index 4b7d694..0000000
--- a/package/webkitgtk24/webkitgtk24.mk
+++ /dev/null
@@ -1,124 +0,0 @@
-################################################################################
-#
-# webkitgtk 2.4.x
-#
-################################################################################
-
-WEBKITGTK24_VERSION = 2.4.10
-WEBKITGTK24_SITE = http://www.webkitgtk.org/releases
-WEBKITGTK24_SOURCE = webkitgtk-$(WEBKITGTK24_VERSION).tar.xz
-WEBKITGTK24_INSTALL_STAGING = YES
-WEBKITGTK24_LICENSE = LGPLv2+, BSD-2c
-WEBKITGTK24_LICENSE_FILES = \
-	Source/WebCore/LICENSE-APPLE \
-	Source/WebCore/LICENSE-LGPL-2
-WEBKITGTK24_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
-	host-pkgconf enchant harfbuzz icu jpeg libcurl libgtk2 \
-	libsecret libsoup libxml2 libxslt sqlite webp
-
-WEBKITGTK24_DEPENDENCIES += \
-	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
-	$(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
-
-# make 3.81 loops into oblivion with numjobs > 1
-ifneq ($(findstring x3.81,x$(RUNNING_MAKE_VERSION)),)
-WEBKITGTK24_MAKE = $(MAKE1)
-endif
-
-# Give explicit path to icu-config to avoid host leakage
-WEBKITGTK24_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
-
-# Some 32-bit architectures need libatomic support for 64-bit ops
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-WEBKITGTK24_CONF_ENV += LIBS="-latomic"
-endif
-
-# dependency tracking is to avoid build issues in the GEN/WTF phase
-WEBKITGTK24_CONF_OPTS = \
-	--enable-dependency-tracking \
-	--enable-spellcheck \
-	--disable-geolocation \
-	--disable-glibtest \
-	--disable-gtk-doc-html \
-	--disable-wayland-target
-
-ifeq ($(BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA),y)
-WEBKITGTK24_CONF_OPTS += \
-	--enable-video \
-	--enable-web-audio
-WEBKITGTK24_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
-else
-WEBKITGTK24_CONF_OPTS += \
-	--disable-video \
-	--disable-web-audio
-endif
-
-# OpenGL
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-WEBKITGTK24_CONF_OPTS += \
-	--enable-accelerated-compositing  \
-	--enable-glx \
-	--enable-webgl \
-	--disable-gles2
-WEBKITGTK24_DEPENDENCIES += libgl
-# EGL + GLES
-else ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-WEBKITGTK24_CONF_OPTS += \
-	--enable-accelerated-compositing \
-	--enable-gles2 \
-	--enable-webgl \
-	--disable-glx
-WEBKITGTK24_DEPENDENCIES += libegl libgles
-# Some EGL/GLES implementations needs extra help (eg. rpi-userland)
-WEBKITGTK24_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) \
-	`$(PKG_CONFIG_HOST_BINARY) --cflags egl` \
-	`$(PKG_CONFIG_HOST_BINARY) --clfags glesv2`"
-# No GL
-else
-WEBKITGTK24_CONF_OPTS += \
-	--disable-accelerated-compositing \
-	--disable-gles2 \
-	--disable-glx \
-	--disable-webgl
-endif
-
-# X11 target with GTK2 (optionally GTK3)
-ifeq ($(BR2_PACKAGE_XLIB_LIBXT),y)
-WEBKITGTK24_CONF_OPTS += --enable-x11-target
-WEBKITGTK24_DEPENDENCIES += xlib_libXt
-else
-WEBKITGTK24_CONF_OPTS += --disable-x11-target
-endif
-
-# ARM needs NEON for JIT
-# i386 & x86_64 don't seem to have any special requirements
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
-WEBKITGTK24_CONF_OPTS += --enable-jit
-else
-WEBKITGTK24_CONF_OPTS += --disable-jit
-# Disabling assembly and JIT needs an extra push sometimes (ppc)
-# See https://bugs.webkit.org/show_bug.cgi?format=multiple&id=113638
-WEBKITGTK24_CONF_ENV += \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -DENABLE_JIT=0 -DENABLE_YARR_JIT=0 -DENABLE_ASSEMBLER=0"
-endif
-
-# webkit1 (old API) uses gtk2, webkit2 (new API) uses gtk3
-# Both can be built simultaneously, prefer "newer" for size/time savings
-# gtk2 is mandatory for plugin support
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-WEBKITGTK24_CONF_OPTS += \
-	--with-gtk=3.0 \
-	--disable-webkit1
-WEBKITGTK24_DEPENDENCIES += libgtk3
-define WEBKITGTK24_INSTALL_BROWSER
-	$(INSTALL) -D -m 0755 $(@D)/Programs/MiniBrowser \
-		$(TARGET_DIR)/usr/bin/MiniBrowser
-endef
-WEBKITGTK24_POST_INSTALL_TARGET_HOOKS += WEBKITGTK24_INSTALL_BROWSER
-else
-WEBKITGTK24_CONF_OPTS += \
-	--with-gtk=2.0 \
-	--disable-webkit2
-endif
-
-$(eval $(autotools-package))
-- 
2.9.3
