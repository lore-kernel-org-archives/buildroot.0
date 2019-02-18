From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 18 Feb 2019 19:17:18 +0200
Subject: [Buildroot] [PATCH RFC/next 3/4] package/webkit: factor out common
 bits of .mk files
In-Reply-To: <20190218171719.18721-1-aperez@igalia.com>
References: <20190218171719.18721-1-aperez@igalia.com>
Message-ID: <20190218171719.18721-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the commen set of dependencies and CMake configuration options into
webkit.mk, as well, as well as test for BR2_WEBKIT_ARCH_SUPPORTS_JIT
(which was duplicated). While at it, the changes make the list of
dependencies common to both packages (WEBKIT_DEPENDENCIES) more correct
and thorough.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkit/webkit.mk              | 14 ++++++++++++++
 package/webkit/webkitgtk/webkitgtk.mk | 15 +++------------
 package/webkit/wpewebkit/wpewebkit.mk | 14 +++-----------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 47e94d72f6..96ca7a109d 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -4,4 +4,18 @@
 #
 ################################################################################
 
+WEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
+	cairo harfbuzz icu jpeg libgcrypt libsoup libpng libtasn1 \
+	libxml2 libxslt sqlite webp
+WEBKIT_CONF_OPTS = \
+	-DENABLE_API_TESTS=OFF \
+	-DENABLE_GTKDOC=OFF \
+	-DENABLE_INTROSPECTION=OFF
+
+ifeq ($(BR2_WEBKIT_ARCH_SUPPORTS_JIT),y)
+WEBKIT_CONF_OPTS += -DENABLE_JIT=ON
+else
+WEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
+endif
+
 include $(sort $(wildcard package/webkit/*/*.mk))
diff --git a/package/webkit/webkitgtk/webkitgtk.mk b/package/webkit/webkitgtk/webkitgtk.mk
index 1834108bcc..fefb52eeaa 100644
--- a/package/webkit/webkitgtk/webkitgtk.mk
+++ b/package/webkit/webkitgtk/webkitgtk.mk
@@ -12,14 +12,11 @@ WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
 WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
-WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
-	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
-	libtasn1 libxml2 libxslt sqlite webp woff2
+WEBKITGTK_DEPENDENCIES = $(WEBKIT_DEPENDENCIES) \
+	enchant libgtk3 libsecret woff2
 WEBKITGTK_CONF_OPTS = \
-	-DENABLE_API_TESTS=OFF \
+	$(WEBKIT_CONF_OPTS)
 	-DENABLE_GEOLOCATION=OFF \
-	-DENABLE_GTKDOC=OFF \
-	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
 	-DPORT=GTK \
@@ -27,12 +24,6 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_WOFF2=ON
 
-ifeq ($(BR2_WEBKIT_ARCH_SUPPORTS_JIT),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
-else
-WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
diff --git a/package/webkit/wpewebkit/wpewebkit.mk b/package/webkit/wpewebkit/wpewebkit.mk
index 3877dcfbb0..e36dadd359 100644
--- a/package/webkit/wpewebkit/wpewebkit.mk
+++ b/package/webkit/wpewebkit/wpewebkit.mk
@@ -12,21 +12,13 @@ WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
 WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
-WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
-	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
-	libpng libxslt wayland-protocols webp wpebackend-fdo
-
+WPEWEBKIT_DEPENDENCIES = $(WEBKIT_DEPENDENCIES) \
+	libepoxy libgles wayland-protocols wpebackend-fdo
 WPEWEBKIT_CONF_OPTS = \
+	$(WEBKIT_CONF_OPTS) \
 	-DPORT=WPE \
-	-DENABLE_API_TESTS=OFF \
 	-DENABLE_MINIBROWSER=OFF
 
-ifeq ($(BR2_WEBKIT_ARCH_SUPPORTS_JIT),y)
-WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=ON
-else
-WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 WPEWEBKIT_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
-- 
2.20.1
