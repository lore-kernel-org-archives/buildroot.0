From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:23:25 +0100
Subject: [Buildroot] [git commit] package/weston: fix build on ancient
	Khronos headers
Message-ID: <20170116124620.F11FA8179D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f162c84a017c8f2411d6cb41f3abed8f471f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport two patches from upstream, to build against ancient headers
and when EGL is not available.

Fixes:
    http://autobuild.buildroot.net/results/2de/2dea0a1b82c535fded6fd67a69496d70e6bcca56
    http://autobuild.buildroot.org/results/112/1125199749455e349d8eb87ca86c778763aae489

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nclude-weston-egl-ext.h-in-drm-x11-and-wa.patch | 58 ++++++++++++++++++++++
 ...ix-building-issue-when-EGL-support-is-not.patch | 47 ++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/package/weston/0004-libweston-include-weston-egl-ext.h-in-drm-x11-and-wa.patch b/package/weston/0004-libweston-include-weston-egl-ext.h-in-drm-x11-and-wa.patch
new file mode 100644
index 0000000..9012f5f
--- /dev/null
+++ b/package/weston/0004-libweston-include-weston-egl-ext.h-in-drm-x11-and-wa.patch
@@ -0,0 +1,58 @@
+From c950667e87dc175bd2741a51460ebd3e29a57c92 Mon Sep 17 00:00:00 2001
+From: Vincent Abriou <vincent.abriou@st.com>
+Date: Wed, 5 Oct 2016 16:14:07 +0200
+Subject: [PATCH] libweston: include weston-egl-ext.h in drm, x11 and wayland
+ compositor
+
+As to what is done for gl-renderer.c, weston-egl-ext.h should be
+include in compositor-drm.c, compositor-x11.c and compositor-wayland.c.
+This fix building issue with GPU that does not have EGL_PLATFORM_xxx_KHR
+in their extension header file eglext.h.
+
+Signed-off-by: Vincent Abriou <vincent.abriou@st.com>
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+---
+ libweston/compositor-drm.c     | 1 +
+ libweston/compositor-wayland.c | 1 +
+ libweston/compositor-x11.c     | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index 567240f..f61e3d9 100644
+--- a/libweston/compositor-drm.c
++++ b/libweston/compositor-drm.c
+@@ -52,6 +52,7 @@
+ #include "shared/helpers.h"
+ #include "shared/timespec-util.h"
+ #include "gl-renderer.h"
++#include "weston-egl-ext.h"
+ #include "pixman-renderer.h"
+ #include "libbacklight.h"
+ #include "libinput-seat.h"
+diff --git a/libweston/compositor-wayland.c b/libweston/compositor-wayland.c
+index 580c7b5..46fdde1 100644
+--- a/libweston/compositor-wayland.c
++++ b/libweston/compositor-wayland.c
+@@ -44,6 +44,7 @@
+ #include "compositor.h"
+ #include "compositor-wayland.h"
+ #include "gl-renderer.h"
++#include "weston-egl-ext.h"
+ #include "pixman-renderer.h"
+ #include "shared/helpers.h"
+ #include "shared/image-loader.h"
+diff --git a/libweston/compositor-x11.c b/libweston/compositor-x11.c
+index dadcd10..1c6de08 100644
+--- a/libweston/compositor-x11.c
++++ b/libweston/compositor-x11.c
+@@ -56,6 +56,7 @@
+ #include "shared/helpers.h"
+ #include "shared/image-loader.h"
+ #include "gl-renderer.h"
++#include "weston-egl-ext.h"
+ #include "pixman-renderer.h"
+ #include "presentation-time-server-protocol.h"
+ #include "linux-dmabuf.h"
+-- 
+2.7.4
+
diff --git a/package/weston/0005-libweston-fix-building-issue-when-EGL-support-is-not.patch b/package/weston/0005-libweston-fix-building-issue-when-EGL-support-is-not.patch
new file mode 100644
index 0000000..6a5b192
--- /dev/null
+++ b/package/weston/0005-libweston-fix-building-issue-when-EGL-support-is-not.patch
@@ -0,0 +1,47 @@
+From 7327d5a7a29ad31af871e144ebe053cb1ab478f7 Mon Sep 17 00:00:00 2001
+From: Vincent Abriou <vincent.abriou@st.com>
+Date: Tue, 11 Oct 2016 13:47:03 +0200
+Subject: [PATCH] libweston: fix building issue when EGL support is not enabled
+
+weston-egl-ext.h has been include in compositor-xx.c file in order to
+define EGL_PLATFORM_xxx_KHR extensions used by the compositors.
+But in case EGL support is not enabled, all EGL related definition must
+be skipped except EGL_PLATFORM_xxx_KHR that must be still defined to
+allow compositor-xx.c to build.
+
+Signed-off-by: Vincent Abriou <vincent.abriou@st.com>
+Reviewed-by: Giulio Camuffo <giuliocamuffo@gmail.com>
+---
+ libweston/weston-egl-ext.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libweston/weston-egl-ext.h b/libweston/weston-egl-ext.h
+index 6e36996..70556fd 100644
+--- a/libweston/weston-egl-ext.h
++++ b/libweston/weston-egl-ext.h
+@@ -28,6 +28,8 @@
+ #ifndef WESTON_EGL_EXT_H
+ #define WESTON_EGL_EXT_H
+ 
++#ifdef ENABLE_EGL
++
+ #ifndef EGL_WL_bind_wayland_display
+ #define EGL_WL_bind_wayland_display 1
+ 
+@@ -152,5 +154,13 @@ typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMPIXMAPSURFACEEXTPROC) (EGLD
+ #define EGL_PLATFORM_X11_KHR 0x31D5
+ #endif
+ 
++#else /* ENABLE_EGL */
++
++/* EGL platform definition are keept to allow compositor-xx.c to build */
++#define EGL_PLATFORM_GBM_KHR     0x31D7
++#define EGL_PLATFORM_WAYLAND_KHR 0x31D8
++#define EGL_PLATFORM_X11_KHR     0x31D5
++
++#endif /* ENABLE_EGL */
+ 
+ #endif
+-- 
+2.7.4
+
