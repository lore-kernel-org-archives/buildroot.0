From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Aug 2019 01:19:08 +0200
Subject: [Buildroot] [PATCH v2] libdrm: fix static build (tests/nouveau)
Message-ID: <20190809231908.22209-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchains (e.g. br-arm-cortex-m4-full) provide empty libdl
libraries. This fools the dynamic/static detection for tests/nouveau,
so explicit check for library type instead.

Fixes [1]:

  ../tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory

[1] http://autobuild.buildroot.net/results/d15/d15ed604756cac4e4a87afca61b7a4778f293baf

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - patch updated
---
 ...shared-library-support-detection-for.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/libdrm/0005-meson-fix-libdl-shared-library-support-detection-for.patch

diff --git a/package/libdrm/0005-meson-fix-libdl-shared-library-support-detection-for.patch b/package/libdrm/0005-meson-fix-libdl-shared-library-support-detection-for.patch
new file mode 100644
index 0000000000..eb36f55ba5
--- /dev/null
+++ b/package/libdrm/0005-meson-fix-libdl-shared-library-support-detection-for.patch
@@ -0,0 +1,52 @@
+From 8705f6908f5de494dcdb13323b8c15fb9b09acf1 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 10 Aug 2019 01:06:13 +0200
+Subject: [PATCH] meson: fix libdl/shared library support detection for nouveau
+ tests
+
+Some toolchains (e.g. br-arm-cortex-m4-full) provide empty libdl
+libraries. This fools the dynamic/static detection for tests/nouveau,
+so explicit check for library type instead.
+
+Fixes:
+
+  ../tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build       | 1 +
+ tests/meson.build | 5 ++++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index adaaf22..b78d9e5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -168,6 +168,7 @@ endif
+
+ # Among others FreeBSD does not have a separate dl library.
+ if not cc.has_function('dlsym')
++  # fooled in case empty libdl provided, e.g. toolchain br-arm-cortex-m4-full
+   dep_dl = cc.find_library('dl', required : with_nouveau)
+ else
+   dep_dl = []
+diff --git a/tests/meson.build b/tests/meson.build
+index 6c8ddd9..f7cb5f0 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -44,8 +44,11 @@ endif
+ if with_etnaviv
+   subdir('etnaviv')
+ endif
++lib_type = get_option('default_library')
+ if with_nouveau
+-  subdir('nouveau')
++  if lib_type != 'static'
++    subdir('nouveau')
++  endif
+ endif
+
+ drmsl = executable(
+--
+2.22.0
+
--
2.22.0
