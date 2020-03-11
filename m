From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:47:09 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5wayland: convert to qmake
 infrastructure
Message-ID: <20200311213449.61A30909E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b73cde8ff7c8b673c1108a8ae6f4f8838d1123d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Straightforward conversion except for the wayland-compositor configure
option.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 46 +++---------------------------------
 1 file changed, 3 insertions(+), 43 deletions(-)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 6ea974f49a..0076bbfe73 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -7,7 +7,7 @@
 QT5WAYLAND_VERSION = $(QT5_VERSION)
 QT5WAYLAND_SITE = $(QT5_SITE)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WAYLAND_VERSION).tar.xz
-QT5WAYLAND_DEPENDENCIES = qt5base wayland
+QT5WAYLAND_DEPENDENCIES = wayland
 QT5WAYLAND_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
@@ -22,47 +22,7 @@ QT5WAYLAND_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1
 QT5WAYLAND_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
 ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
-QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
+QT5WAYLAND_CONF_OPTS += CONFIG+=wayland-compositor
 endif
 
-define QT5WAYLAND_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
-endef
-
-define QT5WAYLAND_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WAYLAND_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
-define QT5WAYLAND_INSTALL_COMPOSITOR
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
-endef
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WAYLAND_INSTALL_COMPOSITOR_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/
-endef
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
-define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-endif
-
-define QT5WAYLAND_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
-	$(QT5WAYLAND_INSTALL_COMPOSITOR)
-	$(QT5WAYLAND_INSTALL_COMPOSITOR_QMLS)
-	$(QT5WAYLAND_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
