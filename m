From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Apr 2021 22:38:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-hiredis: fix build with gcc
 4.8
Message-ID: <20210406203808.1339872-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails with gcc 4.8 since bump to version 2.0.0 in commit
69405d89596988b5b7d25886b7f9c07efad70741

Fixes:
 -  http://autobuild.buildroot.org/results/04cbcddf6d83ebad8c98400754f9445375e9e489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-setup.py-fix-build-with-gcc-4.8.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch

diff --git a/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch b/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..93f9440a74
--- /dev/null
+++ b/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,43 @@
+From 204898e28c7650089bf664eea8adfc16a22ba4f4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 6 Apr 2021 10:37:49 +0200
+Subject: [PATCH] setup.py: fix build with gcc 4.8
+
+Fix the following build failure on gcc 4.8 which is raised since version
+2.0.0 and
+https://github.com/redis/hiredis-py/commit/9084152f624e8e593b4e86ddf8bd13329fdfc043:
+
+vendor/hiredis/read.c: In function 'redisReaderFree':
+vendor/hiredis/read.c:646:9: error: 'for' loop initial declarations are only allowed in C99 mode
+         for (int i = 0; i < r->tasks; i++) {
+         ^
+vendor/hiredis/read.c:646:9: note: use option -std=c99 or -std=gnu99 to compile your code
+
+This build failure is raised because hiredis source code is built
+without C99:
+https://github.com/redis/hiredis/commit/13a35bdb64615e381c5e1151cdd4e78bba71a6db
+
+Fixes:
+ - http://autobuild.buildroot.org/results/04cbcddf6d83ebad8c98400754f9445375e9e489
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/redis/hiredis-py/pull/110]
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index d83153b..1f623c9 100755
+--- a/setup.py
++++ b/setup.py
+@@ -13,6 +13,7 @@ def version():
+ ext = Extension("hiredis.hiredis",
+   sources=sorted(glob.glob("src/*.c") +
+                  ["vendor/hiredis/%s.c" % src for src in ("alloc", "read", "sds")]),
++  extra_compile_args=["-std=c99"],
+   include_dirs=["vendor"])
+ 
+ setup(
+-- 
+2.30.2
+
-- 
2.30.2
