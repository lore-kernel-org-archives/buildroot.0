From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 19 May 2018 07:39:12 +0200
Subject: [Buildroot] [PATCH v1] qt5wayland: fix
 hardwareintegration/client/xcomposite-egl compile
Message-ID: <20180519053912.8296-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch, fixes [1]:

  ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp: In member function 'void QtWaylandClient::QWaylandXCompositeEGLWindow::createEglSurface()':
  ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp:124:82: error: invalid conversion from 'Window {aka long unsigned int}' to 'EGLNativeWindowType {aka void*}' [-fpermissive]
       m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, m_xWindow,0);
                                                                                    ^~~~~~~~~
  In file included from ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglclientbufferintegration.h:57:0,
                   from ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.h:46,
                   from ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp:40:
  .../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/EGL/egl.h:265:31: note:   initializing argument 3 of 'void* eglCreateWindowSurface(EGLDisplay, EGLConfig, EGLNativeWindowType, const EGLint*)'
 EGLAPI EGLSurface EGLAPIENTRY eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config,

[1] http://autobuild.buildroot.net/results/9bcc76ed9e23c0d525f20b4da7f3bb5efe3083d4

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...0001-Fix-compilation-for-Renesas-R-Car-M3.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/qt5/qt5wayland/5.10.1/0001-Fix-compilation-for-Renesas-R-Car-M3.patch

diff --git a/package/qt5/qt5wayland/5.10.1/0001-Fix-compilation-for-Renesas-R-Car-M3.patch b/package/qt5/qt5wayland/5.10.1/0001-Fix-compilation-for-Renesas-R-Car-M3.patch
new file mode 100644
index 0000000000..df09d4f382
--- /dev/null
+++ b/package/qt5/qt5wayland/5.10.1/0001-Fix-compilation-for-Renesas-R-Car-M3.patch
@@ -0,0 +1,44 @@
+From 1619f8bcdd1680c9557996b4977580090a749037 Mon Sep 17 00:00:00 2001
+From: Johan Klokkhammer Helsing <johan.helsing@qt.io>
+Date: Thu, 9 Feb 2017 12:53:56 +0100
+Subject: [PATCH] Fix compilation for Renesas R-Car M3
+
+Change-Id: Ib85001884bb880a18d8aa1241da0eb614a6b58ba
+Reviewed-by: Paul Olav Tvete <paul.tvete@qt.io>
+
+Upstream: http://code.qt.io/cgit/qt/qtwayland.git/patch/?id=8b204b2c56be5e7c1fd21144ae140c9b865dd86b
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp               | 2 +-
+ .../compositor/xcomposite-egl/xcompositeeglintegration.cpp              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp
+index 431cb14..9c3dee3 100644
+--- a/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp
++++ b/src/hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp
+@@ -121,7 +121,7 @@ void QWaylandXCompositeEGLWindow::createEglSurface()
+     XCompositeRedirectWindow(m_glxIntegration->xDisplay(), m_xWindow, CompositeRedirectManual);
+     XMapWindow(m_glxIntegration->xDisplay(), m_xWindow);
+ 
+-    m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, m_xWindow,0);
++    m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, reinterpret_cast<EGLNativeWindowType>(m_xWindow), nullptr);
+     if (m_surface == EGL_NO_SURFACE) {
+         qFatal("Could not make eglsurface");
+     }
+diff --git a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp
+index 3cc0ba0..071b088 100644
+--- a/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp
++++ b/src/hardwareintegration/compositor/xcomposite-egl/xcompositeeglintegration.cpp
+@@ -129,7 +129,7 @@ QOpenGLTexture *XCompositeEglClientBuffer::toOpenGlTexture(int plane)
+     attribList.append(EGL_TEXTURE_2D);
+     attribList.append(EGL_NONE);
+ 
+-    EGLSurface surface = eglCreatePixmapSurface(m_integration->eglDisplay(),config,pixmap,attribList.constData());
++    EGLSurface surface = eglCreatePixmapSurface(m_integration->eglDisplay(), config, reinterpret_cast<EGLNativePixmapType>(pixmap), attribList.constData());
+     if (surface == EGL_NO_SURFACE) {
+         qDebug() << "Failed to create eglsurface" << pixmap << compositorBuffer->window();
+     }
+-- 
+2.16.3
+
-- 
2.16.3
