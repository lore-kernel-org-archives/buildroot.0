From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 12 Jan 2019 21:02:30 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.3.1
Message-ID: <20190112190230.13556-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the patches as they're already on upstream.
As a consequence, no need to autoreconf anymore.
Also added license hashes.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...-serach-for-dladdr-only-on-libunwind.patch | 45 ------------
 ...nclude.m4-check-if-latomic-is-needed.patch | 71 -------------------
 package/zeromq/zeromq.hash                    |  8 ++-
 package/zeromq/zeromq.mk                      |  4 +-
 4 files changed, 6 insertions(+), 122 deletions(-)
 delete mode 100644 package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
 delete mode 100644 package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch

diff --git a/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch b/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
deleted file mode 100644
index 1037a67fe2..0000000000
--- a/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 194b3836c87f77aca34581656ff99da49813d8c3 Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Fri, 13 Apr 2018 11:56:46 +0300
-Subject: [PATCH] configure.ac: search for dladdr only on libunwind
-
-The original configure.ac tries to check for dladdr, but it actually needs
-it only in case we have libunwind (which has a another section and checks for it
-too).
-This can fail the build on systems without dynamic linking support.
-Therefore, the dladdr check has to be performed only when checking libunwind.
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
-Upstream-status: https://github.com/zeromq/libzmq/commit/c971445025535b9f989ab0b78f5ddd1c026f1878
----
- configure.ac | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 216b2bc4..0858a6c1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -174,11 +174,6 @@ case "${host_os}" in
-         AC_DEFINE(ZMQ_HAVE_LINUX, 1, [Have Linux OS])
-         libzmq_on_linux="yes"
- 
--        # dladdr/dlopen is in libdl on glibc
--        AC_SEARCH_LIBS([dladdr], [dl dld], [], [
--          AC_MSG_ERROR([unable to find the dladdr() function])
--        ])
--
-         if test "x$libzmq_tipc_support" = "xyes"; then
-             AC_DEFINE(ZMQ_HAVE_TIPC, 1, [Have TIPC support])
-         fi
-@@ -783,7 +778,7 @@ if test "x$enable_libunwind" != "xno"; then
-             AC_DEFINE(HAVE_LIBUNWIND, 1, [The libunwind library is to be used])
-             AC_SUBST([LIBUNWIND_CFLAGS])
-             AC_SUBST([LIBUNWIND_LIBS])
--            AC_CHECK_LIB([dl], [dladdr])
-+            AC_SEARCH_LIBS([dladdr], [dl dld])
-         ],
-         [
-             if test "x$enable_libunwind" = "xyes"; then
--- 
-2.17.0
-
diff --git a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
deleted file mode 100644
index 233b364662..0000000000
--- a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 9f4ca582555b208d065f730b5ce3b1901136b275 Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Mon, 7 May 2018 23:19:09 +0300
-Subject: [PATCH] acinclude.m4: check if -latomic is needed
-
-On some cases, -latomic is needed for linking, and since the current
-acinclude.m4 checks only compilation we can sometimes miss the need for -latomic
-and the linking process will fail.
-Therefore, the AC_CHECK_IFELSE was replaced with AC_LINK_IFELSE. If the first
-try fails, we try to link again with -latomic and add LIBS="-latomic" in case we
-succeeded.
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Update to use LIBS: https://github.com/zeromq/libzmq/pull/3250]
----
- acinclude.m4 | 31 +++++++++++++++++++++++++++----
- 1 file changed, 27 insertions(+), 4 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index f648ed0f..aa35195f 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -668,7 +668,7 @@ dnl # Check if compiler supoorts __atomic_Xxx intrinsics
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_ATOMIC_INTRINSICS], [{
-     AC_MSG_CHECKING(whether compiler supports __atomic_Xxx intrinsics)
--    AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-+    AC_LINK_IFELSE([AC_LANG_SOURCE([
- /* atomic intrinsics test */
- int v = 0;
- int main (int, char **)
-@@ -677,9 +677,32 @@ int main (int, char **)
-     return t;
- }
-     ])],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_has_atomic_instrisics="no"  ; $2]
--    )
-+    [libzmq_cv_has_atomic_instrisics="yes"],
-+    [libzmq_cv_has_atomic_instrisics="no"])
-+
-+    if test "x$libzmq_cv_has_atomic_instrisics" = "xno"; then
-+        save_LIBS=$LIBS
-+        LIBS="$LIBS -latomic"
-+        AC_LINK_IFELSE([AC_LANG_SOURCE([
-+        /* atomic intrinsics test */
-+        int v = 0;
-+        int main (int, char **)
-+        {
-+            int t = __atomic_add_fetch (&v, 1, __ATOMIC_ACQ_REL);
-+            return t;
-+        }
-+        ])],
-+        [libzmq_cv_has_atomic_instrisics="yes"],
-+        [libzmq_cv_has_atomic_instrisics="no" LIBS=$save_LIBS])
-+    fi
-+
-+    if test "x$libzmq_cv_has_atomic_instrisics" = "xyes"; then
-+        AC_MSG_RESULT(yes)
-+        $1
-+    else
-+        AC_MSG_RESULT(no)
-+        $2
-+    fi
- }])
- 
- dnl ################################################################################
--- 
-2.17.0
-
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 86380c0295..5af6a3ff8d 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,5 +1,7 @@
 # From https://github.com/zeromq/libzmq/releases
-md5  a1c95b34384257e986842f4d006957b8  zeromq-4.2.5.tar.gz
-sha1 1132f839d703486c4ee1cf22f056585dfbb329c2  zeromq-4.2.5.tar.gz
+md5  64cbf3577afdbfda30358bc757a6ac83  zeromq-4.3.1.tar.gz
+sha1 6cce22d830eaf95feff7cab00744df13ad7ab7f3  zeromq-4.3.1.tar.gz
 # Locally computed
-sha256 cc9090ba35713d59bb2f7d7965f877036c49c5558ea0c290b0dcc6f2a17e489f  zeromq-4.2.5.tar.gz
+sha256 bcbabe1e2c7d0eec4ed612e10b94b112dd5f06fcefa994a0c79a45d835cd21eb  zeromq-4.3.1.tar.gz
+sha256 4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
+sha256 83f32abe61ee58ffb1b007412c08415168c052501dbf56d7a47aaaac52b03ef6  COPYING.LESSER
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 4b25c7d678..da57f8745c 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.2.5
+ZEROMQ_VERSION = 4.3.1
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
-# 0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch touches configure.ac
-ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
-- 
2.19.1
