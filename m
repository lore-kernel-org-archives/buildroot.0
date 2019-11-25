From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:16:26 +0100
Subject: [Buildroot] [git commit] package/libdrm: disable nouveau test for
 static build
Message-ID: <20191125170836.DEC2982AFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54bcc1b188ab60a5b33bc6e9b710229646038dee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  [46/66] Compiling C object 'tests/nouveau/e47a46e@@threaded at exe/threaded.c.o'.
  FAILED: tests/nouveau/e47a46e@@threaded at exe/threaded.c.o
  ./tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory
  #include <dlfcn.h>

[1] http://autobuild.buildroot.net/results/3042637f54d2d232904ea009455cae82e159ea2e

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....build-disable-nouveau-tests-for-static-b.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch b/package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch
new file mode 100644
index 0000000000..e2e18e122b
--- /dev/null
+++ b/package/libdrm/0005-tests-meson.build-disable-nouveau-tests-for-static-b.patch
@@ -0,0 +1,43 @@
+From c9036706b9f724f09ac6288f82b53f2e76264ec7 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 25 Nov 2019 15:59:15 +0100
+Subject: [PATCH] tests/meson.build: disable nouveau tests for static build
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+Notes:
+
+  - the existing test/check for static build in meson.build does not
+    catch this case because e.g. the buildroot toolchain
+    br-arm-full-static-2019.05.1 provides an empty libdl.a
+
+  169 # Among others FreeBSD does not have a separate dl library.
+  170 if not cc.has_function('dlsym')
+  171   dep_dl = cc.find_library('dl', required : with_nouveau)
+  172 else
+  173   dep_dl = []
+  174 endif
+---
+ tests/meson.build | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
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
+2.24.0
+
