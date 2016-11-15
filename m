From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 12:53:38 +0100
Subject: [Buildroot] [git commit] qt5base: fix eglfs compile for odroid-mali
Message-ID: <20161115115343.A89C8817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2114cf021f493defdc3aa6f21259a317aaf62493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid duplicated struct fbdev_window definition (introduced by [1]) by
renaming struct fbdev_window to shadow_fbdev_window.

Fixes [2]:

qeglfsmaliintegration.cpp:45:8: error: redefinition of 'struct fbdev_window'
 struct fbdev_window {
        ^
In file included from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:28:0,
                 from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36,
                 from ../../../eglfs/qeglfsglobal.h:45,
                 from ../../../eglfs/qeglfsdeviceintegration.h:48,
                 from qeglfsmaliintegration.h:37,
                 from qeglfsmaliintegration.cpp:34:

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=58bed4cda98e8e25db8adc61c7db73b6853077dc
[2] http://autobuild.buildroot.net/results/48c/48c458c035162169e8ca7c34ae65e9064822f25a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch b/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
new file mode 100644
index 0000000..cbafb39
--- /dev/null
+++ b/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
@@ -0,0 +1,53 @@
+From b6c602e4264021f98ec2c72316e2a2000bf35e82 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 14 Nov 2016 23:42:25 +0100
+Subject: [PATCH] eglfs: fix eglfs_mali compile for odroid-mali
+
+Avoid duplicated struct fbdev_window definition (introduced by [1]) by
+renaming struct fbdev_window to shadow_fbdev_window.
+
+Fixes the following buildroot compile failure ([2]):
+
+qeglfsmaliintegration.cpp:45:8: error: redefinition of 'struct fbdev_window'
+ struct fbdev_window {
+        ^
+In file included from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:28:0,
+                 from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36,
+                 from ../../../eglfs/qeglfsglobal.h:45,
+                 from ../../../eglfs/qeglfsdeviceintegration.h:48,
+                 from qeglfsmaliintegration.h:37,
+                 from qeglfsmaliintegration.cpp:34:
+
+[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=58bed4cda98e8e25db8adc61c7db73b6853077dc
+[2] http://autobuild.buildroot.net/results/48c/48c458c035162169e8ca7c34ae65e9064822f25a
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp      | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
+index 43decdf..aeba83f 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
+@@ -42,7 +42,7 @@
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-struct fbdev_window {
++struct shadow_fbdev_window {
+     unsigned short width;
+     unsigned short height;
+ };
+@@ -85,7 +85,7 @@ EGLNativeWindowType QEglFSMaliIntegration::createNativeWindow(QPlatformWindow *w
+     Q_UNUSED(window);
+     Q_UNUSED(format);
+ 
+-    fbdev_window *fbwin = reinterpret_cast<fbdev_window *>(malloc(sizeof(fbdev_window)));
++    shadow_fbdev_window *fbwin = reinterpret_cast<shadow_fbdev_window *>(malloc(sizeof(shadow_fbdev_window)));
+     if (NULL == fbwin)
+         return 0;
+ 
+-- 
+2.8.1
+
