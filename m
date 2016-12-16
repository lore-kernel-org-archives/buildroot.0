From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 16 Dec 2016 23:22:49 +0100
Subject: [Buildroot] [PATCH] tinycbor: disable parallel build
Message-ID: <20161216222249.7468-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maybe fixes ([1]):

 make[1]: Entering directory `/home/peko/autobuild/instance-1/output/build/tinycbor-v0.4'
 .config:8: *** missing separator.  Stop.

[1] http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
See [2] for discussion. If disabling parallel build does not work a
second attempt to fix this problem would be to pre-gnerate a .config
file before starting the compile.

[2] http://lists.busybox.net/pipermail/buildroot/2016-December/179783.html
---
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
 package/tinycbor/tinycbor.mk                       |  4 +-
 2 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100644 package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch

diff --git a/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch b/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
deleted file mode 100644
index cbafb397b..000000000
--- a/package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b6c602e4264021f98ec2c72316e2a2000bf35e82 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 14 Nov 2016 23:42:25 +0100
-Subject: [PATCH] eglfs: fix eglfs_mali compile for odroid-mali
-
-Avoid duplicated struct fbdev_window definition (introduced by [1]) by
-renaming struct fbdev_window to shadow_fbdev_window.
-
-Fixes the following buildroot compile failure ([2]):
-
-qeglfsmaliintegration.cpp:45:8: error: redefinition of 'struct fbdev_window'
- struct fbdev_window {
-        ^
-In file included from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:28:0,
-                 from /accts/mlweber1/rc-buildroot-test/scripts/instance-0/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/egl.h:36,
-                 from ../../../eglfs/qeglfsglobal.h:45,
-                 from ../../../eglfs/qeglfsdeviceintegration.h:48,
-                 from qeglfsmaliintegration.h:37,
-                 from qeglfsmaliintegration.cpp:34:
-
-[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?h=dev&id=58bed4cda98e8e25db8adc61c7db73b6853077dc
-[2] http://autobuild.buildroot.net/results/48c/48c458c035162169e8ca7c34ae65e9064822f25a
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp      | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-index 43decdf..aeba83f 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_mali/qeglfsmaliintegration.cpp
-@@ -42,7 +42,7 @@
- 
- QT_BEGIN_NAMESPACE
- 
--struct fbdev_window {
-+struct shadow_fbdev_window {
-     unsigned short width;
-     unsigned short height;
- };
-@@ -85,7 +85,7 @@ EGLNativeWindowType QEglFSMaliIntegration::createNativeWindow(QPlatformWindow *w
-     Q_UNUSED(window);
-     Q_UNUSED(format);
- 
--    fbdev_window *fbwin = reinterpret_cast<fbdev_window *>(malloc(sizeof(fbdev_window)));
-+    shadow_fbdev_window *fbwin = reinterpret_cast<shadow_fbdev_window *>(malloc(sizeof(shadow_fbdev_window)));
-     if (NULL == fbwin)
-         return 0;
- 
--- 
-2.8.1
-
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 2691e5b8d..65deacd22 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -18,8 +18,10 @@ endif
 
 TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
 
+# disabled parallel build because of build failures while
+# producing the .config file
 define TINYCBOR_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TINYCBOR_MAKE_OPTS) -C $(@D)
 endef
 
 define TINYCBOR_INSTALL_STAGING_CMDS
-- 
2.11.0
