From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:09:14 +0200
Subject: [Buildroot] [git commit branch/next] qt5base: fix examples compile
	without opengl support
Message-ID: <20170809225749.0AED980124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d29f050d548d9c5b6ef6002104e9341219c4356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes [1]:

  make[1]: Entering directory '.../build/qt5base-5.9.1/examples/opengl'
  cd hellowindow/ && ( test -e Makefile || .../build/qt5base-5.9.1/bin/qmake -o Makefile .../build/qt5base-5.9.1/examples/opengl/hellowindow/hellowindow.pro ) && make -f Makefile
  make[2]: Entering directory '.../build/qt5base-5.9.1/examples/opengl/hellowindow'
  .../host/bin/sparc-linux-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=.../host/sparc-buildroot-linux-uclibc/sysroot -O2 -O3 -fno-exceptions -Wall -W -D_REENTRANT -fPIC -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -I. -I../../../include/QtGui/5.9.1 -I../../../include/QtGui/5.9.1/QtGui -I../../../include -I../../../include/QtGui -I../../../include/QtCore/5.9.1 -I../../../include/QtCore/5.9.1/QtCore -I../../../include/QtCore -I.moc -I../../../mkspecs/devices/linux-buildroot-g++ -o .obj/hellowindow.o hellowindow.cpp
  In file included from hellowindow.cpp:51:0:
  hellowindow.h:96:5: error: ???QOpenGLShaderProgram??? does not name a type
       QOpenGLShaderProgram *m_program;
       ^~~~~~~~~~~~~~~~~~~~
  hellowindow.h:97:5: error: ???QOpenGLBuffer??? does not name a type
       QOpenGLBuffer m_vbo;
       ^~~~~~~~~~~~~
  hellowindow.cpp: In constructor ???Renderer::Renderer(const QSurfaceFormat&, Renderer*, QScreen*)???:
  hellowindow.cpp:62:40: error: invalid use of incomplete type ???class QOpenGLContext???
       m_context = new QOpenGLContext(this);
                                          ^
  In file included from ../../../include/QtGui/qsurfaceformat.h:1:0,
                   from ../../../include/QtGui/../../src/gui/kernel/qsurface.h:45,
                   from ../../../include/QtGui/qsurface.h:1,
                   from ../../../include/QtGui/../../src/gui/kernel/qwindow.h:51,
                   from ../../../include/QtGui/qwindow.h:1,
                   from ../../../include/QtGui/QWindow:1,
                   from hellowindow.h:51,
                   from hellowindow.cpp:51:

[1] http://autobuild.buildroot.net/results/001/001bc930014fca8c2a8b7a390350b4e1a15fa375/build-end.log

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...amples-fix-compile-without-opengl-support.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/qt5/qt5base/5.9.1/0002-examples-fix-compile-without-opengl-support.patch b/package/qt5/qt5base/5.9.1/0002-examples-fix-compile-without-opengl-support.patch
new file mode 100644
index 0000000..6735ab6
--- /dev/null
+++ b/package/qt5/qt5base/5.9.1/0002-examples-fix-compile-without-opengl-support.patch
@@ -0,0 +1,33 @@
+From adacb2d6701b12511c5a0e58072236da91ebf810 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 7 Aug 2017 22:54:11 +0200
+Subject: [PATCH] examples: fix compile without opengl support
+
+Compile examples/opengl only in case opengl support is available.
+
+Task-number: QTBUG-62372
+Change-Id: I742a1eb7b7639a5a722c4d5e9b4ee070b629b02e
+
+Upstream: https://codereview.qt-project.org/201947
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/examples.pro | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index a3851c6d81..d87fa2da88 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -14,7 +14,8 @@ qtHaveModule(concurrent): SUBDIRS += qtconcurrent
+ qtHaveModule(sql): SUBDIRS += sql
+ qtHaveModule(widgets): SUBDIRS += widgets
+ qtHaveModule(xml): SUBDIRS += xml
+-qtHaveModule(gui): SUBDIRS += gui opengl
++qtHaveModule(gui): SUBDIRS += gui
++qtHaveModule(gui):qtConfig(opengl): SUBDIRS += opengl
+ 
+ aggregate.files = aggregate/examples.pro
+ aggregate.path = $$[QT_INSTALL_EXAMPLES]
+-- 
+2.11.0
+
