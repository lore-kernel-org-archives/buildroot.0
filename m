From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 23 Sep 2020 20:23:00 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5declarative: remove optional
 quick module option
Message-ID: <20200923182300.58950-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit [1] we are not able to disable/enable this module
so let's force to set Qt5 OpenGL support by default
if it's possible because currently quick's components
are being built anyway.

This should fix the build errors with qt5location package
which includes couple of built-in components that require
OpenGL support [2] when Qt Quick module is detected.

http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/

[1] https://git.buildroot.net/buildroot/commit/package/qt5/qt5declarative/qt5declarative.mk?id=1bdceb5d735aad5fbf32b35e3a7f573ecb727e20
[2] https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/qt5/qt5declarative/Config.in | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 3ba9224c22..a25a12f06f 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -11,11 +12,3 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 	  http://doc.qt.io/qt-5/qtqml-index.html
 	  http://doc.qt.io/qt-5/qtquick-index.html
-
-if BR2_PACKAGE_QT5DECLARATIVE
-
-config BR2_PACKAGE_QT5DECLARATIVE_QUICK
-	bool "quick module"
-	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5_GL_AVAILABLE
-
-endif
-- 
2.28.0
