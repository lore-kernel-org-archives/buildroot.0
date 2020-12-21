From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:48:56 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5base: fix
 build with TI SGX GL stack
Message-ID: <20201221124323.4D499815EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d5e23d20be2c14139676c3e33b29c4971ed88dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

qt5base FTBFS with TI SGX GL stack because it defines a type that is
incompatible with that expected by Qt.

Fix that by adapting a mix of upstream bug reports, upstream tentative
patch, and various comments on various Qt forums, none of which were
satisfying for various reasons explained in each resource:

  - https://bugreports.qt.io/browse/QTBUG-72567
  - https://codereview.qt-project.org/c/qt/qtbase/+/248270
  - https://forum.qt.io/topic/88588/qtbase-compilation-error-with-device-linux-rasp-pi3-g-qeglfskmsgbmwindow-cpp/8
  - https://forum.qt.io/topic/91596/raspberry-pi-3-compiling-qt-5-11-0-problem/6
  - https://patchwork.ozlabs.org/project/buildroot/patch/20200702201125.3639873-1-aduskett at gmail.com/#2579598

... which, mixed together with my little understanding of Qt, GL, and
C++, gave a relatively simple patch that overcomes the build failure on
TI's SGX, while at the same time keeping buildability and functionality
on other platforms.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Markus <zehnder@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cf7f3112f6a4d83a3802cb5bc1abf1a048541773)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d71fc330fe4e7c6a53fcd7a2bdb830360f0329e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...on-for-obscure-EGLNativeDisplayType-types.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch b/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
new file mode 100644
index 0000000000..3621cdb2d3
--- /dev/null
+++ b/package/qt5/qt5base/0005-eglfs-avoid-breaking-compilation-for-obscure-EGLNativeDisplayType-types.patch
@@ -0,0 +1,63 @@
+From 0eb7058b473069a04cde60a800dfd04148c0c8b1 Mon Sep 17 00:00:00 2001
+From: Yann E. MORIN <yann.morin.1998@free.fr>
+Date: Sat, 14 Dec 2020 21:15:17 +0100
+Subject: [PATCH] plugins/eglfs/gbm: don't FTBFS when EGLNativeDisplayType is not a pointer
+
+On some platforms, EGLNativeDisplayType is not a pointer, but some kind
+of integer, like an int (e.g. TI's SGX) or an unsigned int. In those
+cases, the build breaks with:
+
+    qeglfskmsgbmintegration.cpp: In member function ???virtual void* QEglFSKmsGbmIntegration::createDisplay(EGLNativeDisplayType)???:
+    qeglfskmsgbmintegration.cpp:83:60: error: invalid conversion from ???EGLNativeDisplayType??? {aka ???int???} to ???void*??? [-fpermissive]
+       83 |         display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
+          |                                                            ^~~~~~~~~~~~~
+          |                                                            |
+          |                                                            EGLNativeDisplayType {aka int}
+
+We fix that by casting nativeDisplay to void* as expected by
+getPlatformDisplay().
+
+We can do that, because usually, nativeDisplay is already a pointer, and
+thus this cast is a no-op. When it is not already a pointer, we either
+don't care because the code path will not be taken at runtime, or the
+integer really is an opaque handle to some internal, low-level memory
+management, much like a void* is an pointer to an opaque memory type...
+
+It is to be noted, though, that in some ABIs (like x32), the size of a
+nativeDisplay that is not already a pointer, might be bigger than that
+of a pointer. There is not much we can do here anyway, since there would
+be no way to fit that in a void* to begin with, and the build will still
+fail for those situations. Those types of ABIs are far frome being
+widespread, the most prominent one, x32, even being retired...
+
+To be noted further: a more usual solution (as suggested in QTBUG-72567
+or in Gerrit:248270) would be to first cast to a qintptr or a quintptr,
+before finally casting to a void*. However, casting to either (resp.)
+qintptr or quintptr first, risk the case that nativeDisplay is of the other
+kind of signedness, (resp.) unsigned or signed, which would also cause
+some compile-time breakage.
+
+Finally, if nativeDisplay is something that is not an int-like, and that
+can't be cast into a void*, this would be hugely weird, so much so, that
+we do not even attempt to catter for that case.
+
+Fixes: QTBUG-72567
+Inspired-by: https://codereview.qt-project.org/c/qt/qtbase/+/248270
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+index d495a8d..059a580 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+@@ -80,7 +80,9 @@
+     }
+ 
+     if (getPlatformDisplay) {
+-        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
++        // EGLNativeDisplayType may be int on some platforms but those
++        // won't hit this path. Have to keep it compiling nonetheless.
++        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, reinterpret_cast<void *>(nativeDisplay), nullptr);
+     } else {
+         qCDebug(qLcEglfsKmsDebug, "No eglGetPlatformDisplay for GBM, falling back to eglGetDisplay");
+         display = eglGetDisplay(nativeDisplay);
