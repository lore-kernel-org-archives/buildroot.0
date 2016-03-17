From: Julien Corjon <corjon.j@ecagroup.com>
Date: Thu, 17 Mar 2016 10:42:25 +0100
Subject: [Buildroot] [PATCH 1/5] package/qt5quick1: remove obsolete package
In-Reply-To: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
References: <1458207749-19507-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1458207749-19507-2-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                |  1 -
 package/qt5/qt5quick1/Config.in      | 26 -----------------------
 package/qt5/qt5quick1/qt5quick1.hash |  2 --
 package/qt5/qt5quick1/qt5quick1.mk   | 41 ------------------------------------
 4 files changed, 70 deletions(-)
 delete mode 100644 package/qt5/qt5quick1/Config.in
 delete mode 100644 package/qt5/qt5quick1/qt5quick1.hash
 delete mode 100644 package/qt5/qt5quick1/qt5quick1.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 1c42102..32de7a0 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,7 +48,6 @@ source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 comment "legacy compatibility"
-source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webkit-examples/Config.in"
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
deleted file mode 100644
index 345ffae..0000000
--- a/package/qt5/qt5quick1/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_QT5QUICK1
-	bool "qt5quick1"
-	select BR2_PACKAGE_QT5BASE
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_NETWORK
-	select BR2_PACKAGE_QT5BASE_WIDGETS
-	select BR2_PACKAGE_QT5SCRIPT
-	select BR2_PACKAGE_QT5XMLPATTERNS
-	# This module does not support static linking
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  This package corresponds to the qt5quick1 module.
-
-	  This package has been tagged as deprecated since version
-	  5.5.0 and should be replaced by Qt Quick module in new
-	  design.
-
-	  http://qt.io
-
-comment "qt5quick1 needs a toolchain w/ dynamic library"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on BR2_STATIC_LIBS
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
deleted file mode 100644
index 845742c..0000000
--- a/package/qt5/qt5quick1/qt5quick1.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtquick1-opensource-src-5.5.1.tar.xz.mirrorlist
-sha256 c812a7e59a8b9f0a87693181059933e15fef04bc875b6486cd653be1b9b51f2c qtquick1-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
deleted file mode 100644
index 7ccf644..0000000
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-################################################################################
-#
-# qt5quick1
-#
-################################################################################
-
-QT5QUICK1_VERSION = $(QT5_VERSION)
-QT5QUICK1_SITE = $(QT5_SITE)
-QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
-QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script \
-	$(if $(BR2_PACKAGE_QT5WEBKIT),qt5webkit)
-QT5QUICK1_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICK1_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5QUICK1_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
-else
-QT5QUICK1_LICENSE = Commercial license
-QT5QUICK1_REDISTRIBUTE = NO
-endif
-
-define QT5QUICK1_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
-endef
-
-define QT5QUICK1_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5QUICK1_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
-define QT5QUICK1_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml1tooling $(TARGET_DIR)/usr/lib/qt/plugins/
-	cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
-endef
-
-$(eval $(generic-package))
-- 
2.5.0
