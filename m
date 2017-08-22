From: Stephan Bauroth <stephanbauroth@web.de>
Date: Tue, 22 Aug 2017 15:32:10 +0200
Subject: [Buildroot] [PATCH] libv4l: avoid compilation error by adding
	upstream patch
Message-ID: <20170822133210.4254-1-stephanbauroth@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this patch, libv4l fails to build if qt5 is enabled:

capture-win-gl.cpp: In member function 'virtual void
CaptureWinGLEngine::initializeGL()':
capture-win-gl.cpp:275:15: error: 'GL_FLAT' was not declared in this scope
  glShadeModel(GL_FLAT);
               ^~~~~~~

and more missing GL_* constants. This patch is upstream but not yet included in
any release. So unitl a new version gets released, include it here.

Backported from: 4d65b0571ea0027b6de45a76cfcadca32ea4be4a
Signed-off-by: Stephan Bauroth <stephanbauroth@web.de>
---
 package/libv4l/0011-fix-compilation-with-qt.patch | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libv4l/0011-fix-compilation-with-qt.patch

diff --git a/package/libv4l/0011-fix-compilation-with-qt.patch b/package/libv4l/0011-fix-compilation-with-qt.patch
new file mode 100644
index 0000000000..dbd60ee498
--- /dev/null
+++ b/package/libv4l/0011-fix-compilation-with-qt.patch
@@ -0,0 +1,37 @@
+From 4d65b0571ea0027b6de45a76cfcadca32ea4be4a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 4 Mar 2017 21:01:53 +0100
+Subject: qv4l2: fix qv4l2.pro qmake project file
+
+The header files v4l2-tpg.h and v4l2-tpg-colors.h moved
+from v4l2-ctl to common.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
+
+diff --git a/utils/qv4l2/qv4l2.pro b/utils/qv4l2/qv4l2.pro
+index 02b03de..6420fa2 100644
+--- a/utils/qv4l2/qv4l2.pro
++++ b/utils/qv4l2/qv4l2.pro
+@@ -13,6 +13,7 @@ greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
+ QT += opengl
+ 
+ INCLUDEPATH += $$PWD/../..
++INCLUDEPATH += $$PWD/../common
+ INCLUDEPATH += $$PWD/../v4l2-ctl/
+ INCLUDEPATH += $$PWD/../v4l2-compliance
+ 
+@@ -25,8 +26,8 @@ HEADERS += general-tab.h
+ HEADERS += qv4l2.h
+ HEADERS += raw2sliced.h
+ HEADERS += vbi-tab.h
+-HEADERS += ../v4l2-ctl/v4l2-tpg.h
+-HEADERS += ../v4l2-ctl/v4l2-tpg-colors.h
++HEADERS += ../common/v4l2-tpg.h
++HEADERS += ../common/v4l2-tpg-colors.h
+ HEADERS += ../../config.h
+ 
+ SOURCES += capture-win.cpp
+-- 
+cgit v0.10.2
+
-- 
2.14.1
