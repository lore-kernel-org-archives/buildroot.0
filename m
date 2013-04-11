From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 17:11:27 +0200
Subject: [Buildroot] [git commit] qt5/qt5quick1: new package
Message-ID: <20130411151209.ED4949B59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=998ebc98b54bbfde52e1789a29492e38a2719b12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/Config.in              |    1 +
 package/qt5/qt5quick1/Config.in    |   22 +++++++++++++++++
 package/qt5/qt5quick1/qt5quick1.mk |   45 ++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index e328b0e..2945d96 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -21,6 +21,7 @@ source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
+source "package/qt5/qt5quick1/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5webkit/Config.in"
diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
new file mode 100644
index 0000000..99fd5a4
--- /dev/null
+++ b/package/qt5/qt5quick1/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QT5QUICK1
+	bool "qt5quick1"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5SCRIPT
+	select BR2_PACKAGE_QT5XMLPATTERNS
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5JSBACKEND
+	select BR2_PACKAGE_QT5WEBKIT
+	# This module does not support static linking
+	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5quick1 module.
+
+	  http://qt-project.org
+
+comment "qt5quick1 requires an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
new file mode 100644
index 0000000..42b5895
--- /dev/null
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -0,0 +1,45 @@
+#############################################################
+#
+# qt5quick1
+#
+#############################################################
+
+QT5QUICK1_VERSION = $(QT5_VERSION)
+QT5QUICK1_SITE = http://releases.qt-project.org/qt5/$(QT5QUICK1_VERSION)/submodules_tar/
+QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
+QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend qt5webkit
+QT5QUICK1_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5QUICK1_CONFIGURE_OPTS += -opensource -confirm-license
+QT5QUICK1_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5QUICK1_LICENSE = Commercial license
+QT5QUICK1_REDISTRIBUTE = NO
+endif
+
+define QT5QUICK1_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5QUICK1_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5QUICK1_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5QUICK1_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_inspector.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
+	cp -dpf $(STAGING_DIR)/usr/bin/qmlviewer $(TARGET_DIR)/usr/bin
+	cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
