From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 17:15:27 +0200
Subject: [Buildroot] [git commit] qt5base: Fix compile errors in qurl.h /
	qeglplatformscreen.cpp
Message-ID: <20151017151618.307E1819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2a4fb24591c398cbf3a7c8cbd8e05910eb681db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the already existing fix for EGL/X11 header issue to fix
an additional problem encountered on my system where I had
compile errors in qeglplatformscreen.cpp. The problem was related
to the wrong order of includes. The X11 headers must always be
included last, as indicated in
http://lists.qt-project.org/pipermail/development/2013-March/010511.html

The fix is done in the existing 0003-xcb-egl-fixes.patch patch, since
it is an additional fix for the same problem.

[Thomas: tweak commit log, and adjust SoB details as suggested by
Arnout.]

Signed-off-by: Marc Andre <marc.andre@netline.ch>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/0003-xcb-egl-fixes.patch |   22 ++++++++++++++++++++--
 1 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/0003-xcb-egl-fixes.patch b/package/qt5/qt5base/0003-xcb-egl-fixes.patch
index 53f8453..65d6f69 100644
--- a/package/qt5/qt5base/0003-xcb-egl-fixes.patch
+++ b/package/qt5/qt5base/0003-xcb-egl-fixes.patch
@@ -1,12 +1,15 @@
-The vivante headers pull in X11 defines which break eglconvenience
+Some EGL headers pull in X11 defines which break eglconvenience
 
 * Adds a missing include to qeglplatformcontext.cpp
 * Fix namespace collision on CursorShape, pulled in from X11/X.h
 * Do not pass MESA_EGL_NO_X11_HEADERS when xcb is use
+* Reorder includes to have the X11-header the last include
 
 [based on patch from Yocto project]
 Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
-
+Updated to fix issue in qeglplatformscreen (reorder includes, see also
+http://lists.qt-project.org/pipermail/development/2013-March/010511.html)
+Signed-off-by: Marc Andre <marc.andre@netline.ch>
 
 diff -Nuar a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
 --- a/src/platformsupport/eglconvenience/eglconvenience.pri	2014-08-07 16:53:50.038277168 -0400
@@ -61,4 +64,19 @@ diff -Nuar a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/pl
  #include "qeglplatformscreen_p.h"
  
  QT_BEGIN_NAMESPACE
+--- qtbase-opensource-src-5.5.0.orig/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:46:57.116883353 +0200
++++ qtbase-opensource-src-5.5.0/src/platformsupport/eglconvenience/qeglplatformscreen.cpp	2015-09-01 14:47:36.560882333 +0200
+@@ -31,11 +31,11 @@
+ **
+ ****************************************************************************/
+
+-#include "qeglplatformscreen_p.h"
+-#include "qeglplatformwindow_p.h"
+ #include <QtGui/qwindow.h>
+ #include <qpa/qwindowsysteminterface.h>
+ #include <QtPlatformSupport/private/qopenglcompositor_p.h>
++#include "qeglplatformscreen_p.h"
++#include "qeglplatformwindow_p.h"
+
+ QT_BEGIN_NAMESPACE
  
