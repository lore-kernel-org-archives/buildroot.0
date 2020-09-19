From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 19 Sep 2020 21:48:57 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5location: needs qt5declarative
 quick package
Message-ID: <20200919194857.491282-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simply add the dependency of qt5declarative quick module that
forces Qt OpenGL support which is needed for qt5location component [1].

Fixes:
 http://autobuild.buildroot.net/results/ddd/ddda7cdb9400f6ca7d548e9b5ada18674fbe42e0/
 http://autobuild.buildroot.net/results/ddb/ddb25ebb591ed6029a7bd4934464171358553936/

and many many more...

[1] https://code.woboq.org/qt5/qtdeclarative/src/quick/scenegraph/coreapi/qsgmaterialshader.h.html#105

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/qt5/qt5location/Config.in      | 4 ++++
 package/qt5/qt5location/qt5location.mk | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index c68deb1006..207ad5a37a 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
+	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -10,3 +11,6 @@ config BR2_PACKAGE_QT5LOCATION
 	  popular location services.
 
 	  http://doc.qt.io/qt-5/qtlocation-index.html
+
+comment "qt5location needs qt5declarative quick"
+	depends on !BR2_PACKAGE_QT5DECLARATIVE_QUICK
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index ea741d0df6..e7523cf1ef 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -7,13 +7,10 @@
 QT5LOCATION_VERSION = $(QT5_VERSION)
 QT5LOCATION_SITE = $(QT5_SITE)
 QT5LOCATION_SOURCE = qtlocation-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5LOCATION_VERSION).tar.xz
+QT5LOCATION_DEPENDENCIES += qt5declarative
 QT5LOCATION_INSTALL_STAGING = YES
 
 QT5LOCATION_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
-QT5LOCATION_DEPENDENCIES += qt5declarative
-endif
-
 $(eval $(qmake-package))
-- 
2.28.0
