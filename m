From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 18 Mar 2020 09:51:25 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/cegui: rename and bump version
Message-ID: <20200318085125.12843-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since spice ver. 0.12.6 doesn't depend on cegui anymore let's bump to the latest stable version
and rename package.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 Config.in.legacy                     |   8 ++
 package/Config.in                    |   2 +-
 package/{cegui06 => cegui}/Config.in |  10 +--
 package/cegui/cegui.hash             |   3 +
 package/cegui/cegui.mk               | 110 +++++++++++++++++++++++++++
 package/cegui06/0001-stddef.h.patch  |  26 -------
 package/cegui06/cegui06.hash         |   3 -
 package/cegui06/cegui06.mk           |  36 ---------
 8 files changed, 126 insertions(+), 72 deletions(-)
 rename package/{cegui06 => cegui}/Config.in (75%)
 create mode 100644 package/cegui/cegui.hash
 create mode 100644 package/cegui/cegui.mk
 delete mode 100644 package/cegui06/0001-stddef.h.patch
 delete mode 100644 package/cegui06/cegui06.hash
 delete mode 100644 package/cegui06/cegui06.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b925e563d3..a53af02844 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_CEGUI06
+	bool "BR2_PACKAGE_CEGUI06 was renamed"
+	select BR2_PACKAGE_CEGUI
+	select BR2_LEGACY
+	help
+	  The BR2_PACKAGE_CEGUI06 config symbol was renamed to
+	  BR2_PACKAGE_CEGUI.
+
 config BR2_PACKAGE_JAMVM
 	bool "jamvm removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index edf7687ab7..cc492b799f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -294,7 +294,7 @@ comment "Graphic applications"
 	source "package/tesseract-ocr/Config.in"
 
 comment "Graphic libraries"
-	source "package/cegui06/Config.in"
+	source "package/cegui/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
 	source "package/efl/Config.in"
diff --git a/package/cegui06/Config.in b/package/cegui/Config.in
similarity index 75%
rename from package/cegui06/Config.in
rename to package/cegui/Config.in
index 0139d32422..27064b7973 100644
--- a/package/cegui06/Config.in
+++ b/package/cegui/Config.in
@@ -1,14 +1,12 @@
-comment "cegui06 needs a toolchain w/ C++, threads, dynamic library"
+comment "cegui needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_CEGUI06
-	bool "cegui06"
+config BR2_PACKAGE_CEGUI
+	bool "cegui"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_GLM
 	help
 	  Crazy Eddie's GUI System is a free library providing windowing
 	  and widgets for graphics APIs / engines where such
