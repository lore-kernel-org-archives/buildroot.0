From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:31 +0200
Subject: [Buildroot] [PATCH 10/11] qt5base: fix Vivante x11/EGL configuration
In-Reply-To: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
Message-ID: <1412340212-3089-11-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix compilation with Vivante headers and bug at runtime.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../qt5base-0001-Force_egl_visual_ID_33.patch      | 23 ++++++++
 .../qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch   | 63 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 package/qt5/qt5base/qt5base-0001-Force_egl_visual_ID_33.patch
 create mode 100644 package/qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch

diff --git a/package/qt5/qt5base/qt5base-0001-Force_egl_visual_ID_33.patch b/package/qt5/qt5base/qt5base-0001-Force_egl_visual_ID_33.patch
new file mode 100644
index 0000000..b0be292
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0001-Force_egl_visual_ID_33.patch
@@ -0,0 +1,23 @@
+Workaround EGL initialization failure due visual mismatch
+
+Error:
+
+Warning: EGL suggested using X Visual ID 33 (RGB888) for EGL config 28 (RGB444), but this is incompatable
+Unable to find an X11 visual which matches EGL config 28
+Could not initialize EGL
+Aborted
+
+Upstream-Status: Inappropriate [workaround]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff -Naur qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp
+--- qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:08:42.163895341 -0800
++++ qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:09:37.207893799 -0800
+@@ -180,5 +180,5 @@
+     }
+ 
+     qWarning("Unable to find an X11 visual which matches EGL config %d", configId);
+-    return (VisualID)0;
++    return (VisualID)33;
+ }
diff --git a/package/qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch b/package/qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch
new file mode 100644
index 0000000..2bbd849
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0004-xcb-egl-fixes.patch
@@ -0,0 +1,63 @@
+The vivante headers pull in X11 defines which break eglconvenience
+
+* Adds a missing include to qeglplatformcontext.cpp
+* Fix namespace collision on CursorShape, pulled in from X11/X.h
+* Do not pass MESA_EGL_NO_X11_HEADERS when xcb is use
+
+[based on patch from Yocto project]
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+
+
+diff -Nuar a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
+--- a/src/platformsupport/eglconvenience/eglconvenience.pri	2014-08-07 16:53:50.038277168 -0400
++++ b/src/platformsupport/eglconvenience/eglconvenience.pri	2014-08-07 16:54:52.874278651 -0400
+@@ -30,8 +30,10 @@
+         }
+     }
+ 
+-    # Avoid X11 header collision
+-    DEFINES += MESA_EGL_NO_X11_HEADERS
++    !contains(QT_CONFIG,xcb) {
++        # Avoid X11 header collision
++        DEFINES += MESA_EGL_NO_X11_HEADERS
++    }
+ 
+     contains(QT_CONFIG,xlib) {
+         HEADERS += \
+diff -Nuar a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+--- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp	2014-08-07 16:53:50.038277168 -0400
++++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp	2014-08-07 16:56:00.630280249 -0400
+@@ -39,6 +39,7 @@
+ **
+ ****************************************************************************/
+ 
++#include <qtextstream.h>
+ #include "qeglplatformcontext_p.h"
+ #include "qeglconvenience_p.h"
+ #include "qeglpbuffer_p.h"
+--- a/src/platformsupport/eglconvenience/qeglplatformcursor_p.h	2014-08-07 16:53:50.038277168 -0400
++++ b/src/platformsupport/eglconvenience/qeglplatformcursor_p.h	2014-08-07 16:58:49.014284222 -0400
+@@ -42,6 +42,11 @@
+ #ifndef QEGLPLATFORMCURSOR_H
+ #define QEGLPLATFORMCURSOR_H
+ 
++// avoid namespace collision with X11/X.h
++#ifdef CursorShape
++#undef CursorShape
++#endif
++
+ #include <qpa/qplatformcursor.h>
+ #include <qpa/qplatformscreen.h>
+ 
+--- a/src/platformsupport/eglconvenience/qeglplatformcursor.cpp	2014-08-07 16:53:50.038277168 -0400
++++ b/src/platformsupport/eglconvenience/qeglplatformcursor.cpp	2014-08-07 17:00:36.806286766 -0400
+@@ -49,8 +49,8 @@
+ 
+ #include <QtPlatformSupport/private/qdevicediscovery_p.h>
+ 
+-#include "qeglplatformcursor_p.h"
+ #include "qeglplatformintegration_p.h"
++#include "qeglplatformcursor_p.h"
+ 
+ QT_BEGIN_NAMESPACE
+ 
-- 
2.1.0
