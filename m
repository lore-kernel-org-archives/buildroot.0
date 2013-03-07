From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:52 +0100
Subject: [Buildroot] [PATCH 24/32] qt5/qt5imageformats: new package
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-25-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                          |    1 +
 package/qt5/qt5imageformats/Config.in          |   10 ++++++
 package/qt5/qt5imageformats/qt5imageformats.mk |   39 ++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/qt5/qt5imageformats/Config.in
 create mode 100644 package/qt5/qt5imageformats/qt5imageformats.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 3f303e2..397f9c2 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -15,6 +15,7 @@ menuconfig BR2_PACKAGE_QT5
 
 if BR2_PACKAGE_QT5
 source "package/qt5/qt5base/Config.in"
+source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 endif
diff --git a/package/qt5/qt5imageformats/Config.in b/package/qt5/qt5imageformats/Config.in
new file mode 100644
index 0000000..d37e08f
--- /dev/null
+++ b/package/qt5/qt5imageformats/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5IMAGEFORMATS
+	bool "qt5imageformats"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5imageformats module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
new file mode 100644
index 0000000..c40d545
--- /dev/null
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# qt5imageformats
+#
+#############################################################
+
+QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
+QT5IMAGEFORMATS_SITE = http://releases.qt-project.org/qt5/$(QT5IMAGEFORMATS_VERSION)/submodules_tar/
+QT5IMAGEFORMATS_SOURCE = qtimageformats-opensource-src-$(QT5IMAGEFORMATS_VERSION).tar.xz
+QT5IMAGEFORMATS_DEPENDENCIES = qt5base
+QT5IMAGEFORMATS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5IMAGEFORMATS_CONFIGURE_OPTS += -opensource -confirm-license
+QT5IMAGEFORMATS_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for qt5svg.
+else
+QT5IMAGEFORMATS_LICENSE = Commercial license
+QT5IMAGEFORMATS_REDISTRIBUTE = NO
+endif
+
+define QT5IMAGEFORMATS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5IMAGEFORMATS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5IMAGEFORMATS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+define QT5IMAGEFORMATS_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/*.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
