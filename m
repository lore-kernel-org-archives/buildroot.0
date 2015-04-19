From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:23 -0300
Subject: [Buildroot] [PATCH v3 08/11] webkitgtk24: new package
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429436906-15222-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new webkitgtk24 package.

The difference with the legacy webkit package is that this one uses the
new webkit2 API, and optionally the webkit1 API.

It's versioned because the latest release of midori can't use the newer
2.6.x or 2.8.x webkitgtk versions yet.

This paves the way for a newer webkitgtk26 or webkitgtk28 package that
can live side-by-side with this one for other uses.

Some loose checks (like !xorg7) are in place for possible/future wayland
support.
Right now wayland requires gtk2, hence xorg, but it might be possible to
patch that out with some work (it seems to be done for version 2.6.x,
though the build system changed to cmake so it might not be a
straighfoward patch).

Choices had to be made in the GL-area, right now the preference order is
libGL (full OpenGL), then GLES, then nothing (obviously).
And when gtk3 is around it's also preferred as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                             |   1 +
 package/webkitgtk24/0001-fix-bug-137640.patch |  17 ++++
 package/webkitgtk24/Config.in                 |  56 ++++++++++++++
 package/webkitgtk24/webkitgtk24.hash          |   2 +
 package/webkitgtk24/webkitgtk24.mk            | 107 ++++++++++++++++++++++++++
 5 files changed, 183 insertions(+)
 create mode 100644 package/webkitgtk24/0001-fix-bug-137640.patch
 create mode 100644 package/webkitgtk24/Config.in
 create mode 100644 package/webkitgtk24/webkitgtk24.hash
 create mode 100644 package/webkitgtk24/webkitgtk24.mk

diff --git a/package/Config.in b/package/Config.in
index ee51593..0acd35b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -772,6 +772,7 @@ menu "Graphics"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
 	source "package/webkit/Config.in"
+	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
 	source "package/zxing/Config.in"
 endmenu
