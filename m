From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 19:06:35 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/qt5/qt5webengine:
 fix build error due to bogus use of -isystem
Message-ID: <20191225175759.3FC7A8E39C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=571f6e06c42956c1056900c7036a97157c9a5d3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

This commit adds a patch from upstream chromium[1] that allows passing
-I instead of -isystem to CFLAGS.

Fixes:
  In file included from /usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/bits/stl_algo.h:59:0,
                  from /usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/algorithm:62,
                  from /usr/include/qt5/QtCore/qglobal.h:85,
                  from /usr/include/qt5/QtCore/qalgorithms.h:37,
                  from /usr/include/qt5/QtCore/qlist.h:37,
                  from /usr/include/qt5/QtCore/qstringlist.h:34,
                  from /usr/include/qt5/QtCore/QStringList:1,
                  from base/http/requestparser.cpp:32:
/usr/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/g++-v6/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
  #include_next <stdlib.h>

[1] https://chromium.googlesource.com/chromium/src/+/a8c8396fd20d98666d517c45b358c63736e345ef

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[Thomas: improved commit log with comments from Giulio.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6cfe21ae90ccd88254bf5240b2b29d74794f45fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-pkg_config-Fixes-when-use_sysroot-false.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

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
