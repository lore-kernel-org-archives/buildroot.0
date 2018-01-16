From: Guillermo A. Amaral <g@maral.me>
Date: Mon, 15 Jan 2018 19:34:49 -0800
Subject: [Buildroot] [PATCH 1/2] package/sdl2: Fix Raspberry Pi support for
 SDL2
Message-ID: <20180116033450.6926-1-g@maral.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tweak build system to play well with Buildroot.

Signed-off-by: Guillermo A. Amaral <g@maral.me>
---
 .../sdl2/0001-sdl2-rpi-video-buildroot-fix.patch   | 90 ++++++++++++++++++++++
 package/sdl2/sdl2.mk                               |  8 +-
 2 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch

diff --git a/package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch b/package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch
new file mode 100644
index 000000000..1866579f1
--- /dev/null
+++ b/package/sdl2/0001-sdl2-rpi-video-buildroot-fix.patch
@@ -0,0 +1,90 @@
+From 76cb63afbe53c984c9734dc4f034c670791ca4d2 Mon Sep 17 00:00:00 2001
+From: "Guillermo A. Amaral" <g@maral.me>
+Date: Sun, 14 Jan 2018 23:01:47 -0800
+Subject: [PATCH] sdl2: Get Raspberry Pi video working on Buildroot
+
+Signed-off-by: Guillermo A. Amaral <g@maral.me>
+---
+ configure           |  8 +++++++-
+ configure.in        |  8 +++++++-
+ src/video/SDL_egl.c | 12 ++++++------
+ 3 files changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/configure b/configure
+index b622085..36e6623 100755
+--- a/configure
++++ b/configure
+@@ -19488,6 +19488,9 @@ fi
+         if test x$ARCH = xnetbsd; then
+             RPI_CFLAGS="-I/usr/pkg/include -I/usr/pkg/include/interface/vcos/pthreads -I/usr/pkg/include/interface/vmcs_host/linux"
+             RPI_LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib -lbcm_host"
++        elif test x$VENDOR = xbuildroot; then
++            RPI_CFLAGS="-I${STAGING_DIR}/usr/include/interface/vcos/pthreads -I${STAGING_DIR}/usr/include/interface/vmcs_host/linux"
++            RPI_LDFLAGS="-L${STAGING_DIR}/usr/lib -lbcm_host -lvchostif"
+         else
+             RPI_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
+             RPI_LDFLAGS="-L/opt/vc/lib -lbcm_host"
+@@ -23739,7 +23742,10 @@ case "$host" in
+                     SUMMARY_video="${SUMMARY_video} android"
+                 fi
+                 ;;
+-            *-*-linux*)         ARCH=linux ;;
++            *-*-linux*)
++                ARCH=linux
++                VENDOR=buildroot
++                ;;
+             *-*-uclinux*)       ARCH=linux ;;
+             *-*-kfreebsd*-gnu)  ARCH=kfreebsd-gnu ;;
+             *-*-knetbsd*-gnu)   ARCH=knetbsd-gnu ;;
+diff --git a/configure.in b/configure.in
+index 5ac2130..daee88b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1566,6 +1566,9 @@ AC_HELP_STRING([--enable-video-rpi], [use Raspberry Pi video driver [[default=ye
+         if test x$ARCH = xnetbsd; then
+             RPI_CFLAGS="-I/usr/pkg/include -I/usr/pkg/include/interface/vcos/pthreads -I/usr/pkg/include/interface/vmcs_host/linux"
+             RPI_LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib -lbcm_host"
++        elif test x$VENDOR = xbuildroot; then
++            RPI_CFLAGS="-I${STAGING_DIR}/usr/include/interface/vcos/pthreads -I${STAGING_DIR}/usr/include/interface/vmcs_host/linux"
++            RPI_LDFLAGS="-L${STAGING_DIR}/usr/lib -lbcm_host -lvchostif"
+         else
+             RPI_CFLAGS="-I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux"
+             RPI_LDFLAGS="-L/opt/vc/lib -lbcm_host"
+@@ -3260,7 +3263,10 @@ case "$host" in
+                     SUMMARY_video="${SUMMARY_video} android"
+                 fi
+                 ;;
+-            *-*-linux*)         ARCH=linux ;;
++            *-*-linux*)
++                ARCH=linux
++                VENDOR=buildroot
++                ;;
+             *-*-uclinux*)       ARCH=linux ;;
+             *-*-kfreebsd*-gnu)  ARCH=kfreebsd-gnu ;;
+             *-*-knetbsd*-gnu)   ARCH=knetbsd-gnu ;;
+diff --git a/src/video/SDL_egl.c b/src/video/SDL_egl.c
+index 9ccc2c3..23a7f2d 100644
+--- a/src/video/SDL_egl.c
++++ b/src/video/SDL_egl.c
+@@ -44,12 +44,12 @@
+ 
+ #if SDL_VIDEO_DRIVER_RPI
+ /* Raspbian places the OpenGL ES/EGL binaries in a non standard path */
+-#define DEFAULT_EGL "/opt/vc/lib/libbrcmEGL.so"
+-#define DEFAULT_OGL_ES2 "/opt/vc/lib/libbrcmGLESv2.so"
+-#define ALT_EGL "/opt/vc/lib/libEGL.so"
+-#define ALT_OGL_ES2 "/opt/vc/lib/libGLESv2.so"
+-#define DEFAULT_OGL_ES_PVR "/opt/vc/lib/libGLES_CM.so"
+-#define DEFAULT_OGL_ES "/opt/vc/lib/libGLESv1_CM.so"
++#define DEFAULT_EGL "libbrcmEGL.so"
++#define DEFAULT_OGL_ES2 "libbrcmGLESv2.so"
++#define ALT_EGL "libEGL.so"
++#define ALT_OGL_ES2 "libGLESv2.so"
++#define DEFAULT_OGL_ES_PVR "libGLES_CM.so"
++#define DEFAULT_OGL_ES "libGLESv1_CM.so"
+ 
+ #elif SDL_VIDEO_DRIVER_ANDROID || SDL_VIDEO_DRIVER_VIVANTE
+ /* Android */
+-- 
+2.13.6
+
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 3e3ba54aa..113e1063d 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -19,7 +19,6 @@ SDL2_CONF_OPTS += \
 	--disable-dbus \
 	--disable-pulseaudio \
 	--disable-video-wayland \
-	--disable-video-rpi
 
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
@@ -39,6 +38,13 @@ else
 SDL2_CONF_OPTS += --disable-video-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+SDL2_DEPENDENCIES += rpi-userland
+SDL2_CONF_OPTS += --enable-video-rpi
+else
+SDL2_CONF_OPTS += --disable-video-rpi
+endif
+
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
 # (/usr/X11R6/include and /usr/X11R6/lib)
-- 
2.13.6
