From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Nov 2017 19:56:36 +0100
Subject: [Buildroot] [PATCH v1] qt5declarative: for latest fix examples
 compile without OpenGL support
Message-ID: <20171119185636.3918-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix examples compile without OpenGL support.

Fixes [1]:

  In file included from fbitem.h:49:0,
                   from mainwindow.cpp:42:
  logo.h:52:11: error: 'GLfloat' does not name a type
       const GLfloat *constData() const { return m_data.constData(); }
             ^
  logo.h:57:15: error: 'GLfloat' has not been declared
       void quad(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2, GLfloat x3, GLfloat y3, GLfloat x4, GLfloat y4);
                 ^
  [...]
  Makefile:610: recipe for target '.obj/mainwindow.o' failed
  make[5]: *** [.obj/mainwindow.o] Error 1
  make[5]: Leaving directory '.../build/qt5declarative-5.9.2/examples/quick/quickwidgets/qquickviewcomparison'
  Makefile:70: recipe for target 'sub-qquickviewcomparison-make_first' failed
  make[4]: *** [sub-qquickviewcomparison-make_first] Error 2
  make[4]: *** Waiting for unfinished jobs....

[1] http://autobuild.buildroot.net/results/cef4abbe043f3aaad03c73e07cfab9d24c3d0fc9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
In principle the same patch as
qt5declarative/5.6.3/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch
(which was moved to the LTS branch only in commit 64f4f6de0c0134b6d81645e8526bde73695ab85e
'qt5: bump latest version to 5.9.2' by accident) but the upstream provided version.

And the same upstream patch as provided by Joshua Henderson as part of the patch '[PATCH v5]
qt5: remove Qt Quick dependency on opengl' [2].

[2] http://lists.busybox.net/pipermail/buildroot/2017-November/206088.html
---
 .../5.9.2/0001-Fix-no-opengl-builds.patch          | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch

diff --git a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
new file mode 100644
index 0000000000..8406ace9a3
--- /dev/null
+++ b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
@@ -0,0 +1,32 @@
+From 66429b5f6986bde1f491699216f095c5e25023cf Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Date: Mon, 25 Sep 2017 16:53:24 +0200
+Subject: [PATCH] Fix no-opengl builds
+
+The qquickwidgets examples uses OpenGL directly
+
+Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
+Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
+
+Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/patch/?id=fa52bb665d6beb77a951c14c8edcba3541850afc
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/quick/quick.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/quick/quick.pro b/examples/quick/quick.pro
+index 445dfb0f..7da255e9 100644
+--- a/examples/quick/quick.pro
++++ b/examples/quick/quick.pro
+@@ -36,7 +36,7 @@ qtConfig(opengl(es1|es2)?) {
+ # Widget dependent examples
+ qtHaveModule(widgets) {
+     SUBDIRS += embeddedinwidgets
+-    qtHaveModule(quickwidgets): SUBDIRS += quickwidgets
++    qtHaveModule(quickwidgets):qtConfig(opengl(es1|es2)?): SUBDIRS += quickwidgets
+ }
+ 
+ EXAMPLE_FILES = \
+-- 
+2.15.0
+
-- 
2.15.0
