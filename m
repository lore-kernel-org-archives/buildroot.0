From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 11 Jul 2017 11:02:45 -0700
Subject: [Buildroot] [PATCH] qt5wayland: new package
Message-ID: <1499796165-1046-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QtWayland is a Qt 5 module that wraps the functionality of Wayland.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                  |  1 +
 package/qt5/qt5wayland/Config.in       | 18 +++++++++++++++
 package/qt5/qt5wayland/qt5wayland.hash |  5 +++++
 package/qt5/qt5wayland/qt5wayland.mk   | 41 ++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/qt5/qt5wayland/Config.in
 create mode 100644 package/qt5/qt5wayland/qt5wayland.hash
 create mode 100644 package/qt5/qt5wayland/qt5wayland.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index abaa584..386dcb1 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -82,4 +82,5 @@ source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
+source "package/qt5/qt5wayland/Config.in"
 endif
diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
new file mode 100644
index 0000000..8bd8b9b
--- /dev/null
+++ b/package/qt5/qt5wayland/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_QT5WAYLAND
+	bool "qt5wayland"
+	select BR2_PACKAGE_QT5DECLARATIVE
+	depends on BR2_PACKAGE_LIBDRM
+	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_WAYLAND
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5wayland module.
+
+	  http://qt.io
+
+comment "qt5wayland needs libdrm/mesa3d/libxkbcommon/weston/wayland support"
+	depends on !BR2_PACKAGE_LIBDRM
+	depends on !BR2_PACKAGE_MESA3D
+	depends on !BR2_PACKAGE_WAYLAND
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
new file mode 100644
index 0000000..95b8824
--- /dev/null
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -0,0 +1,5 @@
+# hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwayland-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 035c3199f4719627b64b7020f0f4574da2b4cb78c6981aba75f27b872d8e6c86	qtwayland-opensource-src-5.6.2.tar.xz
+
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwayland-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 cf0cb1982a7b748bfec8c7834691f13072f104884c61809d0bbd1a01ebda3ffa	qtwayland-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
new file mode 100644
index 0000000..7f6fcb8
--- /dev/null
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qt5wayland
+#
+################################################################################
+
+QT5WAYLAND_VERSION = $(QT5_VERSION)
+QT5WAYLAND_SITE = $(QT5_SITE)
+QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
+QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative
+QT5WAYLAND_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WAYLAND_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT5WAYLAND_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+else
+QT5WAYLAND_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
+QT5WAYLAND_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
+
+define QT5WAYLAND_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake CONFIG+=wayland-compositor)
+endef
+
+define QT5WAYLAND_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WAYLAND_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5WAYLAND_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
