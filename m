From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:21:51 +0100
Subject: [Buildroot] [git commit] package/qt5webkit: remove obsolete package
Message-ID: <20160320222256.CF75B7FD11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c7cae04b2c152055e9a4d08313fe3051a2b1218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
[Thomas: add removed option to Config.in.legacy.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                     |  7 +++++
 package/qt5/Config.in                |  1 -
 package/qt5/qt5webkit/Config.in      | 23 --------------
 package/qt5/qt5webkit/qt5webkit.hash |  2 --
 package/qt5/qt5webkit/qt5webkit.mk   | 58 ------------------------------------
 5 files changed, 7 insertions(+), 84 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a95f6b..d3371f1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_QT5WEBKIT
+	bool "qt5webkit package removed"
+	select BR2_LEGACY
+	help
+	  The qt5webkit package has been removed, since it was removed
+	  from upstream starting from Qt 5.6.
+
 config BR2_PACKAGE_QT5QUICK1
 	bool "qt5quick1 package removed"
 	select BR2_LEGACY
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 32de7a0..95d3ab9 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -49,6 +49,5 @@ source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 comment "legacy compatibility"
 source "package/qt5/qt5script/Config.in"
-source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webkit-examples/Config.in"
 endif
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
deleted file mode 100644
index 96d97cc..0000000
--- a/package/qt5/qt5webkit/Config.in
+++ /dev/null
@@ -1,23 +0,0 @@
-config BR2_PACKAGE_QT5WEBKIT
-	bool "qt5webkit"
-	select BR2_PACKAGE_QT5BASE
-	select BR2_PACKAGE_QT5BASE_ICU
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
-	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
-	# This module does not support static linking
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_BINFMT_FLAT # icu
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package corresponds to the qt5webkit module.
-
-	  This package has been tagged as deprecated since version
-	  5.5.0 and should be replaced by Qt WebEngine module in
-	  new design.
-
-	  http://qt.io
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
deleted file mode 100644
index 8517223..0000000
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebkit-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 77583f9dbd3e6ad874386df71b165dc3ce88efdabbc6e5d97a959ee2187d6d69 qtwebkit-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
deleted file mode 100644
index 75ad1bf..0000000
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-################################################################################
-#
-# qt5webkit
-#
-################################################################################
-
-QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = $(QT5_SITE)
-QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-QT5WEBKIT_DEPENDENCIES = qt5base sqlite host-ruby host-gperf host-bison host-flex
-QT5WEBKIT_INSTALL_STAGING = YES
-
-QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
-
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), LGPLv2.1 with exception or LGPLv3 or GPLv2
-# Source files contain references to LGPL_EXCEPTION.txt but it is not included
-# in the archive.
-QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
-else
-QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), Commercial license
-QT5WEBKIT_REDISTRIBUTE = NO
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
-QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
-endif
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-QT5WEBKIT_DEPENDENCIES += qt5declarative
-endif
-
-define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-endef
-
-define QT5WEBKIT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBKIT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBKIT_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-define QT5WEBKIT_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
-	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
-endef
-
-$(eval $(generic-package))
