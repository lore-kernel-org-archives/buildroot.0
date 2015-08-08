From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:12 -0000
Subject: [Buildroot] [git commit branch/next] qt/qt5webchannel: new package
Message-ID: <20150808105639.75006818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85904720aa07c5ae5bc4c8f2beb7d2b30d6cb45e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                              |    1 +
 .../0001-Fix-builds-without-qml-module.patch       |   61 ++++++++++++++++++++
 package/qt5/qt5webchannel/Config.in                |   11 ++++
 package/qt5/qt5webchannel/qt5webchannel.hash       |    4 +
 package/qt5/qt5webchannel/qt5webchannel.mk         |   61 ++++++++++++++++++++
 5 files changed, 138 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 737a789..3fb65f7 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
 source "package/qt5/qt5xmlpatterns/Config.in"
diff --git a/package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch b/package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch
new file mode 100644
index 0000000..0eb007e
--- /dev/null
+++ b/package/qt5/qt5webchannel/0001-Fix-builds-without-qml-module.patch
@@ -0,0 +1,61 @@
+From 4dee412aa655e1dc7f9e01869abcab47e0179422 Mon Sep 17 00:00:00 2001
+From: Julien Corjon <corjon.j@ecagroup.com>
+Date: Wed, 22 Jul 2015 09:24:04 +0200
+Subject: [PATCH] Fix builds without qml module
+
+When we build without qml module we cannot use QJSValue in qmetaobjectpublisher
+To prevent QJSValue inclusiion I use a preprocessor directive QT_HAVE_QML. This
+is probably not the best solution but I do not know any other QML directive.
+
+Upstream--Status: https://bugreports.qt.io/browse/QTBUG-47360
+Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
+---
+ src/webchannel/qmetaobjectpublisher.cpp | 4 ++++
+ src/webchannel/webchannel.pro           | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/webchannel/qmetaobjectpublisher.cpp b/src/webchannel/qmetaobjectpublisher.cpp
+index 0cad569..b0e9652 100644
+--- a/src/webchannel/qmetaobjectpublisher.cpp
++++ b/src/webchannel/qmetaobjectpublisher.cpp
+@@ -41,7 +41,9 @@
+ #include <QDebug>
+ #include <QJsonObject>
+ #include <QJsonArray>
++#ifdef QT_HAVE_QML
+ #include <QJSValue>
++#endif
+ #include <QUuid>
+ 
+ QT_BEGIN_NAMESPACE
+@@ -486,12 +488,14 @@ QJsonValue QMetaObjectPublisher::wrapResult(const QVariant &result, QWebChannelA
+         if (!classInfo.isEmpty())
+             objectInfo[KEY_DATA] = classInfo;
+         return objectInfo;
++#ifdef QT_HAVE_QML
+     } else if (result.canConvert<QJSValue>()) {
+         // Workaround for keeping QJSValues from QVariant.
+         // Calling QJSValue::toVariant() converts JS-objects/arrays to QVariantMap/List
+         // instead of stashing a QJSValue itself into a variant.
+         // TODO: Improve QJSValue-QJsonValue conversion in Qt.
+         return wrapResult(result.value<QJSValue>().toVariant(), transport, parentObjectId);
++#endif
+     } else if (result.canConvert<QVariantList>()) {
+         // recurse and potentially wrap contents of the array
+         return wrapList(result.toList(), transport);
+diff --git a/src/webchannel/webchannel.pro b/src/webchannel/webchannel.pro
+index eba8123..f476d6f 100644
+--- a/src/webchannel/webchannel.pro
++++ b/src/webchannel/webchannel.pro
+@@ -30,6 +30,8 @@ SOURCES += \
+ qtHaveModule(qml) {
+     QT += qml
+ 
++    QMAKE_CXXFLAGS += "-DQT_HAVE_QML"
++
+     SOURCES += \
+         qqmlwebchannel.cpp \
+         qqmlwebchannelattached.cpp
+-- 
+2.1.0
+
diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
new file mode 100644
index 0000000..218629a
--- /dev/null
+++ b/package/qt5/qt5webchannel/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5WEBCHANNEL
+	bool "qt5webchannel"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5WEBSOCKETS
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5webchannel module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
new file mode 100644
index 0000000..b96aebb
--- /dev/null
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -0,0 +1,4 @@
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebchannel-opensource-src-5.5.0.tar.xz.mirrorlist
+sha256 94f88604ff0b29a30f1a1b13601d4bce9af5c0a96c43869705aee1596aeb2d8d qtwebchannel-opensource-src-5.5.0.tar.xz
+sha1   7c45ecb9c4226207f184b5cf25d1a18d650075da                         qtwebchannel-opensource-src-5.5.0.tar.xz
+md5    c20146286108477cdab60c67d2d87dc7                                 qtwebchannel-opensource-src-5.5.0.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
new file mode 100644
index 0000000..cfb6da9
--- /dev/null
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# qt5webchannel
+#
+################################################################################
+
+QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
+QT5WEBCHANNEL_SITE = $(QT5_SITE)
+QT5WEBCHANNEL_SOURCE = qtwebchannel-opensource-src-$(QT5WEBCHANNEL_VERSION).tar.xz
+QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
+QT5WEBCHANNEL_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5WEBCHANNEL_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
+QT5WEBCHANNEL_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LGPL_EXCEPTION.txt LICENSE.GPLv2
+else
+QT5WEBCHANNEL_LICENSE = Commercial license
+QT5WEBCHANNEL_REDISTRIBUTE = NO
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
+endif
+
+define QT5WEBCHANNEL_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5WEBCHANNEL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webchannel $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+define QT5WEBCHANNEL_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebChannel.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
+	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
+	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
+endef
+
+$(eval $(generic-package))
