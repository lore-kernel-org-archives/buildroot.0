From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Nov 2020 18:45:56 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/zeromq: add
 libbsd optional dependency
Message-ID: <20201107174515.590A286F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85b2995d13b836d60827a65d4e1743eb889010b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

libbsd is an optional dependency which is enabled by default since
version 4.3.3 and
https://github.com/zeromq/libzmq/commit/068385c951c0608edec6264d55ba9c4c923acccc

Fixes:
 - http://autobuild.buildroot.org/results/51220b1b82774e8f6f6ed8593c58d2e3c31a1531

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25b5dc747a1bf4e1a18def00387246808c3c0a4e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pat.hpp-fix-build-with-libbsd-and-strlcpy.patch | 107 +++++++++++++++++++++
 package/zeromq/zeromq.mk                           |   9 ++
 2 files changed, 116 insertions(+)

diff --git a/package/zeromq/0001-src-compat.hpp-fix-build-with-libbsd-and-strlcpy.patch b/package/zeromq/0001-src-compat.hpp-fix-build-with-libbsd-and-strlcpy.patch
new file mode 100644
index 0000000000..ea1166fd55
--- /dev/null
+++ b/package/zeromq/0001-src-compat.hpp-fix-build-with-libbsd-and-strlcpy.patch
@@ -0,0 +1,107 @@
+From 8cb5708829df9eacd58e1215ce7a1c135eb912b1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 2 Nov 2020 00:04:14 +0100
+Subject: [PATCH] src/compat.hpp: fix build with libbsd and strlcpy
+
+Don't include bsd/string.h if strlcpy is also defined in string.h to
+avoid the following build failure on uclibc:
+
+In file included from src/compat.hpp:41:0,
+                 from src/ipc_address.cpp:31:
+/tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/bsd/string.h:44:54: error: declaration of 'size_t strlcpy(char*, const char*, size_t)' has a different exception specifier
+ size_t strlcpy(char *dst, const char *src, size_t siz);
+                                                      ^
+In file included from src/compat.hpp:34:0,
+                 from src/ipc_address.cpp:31:
+/tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/string.h:424:15: error: from previous declaration 'size_t strlcpy(char*, const char*, size_t) throw ()'
+ extern size_t strlcpy(char *__restrict dst, const char *__restrict src,
+               ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/51220b1b82774e8f6f6ed8593c58d2e3c31a1531
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/zeromq/libzmq/commit/b2a0842063aaa464ca2d182f9d3fefc6493906d0]
+---
+ CMakeLists.txt |  4 +---
+ configure.ac   | 26 ++++++++++++--------------
+ src/compat.hpp |  4 +++-
+ 3 files changed, 16 insertions(+), 18 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 85747f626..74dd99ae0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -250,9 +250,7 @@ if(NOT MSVC)
+       set(ZMQ_HAVE_LIBBSD 1)
+     endif()
+   endif()
+-  if(NOT WITH_LIBBSD OR NOT LIBBSD_FOUND)
+-    check_cxx_symbol_exists(strlcpy string.h ZMQ_HAVE_STRLCPY)
+-  endif()
++  check_cxx_symbol_exists(strlcpy string.h ZMQ_HAVE_STRLCPY)
+ endif()
+ 
+ # Select curve encryption library, defaults to tweetnacl To use libsodium instead, use --with-libsodium(must be
+diff --git a/configure.ac b/configure.ac
+index 58a78e75e..a7a1609af 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -812,20 +812,18 @@ if test "x$enable_libbsd" != "xno"; then
+             fi
+         ])
+ fi
+-if test "x$found_libbsd" != "xyes"; then
+-    AC_MSG_CHECKING([whether strlcpy is available])
+-    AC_COMPILE_IFELSE(
+-        [AC_LANG_PROGRAM(
+-            [[#include <string.h>]],
+-            [[char buf [100]; size_t bar = strlcpy (buf, "foo", 100); (void)bar; return 0;]])
+-        ],[
+-            AC_MSG_RESULT([yes])
+-            AC_DEFINE(ZMQ_HAVE_STRLCPY, [1],
+-                [strlcpy is available])
+-        ],[
+-            AC_MSG_RESULT([no])
+-    ])
+-fi
++AC_MSG_CHECKING([whether strlcpy is available])
++AC_COMPILE_IFELSE(
++    [AC_LANG_PROGRAM(
++        [[#include <string.h>]],
++        [[char buf [100]; size_t bar = strlcpy (buf, "foo", 100); (void)bar; return 0;]])
++    ],[
++        AC_MSG_RESULT([yes])
++        AC_DEFINE(ZMQ_HAVE_STRLCPY, [1],
++            [strlcpy is available])
++    ],[
++        AC_MSG_RESULT([no])
++])
+ 
+ # pthread_setname is non-posix, and there are at least 4 different implementations
+ AC_MSG_CHECKING([whether signature of pthread_setname_np() has 1 argument])
+diff --git a/src/compat.hpp b/src/compat.hpp
+index 7c7a89275..47744b98e 100644
+--- a/src/compat.hpp
++++ b/src/compat.hpp
+@@ -37,9 +37,10 @@
+ #define strcasecmp _stricmp
+ #define strtok_r strtok_s
+ #else
++#ifndef ZMQ_HAVE_STRLCPY
+ #ifdef ZMQ_HAVE_LIBBSD
+ #include <bsd/string.h>
+-#elif !defined(ZMQ_HAVE_STRLCPY)
++#else
+ static inline size_t
+ strlcpy (char *dest_, const char *src_, const size_t dest_size_)
+ {
+@@ -50,6 +51,7 @@ strlcpy (char *dest_, const char *src_, const size_t dest_size_)
+     return dest_size_ - remain;
+ }
+ #endif
++#endif
+ template <size_t size>
+ static inline int strcpy_s (char (&dest_)[size], const char *const src_)
+ {
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 7840d03624..af44784b38 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,6 +11,8 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+# We're patching configure.ac
+ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
@@ -53,6 +55,13 @@ else
 ZEROMQ_CONF_OPTS += --disable-drafts
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+ZEROMQ_DEPENDENCIES += host-pkgconf libbsd
+ZEROMQ_CONF_OPTS += --enable-libbsd
+else
+ZEROMQ_CONF_OPTS += --disable-libbsd
+endif
+
 # ZeroMQ uses libsodium if it's available.
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 ZEROMQ_DEPENDENCIES += libsodium
