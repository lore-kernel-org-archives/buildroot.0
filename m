From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:22:42 +0100
Subject: [Buildroot] [git commit] package/qt5webkit-examples: remove
	obsolete package
Message-ID: <20160320222257.666ED7FD11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=940bfe2f4336a3fea1ec6805db1f90ce83bd4a78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
[Thomas: add removed option to Config.in.legacy.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  7 +++
 package/qt5/Config.in                              |  1 -
 package/qt5/qt5webkit-examples/0001-build.patch    | 30 -------------
 package/qt5/qt5webkit-examples/Config.in           | 14 ------
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  2 -
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 50 ----------------------
 6 files changed, 7 insertions(+), 97 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d3371f1..60702ce 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
+	bool "qt5webkit-examples package removed"
+	select BR2_LEGACY
+	help
+	  The qt5webkit-examples package has been removed, since it
+	  was removed from upstream starting from Qt 5.6.
+
 config BR2_PACKAGE_QT5WEBKIT
 	bool "qt5webkit package removed"
 	select BR2_LEGACY
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 95d3ab9..f673daa 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -49,5 +49,4 @@ source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
-source "package/qt5/qt5webkit-examples/Config.in"
 endif
diff --git a/package/qt5/qt5webkit-examples/0001-build.patch b/package/qt5/qt5webkit-examples/0001-build.patch
deleted file mode 100644
index 68964f0..0000000
--- a/package/qt5/qt5webkit-examples/0001-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-This patch improves the qt5webkit examples build for 2 aspects:
-
-# Allows to build even if qt5base examples are not enabled
-# Builds xmlpatterns example only if the qt5xmlpattern package has been built
-
-Signed-off-by: Massimo Callegari <massimocallegari@yahoo.it>
-
-Index: b/examples/webkitwidgets/webkitwidgets.pro
-===================================================================
---- /dev/null
-+++ b/examples/webkitwidgets/webkitwidgets.pro
-@@ -8,5 +8,6 @@
-             framecapture \
-             browser \
-             embedded \
--            scroller \
--            xmlpatterns
-+            scroller
-+
-+qtHaveModule(xmlpatterns): SUBDIRS += xmlpatterns
-Index: b/qtwebkit-examples.pro
-===================================================================
---- /dev/null
-+++ b/qtwebkit-examples.pro
-@@ -3,3 +3,4 @@
- load(qt_parts)
- 
- SUBDIRS += doc
-+SUBDIRS += examples
-
diff --git a/package/qt5/qt5webkit-examples/Config.in b/package/qt5/qt5webkit-examples/Config.in
deleted file mode 100644
index 3f9c243..0000000
--- a/package/qt5/qt5webkit-examples/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
-	bool "qt5webkit examples"
-	depends on BR2_PACKAGE_QT5WEBKIT
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package contains examples for the qt5webkit module.
-
-	  This package has been tagged as deprecated since version
-	  5.5.0 and should be replaced by Qt WebEngine module in
-	  new design.
-
-	  http://qt.io
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
deleted file mode 100644
index b28e0da..0000000
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebkit-examples-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 098935b42d6d249027d1a635e4e70edc3d2969dd860f825b36aec06fc72e46c6 qtwebkit-examples-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
deleted file mode 100644
index b687ac7..0000000
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ /dev/null
@@ -1,50 +0,0 @@
-################################################################################
-#
-# qt5webkit-examples
-#
-################################################################################
-
-QT5WEBKIT_EXAMPLES_VERSION = $(QT5_VERSION)
-QT5WEBKIT_EXAMPLES_SITE = $(QT5_SITE)
-QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_EXAMPLES_VERSION).tar.xz
-QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit
-
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_EXAMPLES_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-# Source files contain references to LGPL_EXCEPTION.txt but it is not included
-# in the archive.
-QT5WEBKIT_EXAMPLES_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
-else
-QT5WEBKIT_EXAMPLES_LICENSE = Commercial license
-QT5WEBKIT_EXAMPLES_REDISTRIBUTE = NO
-endif
-
-ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
-QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
-endif
-
-define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-endef
-
-define QT5WEBKIT_EXAMPLES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBKIT_EXAMPLES_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-define QT5WEBKIT_EXAMPLES_INSTALL_QML
-	cp -dpfr $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
-endef
-endif
-
-define QT5WEBKIT_EXAMPLES_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/examples
-	cp -dpfr $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples
-	$(QT5WEBKIT_EXAMPLES_INSTALL_QML)
-endef
-
-$(eval $(generic-package))
