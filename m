From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 24 Dec 2013 08:34:51 +0200
Subject: [Buildroot] [PATCH] qt5: remove qt5jsbackend package
Message-ID: <1387866891-31546-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream did not release a new version of this package since it is
superseded by the builtin qml engine found in new qt5declarative.

Fixes: http://autobuild.buildroot.net/results/3861aa91e03154c7d20f4157f0c3a1fa14838af1/

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                              |  1 -
 package/qt5/qt5declarative/Config.in               | 13 +++++--
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5graphicaleffects/Config.in          |  5 ++-
 package/qt5/qt5jsbackend/Config.in                 | 19 ----------
 ...ackend-0001-dont-import-bz2-python-module.patch | 29 ----------------
 package/qt5/qt5jsbackend/qt5jsbackend.mk           | 40 ----------------------
 package/qt5/qt5multimedia/Config.in                |  5 ++-
 package/qt5/qt5quick1/Config.in                    |  5 ++-
 package/qt5/qt5quick1/qt5quick1.mk                 |  2 +-
 package/qt5/qt5quickcontrols/Config.in             |  5 ++-
 11 files changed, 20 insertions(+), 106 deletions(-)
 delete mode 100644 package/qt5/qt5jsbackend/Config.in
 delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
 delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 42724dc..d2b8f10 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -20,7 +20,6 @@ source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
-source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index c9a6736..a1fb9a3 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,13 +1,20 @@
+config BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
+	bool
+	# Javascript engine is only available on certain architectures
+	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	# ARM needs BLX, so v5t+
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
+	default y
+
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	select BR2_PACKAGE_QT5XMLPATTERNS
-	select BR2_PACKAGE_QT5JSBACKEND
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -18,4 +25,4 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 comment "qt5declarative requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 11b9287..6eb803a 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -7,7 +7,7 @@
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
 QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz
-QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns qt5jsbackend
+QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
index ed0454a..4958586 100644
--- a/package/qt5/qt5graphicaleffects/Config.in
+++ b/package/qt5/qt5graphicaleffects/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 	bool "qt5graphicaleffects"
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5DECLARATIVE
-	# qt5declarative -> qt5jsbackend
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
 	help
@@ -16,4 +15,4 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
 
 comment "qt5graphicaleffects requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
diff --git a/package/qt5/qt5jsbackend/Config.in b/package/qt5/qt5jsbackend/Config.in
deleted file mode 100644
index d9301d0..0000000
--- a/package/qt5/qt5jsbackend/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
-	bool
-	# v8 is only available on certain architectures
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
-	default y
-
-config BR2_PACKAGE_QT5JSBACKEND
-	bool "qt5jsbackend"
-	select BR2_PACKAGE_QT5BASE
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package corresponds to the qt5jsbackend module.
-
-	  http://qt-project.org
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch b/package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
deleted file mode 100644
index 08f343e..0000000
--- a/package/qt5/qt5jsbackend/qt5jsbackend-0001-dont-import-bz2-python-module.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Only import bz2 python module when needed
-
-The js2c.py script imports the bz2 module unconditionnally, which
-would require us to build the bzip2 support in host-python. Since in
-fact bzip2 support is not technically used when building this package,
-we ensure that the bz2 module is only imported when needed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/3rdparty/v8/tools/js2c.py
-===================================================================
---- a/src/3rdparty/v8/tools/js2c.py
-+++ b/src/3rdparty/v8/tools/js2c.py
-@@ -33,7 +33,6 @@
- 
- import os, re, sys, string
- import jsmin
--import bz2
- 
- 
- def ToCAsciiArray(lines):
-@@ -344,6 +343,7 @@
-   else:
-     raw_sources_declaration = RAW_SOURCES_COMPRESSION_DECLARATION
-     if env['COMPRESSION'] == 'bz2':
-+      import bz2
-       all_sources = bz2.compress("".join(all_sources))
-     total_length = len(all_sources)
-     sources_data = ToCArray(all_sources)
diff --git a/package/qt5/qt5jsbackend/qt5jsbackend.mk b/package/qt5/qt5jsbackend/qt5jsbackend.mk
deleted file mode 100644
index 9eccd23..0000000
--- a/package/qt5/qt5jsbackend/qt5jsbackend.mk
+++ /dev/null
@@ -1,40 +0,0 @@
-################################################################################
-#
-# qt5jsbackend
-#
-################################################################################
-
-QT5JSBACKEND_VERSION = $(QT5_VERSION)
-QT5JSBACKEND_SITE = $(QT5_SITE)
-QT5JSBACKEND_SOURCE = qtjsbackend-opensource-src-$(QT5JSBACKEND_VERSION).tar.xz
-QT5JSBACKEND_DEPENDENCIES = qt5base
-QT5JSBACKEND_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5JSBACKEND_LICENSE = LGPLv2.1 or GPLv3.0
-QT5JSBACKEND_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
-else
-QT5JSBACKEND_LICENSE = Commercial license
-QT5JSBACKEND_REDISTRIBUTE = NO
-endif
-
-define QT5JSBACKEND_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
-endef
-
-define QT5JSBACKEND_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5JSBACKEND_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
-ifeq ($(BR2_PREFER_STATIC_LIB),)
-define QT5JSBACKEND_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5V8*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-$(eval $(generic-package))
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
index 080cba2..62373e4 100644
--- a/package/qt5/qt5multimedia/Config.in
+++ b/package/qt5/qt5multimedia/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_QT5DECLARATIVE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	# qt5declarative -> qt5jsbackend
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -16,4 +15,4 @@ config BR2_PACKAGE_QT5MULTIMEDIA
 
 comment "qt5multimedia requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 594b4f6..d3c71e3 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -6,12 +6,11 @@ config BR2_PACKAGE_QT5QUICK1
 	select BR2_PACKAGE_QT5SCRIPT
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5DECLARATIVE
-	select BR2_PACKAGE_QT5JSBACKEND
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -21,6 +20,6 @@ config BR2_PACKAGE_QT5QUICK1
 	  http://qt-project.org
 
 comment "qt5quick1 needs a toolchain w/ dynamic library and an OpenGL-capable backend"
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
 	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES || \
 		BR2_PREFER_STATIC_LIB
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index f9bb3e8..4cc011a 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -7,7 +7,7 @@
 QT5QUICK1_VERSION = $(QT5_VERSION)
 QT5QUICK1_SITE = $(QT5_SITE)
 QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
-QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend \
+QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative \
 	$(if $(BR2_PACKAGE_QT5WEBKIT),qt5webkit)
 QT5QUICK1_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 3d80630..2651328 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5DECLARATIVE
-	# qt5declarative -> qt5jsbackend
-	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
 	help
@@ -17,4 +16,4 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 
 comment "qt5quickcontrols requires an OpenGL-capable backend"
 	depends on (!BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES) && \
-		BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+		BR2_PACKAGE_QT5DECLARATIVE_AVAILABLE
-- 
1.8.5.1
