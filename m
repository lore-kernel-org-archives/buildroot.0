From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Mar 2020 18:19:41 +0100
Subject: [Buildroot] [git commit] package/mesa3d: fix nouveau std::isinf
 related compile failure
Message-ID: <20200305170814.7F74B8F3ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99e7cf6de704f6b58cc1b433151fe1d54c4535ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Activate already existing mesa3d solution for the isinf compile
failure for uclibc based toolchains instead of using a custom
workaround.

- remove 0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
- add 0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch

Fixes:
  http://autobuild.buildroot.net/results/cbefc5d4a4fefb674e596400fa1d2698cd89c5b3/
  http://autobuild.buildroot.net/results/dc974da012f53fa4ed3be616f937b0afae423d66/

  ../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp: In member function 'bool nv50_ir::GCRA::simplify()':
  ../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp:1348:19: error: expected unqualified-id before '(' token
            if (std::isinf(bestScore)) {
                     ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-import-isinf-for-uclibc-based-toolchains.patch | 30 ++++++++++++++
 ...-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch | 47 ----------------------
 2 files changed, 30 insertions(+), 47 deletions(-)

diff --git a/package/mesa3d/0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch b/package/mesa3d/0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch
new file mode 100644
index 0000000000..5acbaa4daa
--- /dev/null
+++ b/package/mesa3d/0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch
@@ -0,0 +1,30 @@
+From 705490763fcc052defa2d49a5c5200775cd12c54 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 4 Mar 2020 08:27:24 +0100
+Subject: [PATCH] c99_math: import isinf for uclibc based toolchains
+
+The same fix as for glibc >= 2.23 is needed for uclibc
+based toolchains.
+
+[Upstream suggested: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4042]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/c99_math.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/c99_math.h b/include/c99_math.h
+index e906c26aa54..c8a73a2d2c7 100644
+--- a/include/c99_math.h
++++ b/include/c99_math.h
+@@ -190,7 +190,7 @@ fpclassify(double x)
+  * undefines those functions, which in glibc 2.23, are defined as macros rather
+  * than functions as in glibc 2.22.
+  */
+-#if __cplusplus >= 201103L && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 23))
++#if __cplusplus >= 201103L && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 23) || defined(__UCLIBC__))
+ #include <cmath>
+ 
+ using std::fpclassify;
+-- 
+2.25.1
+
diff --git a/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch b/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
deleted file mode 100644
index 73e75993de..0000000000
--- a/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f2ce27b761eeca301a109856f20ed9a8eb06796d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 Dec 2019 21:49:43 +0100
-Subject: [PATCH] src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp: prefix
- isinf with std::
-
-Prefix isinf with std:: to fix the following build failure with gcc 4.9:
-
-../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp: In member function 'bool nv50_ir::GCRA::simplify()':
-../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp:1350:29: error: 'isinf' was not declared in this scope
-          if (isinf(bestScore)) {
-                             ^
-../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp:1350:29: note: suggested alternative:
-In file included from /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/random:38:0,
-                 from /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/bits/stl_algo.h:66,
-                 from /data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/algorithm:62,
-                 from ../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp:26:
-/data/buildroot/buildroot-test/instance-0/output/host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/4.9.4/cmath:621:5: note:   'std::isinf'
-     isinf(_Tp __x)
-     ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/599dc3478ed65d36fbf9f5e9625691dfa813b530
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3227]
----
- src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
-index 6df2664da22..e81fb117213 100644
---- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
-+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
-@@ -1345,7 +1345,7 @@ GCRA::simplify()
-                bestMaxReg = it->maxReg;
-             }
-          }
--         if (isinf(bestScore)) {
-+         if (std::isinf(bestScore)) {
-             ERROR("no viable spill candidates left\n");
-             return false;
-          }
--- 
-2.24.0
-
