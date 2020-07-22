From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 23:12:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5xmlpatterns:
 enable qml module
Message-ID: <20200722211134.4D5E781057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5fdf37e134fa30afcf9ba6a8a3b9897b14355f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

qt5declarative:
 - remove unneded dependency on qt5mlpatterns

qt5xmlpatterns:
 - add optional dependency on qt5declarative
 - add target install step of the optional qml files

Reported-by: Nimai Mahajan <nimaim@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Nimai Mahajan <nimaim@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5declarative/Config.in         |  1 -
 package/qt5/qt5declarative/qt5declarative.mk |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 11 +++++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 3a353a8326..d85f4c7136 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 6210611961..200a5578f8 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -7,7 +7,7 @@
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DECLARATIVE_VERSION).tar.xz
-QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
+QT5DECLARATIVE_DEPENDENCIES = qt5base
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 6ed247fd59..5ce4064cb6 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -21,6 +21,10 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5XMLPATTERNS_DEPENDENCIES += qt5declarative
+endif
+
 define QT5XMLPATTERNS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
 endef
@@ -39,6 +43,12 @@ define QT5XMLPATTERNS_INSTALL_TARGET_LIBS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5XMLPATTERNS_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/XmlListModel $(TARGET_DIR)/usr/qml/QtQuick
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/xmlpatterns $(TARGET_DIR)/usr/lib/qt/examples/
@@ -47,6 +57,7 @@ endif
 
 define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
 	$(QT5XMLPATTERNS_INSTALL_TARGET_LIBS)
+	$(QT5XMLPATTERNS_INSTALL_TARGET_QMLS)
 	$(QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES)
 endef
 
