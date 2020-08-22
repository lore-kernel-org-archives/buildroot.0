From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Aug 2020 20:25:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5imageformats: add optional
 dependencies
Message-ID: <20200822182535.1835260-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add optional dependencies which are enabled by default:
 - libmng and tiff are optional dependencies since version 5.0.0 and
   https://github.com/qt/qtimageformats/commit/5373e3e821c7f43d9c941384437b1d39d6e9d47e
 - webp is an optional dependency since version 5.3.0 and
   https://github.com/qt/qtimageformats/commit/4522b350e53471c2ebc6d4692736ee4708445b66
 - jasper is an optional dependency since version 5.7.0 and
   https://github.com/qt/qtimageformats/commit/2d59367241aafbfe6acb30202f64e30697028bd9

Ideally we should use the configure options to disable those
dependencies if needed especially webp to avoid using the embedded one
These options are defined here:
https://code.qt.io/cgit/qt/qtimageformats.git/tree/config_help.txt
but I'm not skilled enough with the qmake-infrastructure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5imageformats/qt5imageformats.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index ffb094d566..33631a39b2 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -12,4 +12,10 @@ QT5IMAGEFORMATS_INSTALL_STAGING = YES
 QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 
+QT5IMAGEFORMATS_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_JASPER),jasper) \
+	$(if $(BR2_PACKAGE_LIBMNG),libmng) \
+	$(if $(BR2_PACKAGE_TIFF),tiff) \
+	$(if $(BR2_PACKAGE_WEBP),webp)
+
 $(eval $(qmake-package))
-- 
2.28.0
