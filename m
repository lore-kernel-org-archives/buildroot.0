From: will_wagner at carallon.com <will_wagner@carallon.com>
Date: Tue,  3 Feb 2015 13:38:43 +0000
Subject: [Buildroot] [PATCH 1/1] qt5base: add option for custom qconfig file
Message-ID: <1422970723-31706-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Add in support for a custom qconfig file in the same way it is
already present for the Qt4 package

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/qt5/qt5base/Config.in  |   13 +++++++++++++
 package/qt5/qt5base/qt5base.mk |   13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index d57dd8e..9f1cf8a 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -28,6 +28,19 @@ config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
 
 	  See also http://doc.qt.io/qt-5/licensing.html
 
+config BR2_PACKAGE_QT5BASE_CONFIG_FILE
+	string "Config file"
+	help
+	  Configure options allow to set which modules are being
+	  compiled or not in Qt, but Qt also provide a more
+	  fine-grained mechanism to configure which features should be
+	  enabled or disabled, through a header file. Examples of such
+	  header files can be found in src/corelib/global/qconfig-*.h
+	  in the Qt sources.
+
+	  This option allows to set the path of such a configuration
+	  file, which Buildroot will give to Qt at compile time.
+
 config BR2_PACKAGE_QT5BASE_EXAMPLES
 	bool "Compile and install examples (with code)"
 	select BR2_PACKAGE_QT5BASE_NETWORK
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index aaf4da0..7872547 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -57,6 +57,12 @@ QT5BASE_LICENSE = Commercial license
 QT5BASE_REDISTRIBUTE = NO
 endif
 
+QT5BASE_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT5BASE_CONFIG_FILE))
+
+ifneq ($(QT5BASE_CONFIG_FILE),)
+QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
+endif
+
 # Qt5 SQL Plugins
 ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
@@ -172,7 +178,14 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
+ifneq ($(QT5BASE_CONFIG_FILE),)
+define QT5BASE_CONFIGURE_CONFIG_FILE
+	cp $(QT5BASE_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
+endef
+endif
+
 define QT5BASE_CONFIGURE_CMDS
+	$(QT5BASE_CONFIGURE_CONFIG_FILE)
 	(cd $(@D); \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
-- 
1.7.10.4
