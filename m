From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 30 Apr 2015 17:12:23 +0200
Subject: [Buildroot] [PATCH v7 08/13] qt5base: fix compilation with Vivante
	headers.
In-Reply-To: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
Message-ID: <1430406748-8493-9-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/qt5/qt5base/0004-xcb-egl-fixes.patch | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/qt5/qt5base/0004-xcb-egl-fixes.patch

diff --git a/package/qt5/qt5base/0004-xcb-egl-fixes.patch b/package/qt5/qt5base/0004-xcb-egl-fixes.patch
new file mode 100644
index 0000000..2bbd849
--- /dev/null
+++ b/package/qt5/qt5base/0004-xcb-egl-fixes.patch
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
1.9.1
