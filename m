From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2015 20:47:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: Update fminf/fmaxf patch
Message-ID: <1428950853-19110-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d now ships with a pre-generated file nir_constant_expressions.c, so there
is no need to patch nir_constant_expressions.py anymore. Furthermore the
previous patch of .py forced a re-generation of the .c file during the build,
but due to missing python-mako (removed during 10.5.3 bump) this will fail.

Fixes
http://autobuild.buildroot.net/results/35f/35fc6608b1d984587abb86700a51bf763770c795/
http://autobuild.buildroot.net/results/25b/25b43a1898d5f3b4e87efc3147b33972668aa52f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-Fix-runtime-error-with-uClibc.patch       |   34 +++++++-------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch b/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
index 6fca65f..c85f88a 100644
--- a/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
+++ b/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
@@ -1,14 +1,5 @@
 Fix runtime error with uClibc
 
-Patch sent upstream:
-http://lists.freedesktop.org/archives/mesa-dev/2015-March/079431.html
-
-
-From b1dae3cae9df36d9c4f64c342cfe7c106e34ec72 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 15 Mar 2015 12:23:26 +0100
-Subject: [PATCH 1/1] Fix runtime error with uClibc
-
 Patch inspired by
 https://www.winehq.org/pipermail/wine-bugs/2011-September/288987.html
 http://git.alpinelinux.org/cgit/aports/tree/main/wine/uclibc-fmaxf-fminf.patch?id=c9b491b6099eec02a835ffd05539b5c783c6c43a
@@ -22,19 +13,21 @@ libGL error: failed to load driver: i965
 libGL error: unable to load driver: swrast_dri.so
 libGL error: failed to load driver: swrast
 
-Here is some background information about the fminf/fmaxf situation in uClibc:
-http://thread.gmane.org/gmane.comp.lib.uclibc.general/24189
+This patch was rejected by upstream mesa3d:
+http://lists.freedesktop.org/archives/mesa-dev/2015-March/079436.html
+
+The real fix was committed to uClibc:
+http://git.uclibc.org/uClibc/commit/?id=6c4538905e65ceb203f59aaa9a61728e81c6bc0a
+
+Until the external toolchains do not contain this uClibc patch we keep this
+patch: http://lists.busybox.net/pipermail/buildroot/2015-March/123410.html
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- src/glsl/nir/nir_constant_expressions.py |   12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/glsl/nir/nir_constant_expressions.py b/src/glsl/nir/nir_constant_expressions.py
-index 22bc4f0..139c25a 100644
---- a/src/glsl/nir/nir_constant_expressions.py
-+++ b/src/glsl/nir/nir_constant_expressions.py
-@@ -50,6 +50,18 @@ static double copysign(double x, double y)
+diff -uNr mesa-10.5.3.org/src/glsl/nir/nir_constant_expressions.c mesa-10.5.3/src/glsl/nir/nir_constant_expressions.c
+--- mesa-10.5.3.org/src/glsl/nir/nir_constant_expressions.c	2015-04-12 23:31:29.000000000 +0200
++++ mesa-10.5.3/src/glsl/nir/nir_constant_expressions.c	2015-04-13 19:59:37.819786541 +0200
+@@ -48,6 +48,18 @@
  }
  #endif
  
@@ -53,6 +46,3 @@ index 22bc4f0..139c25a 100644
  /**
   * Evaluate one component of packSnorm4x8.
   */
--- 
-1.7.10.4
-
-- 
1.7.10.4
