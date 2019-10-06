From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 10:13:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine: Add two upstream
 patches to fix build errors
Message-ID: <20191006081351.6760-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build errors with this defconfig:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...1-Fix-build-with-recent-linux-kernel.patch |  52 ++++++
 ...2-Fix-detection-of-ozone-x11-support.patch | 164 ++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.12.4/0001-Fix-build-with-recent-linux-kernel.patch
 create mode 100644 package/qt5/qt5webengine/5.12.4/0002-Fix-detection-of-ozone-x11-support.patch

diff --git a/package/qt5/qt5webengine/5.12.4/0001-Fix-build-with-recent-linux-kernel.patch b/package/qt5/qt5webengine/5.12.4/0001-Fix-build-with-recent-linux-kernel.patch
new file mode 100644
index 0000000000..7cbe2aa505
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.4/0001-Fix-build-with-recent-linux-kernel.patch
@@ -0,0 +1,52 @@
+From 6e2562dd1efff2b96848e8ec166e8c233029d6cc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Emilio=20Cobos=20=C3=81lvarez?= <emilio@mozilla.com>
+Date: Wed, 29 May 2019 15:30:32 +0200
+Subject: Fix build with recent linux kernel.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recent kernel commit[1] moved a bit the define for this constant. This revealed
+a missing include in WebRTC.
+
+[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0768e17073dc5
+
+Bug: webrtc:10677
+Change-Id: I6ed69d307599d077760ae6ad74be10bfbdd1cac6
+Commit-Queue: Karl Wiberg <kwiberg@webrtc.org>
+Reviewed-by: Karl Wiberg <kwiberg@webrtc.org>
+Cr-Commit-Position: refs/heads/master@{#28108}
+See-Also: https://chromium.googlesource.com/external/webrtc/+/6806550d5d51a820104a12205d1f37ce0acebf19
+Reviewed-by: J?ri Valdmann <juri.valdmann@qt.io>
+(cherry picked from commit 74e69da92d0a895122ca65922b9a2b8b3926c882)
+Reviewed-by: Michal Klocek <michal.klocek@qt.io>
+
+Downloaded from upstream commit
+https://code.qt.io/cgit/qt/qtwebengine-chromium.git/commit/?id=6e2562dd1efff
+
+Upstream bug report: https://bugreports.qt.io/browse/QTBUG-76963
+
+[Bernd: Fixed path]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ chromium/third_party/webrtc/rtc_base/physicalsocketserver.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/chromium/third_party/webrtc/rtc_base/physicalsocketserver.cc b/chromium/third_party/webrtc/rtc_base/physicalsocketserver.cc
+index ca78499179a..e8c1474762f 100644
+--- a/src/3rdparty/chromium/third_party/webrtc/rtc_base/physicalsocketserver.cc
++++ b/src/3rdparty/chromium/third_party/webrtc/rtc_base/physicalsocketserver.cc
+@@ -52,6 +52,10 @@
+ #include "rtc_base/timeutils.h"
+ #include "rtc_base/win32socketinit.h"
+ 
++#if defined(WEBRTC_LINUX)
++#include <linux/sockios.h>
++#endif
++
+ #if defined(WEBRTC_WIN)
+ #define LAST_SYSTEM_ERROR (::GetLastError())
+ #elif defined(__native_client__) && __native_client__
+-- 
+cgit v1.2.1
+
diff --git a/package/qt5/qt5webengine/5.12.4/0002-Fix-detection-of-ozone-x11-support.patch b/package/qt5/qt5webengine/5.12.4/0002-Fix-detection-of-ozone-x11-support.patch
new file mode 100644
index 0000000000..a4f337219c
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.4/0002-Fix-detection-of-ozone-x11-support.patch
@@ -0,0 +1,164 @@
+From bb2a0bbd71019c44a38ba8608f8a7b3cd2106f7e Mon Sep 17 00:00:00 2001
+From: Michal Klocek <michal.klocek@qt.io>
+Date: Fri, 12 Jul 2019 11:17:40 +0200
+Subject: Fix detection of ozone x11 support
+
+Fixes: QTBUG-77011
+Change-Id: I0136b360c74970b912124f6f308f598c80eceba3
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Downloaded from upstream commit
+https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=bb2a0bbd71019c44a38ba8608f8a7b3cd2106f7e
+
+Upstream bug report: http://bugreports.qt.io/browse/QTBUG-77011
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ mkspecs/features/configure.prf        | 10 +++-------
+ mkspecs/features/functions.prf        |  8 --------
+ src/core/config/linux.pri             |  2 +-
+ src/core/configure.json               | 20 ++++++++++++++++++--
+ src/core/core_chromium.pri            |  2 +-
+ src/core/ozone/surface_factory_qt.cpp |  4 ++--
+ 6 files changed, 25 insertions(+), 21 deletions(-)
+
+diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
+index 42e5b40c..e407ede1 100644
+--- a/mkspecs/features/configure.prf
++++ b/mkspecs/features/configure.prf
+@@ -94,13 +94,9 @@ defineTest(runConfigure) {
+             }
+          }
+ 
+-        !qtConfig(webengine-embedded-build): qtConfig(xcb) {
+-             for(package, $$list("libdrm xcomposite xcursor xi xtst")) {
+-                 !qtConfig(webengine-system-$$package) {
+-                     skipBuild("A suitable version of $$package could not be found.")
+-                     return(false)
+-                 }
+-             }
++        !qtConfig(webengine-embedded-build): qtConfig(xcb) : !qtConfig(webengine-ozone-x11) {
++            skipBuild("Could not find all necessary libraries for qpa-xcb support")
++            return(false)
+         }
+     }
+ }
+diff --git a/mkspecs/features/functions.prf b/mkspecs/features/functions.prf
+index 9efa8958..d3eda85b 100644
+--- a/mkspecs/features/functions.prf
++++ b/mkspecs/features/functions.prf
+@@ -121,11 +121,3 @@ defineReplace(pkgConfigHostExecutable) {
+     return($$system_quote($$system_path($$wrapper_name)))
+ }
+ 
+-defineTest(hasX11Dependencies) {
+-    for(package, $$list("libdrm xcomposite xcursor xi xtst")) {
+-        !qtConfig(webengine-system-$$package) {
+-            return(false)
+-        }
+-    }
+-    return(true)
+-}
+diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
+index e7576423..eaecab3c 100644
+--- a/src/core/config/linux.pri
++++ b/src/core/config/linux.pri
+@@ -175,7 +175,7 @@ host_build {
+     }
+     !packagesExist(libpci): gn_args += use_libpci=false
+ 
+-    qtConfig(webengine-system-x11): hasX11Dependencies() {
++    qtConfig(webengine-ozone-x11) {
+         gn_args += ozone_platform_x11=true
+         packagesExist(xscrnsaver): gn_args += use_xscrnsaver=true
+     }
+diff --git a/src/core/configure.json b/src/core/configure.json
+index 6dccd164..9e4eb62a 100644
+--- a/src/core/configure.json
++++ b/src/core/configure.json
+@@ -642,6 +642,17 @@
+             "condition": "config.unix && libs.webengine-x11",
+             "output": [ "privateFeature" ]
+         },
++        "webengine-ozone-x11" : {
++             "label": "Support qpa-xcb",
++             "condition": "config.unix
++                          && features.webengine-system-x11
++                          && features.webengine-system-libdrm
++                          && features.webengine-system-xcomposite
++                          && features.webengine-system-xcursor
++                          && features.webengine-system-xi
++                          && features.webengine-system-xtst",
++             "output": [ "privateFeature" ]
++        },
+         "webengine-sanitizer" : {
+             "label": "Sanitizer",
+             "autoDetect": "config.sanitizer && tests.webengine-sanitizer",
+@@ -730,6 +741,11 @@
+                 "webengine-webchannel",
+                 "webengine-v8-snapshot",
+                 "webengine-kerberos",
++                {
++                    "type": "feature",
++                    "args": "webengine-ozone-x11",
++                    "condition": "config.unix"
++                },
+                 {
+                     "type": "feature",
+                     "args": "webengine-v8-snapshot-support",
+@@ -802,8 +818,7 @@
+                         "webengine-system-png",
+                         "webengine-system-jpeg",
+                         "webengine-system-harfbuzz",
+-                        "webengine-system-freetype",
+-                        "webengine-system-x11"
++                        "webengine-system-freetype"
+                     ]
+                 },
+                 {
+@@ -821,6 +836,7 @@
+                    "section": "Required system libraries for qpa-xcb",
+                    "condition": "config.unix && !config.macos",
+                    "entries": [
++                        "webengine-system-x11",
+                         "webengine-system-libdrm",
+                         "webengine-system-xcomposite",
+                         "webengine-system-xcursor",
+diff --git a/src/core/core_chromium.pri b/src/core/core_chromium.pri
+index 60eaf1f0..5566dbef 100644
+--- a/src/core/core_chromium.pri
++++ b/src/core/core_chromium.pri
+@@ -219,7 +219,7 @@ HEADERS = \
+         web_event_factory.h
+ 
+ 
+-qtConfig(webengine-system-x11): hasX11Dependencies() {
++qtConfig(webengine-ozone-x11) {
+     HEADERS += ozone/gl_ozone_glx_qt.h \
+                ozone/gl_surface_glx_qt.h
+     SOURCES += ozone/gl_surface_glx_qt.cpp \
+diff --git a/src/core/ozone/surface_factory_qt.cpp b/src/core/ozone/surface_factory_qt.cpp
+index 9570852c..f69520b7 100644
+--- a/src/core/ozone/surface_factory_qt.cpp
++++ b/src/core/ozone/surface_factory_qt.cpp
+@@ -41,7 +41,7 @@
+ #include "qtwebenginecoreglobal_p.h"
+ #include "gl_context_qt.h"
+ #include "gl_ozone_egl_qt.h"
+-#if QT_CONFIG(webengine_system_x11)
++#if QT_CONFIG(webengine_ozone_x11)
+ #include "gl_ozone_glx_qt.h"
+ #endif
+ 
+@@ -58,7 +58,7 @@ namespace QtWebEngineCore {
+ SurfaceFactoryQt::SurfaceFactoryQt()
+ {
+     Q_ASSERT(qApp);
+-#if QT_CONFIG(webengine_system_x11)
++#if QT_CONFIG(webengine_ozone_x11)
+     if (GLContextHelper::getGlXConfig()) {
+         m_impl = gl::kGLImplementationDesktopGL;
+         m_ozone.reset(new ui::GLOzoneGLXQt());
+-- 
+cgit v1.2.1
+
-- 
2.20.1