diff --git a/package/cegui/cegui.hash b/package/cegui/cegui.hash
new file mode 100644
index 0000000000..8295039037
--- /dev/null
+++ b/package/cegui/cegui.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  7be289d2d8562e7d20bd155d087d6ccb0ba62f7e99cc25d20684b8edf2ba15cd  cegui-0-8-7.tar.gz
+sha256  cc869e2ece8ad039f6d7fd17259db4ea0ae0a502d02a1bb506c0168deb12e40d  COPYING
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
new file mode 100644
index 0000000000..eab2a540f2
--- /dev/null
+++ b/package/cegui/cegui.mk
@@ -0,0 +1,110 @@
+################################################################################
+#
+# cegui
+#
+################################################################################
+
+CEGUI_VERSION = 0-8-7
+CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
+CEGUI_LICENSE = MIT
+CEGUI_LICENSE_FILES = COPYING
+CEGUI_DEPENDENCIES = glm
+CEGUI_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+CEGUI_DEPENDENCIES += libiconv
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+CEGUI_DEPENDENCIES += libepoxy
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_OPENGLES),y)
+CEGUI_DEPENDENCIES += sdl2_opengles
+endif
+
+ifeq ($(BR2_PACKAGE_OGRE),y)
+CEGUI_DEPENDENCIES += ogre
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+CEGUI_DEPENDENCIES += directfb
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+CEGUI_DEPENDENCIES += sdl
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2),y)
+CEGUI_DEPENDENCIES += sdl2
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
+CEGUI_DEPENDENCIES += sdl2_image
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+CEGUI_DEPENDENCIES += pcre
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLFW),y)
+CEGUI_DEPENDENCIES += libglfw
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+CEGUI_DEPENDENCIES += freetype
+endif
+
+ifeq ($(BR2_PACKAGE_MINIZIP),y)
+CEGUI_DEPENDENCIES += minizip
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+CEGUI_DEPENDENCIES += libfribidi
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+CEGUI_DEPENDENCIES += expat
+endif
+
+ifeq ($(BR2_PACKAGE_XERCES),y)
+CEGUI_DEPENDENCIES += xerces
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+CEGUI_DEPENDENCIES += libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_RAPIDXML),y)
+CEGUI_DEPENDENCIES += rapidxml
+endif
+
+ifeq ($(BR2_PACKAGE_TINYXML),y)
+CEGUI_DEPENDENCIES += tinyxml
+endif
+
+ifeq ($(BR2_PACKAGE_TINYXML2),y)
+CEGUI_DEPENDENCIES += tinyxml2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
+CEGUI_DEPENDENCIES += libfreeimage
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+CEGUI_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+CEGUI_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLEW),y)
+CEGUI_DEPENDENCIES += libglew
+endif
+
+ifeq ($(BR2_PACKAGE_IRRLICHT),y)
+CEGUI_DEPENDENCIES += irrlicht
+endif
+
+$(eval $(cmake-package))
diff --git a/package/cegui06/0001-stddef.h.patch b/package/cegui06/0001-stddef.h.patch
deleted file mode 100644
index cc16effc25..0000000000
--- a/package/cegui06/0001-stddef.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-includes: ptrdiff_t is defined in stddef.h
-
-ptrdiff_t is defined in the stddef.h header, so this
-header must be included.
-
-Do the #include in a common header to avoid doing it
-all over the place.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Patch not sent upstream, it's a no-longer-maintained branch.
-To be noted, however, is that the current devel branch is
-still missing that include.
-
-diff -durN cegui06-0.6.2.orig/include/CEGUIBase.h cegui06-0.6.2/include/CEGUIBase.h
---- cegui06-0.6.2.orig//include/CEGUIBase.h	2008-02-11 15:38:27.000000000 +0100
-+++ cegui06-0.6.2/include/CEGUIBase.h	2012-08-19 22:51:50.260385978 +0200
-@@ -34,6 +34,7 @@
- #define _CEGUIBase_h_
- 
- #include <cassert>
-+#include <stddef.h>
- 
- // bring in configuration options
- #include "CEGUIConfig.h"
diff --git a/package/cegui06/cegui06.hash b/package/cegui06/cegui06.hash
deleted file mode 100644
index f46bcee242..0000000000
--- a/package/cegui06/cegui06.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  eb77741cd9fcc927a876e8116b98691212e973d2264e2071406423f6ca3e305f  CEGUI-0.6.2b.tar.gz
-sha256  da1c10009579e3eb8d3b3abc65d538a2890f70ff7fd1f05b73a4f9e3fff5c56e  COPYING
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
deleted file mode 100644
index d3da3ebc4c..0000000000
--- a/package/cegui06/cegui06.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# cegui06
-#
-################################################################################
-
-# Do not update the version, we need exactly that one for Spice.
-CEGUI06_VERSION_MAJOR = 0.6.2
-CEGUI06_VERSION = $(CEGUI06_VERSION_MAJOR)b
-CEGUI06_SOURCE = CEGUI-$(CEGUI06_VERSION).tar.gz
-CEGUI06_SITE = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION_MAJOR)
-CEGUI06_LICENSE = MIT
-CEGUI06_LICENSE_FILES = COPYING
-CEGUI06_INSTALL_STAGING = YES
-
-CEGUI06_DEPENDENCIES = \
-	expat \
-	freetype \
-	pcre
-
-CEGUI06_CONF_OPTS = \
-	--enable-expat \
-	--disable-external-tinyxml \
-	--disable-xerces-c \
-	--disable-libxml \
-	--disable-tinyxml \
-	--disable-opengl-renderer \
-	--disable-external-glew \
-	--disable-irrlicht-renderer \
-	--disable-directfb-renderer \
-	--disable-samples \
-	--disable-lua-module \
-	--disable-toluacegui \
-	--disable-external-toluapp
-
-$(eval $(autotools-package))
-- 
2.25.1
