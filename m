From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 09:28:13 +0300
Subject: [Buildroot] [PATCH 5/5] qt5x11extras: new package
In-Reply-To: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
References: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <1379485693-822-6-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/Config.in                    |    1 +
 package/qt5/qt5x11extras/Config.in       |   11 ++++++++
 package/qt5/qt5x11extras/qt5x11extras.mk |   42 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/qt5/qt5x11extras/Config.in
 create mode 100644 package/qt5/qt5x11extras/qt5x11extras.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index fa10155..87b869a 100644
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
index 0000000..fa5f583
--- /dev/null
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -0,0 +1,42 @@
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
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
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
-- 
1.7.10.4
