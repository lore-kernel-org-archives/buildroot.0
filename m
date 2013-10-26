From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 16:40:18 +0200
Subject: [Buildroot] [git commit] qt5x11extras: new package
Message-ID: <20131027072650.8DB9F9BBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b601a07165fddeaf496f2b89266fce3a7c66cd2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in                    |    1 +
 package/qt5/qt5x11extras/Config.in       |   11 ++++++++
 package/qt5/qt5x11extras/qt5x11extras.mk |   40 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6c953f1..30f4ac8 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -28,5 +28,6 @@ source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
+source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
 endif
diff --git a/package/qt5/qt5x11extras/Config.in b/package/qt5/qt5x11extras/Config.in
new file mode 100644
index 0000000..79ff9b9
--- /dev/null
+++ b/package/qt5/qt5x11extras/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5X11EXTRAS
+	bool "qt5x11extras"
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	depends on BR2_PACKAGE_QT5BASE_XCB
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5x11extras module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
new file mode 100644
index 0000000..237fe32
--- /dev/null
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# qt5x11extras
+#
+################################################################################
+
+QT5X11EXTRAS_VERSION = $(QT5_VERSION)
+QT5X11EXTRAS_SITE = $(QT5_SITE)
+QT5X11EXTRAS_SOURCE = qtx11extras-opensource-src-$(QT5X11EXTRAS_VERSION).tar.xz
+QT5X11EXTRAS_DEPENDENCIES = qt5base
+QT5X11EXTRAS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5X11EXTRAS_LICENSE = LGPLv2.1 or GPLv3.0
+QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
+else
+QT5X11EXTRAS_LICENSE = Commercial license
+QT5X11EXTRAS_REDISTRIBUTE = NO
+endif
+
+define QT5X11EXTRAS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5X11EXTRAS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5X11EXTRAS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5X11EXTRAS_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5X11Extras.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+$(eval $(generic-package))
