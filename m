From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 12 Jun 2021 10:57:40 +0200
Subject: [Buildroot] [PATCH] package/cegui: bump to current master
Message-ID: <20210612085740.300581-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v0-8-7 is pretty old (2016) and raises a lot of build failures
so switch to the current master version while at it disable
support for irrlicht and fribidi that are broken on master.
Moreover disable samples and application templates that
are not required.

Fixes:
- http://autobuild.buildroot.net/results/5b9/5b9ff0e8f16a2fd732ae25d5383656f7ae205748/
- http://autobuild.buildroot.net/results/333/33397224f8a8067d8ecbd6661b84ca155a0525c0/

and more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...pp-check-if-execinfo-header-is-avail.patch | 33 ------------------
 ...tringTranscoder.cpp-use-cast-notatio.patch | 34 -------------------
 package/cegui/cegui.hash                      |  2 +-
 package/cegui/cegui.mk                        | 26 +++++---------
 4 files changed, 9 insertions(+), 86 deletions(-)
 delete mode 100644 package/cegui/0001-src-Exceptions.cpp-check-if-execinfo-header-is-avail.patch
 delete mode 100644 package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch

diff --git a/package/cegui/0001-src-Exceptions.cpp-check-if-execinfo-header-is-avail.patch b/package/cegui/0001-src-Exceptions.cpp-check-if-execinfo-header-is-avail.patch
deleted file mode 100644
index dd5dba9e71..0000000000
--- a/package/cegui/0001-src-Exceptions.cpp-check-if-execinfo-header-is-avail.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e18e48624cd45910917e5e4fb0aa16cef490bb6d Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <b.bilas@grinn-global.com>
-Date: Sun, 22 Mar 2020 14:25:53 +0100
-Subject: [PATCH] src/Exceptions.cpp: check if execinfo header is available
-
-Fixes:
-  fatal error: execinfo.h: No such file or directory
-  compilation terminated.
-
-Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
----
- Upstream status: https://github.com/cegui/cegui/pull/1189
-
-cegui/src/Exceptions.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/cegui/src/Exceptions.cpp b/cegui/src/Exceptions.cpp
-index 8e4890378..6a8420491 100644
---- a/cegui/src/Exceptions.cpp
-+++ b/cegui/src/Exceptions.cpp
-@@ -46,7 +46,9 @@
- #elif     (defined(__linux__) && !defined(__ANDROID__)) \
-       ||  defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) \
-       ||  defined(__HAIKU__)
-+#ifdef HAVE_EXECINFO_H
- #   include <execinfo.h>
-+#endif
- #   include <dlfcn.h>
- #   include <cxxabi.h>
- #   include <cstddef>
--- 
-2.25.2
-
diff --git a/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch b/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
deleted file mode 100644
index f30438b986..0000000000
--- a/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4561bac9dddad8fd79e746ea1ddd89c20647a162 Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <b.bilas@grinn-global.com>
-Date: Thu, 2 Apr 2020 18:04:28 +0200
-Subject: [PATCH] cegui/src/IconvStringTranscoder.cpp: use cast notation
- instead of reinterpret_cast
-
-Fixes:
-	IconvStringTranscoder.cpp:50:49: error: invalid cast from type 'int' to
-	type 'iconv_t' {aka 'long int'}
-         if (d_cd == reinterpret_cast<iconv_t>(-1))
-
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- Upstream status: https://github.com/cegui/cegui/pull/1194
-
- cegui/src/IconvStringTranscoder.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cegui/src/IconvStringTranscoder.cpp b/cegui/src/IconvStringTranscoder.cpp
-index 1a5df2995..f6b5aa816 100644
---- a/cegui/src/IconvStringTranscoder.cpp
-+++ b/cegui/src/IconvStringTranscoder.cpp
-@@ -47,7 +47,7 @@ public:
-         d_toCode(tocode),
-         d_cd(iconv_open(d_toCode.c_str(), d_fromCode.c_str()))
-     {
--        if (d_cd == reinterpret_cast<iconv_t>(-1))
-+        if (d_cd == (iconv_t)(-1))
-             CEGUI_THROW(InvalidRequestException(String(
-                 "Failed to create conversion descriptor from \"") +
-                 d_fromCode.c_str() + "\" to \"" + d_toCode.c_str() + "\"."));
--- 
-2.26.0
-
diff --git a/package/cegui/cegui.hash b/package/cegui/cegui.hash
index 8295039037..131b248619 100644
--- a/package/cegui/cegui.hash
+++ b/package/cegui/cegui.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7be289d2d8562e7d20bd155d087d6ccb0ba62f7e99cc25d20684b8edf2ba15cd  cegui-0-8-7.tar.gz
+sha256  5b6f9e209e8a29b2f30d6aef92efd125c8bedaab5be04b562208be51e5e7f04e  cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0.tar.gz
 sha256  cc869e2ece8ad039f6d7fd17259db4ea0ae0a502d02a1bb506c0168deb12e40d  COPYING
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 23a5859bc8..51ec743eeb 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -4,15 +4,19 @@
 #
 ################################################################################
 
-CEGUI_VERSION = 0-8-7
-CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
+CEGUI_VERSION = 00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0
+CEGUI_SITE = $(call github,cegui,cegui,$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS = \
-	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
-	-DCEGUI_BUILD_RENDERER_OGRE=OFF
+	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
+	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
+	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
+	-DCEGUI_USE_FRIBIDI=OFF	\
+	-DCEGUI_SAMPLES_ENABLED=OFF \
+	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF
 CEGUI_DEPENDENCIES = glm \
 	$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
@@ -44,13 +48,6 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_IRRLICHT),y)
-CEGUI_DEPENDENCIES += irrlicht
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_IRRLICHT=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_IRRLICHT=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_IMAGE),yy)
 CEGUI_DEPENDENCIES += sdl2 sdl2_image
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_SDL2=ON
@@ -72,13 +69,6 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-CEGUI_DEPENDENCIES += libfribidi
-CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 CEGUI_DEPENDENCIES += libxml2
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
-- 
2.32.0
