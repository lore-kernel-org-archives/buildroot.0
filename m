From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 12:50:21 +0100
Subject: [Buildroot] [git commit] mono: use proper Git patches
Message-ID: <20150207120036.47F048045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee60fbdd7ba39d50fcca32f5f0d4ce9a51ae5e83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to ease the modification of the Mono patches, turn the
existing ones into proper Git patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Disable-backtrace-on-not-supported-uclibc.patch |   27 ++++++++++++++++++++
 package/mono/0001-gc-fix-uclibc.patch              |   16 -----------
 ...so-path-depending-on-C-library-being-use.patch} |   17 +++++++++---
 .../0003-mono-context.h-fix-build-on-MIPS.patch    |    6 ++--
 4 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch b/package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch
new file mode 100644
index 0000000..7bc7384
--- /dev/null
+++ b/package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch
@@ -0,0 +1,27 @@
+From 5232ec11c74eb49fb220a7e2df80e46ac621e941 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Date: Sat, 7 Feb 2015 09:49:37 +0100
+Subject: [PATCH] Disable backtrace on not supported uclibc
+
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libgc/include/gc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgc/include/gc.h b/libgc/include/gc.h
+index 2265fdb..6485fc0 100644
+--- a/libgc/include/gc.h
++++ b/libgc/include/gc.h
+@@ -500,7 +500,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_off_page GC_PROTO((size_t lb));
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
+-- 
+2.1.0
+
diff --git a/package/mono/0001-gc-fix-uclibc.patch b/package/mono/0001-gc-fix-uclibc.patch
deleted file mode 100644
index 62b52cd..0000000
--- a/package/mono/0001-gc-fix-uclibc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Disable backtrace on not supported uclibc.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-
-diff -purN mono-native-3.8.0.orig/libgc/include/gc.h mono-native-3.8.0/libgc/include/gc.h
---- mono-native-3.8.0.orig/libgc/include/gc.h	2014-10-07 15:00:21.259466731 +0200
-+++ mono-native-3.8.0/libgc/include/gc.h	2014-10-07 15:05:25.560975681 +0200
-@@ -500,7 +500,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_of
- #ifdef __linux__
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
diff --git a/package/mono/0002-support-uclibc-musl.patch b/package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch
similarity index 57%
rename from package/mono/0002-support-uclibc-musl.patch
rename to package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch
index 48a3493..4c1d522 100644
--- a/package/mono/0002-support-uclibc-musl.patch
+++ b/package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch
@@ -1,16 +1,22 @@
-Adjust libc.so path depending on C library being used
+From 6f8346438e0257259867b5dca6bb6db54eb96705 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 7 Feb 2015 09:50:24 +0100
+Subject: [PATCH] Adjust libc.so path depending on C library being used
 
 By default, on Linux systems, Mono assumes that the C library is
 libc.so.6. While this is true for glibc, it is not true for uClibc and
 Musl based systems. This patch adds support for such systems.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
 
-Index: b/configure.ac
-===================================================================
+diff --git a/configure.ac b/configure.ac
+index 5d9961a..f6a7909 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2973,6 +2973,12 @@
+@@ -2978,6 +2978,12 @@ case "$host" in
          SQLITE="libsqlite.so"
          SQLITE3="libsqlite3.so"
  	;;
@@ -23,3 +29,6 @@ Index: b/configure.ac
      *-*-*linux*)
  	AC_PATH_X
  	dlsearch_path=`(libtool --config ; echo eval echo \\$sys_lib_dlsearch_path_spec) | sh`
+-- 
+2.1.0
+
diff --git a/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch b/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
index dab22ce..f60cfb9 100644
--- a/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
+++ b/package/mono/0003-mono-context.h-fix-build-on-MIPS.patch
@@ -1,4 +1,4 @@
-From 8f489c24e1770c2852efcaff9419d54bfadf0854 Mon Sep 17 00:00:00 2001
+From 2a8fab27a4308335282752164bebcfc77771fd3f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Fri, 6 Feb 2015 14:56:10 +0100
 Subject: [PATCH] mono-context.h: fix build on MIPS
@@ -16,10 +16,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/mono/utils/mono-context.h b/mono/utils/mono-context.h
-index d96eb75..ad56e2c 100755
+index 3b01b49..8852a63 100755
 --- a/mono/utils/mono-context.h
 +++ b/mono/utils/mono-context.h
-@@ -464,6 +464,8 @@ mono_ia64_context_get_fp (MonoContext *ctx)
+@@ -460,6 +460,8 @@ mono_ia64_context_get_fp (MonoContext *ctx)
  
  #elif ((defined(__mips__) && !defined(MONO_CROSS_COMPILE)) || (defined(TARGET_MIPS))) && SIZEOF_REGISTER == 4 /* defined(__ia64__) */
  