diff --git a/package/webkitgtk24/0001-fix-bug-137640.patch b/package/webkitgtk24/0001-fix-bug-137640.patch
new file mode 100644
index 0000000..2d5b94f
--- /dev/null
+++ b/package/webkitgtk24/0001-fix-bug-137640.patch
@@ -0,0 +1,17 @@
+Fix for bug #137640 - build breaks without accelerated compositing.
+See: https://bugs.webkit.org/show_bug.cgi?id=137640
+
+Singed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -urN webkitgtk-2.4.6.orig/Source/WebKit2/WebProcess/soup/WebProcessSoup.cpp webkitgtk-2.4.6/Source/WebKit2/WebProcess/soup/WebProcessSoup.cpp
+--- webkitgtk-2.4.6.orig/Source/WebKit2/WebProcess/soup/WebProcessSoup.cpp	2014-09-26 11:40:45.000000000 +0400
++++ webkitgtk-2.4.6/Source/WebKit2/WebProcess/soup/WebProcessSoup.cpp	2014-10-11 20:43:16.687116807 +0400
+@@ -110,7 +110,7 @@
+     WebCore::memoryCache()->setDeadDecodedDataDeletionInterval(deadDecodedDataDeletionInterval);
+     WebCore::pageCache()->setCapacity(pageCacheCapacity);
+ 
+-#if PLATFORM(GTK)
++#if PLATFORM(GTK) && USE(ACCELERATED_COMPOSITING)
+     WebCore::pageCache()->setShouldClearBackingStores(true);
+ #endif
+ 
diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
new file mode 100644
index 0000000..2057546
--- /dev/null
+++ b/package/webkitgtk24/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	bool
+	# ARM needs BLX, so v5t+
+	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4
+	# i386 / x86_64 external toolchains have issues
+	# https://bugs.webkit.org/show_bug.cgi?id=132231
+	# https://stackoverflow.com/questions/9140019/yield-is-not-a-member-of-stdthis-thread
+	default y if BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
+	# Disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
+	# Disabled on mips due to sigbus
+	depends on BR2_USE_MMU # libglib2
+
+comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
+	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_WEBKITGTK24
+	bool "webkitgtk 2.4.x"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)
+	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	depends on BR2_ARCH_HAS_ATOMICS
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_ENCHANT
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBSECRET
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
+	# MESA3D because it wants xcomposite/xdamage if GL/glx.h is found
+	# even if the GL* backends are disabled
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_HAS_LIBGL || \
+		(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL) || \
+		BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_HAS_LIBGL || \
+		(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL) || \
+		BR2_PACKAGE_MESA3D
+	help
+	  WebKit is an open source, standards compliant web browser engine.
+
+	  http://www.webkitgtk.org/
diff --git a/package/webkitgtk24/webkitgtk24.hash b/package/webkitgtk24/webkitgtk24.hash
new file mode 100644
index 0000000..90e925f
--- /dev/null
+++ b/package/webkitgtk24/webkitgtk24.hash
@@ -0,0 +1,2 @@
+# From http://www.webkitgtk.org/releases/webkitgtk-2.4.8.tar.xz.sha1
+sha1	44c6bbe52108297126830525619c1df047886a6f	webkitgtk-2.4.8.tar.xz
diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
new file mode 100644
index 0000000..e7862b5
--- /dev/null
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -0,0 +1,107 @@
+################################################################################
+#
+# webkitgtk 2.4.x
+#
+################################################################################
+
+WEBKITGTK24_VERSION = 2.4.8
+WEBKITGTK24_SITE = http://www.webkitgtk.org/releases
+WEBKITGTK24_SOURCE = webkitgtk-$(WEBKITGTK24_VERSION).tar.xz
+WEBKITGTK24_INSTALL_STAGING = YES
+WEBKITGTK24_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
+	enchant harfbuzz icu jpeg libcurl libgtk2 libsecret libsoup \
+	libxml2 libxslt sqlite webp
+
+WEBKITGTK24_DEPENDENCIES += \
+	$(if $(BR_PACKAGE_XLIB_LIBXCOMPOSITE),xlib_libXcomposite) \
+	$(if $(BR_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
+
+# make 3.81 loops into oblivion with numjobs > 1
+ifeq ($(findstring x3.81,x$(MAKE_VERSION)),)
+WEBKITGTK24_MAKE = $(MAKE1)
+endif
+
+# Give explicit path to icu-config and prevent ar to make thin archives.
+WEBKITGTK24_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
+	AR_FLAGS="cru"
+
+# Some 32-bit architectures need libatomic support for 64-bit ops
+ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel),y)
+WEBKITGTK24_CONF_ENV += LIBS="-latomic"
+endif
+
+WEBKITGTK24_CONF_OPTS = \
+	--enable-dependency-tracking \
+	--enable-spellcheck \
+	--disable-geolocation \
+	--disable-glibtest \
+	--disable-gtk-doc-html \
+	--disable-wayland-target
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+WEBKITGTK24_CONF_OPTS += \
+	--enable-video \
+	--enable-web-audio
+WEBKITGTK24_DEPENDENCIES += gst1-plugins-good
+else
+WEBKITGTK24_CONF_OPTS += \
+	--disable-video \
+	--disable-web-audio
+endif
+
+# OpenGL
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+WEBKITGTK24_CONF_OPTS += \
+	--enable-accelerated-compositing  \
+	--enable-glx \
+	--enable-webgl \
+	--disable-gles2
+WEBKITGTK24_DEPENDENCIES += libgl
+# EGL + GLES
+else ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+WEBKITGTK24_CONF_OPTS += \
+	--enable-accelerated-compositing \
+	--enable-gles2 \
+	--enable-webgl \
+	--disable-glx
+WEBKITGTK24_DEPENDENCIES += libegl libgles
+# No GL
+else
+WEBKITGTK24_CONF_OPTS += \
+	--disable-accelerated-compositing \
+	--disable-gles2 \
+	--disable-glx \
+	--disable-webgl
+endif
+
+# X11 target with GTK2 (optionally GTK3)
+ifeq ($(BR2_PACKAGE_XLIB_LIBXT),y)
+WEBKITGTK24_CONF_OPTS += --enable-x11-target
+WEBKITGTK24_DEPENDENCIES += xlib_libXt
+else
+WEBKITGTK24_CONF_OPTS += --disable-x11-target
+endif
+
+# ARM needs NEON for JIT
+# i386 & x86_64 don't seem to have any special requirements
+ifeq ($(BR2_ARM_ENABLE_NEON)$(BR2_i386)$(BR2_x86_64),y)
+WEBKITGTK24_CONF_OPTS += --enable-jit
+else
+WEBKITGTK24_CONF_OPTS += --disable-jit
+endif
+
+# webkit1 (old API) uses gtk2, webkit2 (new API) uses gtk3
+# Both can be built simultaneously, prefer "newer" for size/time savings
+# gtk2 is mandatory for plugin support
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+WEBKITGTK24_CONF_OPTS += \
+	--with-gtk=3.0 \
+	--disable-webkit1
+WEBKITGTK24_DEPENDENCIES += libgtk3
+else
+WEBKITGTK24_CONF_OPTS += \
+	--with-gtk=2.0 \
+	--disable-webkit2
+endif
+
+$(eval $(autotools-package))
-- 
2.0.5
