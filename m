From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 Jul 2017 02:55:30 +0300
Subject: [Buildroot] [PATCH 3/4] webkitgtk: Add patch to allow Wayland-only
	builds
In-Reply-To: <20170712235531.20444-1-aperez@igalia.com>
References: <20170712235531.20444-1-aperez@igalia.com>
Message-ID: <20170712235531.20444-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The added patch allows building WebKitGTK+ with Wayland support enabled,
and with X11/X.org support disabled. Without this the code includes the
X11 headers, which are not available in this case. The patch has to be
adapted from the one attached in the corresponding upstream bug report,
as it would not apply on top of the 2.16.5 sources.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../webkitgtk/0003-angle-egl-wayland-support.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/webkitgtk/0003-angle-egl-wayland-support.patch

diff --git a/package/webkitgtk/0003-angle-egl-wayland-support.patch b/package/webkitgtk/0003-angle-egl-wayland-support.patch
new file mode 100644
index 0000000000..4461e4390a
--- /dev/null
+++ b/package/webkitgtk/0003-angle-egl-wayland-support.patch
@@ -0,0 +1,45 @@
+eglplatform.h does not support Wayland
+
+Upstream, adapted from https://bugs.webkit.org/show_bug.cgi?id=163482
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+--- a/Source/ThirdParty/ANGLE/include/EGL/eglplatform.h	2017-07-12 13:26:36.222193809 +0300
++++ b/Source/ThirdParty/ANGLE/include/EGL/eglplatform.h	2017-07-12 13:30:04.071741009 +0300
+@@ -89,6 +89,12 @@ typedef int   EGLNativeDisplayType;
+ typedef void *EGLNativeWindowType;
+ typedef void *EGLNativePixmapType;
+ 
++#elif defined(WL_EGL_PLATFORM)
++
++typedef struct wl_display    *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap *EGLNativePixmapType;
++typedef struct wl_egl_window *EGLNativeWindowType;
++
+ #elif defined(__ANDROID__) || defined(ANDROID)
+ 
+ #include <android/native_window.h>
+@@ -107,6 +113,8 @@ typedef intptr_t EGLNativePixmapType;
+ 
+ #elif defined(__unix__)
+ 
++#if defined(ANGLE_USE_X11)
++
+ /* X11 (tentative)  */
+ #include <X11/Xlib.h>
+ #include <X11/Xutil.h>
+@@ -115,6 +123,14 @@ typedef Display *EGLNativeDisplayType;
+ typedef Pixmap   EGLNativePixmapType;
+ typedef Window   EGLNativeWindowType;
+ 
++#else
++
++typedef void             *EGLNativeDisplayType;
++typedef khronos_uintptr_t EGLNativePixmapType;
++typedef khronos_uintptr_t EGLNativeWindowType;
++
++#endif /* ANGLE_USE_X11 */
++
+ #elif defined(__GNUC__) && ( defined(__APPLE_CPP__) || defined(__APPLE_CC__) || defined(__MACOS_CLASSIC__) )
+ 
+ #if defined(__OBJC__)
-- 
2.13.2
