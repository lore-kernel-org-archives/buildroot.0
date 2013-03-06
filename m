From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Mar 2013 21:23:14 +0100
Subject: [Buildroot] [PATCH 32/34] qt5/qt5multimedia: new package
In-Reply-To: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362601396-32250-33-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                      |    1 +
 package/qt5/qt5multimedia/Config.in        |   11 +++++++
 package/qt5/qt5multimedia/qt5multimedia.mk |   43 ++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/qt5/qt5multimedia/Config.in
 create mode 100644 package/qt5/qt5multimedia/qt5multimedia.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 59234dd..e8e581c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -19,6 +19,7 @@ source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5jsbackend/Config.in"
+source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
new file mode 100644
index 0000000..8024798
--- /dev/null
+++ b/package/qt5/qt5multimedia/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5MULTIMEDIA
+	bool "qt5multimedia"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5DECLARATIVE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5multimedia module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
new file mode 100644
index 0000000..5248b2e
--- /dev/null
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# qt5multimedia
+#
+#############################################################
+
+QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
+QT5MULTIMEDIA_SITE = http://releases.qt-project.org/qt5/$(QT5MULTIMEDIA_VERSION)/submodules_tar/
+QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
+QT5MULTIMEDIA_DEPENDENCIES = qt5base qt5declarative
+QT5MULTIMEDIA_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5MULTIMEDIA_CONFIGURE_OPTS += -opensource -confirm-license
+QT5MULTIMEDIA_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5MULTIMEDIA_LICENSE = Commercial license
+QT5MULTIMEDIA_REDISTRIBUTE = NO
+endif
+
+define QT5MULTIMEDIA_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5MULTIMEDIA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/qml/* $(TARGET_DIR)/usr/qml
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
