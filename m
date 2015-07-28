From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:14:15 +0200
Subject: [Buildroot] [git commit branch/next] qt5base: Fix INCLUDE_PATH when
	no JPEG/PNG support
Message-ID: <20150808105649.5F9717FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34b4e42a2cfcc829bd5a926703a543ecf5f50b2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
  http://autobuild.buildroot.net/results/4be77432390c4cfb557c3f2cc52cf732de037949/
  http://autobuild.buildroot.net/results/255a77e01d8af4090e03acb82f9ad93b7c4dd212/
  http://autobuild.buildroot.net/results/7844e6a3eeecf67dc29277b73bfe714e4d8f0d85/
  http://autobuild.buildroot.net/results/b941f35b6c8e1cf3b2c4b046dfcce98700d8f408/
  http://autobuild.buildroot.net/results/c64b640a39285f59cde47cb8d06ab70a5ac97c8b/
  http://autobuild.buildroot.net/results/f6d24b50f58251c8051d39bc1d09b5b43f81f441/
  http://autobuild.buildroot.net/results/30acea45fb497942129ca57c143bab6174e14609/
  http://autobuild.buildroot.net/results/f0891474fe2cd3e47b1489f147e31f698dbd013f/

Upstream-Status: https://codereview.qt-project.org/#/c/122145/

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...008-QtGui-force-image-dir-in-include_path.patch |   89 ++++++++++++++++++++
 1 files changed, 89 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
new file mode 100644
index 0000000..8886fb7
--- /dev/null
+++ b/package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch
@@ -0,0 +1,89 @@
+From 7f282aa9f718389199b95b7f53ecd6401172fcc6 Mon Sep 17 00:00:00 2001
+From: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
+Date: Fri, 24 Jul 2015 13:18:29 +0200
+Subject: [PATCH 1/1] fix build with no built-in image handlers
+
+the handlers' .pri files added $$PWD to INCLUDEPATH to make the files
+self-contained when used externally, but this polluted the include path
+of the gui module itself, thus hiding incorrect use of QPA includes.
+
+Task-number: QTBUG-47400
+Change-Id: I576469a71e8ded0b409d62687999c0fa884613f9
+Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
+---
+ src/gui/image/qgifhandler.pri          | 1 -
+ src/gui/image/qjpeghandler.pri         | 1 -
+ src/gui/image/qpnghandler.pri          | 1 -
+ src/gui/painting/qbrush.cpp            | 2 +-
+ src/plugins/imageformats/gif/gif.pro   | 1 +
+ src/plugins/imageformats/jpeg/jpeg.pro | 1 +
+ 6 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/gui/image/qgifhandler.pri b/src/gui/image/qgifhandler.pri
+index 6eb0751..ec33101 100644
+--- a/src/gui/image/qgifhandler.pri
++++ b/src/gui/image/qgifhandler.pri
+@@ -1,4 +1,3 @@
+ # common to plugin and built-in forms
+-INCLUDEPATH *= $$PWD
+ HEADERS += $$PWD/qgifhandler_p.h
+ SOURCES += $$PWD/qgifhandler.cpp
+diff --git a/src/gui/image/qjpeghandler.pri b/src/gui/image/qjpeghandler.pri
+index c8de33d..de40c67 100644
+--- a/src/gui/image/qjpeghandler.pri
++++ b/src/gui/image/qjpeghandler.pri
+@@ -1,5 +1,4 @@
+ # common to plugin and built-in forms
+-INCLUDEPATH *= $$PWD
+ HEADERS += $$PWD/qjpeghandler_p.h
+ SOURCES += $$PWD/qjpeghandler.cpp
+ contains(QT_CONFIG, system-jpeg) {
+diff --git a/src/gui/image/qpnghandler.pri b/src/gui/image/qpnghandler.pri
+index aca7e2c..9ab175d 100644
+--- a/src/gui/image/qpnghandler.pri
++++ b/src/gui/image/qpnghandler.pri
+@@ -1,4 +1,3 @@
+-INCLUDEPATH *= $$PWD
+ HEADERS += $$PWD/qpnghandler_p.h
+ SOURCES += $$PWD/qpnghandler.cpp
+ contains(QT_CONFIG, system-png) {
+diff --git a/src/gui/painting/qbrush.cpp b/src/gui/painting/qbrush.cpp
+index 670717c..c3a0f5c 100644
+--- a/src/gui/painting/qbrush.cpp
++++ b/src/gui/painting/qbrush.cpp
+@@ -35,7 +35,7 @@
+ #include "qpixmap.h"
+ #include "qbitmap.h"
+ #include "qpixmapcache.h"
+-#include "qplatformpixmap.h"
++#include <qpa/qplatformpixmap.h>
+ #include "qdatastream.h"
+ #include "qvariant.h"
+ #include "qline.h"
+diff --git a/src/plugins/imageformats/gif/gif.pro b/src/plugins/imageformats/gif/gif.pro
+index 898f06e..2a5048b 100644
+--- a/src/plugins/imageformats/gif/gif.pro
++++ b/src/plugins/imageformats/gif/gif.pro
+@@ -5,6 +5,7 @@ PLUGIN_CLASS_NAME = QGifPlugin
+ load(qt_plugin)
+ 
+ include(../../../gui/image/qgifhandler.pri)
++INCLUDEPATH += ../../../gui/image
+ SOURCES += $$PWD/main.cpp
+ HEADERS += $$PWD/main.h
+ OTHER_FILES += gif.json
+diff --git a/src/plugins/imageformats/jpeg/jpeg.pro b/src/plugins/imageformats/jpeg/jpeg.pro
+index 45bf7bb..e33fde1 100644
+--- a/src/plugins/imageformats/jpeg/jpeg.pro
++++ b/src/plugins/imageformats/jpeg/jpeg.pro
+@@ -9,6 +9,7 @@ QT += core-private
+ QTDIR_build:REQUIRES = "!contains(QT_CONFIG, no-jpeg)"
+ 
+ include(../../../gui/image/qjpeghandler.pri)
++INCLUDEPATH += ../../../gui/image
+ SOURCES += main.cpp
+ HEADERS += main.h
+ OTHER_FILES += jpeg.json
+-- 
+2.1.0
+
