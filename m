From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 19:30:00 +0200
Subject: [Buildroot] [git commit] libfastjson: bump to version 0.99.8
Message-ID: <20180429173110.60A228A3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d22b44642274ac89752428b80d81338cc7b1de79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (applied in this version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-m4-fix-detection-of-atomics.patch         | 86 ----------------------
 package/libfastjson/libfastjson.hash               |  3 +-
 package/libfastjson/libfastjson.mk                 |  2 +-
 3 files changed, 3 insertions(+), 88 deletions(-)

diff --git a/package/libfastjson/0001-m4-fix-detection-of-atomics.patch b/package/libfastjson/0001-m4-fix-detection-of-atomics.patch
deleted file mode 100644
index 1fdbf1923f..0000000000
--- a/package/libfastjson/0001-m4-fix-detection-of-atomics.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From df087711cf7be55268a55e7820f4d928cb34c078 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 9 Jul 2016 20:44:36 +0200
-Subject: [PATCH] m4: fix detection of atomics
-
-In cross-compilation, it is impossible to run code at configure time to
-detect the target specifics.
-
-As such, AC_TRY_RUN fails miserably to detect reliably that atomic
-intrisics are present in a toolchain, and decides they are not just
-because this is cross-compilation.
-
-Instead of AC_TRY_RUN, use AC_LINK_IFELSE that does not need to actually
-run code, since all we're interested in is whether the intrisics are
-present (or not). Fix both the 32- and 64-bit variants, even if the
-latter is not used currently.
-
-Fixes build failures detected by the Buildroot autobuilders, like:
-    http://autobuild.buildroot.org/results/23a/23ac0e742ed3a70ae4d038f8c9eadc23e708f671/build-end.log
-    http://autobuild.buildroot.org/results/192/1923d0b570adba494f83747a9610ea6ec35f5223/build-end.log
-
-and many other cases, espcially on architectures where such intrisics are
-present, but where the toolchain does not have threads (and anyway, it
-is much more efficient to use the intrisics rather than use mutexes).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch sent upstream:
-    https://github.com/rsyslog/libfastjson/pull/109
-
----
- m4/atomic_operations.m4       | 6 ++----
- m4/atomic_operations_64bit.m4 | 6 ++----
- 2 files changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/m4/atomic_operations.m4 b/m4/atomic_operations.m4
-index ad0ee60..7d2bca6 100644
---- a/m4/atomic_operations.m4
-+++ b/m4/atomic_operations.m4
-@@ -9,9 +9,7 @@
- #
- AC_DEFUN([RS_ATOMIC_OPERATIONS],
- [AC_CACHE_CHECK([whether the compiler provides atomic builtins], [ap_cv_atomic_builtins],
--[AC_TRY_RUN([
--int main()
--{
-+[AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
-     unsigned long val = 1010, tmp, *mem = &val;
- 
-     if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
-@@ -44,7 +42,7 @@ int main()
-         return 1;
- 
-     return 0;
--}], [ap_cv_atomic_builtins=yes], [ap_cv_atomic_builtins=no], [ap_cv_atomic_builtins=no])])
-+]])], [ap_cv_atomic_builtins=yes], [ap_cv_atomic_builtins=no])])
- 
- if test "$ap_cv_atomic_builtins" = "yes"; then
-     AC_DEFINE(HAVE_ATOMIC_BUILTINS, 1, [Define if compiler provides atomic builtins])
-diff --git a/m4/atomic_operations_64bit.m4 b/m4/atomic_operations_64bit.m4
-index 9fbef0a..d01a977 100644
---- a/m4/atomic_operations_64bit.m4
-+++ b/m4/atomic_operations_64bit.m4
-@@ -9,9 +9,7 @@
- #
- AC_DEFUN([RS_ATOMIC_OPERATIONS_64BIT],
- [AC_CACHE_CHECK([whether the compiler provides atomic builtins for 64 bit data types], [ap_cv_atomic_builtins_64],
--[AC_TRY_RUN([
--int main()
--{
-+[AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[
-     unsigned long long val = 1010, tmp, *mem = &val;
- 
-     if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
-@@ -44,7 +42,7 @@ int main()
-         return 1;
- 
-     return 0;
--}], [ap_cv_atomic_builtins_64=yes], [ap_cv_atomic_builtins_64=no], [ap_cv_atomic_builtins_64=no])])
-+]])], [ap_cv_atomic_builtins_64=yes], [ap_cv_atomic_builtins_64=no])])
- 
- if test "$ap_cv_atomic_builtins_64" = "yes"; then
-     AC_DEFINE(HAVE_ATOMIC_BUILTINS64, 1, [Define if compiler provides 64 bit atomic builtins])
--- 
-2.7.4
-
diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 427db9c702..72fb9856a0 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  03ef63dcc88417e71c19ce4436804159e3397e3a20d3529efef6a43c3bef5c8d  libfastjson-v0.99.4.tar.gz
+sha256  7e49057b26a5a9e3c6623e024f95f9fd9a14b571b9150aeb89d6d475fc3633e3  libfastjson-v0.99.8.tar.gz
+sha256  b29370bbfa98816e1fca0901f18149d920736771bfd68b4ee0eb00c78b38d245  COPYING
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index 06da0d8edd..565cdd0ec8 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = v0.99.4
+LIBFASTJSON_VERSION = v0.99.8
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
