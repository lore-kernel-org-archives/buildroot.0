From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  3 Feb 2016 23:01:23 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump version to 5.5.1
Message-ID: <1454536883-5029-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reduce hash lists to strongest only (sha256).

Remove upstream committed patches (qt5base):
 - 0004-no-gold-linker-for-host-build.patch (see [1], [2])
 - 0007-big_endian-fix_destformat.patch (see [3])
 - 0008-QtGui-force-image-dir-in-include_path.patch (see [4], [5])

[1] https://bugreports.qt.io/browse/QTBUG-46125
[2] https://codereview.qt-project.org/#/c/113563/
[3] https://codereview.qt-project.org/#/c/120654/
[4] https://bugreports.qt.io/browse/QTBUG-47400
[5] https://codereview.qt-project.org/#/c/122145/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note: updates new qt5tools package too.
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 .../0004-no-gold-linker-for-host-build.patch       | 41 ----------
 .../qt5base/0007-big_endian-fix_destformat.patch   | 34 ---------
 ...008-QtGui-force-image-dir-in-include_path.patch | 89 ----------------------
 package/qt5/qt5base/qt5base.hash                   |  6 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  6 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  6 +-
 package/qt5/qt5enginio/qt5enginio.hash             |  6 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  6 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  6 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  6 +-
 package/qt5/qt5quick1/qt5quick1.hash               |  6 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  6 +-
 package/qt5/qt5script/qt5script.hash               |  6 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  6 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  6 +-
 package/qt5/qt5svg/qt5svg.hash                     |  6 +-
 package/qt5/qt5tools/qt5tools.hash                 |  6 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  6 +-
 .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  6 +-
 package/qt5/qt5webkit/qt5webkit.hash               |  6 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  6 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  6 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  6 +-
 25 files changed, 43 insertions(+), 247 deletions(-)
 delete mode 100644 package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
 delete mode 100644 package/qt5/qt5base/0007-big_endian-fix_destformat.patch
 delete mode 100644 package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d7f38ac..bb33903 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,5 +1,5 @@
 QT5_VERSION_MAJOR = 5.5
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 0ba111e..8fbc42f 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,2 +1,2 @@
-# Hash from http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qt3d-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 bf6c54fbb6f279e9bd6fd67f7faa8e61ac4273baa06a56f8946346adc8c3568e qt3d-opensource-src-5.5.0.tar.xz
+# Hash from http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qt3d-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 e380906e2bcbd825dab45043bf063dd88b793c0d5fb050ee915bf4e2b58b1bf7 qt3d-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch b/package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
deleted file mode 100644
index 3dc9a6d..0000000
--- a/package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2cb4b7e947f64580592afaf221d4b261d980bb45 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 19 May 2015 21:30:21 +0200
-Subject: [PATCH] Disable gold linker/new dtags support for host builds
-
-There is no test for gold linker and new dtags support for the host build
-(only for the target compiler/build) which leads to trouble in some cross
-compiling environments (see [1] for details).
-
-So disable gold linker/new dtags support unconditionally for host builds.
-
-[1] http://lists.busybox.net/pipermail/buildroot/2015-May/128303.html
-
-Task-number: QTBUG-46125
-Change-Id: Ic62828704dcce461487d63860705158cce3e4af8
-Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
----
- mkspecs/features/default_post.prf | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/mkspecs/features/default_post.prf b/mkspecs/features/default_post.prf
-index 8e68b95..bcaddc8 100644
---- a/mkspecs/features/default_post.prf
-+++ b/mkspecs/features/default_post.prf
-@@ -62,8 +62,11 @@ debug {
-     QMAKE_LIBFLAGS += $$QMAKE_LIBFLAGS_RELEASE
- }
- 
--use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
--enable_new_dtags: QMAKE_LFLAGS += $$QMAKE_LFLAGS_NEW_DTAGS
-+# disable special linker flags for host builds (no proper test for host support yet)
-+!host_build {
-+    use_gold_linker: QMAKE_LFLAGS += $$QMAKE_LFLAGS_USE_GOLD
-+    enable_new_dtags: QMAKE_LFLAGS += $$QMAKE_LFLAGS_NEW_DTAGS
-+}
- 
- dll:win32: QMAKE_LFLAGS += $$QMAKE_LFLAGS_DLL
- static:mac: QMAKE_LFLAGS += $$QMAKE_LFLAGS_STATIC_LIB
--- 
-2.1.0
-
diff --git a/package/qt5/qt5base/0007-big_endian-fix_destformat.patch b/package/qt5/qt5base/0007-big_endian-fix_destformat.patch
deleted file mode 100644
index b30d220..0000000
--- a/package/qt5/qt5base/0007-big_endian-fix_destformat.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 02ab210ea9bc5ee53fa4f1db2f068ce24272a6cd Mon Sep 17 00:00:00 2001
-From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
-Date: Fri, 3 Jul 2015 14:19:02 +0200
-Subject: [PATCH] Fix compile error on big endian
-
-DestFormat is not defined here but should be Format_RGBX8888
-
-Change-Id: Ie33989a6fc31650434281a6b7b0f4806524268af
-Reviewed-by: Konstantin Ritt <ritt.ks@gmail.com>
-Reviewed-by: Timo Jyrinki <timo.jyrinki@canonical.com>
-Reviewed-by: Simon Hausmann <simon.hausmann@theqtcompany.com>
-
-Upstream-Status: https://codereview.qt-project.org/#/c/120654/
-Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
----
- src/gui/image/qimage_conversions.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gui/image/qimage_conversions.cpp b/src/gui/image/qimage_conversions.cpp
-index e0ca2c5..02f32aa 100644
---- a/src/gui/image/qimage_conversions.cpp
-+++ b/src/gui/image/qimage_conversions.cpp
-@@ -1103,7 +1103,7 @@ static bool mask_alpha_converter_rgbx_inplace(QImageData *data, Qt::ImageConvers
-         }
-         rgb_data += pad;
-     }
--    data->format = DestFormat;
-+    data->format = QImage::Format_RGBX8888;
-     return true;
- #endif
- }
--- 
-2.1.0
-
diff --git a/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
deleted file mode 100644
index 8886fb7..0000000
--- a/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 7f282aa9f718389199b95b7f53ecd6401172fcc6 Mon Sep 17 00:00:00 2001
-From: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
-Date: Fri, 24 Jul 2015 13:18:29 +0200
-Subject: [PATCH 1/1] fix build with no built-in image handlers
-
-the handlers' .pri files added $$PWD to INCLUDEPATH to make the files
-self-contained when used externally, but this polluted the include path
-of the gui module itself, thus hiding incorrect use of QPA includes.
-
-Task-number: QTBUG-47400
-Change-Id: I576469a71e8ded0b409d62687999c0fa884613f9
-Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
----
- src/gui/image/qgifhandler.pri          | 1 -
- src/gui/image/qjpeghandler.pri         | 1 -
- src/gui/image/qpnghandler.pri          | 1 -
- src/gui/painting/qbrush.cpp            | 2 +-
- src/plugins/imageformats/gif/gif.pro   | 1 +
- src/plugins/imageformats/jpeg/jpeg.pro | 1 +
- 6 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/src/gui/image/qgifhandler.pri b/src/gui/image/qgifhandler.pri
-index 6eb0751..ec33101 100644
---- a/src/gui/image/qgifhandler.pri
-+++ b/src/gui/image/qgifhandler.pri
-@@ -1,4 +1,3 @@
- # common to plugin and built-in forms
--INCLUDEPATH *= $$PWD
- HEADERS += $$PWD/qgifhandler_p.h
- SOURCES += $$PWD/qgifhandler.cpp
-diff --git a/src/gui/image/qjpeghandler.pri b/src/gui/image/qjpeghandler.pri
-index c8de33d..de40c67 100644
---- a/src/gui/image/qjpeghandler.pri
-+++ b/src/gui/image/qjpeghandler.pri
-@@ -1,5 +1,4 @@
- # common to plugin and built-in forms
--INCLUDEPATH *= $$PWD
- HEADERS += $$PWD/qjpeghandler_p.h
- SOURCES += $$PWD/qjpeghandler.cpp
- contains(QT_CONFIG, system-jpeg) {
-diff --git a/src/gui/image/qpnghandler.pri b/src/gui/image/qpnghandler.pri
-index aca7e2c..9ab175d 100644
---- a/src/gui/image/qpnghandler.pri
-+++ b/src/gui/image/qpnghandler.pri
-@@ -1,4 +1,3 @@
--INCLUDEPATH *= $$PWD
- HEADERS += $$PWD/qpnghandler_p.h
- SOURCES += $$PWD/qpnghandler.cpp
- contains(QT_CONFIG, system-png) {
-diff --git a/src/gui/painting/qbrush.cpp b/src/gui/painting/qbrush.cpp
-index 670717c..c3a0f5c 100644
---- a/src/gui/painting/qbrush.cpp
-+++ b/src/gui/painting/qbrush.cpp
-@@ -35,7 +35,7 @@
- #include "qpixmap.h"
- #include "qbitmap.h"
- #include "qpixmapcache.h"
--#include "qplatformpixmap.h"
-+#include <qpa/qplatformpixmap.h>
- #include "qdatastream.h"
- #include "qvariant.h"
- #include "qline.h"
-diff --git a/src/plugins/imageformats/gif/gif.pro b/src/plugins/imageformats/gif/gif.pro
-index 898f06e..2a5048b 100644
---- a/src/plugins/imageformats/gif/gif.pro
-+++ b/src/plugins/imageformats/gif/gif.pro
-@@ -5,6 +5,7 @@ PLUGIN_CLASS_NAME = QGifPlugin
- load(qt_plugin)
- 
- include(../../../gui/image/qgifhandler.pri)
-+INCLUDEPATH += ../../../gui/image
- SOURCES += $$PWD/main.cpp
- HEADERS += $$PWD/main.h
- OTHER_FILES += gif.json
-diff --git a/src/plugins/imageformats/jpeg/jpeg.pro b/src/plugins/imageformats/jpeg/jpeg.pro
-index 45bf7bb..e33fde1 100644
---- a/src/plugins/imageformats/jpeg/jpeg.pro
-+++ b/src/plugins/imageformats/jpeg/jpeg.pro
-@@ -9,6 +9,7 @@ QT += core-private
- QTDIR_build:REQUIRES = "!contains(QT_CONFIG, no-jpeg)"
- 
- include(../../../gui/image/qjpeghandler.pri)
-+INCLUDEPATH += ../../../gui/image
- SOURCES += main.cpp
- HEADERS += main.h
- OTHER_FILES += jpeg.json
--- 
-2.1.0
-
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 07f6caf..ea831e9 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtbase-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 893f0691739c00d13ff85bf8d3fd14e1c7a62fbbbcffa44b0491da4d5e570965 qtbase-opensource-src-5.5.0.tar.xz
-sha1   3d6734bc6d00e1017c1db40d68309997bdf7bf6f                         qtbase-opensource-src-5.5.0.tar.xz
-md5    252613b5a180c94d7196d10467a4f08b                                 qtbase-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtbase-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 dfa4e8a4d7e4c6b69285e7e8833eeecd819987e1bdbe5baa6b6facd4420de916 qtbase-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index d323b5f..058ba31 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtconnectivity-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 f1cfdd934e11dc114039c84a6a6b83870b56b2966715f1cb266f25bce1524302 qtconnectivity-opensource-src-5.5.0.tar.xz
-sha1   b393471529502028b0d5318088a27e48e944bc90                         qtconnectivity-opensource-src-5.5.0.tar.xz
-md5    31b005585b2be1c8aca9ea585a90f2b0                                 qtconnectivity-opensource-src-5.5.0.tar.xz
+# Hashe from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtconnectivity-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 3637e6def8582fc0fb3684179b93650720ba2da1311a560d358296153f245023 qtconnectivity-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 9fb9609..f32b037 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtdeclarative-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 858a12c5647764da8f81edec4ed444af77888cf931b739c10168064ae96f6773 qtdeclarative-opensource-src-5.5.0.tar.xz
-sha1   f41766db6f6bc8b9cefff05543891c271436043e                         qtdeclarative-opensource-src-5.5.0.tar.xz
-md5    1452c92f8c660dc7d23d9e17d89f8716                                 qtdeclarative-opensource-src-5.5.0.tar.xz
+# Hashe from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtdeclarative-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 5fd14eefb83fff36fb17681693a70868f6aaf6138603d799c16466a094b26791 qtdeclarative-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index 359e745..6f5f626 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtenginio-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 f61c4b2a26550bcb5e81cfcde55b1e521ee021226679dc9f60ab6c55f21f1520 qtenginio-opensource-src-5.5.0.tar.xz
-sha1   14b961bea8cf2f2d4510283d6120038dbf90d29d                         qtenginio-opensource-src-5.5.0.tar.xz
-md5    917e3105fe125068942f39e775f621ad                                 qtenginio-opensource-src-5.5.0.tar.xz
+# Hashe from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtenginio-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 a79936bd5b6a35aba28dd282291b28c8fa869b8d86652c62efe5e268d94defe2 qtenginio-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 8c020a0..959230f 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtgraphicaleffects-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 f143514e7414797f264fea6348635e1db3e15d13e326af4a6b355fecf0a147ee qtgraphicaleffects-opensource-src-5.5.0.tar.xz
-sha1   1e9ca2b5d1fdfe6a73dfd646868c5351989ecccc                         qtgraphicaleffects-opensource-src-5.5.0.tar.xz
-md5    2fb95cecb2ab0542cb0b5847c65600c3                                 qtgraphicaleffects-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtgraphicaleffects-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 9bca0f8db3a4289eceebfa9504915440fe3fa6301d90b65705e4ece528c12d47 qtgraphicaleffects-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 8bc5705..c392abf 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtimageformats-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 6479d1d2ac5b7dd85566799e13a173e525cbccd5c8bd43e7db1bdaf772af8955 qtimageformats-opensource-src-5.5.0.tar.xz
-sha1   cffd35f9742f13a0c5afc04eab27b7b47338e800                         qtimageformats-opensource-src-5.5.0.tar.xz
-md5    72cbebfda5253dece90fa90ded64e953                                 qtimageformats-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtimageformats-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 c97fee00c602f9f089fea480546d6e9d61a2b2297c2f163bfd9f8aba92b754a5 qtimageformats-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index f4e23d5..b4e1b68 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtmultimedia-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 a8bf1bd59bad74bba2906e6a86faa1cf008c8dba5f5a9cdea72eb0ce5f85355b qtmultimedia-opensource-src-5.5.0.tar.xz
-sha1   3438c16f498e40eaa68cd518b76ddd81c02a5471                         qtmultimedia-opensource-src-5.5.0.tar.xz
-md5    2759807c5d1842ee69e516aacd5e756a                                 qtmultimedia-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtmultimedia-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 7cc7ca99f41587c188303670499e5c75101f9a8cb6178e8f29cc941e637d957f qtmultimedia-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5quick1/qt5quick1.hash b/package/qt5/qt5quick1/qt5quick1.hash
index 2b0c19c..845742c 100644
--- a/package/qt5/qt5quick1/qt5quick1.hash
+++ b/package/qt5/qt5quick1/qt5quick1.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtquick1-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 db563b33e1670bc8a254d53c0a8e29ba501b903fafcd3b7e3d2ab845db0dfa2c qtquick1-opensource-src-5.5.0.tar.xz
-sha1   27d67436cd902bb8b89b5808e4cc4a34fd61ac75                         qtquick1-opensource-src-5.5.0.tar.xz
-md5    8cd53fd1100e7f7cdf5b14f7c227e7b9                                 qtquick1-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtquick1-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 c812a7e59a8b9f0a87693181059933e15fef04bc875b6486cd653be1b9b51f2c qtquick1-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 6aab435..99dacb8 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtquickcontrols-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 df616aa6b390797f92f33115510961d1a53a55c349a18ae21f74b4aff478c2ea qtquickcontrols-opensource-src-5.5.0.tar.xz
-sha1   9b12048acb3555f7e98bd6c1333437fb04cf60d6                         qtquickcontrols-opensource-src-5.5.0.tar.xz
-md5    24b59d5928092f02e0cba969d9548350                                 qtquickcontrols-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtquickcontrols-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 1b7a8389d656066c629bd2cb520b39a7eb041d184b567dd1b9639b88d841fcf0 qtquickcontrols-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 2b17fb7..f2b1df8 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtscript-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 343932ea8b2ecb16c3d9b49db55a7975f2f22534055608de4b06b1e38d867e8b qtscript-opensource-src-5.5.0.tar.xz
-sha1   ed5cf73c8217a249535442c49a8a0e5c43f6e648                         qtscript-opensource-src-5.5.0.tar.xz
-md5    1e9766d2651d6a81221525462378336d                                 qtscript-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtscript-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 cd46dddd998f22bcb06447e0407fef81f7052f25bc770b1c27625654cee828fd qtscript-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index e52ee6d..23559f6 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtsensors-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 8d5a989df94b28dac872f3b28437982ecc6434b38b44da75f1d4bf81915fd14b qtsensors-opensource-src-5.5.0.tar.xz
-sha1   bd4b2fb7685f80ef1661ced90ff665b4b27216aa                         qtsensors-opensource-src-5.5.0.tar.xz
-md5    68ea0a61147a4934ca0fbd04fae10ed6                                 qtsensors-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtsensors-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 5d264fc0729a5d7679bd4eb8d7a0a9b142ed38d09fa68fc7dfe57f64afc8eeea qtsensors-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 05c276a..db50145 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtserialport-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 a60e2d2113c1c3895b71c901921f83b81e9b3c59e3620cf94bd8647730efa866 qtserialport-opensource-src-5.5.0.tar.xz
-sha1   371da46f2f2ad652a22b0f04e4b48f088976d3ce                         qtserialport-opensource-src-5.5.0.tar.xz
-md5    8a76f051ed28a9c925d32f5864d33e78                                 qtserialport-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtserialport-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 a034dbfb023db1b9b9de54390f7e76a48c1d1eb12533b0ffd574505c99968f7a qtserialport-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index c47855e..afe98cf 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtsvg-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 00efdeec66d34dabeddf17c510c0d607179991566a030d461968a16d6322e19f qtsvg-opensource-src-5.5.0.tar.xz
-sha1   9238a1aedd126f84a73014c12b6391267238da0a                         qtsvg-opensource-src-5.5.0.tar.xz
-md5    08234e3c3696f1a75df30201ca16d4bc                                 qtsvg-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtsvg-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 f7f588be48befd9ccab5a6086832551b8899e8bed9e603ddea979581e05a91c7 qtsvg-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 427dfe7..f54c94a 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qttools-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 5b65147187fb7f4456c20ef263f1093709d728f737d6d871a9a5888132fac07d qttools-opensource-src-5.5.0.tar.xz
-sha1   be69ccb338bcc7b397a8b31d7ba0a45fe677390e                         qttools-opensource-src-5.5.0.tar.xz
-md5    2057ef2110b6a1aec260a69e2860a502                                 qttools-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qttools-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 4361f6ce49717058160908297841a18b94645cec593d1b48fb126c9d06c87bfd qttools-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index b96aebb..c0ae89e 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebchannel-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 94f88604ff0b29a30f1a1b13601d4bce9af5c0a96c43869705aee1596aeb2d8d qtwebchannel-opensource-src-5.5.0.tar.xz
-sha1   7c45ecb9c4226207f184b5cf25d1a18d650075da                         qtwebchannel-opensource-src-5.5.0.tar.xz
-md5    c20146286108477cdab60c67d2d87dc7                                 qtwebchannel-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebchannel-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 7f4295ee57cd4ecba3cb263452d2a08d501b45c9a2b8b7794b6a97d7652f15d0 qtwebchannel-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 83975b0..b28e0da 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebkit-examples-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 d25564fb56e8e06ad782390c7a7cf2c80f52c1dac5a8cac6ad5382711cd4bd12 qtwebkit-examples-opensource-src-5.5.0.tar.xz
-sha1   706464b813e9910fefd4af83e479a8247fd50a68                         qtwebkit-examples-opensource-src-5.5.0.tar.xz
-md5    5005737b4b29a76c70d2d08e5b105a66                                 qtwebkit-examples-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebkit-examples-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 098935b42d6d249027d1a635e4e70edc3d2969dd860f825b36aec06fc72e46c6 qtwebkit-examples-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 741772b..8517223 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebkit-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 17964996347d040a68b0c378a84b4b3874f1289c0d561b6868f7668402d9eeec qtwebkit-opensource-src-5.5.0.tar.xz
-sha1   8489ffa9253ab429b75f65117e435624dd78f769                         qtwebkit-opensource-src-5.5.0.tar.xz
-md5    5335fe211f5c0f92a4f6ca370fa9a0ce                                 qtwebkit-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebkit-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 77583f9dbd3e6ad874386df71b165dc3ce88efdabbc6e5d97a959ee2187d6d69 qtwebkit-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index d3c0f3b..0bd4a5a 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtwebsockets-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 1ad465b1b2d1e6dddbdc403af9f69d93b1c408f6903c28ccaa52058df7ee8ae8 qtwebsockets-opensource-src-5.5.0.tar.xz
-sha1   215f4e8d8170933d68e9395d966ecf6213fc0a74                         qtwebsockets-opensource-src-5.5.0.tar.xz
-md5    aa7b160a4b97fafe71d5546c20715b8f                                 qtwebsockets-opensource-src-5.5.0.tar.xz
+# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtwebsockets-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 cf4e834a867b90337188be504ef20184c52666370f721e704952988f8cb12deb qtwebsockets-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 3b87968..d7c0ad0 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtx11extras-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 bcb3cec5c9f0b551f0e2de30824c8be08620fbbe466ad4846beb2ad636d0b979 qtx11extras-opensource-src-5.5.0.tar.xz
-sha1   2eb25a96cc061b364d5fc30125a5ca9904857e89                         qtx11extras-opensource-src-5.5.0.tar.xz
-md5    9bee6d5c127ba8cc878ac7c2664d99f9                                 qtx11extras-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtx11extras-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 6387a01d972b62e1ad39e5a25e07d0492200f62fc87cf4366122085aeeebeb65 qtx11extras-opensource-src-5.5.1.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 718f8ce..e04a1a1 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,4 +1,2 @@
-# Hashes from: http://download.qt.io/official_releases/qt/5.5/5.5.0/submodules/qtxmlpatterns-opensource-src-5.5.0.tar.xz.mirrorlist
-sha256 672882c670c13c5caec199173cdabffd38474d06979d261bdc6e19738e0cef53 qtxmlpatterns-opensource-src-5.5.0.tar.xz
-sha1   d961f998980264f19916f70c8585da8479a84724                         qtxmlpatterns-opensource-src-5.5.0.tar.xz
-md5    138ab73b2376fcfca92a4bb6ab47e4a4                                 qtxmlpatterns-opensource-src-5.5.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.5/5.5.1/submodules/qtxmlpatterns-opensource-src-5.5.1.tar.xz.mirrorlist
+sha256 b537eb0252988e3805a32a16c65038973371d647baf246fdf703bde725d0e8ec qtxmlpatterns-opensource-src-5.5.1.tar.xz
-- 
2.1.4
