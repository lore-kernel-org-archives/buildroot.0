From: goran.radni at gmail.com <goran.radni@gmail.com>
Date: Wed, 17 Feb 2021 17:09:58 +0100
Subject: [Buildroot] [PATCH 1/1] qt5doc: Add package with qt quick demos
Message-ID: <20210217160958.18825-1-goranradni@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Goran Ra?enovi? <gradenovic@ultratronik.de>

Since qt 5.12, quick demos are moved in the qt5doc package.
In order to use quick demos, qt5doc has to be built.
qt5doc is a bit misleading name for the package, while it's
basic content are the quick demos. qdoc tool itself is a part
of qt5tools.

Signed-off-by: Goran Ra?enovi? <gradenovic@ultratronik.de>
---
 package/qt5/Config.in          |  1 +
 package/qt5/qt5doc/Config.in   | 13 +++++++++++++
 package/qt5/qt5doc/qt5doc.hash |  2 ++
 package/qt5/qt5doc/qt5doc.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/qt5/qt5doc/Config.in
 create mode 100644 package/qt5/qt5doc/qt5doc.hash
 create mode 100644 package/qt5/qt5doc/qt5doc.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6714c6271d..a66b6a3e24 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -43,6 +43,7 @@ source "package/qt5/qt5charts/Config.in"
 source "package/qt5/qt5coap/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
+source "package/qt5/qt5doc/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
diff --git a/package/qt5/qt5doc/Config.in b/package/qt5/qt5doc/Config.in
new file mode 100644
index 0000000000..7ff68d585b
--- /dev/null
+++ b/package/qt5/qt5doc/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_QT5DOC
+	bool "qt5doc (includes quick demos)"
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qtdoc contains the main Qt Reference Documentation, which includes
+	  overviews, Qt topics, and examples not specific to any Qt module.The
+	  configuration files are located in qtdoc/doc/config and the articles in
+	  qtdoc/doc/src. Note that QDoc is located in qtbase.
+
diff --git a/package/qt5/qt5doc/qt5doc.hash b/package/qt5/qt5doc/qt5doc.hash
new file mode 100644
index 0000000000..a26e7e37cb
--- /dev/null
+++ b/package/qt5/qt5doc/qt5doc.hash
@@ -0,0 +1,2 @@
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtdoc-everywhere-src-5.15.2.tar.xz
+sha256 a47809f00f1bd690ca4e699cb32ffe7717d43da84e0167d1f562210da7714ce4 qtdoc-everywhere-src-5.15.2.tar.xz
diff --git a/package/qt5/qt5doc/qt5doc.mk b/package/qt5/qt5doc/qt5doc.mk
new file mode 100644
index 0000000000..106711ee56
--- /dev/null
+++ b/package/qt5/qt5doc/qt5doc.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# qt5doc
+#
+################################################################################
+
+QT5DOC_VERSION = $(QT5_VERSION)
+QT5DOC_SITE = $(QT5_SITE)
+QT5DOC_SOURCE = qtdoc-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DOC_VERSION).tar.xz
+QT5DOC_DEPENDENCIES = qt5declarative
+QT5DOC_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS),y)
+QT5DOC_DEPENDENCIES += qt5quickcontrols
+endif
+
+ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS2),y)
+QT5DOC_DEPENDENCIES += qt5quickcontrols2
+endif
+
+ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
+QT5DOC_DEPENDENCIES += qt5xmlpatterns
+endif
+
+QT5DOC_LICENSE = GFDL-1.3
+QT5DOC_LICENSE_FILES = LICENSE.FDL
+
+$(eval $(qmake-package))
-- 
2.17.1
