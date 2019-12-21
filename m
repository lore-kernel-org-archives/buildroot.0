From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 21 Dec 2019 12:12:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5webengine: fix build error
Message-ID: <20191221111218.26960-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch from upstream chromium [1].

Fixes:
  ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
  note: in definition of macro 'NS'
  #define NS(id) id

[1] https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
v1 -> v2:
 - keep gcc 4.8 as a minimum required version (suggested by Giulio Benetti)
 ..._config-Fixes-when-use_sysroot-false.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch

diff --git a/package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch b/package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch
new file mode 100644
index 0000000000..a0fdad4da3
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.5/0001-pkg_config-Fixes-when-use_sysroot-false.patch
@@ -0,0 +1,57 @@
+From cc35cac78c053c14da01d6b1e5b05b0615360148 Mon Sep 17 00:00:00 2001
+From: Tom Anderson <thomasanderson@chromium.org>
+Date: Thu, 2 Aug 2018 01:59:28 +0000
+Subject: [PATCH] pkg_config: Fixes when use_sysroot=false
+
+This CL introduces 2 changes to the behavior of pkg_config when
+use_sysroot=false:
+
+1. The path is not made relative to the build directory.  This fixes the case
+where your src directory may be mounted at different locations.
+
+2. -I is used instead of -isystem.  When -isystem is used, dep files do not
+reference the system header files.  This is OK when using the sysroot because
+the CR_SYSROOT_HASH macro contains the sysroot revision so any source files will
+be rebuilt when the sysroot updates.
+
+R=dpranke
+
+Change-Id: Ia3d7df51880205fee888923283b76078ccb3112f
+Reviewed-on: https://chromium-review.googlesource.com/1159689
+Reviewed-by: Dirk Pranke <dpranke@chromium.org>
+Commit-Queue: Thomas Anderson <thomasanderson@chromium.org>
+Cr-Original-Commit-Position: refs/heads/master@{#580030}
+Cr-Mirrored-From: https://chromium.googlesource.com/chromium/src
+Cr-Mirrored-Commit: a8c8396fd20d98666d517c45b358c63736e345ef
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ src/3rdparty/chromium/build/config/linux/pkg_config.gni | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/3rdparty/chromium/build/config/linux/pkg_config.gni b/src/3rdparty/chromium/build/config/linux/pkg_config.gni
+index 53ee353af..428e44ac0 100644
+--- a/src/3rdparty/chromium/build/config/linux/pkg_config.gni
++++ b/src/3rdparty/chromium/build/config/linux/pkg_config.gni
+@@ -103,11 +103,15 @@ template("pkg_config") {
+     pkgresult = exec_script(pkg_config_script, args, "value")
+     cflags = pkgresult[1]
+ 
+-    # We want the system include paths to use -isystem instead of -I to suppress
+-    # warnings in those headers.
+     foreach(include, pkgresult[0]) {
+-      include_relativized = rebase_path(include, root_build_dir)
+-      cflags += [ "-isystem$include_relativized" ]
++      if (use_sysroot) {
++        # We want the system include paths to use -isystem instead of -I to
++        # suppress warnings in those headers.
++        include_relativized = rebase_path(include, root_build_dir)
++        cflags += [ "-isystem$include_relativized" ]
++      } else {
++        cflags += [ "-I$include" ]
++      }
+     }
+ 
+     if (!defined(invoker.ignore_libs) || !invoker.ignore_libs) {
+-- 
+2.21.0
+
-- 
2.24.1
