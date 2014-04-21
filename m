From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:17:28 +0200
Subject: [Buildroot] [git commit] qt5base: fix no-opengl build with egl
Message-ID: <20140421202323.1327D9C96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=467122e64a5bf6e925deba447e97170a554744df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/8ed/8eddd934bd80fdbcdf7a9dbf5d9f8b7ba69634d4/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...qt5base-0007-Fix-no-opengl-build-with-egl.patch |   65 ++++++++++++++++++++
 1 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch b/package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch
new file mode 100644
index 0000000..c0f03d5
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0007-Fix-no-opengl-build-with-egl.patch
@@ -0,0 +1,65 @@
+From cd14b80dd87ff9ae632bf0479a1d824c72316362 Mon Sep 17 00:00:00 2001
+From: Laszlo Agocs <laszlo.agocs@digia.com>
+Date: Wed, 12 Mar 2014 16:56:19 +0100
+Subject: [PATCH] Fix no-opengl build with egl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Disable eglfs and similar plugins when opengl is not enabled.
+(but egl is present)
+
+GL-dependent parts of eglconvenience need to be skipped too.
+
+Task-number: QTBUG-37457
+Change-Id: I44d49495241551bc7b1f565aa0b5ace9f310628e
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+Reviewed-by: J??rgen Lind <jorgen.lind@digia.com>
+Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
+
+Conflicts:
+	src/platformsupport/eglconvenience/eglconvenience.pri
+---
+ configure                                             | 2 +-
+ src/platformsupport/eglconvenience/eglconvenience.pri | 7 +++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index aaa59bd..0c310ff 100755
+--- a/configure
++++ b/configure
+@@ -5337,7 +5337,7 @@ if [ "$CFG_EGL" != "no" ]; then
+ fi
+ 
+ if [ "$CFG_EGLFS" != "no" ]; then
+-    if [ "$XPLATFORM_QNX" = "no" ]; then
++    if [ "$XPLATFORM_QNX" = "no" ] && [ "$CFG_OPENGL" != "no" ]; then
+         CFG_EGLFS="$CFG_EGL"
+     else
+         CFG_EGLFS="no"
+diff --git a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
+index 506f4ab..462c60c 100644
+--- a/src/platformsupport/eglconvenience/eglconvenience.pri
++++ b/src/platformsupport/eglconvenience/eglconvenience.pri
+@@ -1,13 +1,16 @@
+ contains(QT_CONFIG,egl) {
+     HEADERS += \
+         $$PWD/qeglconvenience_p.h \
+-        $$PWD/qeglplatformcontext_p.h \
+         $$PWD/qeglpbuffer_p.h
+     SOURCES += \
+         $$PWD/qeglconvenience.cpp \
+-        $$PWD/qeglplatformcontext.cpp \
+         $$PWD/qeglpbuffer.cpp
+ 
++    contains(QT_CONFIG,opengl) {
++        HEADERS += $$PWD/qeglplatformcontext_p.h
++        SOURCES += $$PWD/qeglplatformcontext.cpp
++    }
++
+     contains(QT_CONFIG,xlib) {
+         HEADERS += \
+             $$PWD/qxlibeglintegration_p.h
+-- 
+1.9.1
+
