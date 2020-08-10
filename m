From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 10 Aug 2020 22:38:41 +0200
Subject: [Buildroot] [PATCH v1] package/qt5webengine: examples need qt5svg
Message-ID: <20200810203841.26171-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934350

  make[3]: Entering directory '.../build/qt5webengine-5.15.0/examples/webenginewidgets'
  Project ERROR: Unknown module(s) in QT: svg
  Makefile:47: recipe for target 'sub-pdfviewer-make_first' failed

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webengine/Config.in       | 1 +
 package/qt5/qt5webengine/qt5webengine.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 215afbb616..9879345e1e 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -54,6 +54,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	select BR2_PACKAGE_QT5QUICKCONTROLS
 	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5BASE_EXAMPLES
 	select BR2_PACKAGE_QT5WEBCHANNEL
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_QT5BASE_XCB
 	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_QT5BASE_XCB
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 4abcf45964..9101f35937 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -18,6 +18,10 @@ QT5WEBENGINE_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
 QT5WEBENGINE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT \
 	LICENSE.GPLv3 LICENSE.LGPL3 $(QT5WEBENGINE_CHROMIUM_LICENSE_FILES)
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5WEBENGINE_DEPENDENCIES += qt5svg
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBENGINE_DEPENDENCIES += xlib_libXScrnSaver xlib_libXcomposite \
 	xlib_libXcursor xlib_libXi xlib_libXrandr xlib_libXtst
-- 
2.28.0
