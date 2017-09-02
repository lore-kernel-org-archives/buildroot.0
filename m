From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:42 -0000
Subject: [Buildroot] [git commit] qt5wayland: new package
Message-ID: <20170902130615.191CA80285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4073fd0377c0df1941550a24191000afcf4ee63b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QtWayland is a Qt 5 module that wraps the functionality of Wayland.

Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Brent Sink <brents_3@hotmail.com>
Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
[Arnout:
 - select wayland instead of depending on it;
 - propagate jscore dependency from qt5declarative
 - re-order select/depends statements
 - rewrite comment to only refer to GL backend (jscore is an arch
   dependency)
 - rewrap help text of BR2_PACKAGE_QT5WAYLAND_COMPOSITOR]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/Config.in                  |  1 +
 package/qt5/qt5wayland/Config.in       | 27 +++++++++++++++
 package/qt5/qt5wayland/qt5wayland.hash |  5 +++
 package/qt5/qt5wayland/qt5wayland.mk   | 61 ++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index abaa584..1802c86 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -77,6 +77,7 @@ source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5virtualkeyboard/Config.in"
+source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5websockets/Config.in"
diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
new file mode 100644
index 0000000..82110cc
--- /dev/null
+++ b/package/qt5/qt5wayland/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_QT5WAYLAND
+	bool "qt5wayland"
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5wayland module.
+
+	  http://qt.io
+
+comment "qt5wayland needs an OpenGL-capable backend"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+
+if BR2_PACKAGE_QT5WAYLAND
+
+config BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
+	bool "Enable compositor (experimental)"
+	help
+	  The compositor API is still experimental, and not built by
+	  default.
+
+endif
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
index 0000000..0a7bdb8
--- /dev/null
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt5wayland
+#
+################################################################################
+
+QT5WAYLAND_VERSION = $(QT5_VERSION)
+QT5WAYLAND_SITE = $(QT5_SITE)
+QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
+QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland
+QT5WAYLAND_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
+QT5WAYLAND_DEPENDENCIES += libxkbcommon
+endif
+
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5WAYLAND_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
+QT5WAYLAND_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+else
+QT5WAYLAND_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
+QT5WAYLAND_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+endif
+
+ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
+QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
+endif
+
+define QT5WAYLAND_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
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
+ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+define QT5WAYLAND_INSTALL_COMPOSITOR
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
+endef
+else
+define QT5WAYLAND_INSTALL_COMPOSITOR
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Compositor.so* $(TARGET_DIR)/usr/lib
+endef
+endif
+endif
+
+define QT5WAYLAND_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
+	$(QT5WAYLAND_INSTALL_COMPOSITOR)
+endef
+
+$(eval $(generic-package))
