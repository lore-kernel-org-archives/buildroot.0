From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 22:53:06 +0200
Subject: [Buildroot] [git commit] qt5base: fix build when egl headers need a
	definition
Message-ID: <20131002214311.B51839B914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f21eefbe98c8c1f367aebbe013ebe549a5a9fe2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build with gpu-viv-bin-mx6q libraries was broken since it wasn't
using "-DEGL_API_FB=1" flag which is found in egl.pc.

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base-0004-egl-cflags.patch |   28 +++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0004-egl-cflags.patch b/package/qt5/qt5base/qt5base-0004-egl-cflags.patch
new file mode 100644
index 0000000..bff82a8
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0004-egl-cflags.patch
@@ -0,0 +1,28 @@
+egl.prf: Append egl CFLAGS to QMAKE_C[XX]FLAGS
+
+Projects including egl in their config (e.g. with CONFIG += egl) cannot get
+egl CFLAGS without this.
+
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+
+--- a/configure
++++ b/configure
+@@ -4934,6 +4934,7 @@
+         QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
+         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
+         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
++        QMakeVar set QMAKE_CFLAGS_EGL "$QMAKE_CFLAGS_EGL"
+     fi       # detect EGL support
+     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
+         CFG_EGL=yes
+--- a/mkspecs/features/egl.prf
++++ b/mkspecs/features/egl.prf
+@@ -14,6 +14,8 @@
+ } else {
+     INCLUDEPATH += $$QMAKE_INCDIR_EGL
+     LIBS_PRIVATE += $$QMAKE_LIBS_EGL
++    QMAKE_CFLAGS += $$QMAKE_CFLAGS_EGL
++    QMAKE_CXXFLAGS += $$QMAKE_CFLAGS_EGL
+     LIBS += $$QMAKE_LFLAGS_EGL
+     for(p, QMAKE_LIBDIR_EGL) {
+         exists($$p):LIBS_PRIVATE += -L$$p
