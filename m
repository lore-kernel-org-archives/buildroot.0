From: Nathan Ford <nford@westpond.com>
Date: Wed, 26 Jun 2019 11:04:06 -0400
Subject: [Buildroot] [PATCH] This upstream patch fixes chromium compile
 issues where standard includes are added that break compilation.
Message-ID: <1561561447-14333-1-git-send-email-nford@westpond.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the upstream commit for more detail:
  https://chromium.googlesource.com/chromium/src.git/+/a8c8396fd20d98666d517c45b358c63736e345ef

Signed-off-by: Nathan Ford <nford@westpond.com>
---
 .../5.12.2/0001-fix_compile_regression.patch         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch

diff --git a/package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch b/package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch
new file mode 100644
index 0000000..974e8c0
--- /dev/null
+++ b/package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch
@@ -0,0 +1,20 @@
+--- a/src/3rdparty/chromium/build/config/linux/pkg_config.gni	2019-06-06 08:53:17.000000000 -0400
++++ b/src/3rdparty/chromium/build/config/linux/pkg_config.gni	2019-05-23 08:39:34.000000000 -0400
+@@ -103,11 +103,15 @@
+     pkgresult = exec_script(pkg_config_script, args, "value")
+     cflags = pkgresult[1]
+ 
+-    # We want the system include paths to use -isystem instead of -I to suppress
+-    # warnings in those headers.
+     foreach(include, pkgresult[0]) {
++      if (use_sysroot) {
++        # We want the system include paths to use -isystem instead of -I to
++        # suppress warnings in those headers.
+       include_relativized = rebase_path(include, root_build_dir)
+       cflags += [ "-isystem$include_relativized" ]
++      } else {
++        cflags += [ "-I$include" ]
++      }
+     }
+ 
+     if (!defined(invoker.ignore_libs) || !invoker.ignore_libs) {
-- 
2.7.4
