From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jun 2015 11:07:17 -0300
Subject: [Buildroot] [PATCHv4 1/4] webkitgtk24: new package
In-Reply-To: <1433772440-18090-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433772440-18090-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433772440-18090-2-git-send-email-gustavo@zacarias.com.ar>
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
 package/Config.in                        |   1 +
 package/webkitgtk24/0001-fix-ppc32.patch |  34 +++++++++
 package/webkitgtk24/Config.in            |  59 ++++++++++++++++
 package/webkitgtk24/webkitgtk24.hash     |   2 +
 package/webkitgtk24/webkitgtk24.mk       | 116 +++++++++++++++++++++++++++++++
 5 files changed, 212 insertions(+)
 create mode 100644 package/webkitgtk24/0001-fix-ppc32.patch
 create mode 100644 package/webkitgtk24/Config.in
 create mode 100644 package/webkitgtk24/webkitgtk24.hash
 create mode 100644 package/webkitgtk24/webkitgtk24.mk

diff --git a/package/Config.in b/package/Config.in
index 38b1b96..519ca0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -806,6 +806,7 @@ menu "Graphics"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
 	source "package/webkit/Config.in"
+	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
 	source "package/zxing/Config.in"
 endmenu
diff --git a/package/webkitgtk24/0001-fix-ppc32.patch b/package/webkitgtk24/0001-fix-ppc32.patch
new file mode 100644
index 0000000..c655a0e
--- /dev/null
+++ b/package/webkitgtk24/0001-fix-ppc32.patch
@@ -0,0 +1,34 @@
+From https://bugs.webkit.org/show_bug.cgi?id=130837
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura webkitgtk-2.4.8/Source/WebKit2/Platform/IPC/Connection.h webkitgtk-2.4.8-ppc/Source/WebKit2/Platform/IPC/Connection.h
+--- webkitgtk-2.4.8/Source/WebKit2/Platform/IPC/Connection.h	2015-01-07 06:45:43.000000000 -0300
++++ webkitgtk-2.4.8-ppc/Source/WebKit2/Platform/IPC/Connection.h	2015-04-20 01:55:41.554547510 -0300
+@@ -216,7 +216,11 @@
+ 
+     Client* m_client;
+     bool m_isServer;
++#if CPU(PPC)
++    uint64_t m_syncRequestID;
++#else
+     std::atomic<uint64_t> m_syncRequestID;
++#endif
+ 
+     bool m_onlySendMessagesAsDispatchWhenWaitingForSyncReplyWhenProcessingSuchAMessage;
+     bool m_shouldExitOnSyncMessageSendFailure;
+diff -Nura webkitgtk-2.4.8/Source/WebKit2/UIProcess/StatisticsRequest.cpp webkitgtk-2.4.8-ppc/Source/WebKit2/UIProcess/StatisticsRequest.cpp
+--- webkitgtk-2.4.8/Source/WebKit2/UIProcess/StatisticsRequest.cpp	2015-01-07 06:45:43.000000000 -0300
++++ webkitgtk-2.4.8-ppc/Source/WebKit2/UIProcess/StatisticsRequest.cpp	2015-04-20 01:55:41.555547544 -0300
+@@ -44,7 +44,11 @@
+ 
+ uint64_t StatisticsRequest::addOutstandingRequest()
+ {
++#if CPU(PPC)
++    static int64_t uniqueRequestID;
++#else
+     static std::atomic<int64_t> uniqueRequestID;
++#endif
+ 
+     uint64_t requestID = ++uniqueRequestID;
+     m_outstandingRequests.add(requestID);
diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
new file mode 100644
index 0000000..72b6ecc
--- /dev/null
+++ b/package/webkitgtk24/Config.in
@@ -0,0 +1,59 @@
+config BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	bool
+	# ARM needs BLX, so v5t+, BE completely untested so disabled
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
+	# i386 / x86_64 external toolchains have issues and old gcc versions
+	# https://bugs.webkit.org/show_bug.cgi?id=132231
+	# https://stackoverflow.com/questions/9140019/yield-is-not-a-member-of-stdthis-thread
+	default y if BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
+	# Disabled on MIPS big endian due to sigbus
+	default y if BR2_mipsel || BR2_mips64el
+	# Disabled on PowerPC pending runtime testing
+	# Disabled on SuperH because of segfault
+	depends on BR2_USE_MMU # libglib2
+
+comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
+	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_PACKAGE_XORG7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_USE_WCHAR
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
index 0000000..bd1754e
--- /dev/null
+++ b/package/webkitgtk24/webkitgtk24.hash
@@ -0,0 +1,2 @@
+# From http://www.webkitgtk.org/releases/webkitgtk-2.4.9.tar.xz.sha1
+sha1	fbe02db8a4f01a70e7cdf0d16f8a18463e18b104	webkitgtk-2.4.9.tar.xz
diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
new file mode 100644
index 0000000..b197b0a
--- /dev/null
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# webkitgtk 2.4.x
+#
+################################################################################
+
+WEBKITGTK24_VERSION = 2.4.9
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
+ifneq ($(findstring x3.81,x$(MAKE_VERSION)),)
+WEBKITGTK24_MAKE = $(MAKE1)
+endif
+
+# Give explicit path to icu-config to avoid host leakage
+WEBKITGTK24_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
+
+# Some 32-bit architectures need libatomic support for 64-bit ops
+ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_sh),y)
+WEBKITGTK24_CONF_ENV += LIBS="-latomic"
+endif
+
+# dependency tracking is to avoid build issues in the GEN/WTF phase
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
+# Disabling assembly and JIT needs an extra push sometimes (ppc)
+# See https://bugs.webkit.org/show_bug.cgi?format=multiple&id=113638
+WEBKITGTK24_CONF_ENV += \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -DENABLE_JIT=0 -DENABLE_YARR_JIT=0 -DENABLE_ASSEMBLER=0"
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
+define WEBKITGTK24_INSTALL_BROWSER
+	$(INSTALL) -D -m 0755 $(@D)/Programs/MiniBrowser \
+		$(TARGET_DIR)/usr/bin/MiniBrowser
+endef
+WEBKITGTK24_POST_INSTALL_TARGET_HOOKS += WEBKITGTK24_INSTALL_BROWSER
+else
+WEBKITGTK24_CONF_OPTS += \
+	--with-gtk=2.0 \
+	--disable-webkit2
+endif
+
+$(eval $(autotools-package))
-- 
2.3.6
