From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 16:59:17 +0100
Subject: [Buildroot] [git commit] package/zeromq: bump to version 4.3.4
Message-ID: <20210117154112.4D48C813AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64ec0541d56cb05aa5898c42f26dd6b531d9b96a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And removed patch (already applied).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...pat.hpp-fix-build-with-libbsd-and-strlcpy.patch | 107 ---------------------
 package/zeromq/zeromq.hash                         |   6 +-
 package/zeromq/zeromq.mk                           |   2 +-
 3 files changed, 4 insertions(+), 111 deletions(-)

diff --git a/package/zeromq/0001-src-compat.hpp-fix-build-with-libbsd-and-strlcpy.patch b/package/zeromq/0001-src-compat.hpp-fix-build-with-libbsd-and-strlcpy.patch
deleted file mode 100644
index ea1166fd55..0000000000
--- a/package/zeromq/0001-src-compat.hpp-fix-build-with-libbsd-and-strlcpy.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 8cb5708829df9eacd58e1215ce7a1c135eb912b1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 2 Nov 2020 00:04:14 +0100
-Subject: [PATCH] src/compat.hpp: fix build with libbsd and strlcpy
-
-Don't include bsd/string.h if strlcpy is also defined in string.h to
-avoid the following build failure on uclibc:
-
-In file included from src/compat.hpp:41:0,
-                 from src/ipc_address.cpp:31:
-/tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/bsd/string.h:44:54: error: declaration of 'size_t strlcpy(char*, const char*, size_t)' has a different exception specifier
- size_t strlcpy(char *dst, const char *src, size_t siz);
-                                                      ^
-In file included from src/compat.hpp:34:0,
-                 from src/ipc_address.cpp:31:
-/tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/string.h:424:15: error: from previous declaration 'size_t strlcpy(char*, const char*, size_t) throw ()'
- extern size_t strlcpy(char *__restrict dst, const char *__restrict src,
-               ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/51220b1b82774e8f6f6ed8593c58d2e3c31a1531
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/zeromq/libzmq/commit/b2a0842063aaa464ca2d182f9d3fefc6493906d0]
----
- CMakeLists.txt |  4 +---
- configure.ac   | 26 ++++++++++++--------------
- src/compat.hpp |  4 +++-
- 3 files changed, 16 insertions(+), 18 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 85747f626..74dd99ae0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -250,9 +250,7 @@ if(NOT MSVC)
-       set(ZMQ_HAVE_LIBBSD 1)
-     endif()
-   endif()
--  if(NOT WITH_LIBBSD OR NOT LIBBSD_FOUND)
--    check_cxx_symbol_exists(strlcpy string.h ZMQ_HAVE_STRLCPY)
--  endif()
-+  check_cxx_symbol_exists(strlcpy string.h ZMQ_HAVE_STRLCPY)
- endif()
- 
- # Select curve encryption library, defaults to tweetnacl To use libsodium instead, use --with-libsodium(must be
-diff --git a/configure.ac b/configure.ac
-index 58a78e75e..a7a1609af 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -812,20 +812,18 @@ if test "x$enable_libbsd" != "xno"; then
-             fi
-         ])
- fi
--if test "x$found_libbsd" != "xyes"; then
--    AC_MSG_CHECKING([whether strlcpy is available])
--    AC_COMPILE_IFELSE(
--        [AC_LANG_PROGRAM(
--            [[#include <string.h>]],
--            [[char buf [100]; size_t bar = strlcpy (buf, "foo", 100); (void)bar; return 0;]])
--        ],[
--            AC_MSG_RESULT([yes])
--            AC_DEFINE(ZMQ_HAVE_STRLCPY, [1],
--                [strlcpy is available])
--        ],[
--            AC_MSG_RESULT([no])
--    ])
--fi
-+AC_MSG_CHECKING([whether strlcpy is available])
-+AC_COMPILE_IFELSE(
-+    [AC_LANG_PROGRAM(
-+        [[#include <string.h>]],
-+        [[char buf [100]; size_t bar = strlcpy (buf, "foo", 100); (void)bar; return 0;]])
-+    ],[
-+        AC_MSG_RESULT([yes])
-+        AC_DEFINE(ZMQ_HAVE_STRLCPY, [1],
-+            [strlcpy is available])
-+    ],[
-+        AC_MSG_RESULT([no])
-+])
- 
- # pthread_setname is non-posix, and there are at least 4 different implementations
- AC_MSG_CHECKING([whether signature of pthread_setname_np() has 1 argument])
-diff --git a/src/compat.hpp b/src/compat.hpp
-index 7c7a89275..47744b98e 100644
---- a/src/compat.hpp
-+++ b/src/compat.hpp
-@@ -37,9 +37,10 @@
- #define strcasecmp _stricmp
- #define strtok_r strtok_s
- #else
-+#ifndef ZMQ_HAVE_STRLCPY
- #ifdef ZMQ_HAVE_LIBBSD
- #include <bsd/string.h>
--#elif !defined(ZMQ_HAVE_STRLCPY)
-+#else
- static inline size_t
- strlcpy (char *dest_, const char *src_, const size_t dest_size_)
- {
-@@ -50,6 +51,7 @@ strlcpy (char *dest_, const char *src_, const size_t dest_size_)
-     return dest_size_ - remain;
- }
- #endif
-+#endif
- template <size_t size>
- static inline int strcpy_s (char (&dest_)[size], const char *const src_)
- {
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 17ffff8762..5085fbca33 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,7 +1,7 @@
 # From https://github.com/zeromq/libzmq/releases
-md5  78acc277d95e10812d71b2b3c3c3c9a9  zeromq-4.3.3.tar.gz
-sha1  d78bc504194d6908df40a2b9e41849b181b02491  zeromq-4.3.3.tar.gz
+md5  c897d4005a3f0b8276b00b7921412379  zeromq-4.3.4.tar.gz
+sha1  47277a64749049123d1401600e8cfbab10a3ae28  zeromq-4.3.4.tar.gz
 # Locally computed
-sha256  9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2  zeromq-4.3.3.tar.gz
+sha256  c593001a89f5a85dd2ddf564805deb860e02471171b3f204944857336295c3e5  zeromq-4.3.4.tar.gz
 sha256  4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
 sha256  83f32abe61ee58ffb1b007412c08415168c052501dbf56d7a47aaaac52b03ef6  COPYING.LESSER
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 954964717a..fbf2ca3f8c 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.3.3
+ZEROMQ_VERSION = 4.3.4
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
