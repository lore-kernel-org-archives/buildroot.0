From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Oct 2019 20:22:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/memcached: bump to version 1.5.19
Message-ID: <20191013182231.9248-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christopher McCrory <chrismcc@gmail.com>

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
[Bernd: bump version 1.5.19, added patches to fix cross build]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: split patches (Thomas)

 ...nfigure-Fix-cross-compilation-errors.patch | 142 ++++++++++++++++++
 ...onfigure-Simplify-pointer-size-check.patch |  76 ++++++++++
 package/memcached/memcached.hash              |   6 +-
 package/memcached/memcached.mk                |   5 +-
 4 files changed, 225 insertions(+), 4 deletions(-)
 create mode 100644 package/memcached/0001-configure-Fix-cross-compilation-errors.patch
 create mode 100644 package/memcached/0002-configure-Simplify-pointer-size-check.patch

diff --git a/package/memcached/0001-configure-Fix-cross-compilation-errors.patch b/package/memcached/0001-configure-Fix-cross-compilation-errors.patch
new file mode 100644
index 0000000000..5c5d948325
--- /dev/null
+++ b/package/memcached/0001-configure-Fix-cross-compilation-errors.patch
@@ -0,0 +1,142 @@
+From 1146bf07624b5820b942b84b68e66f0d3dd25914 Mon Sep 17 00:00:00 2001
+From: Ola Jeppsson <ola.jeppsson@gmail.com>
+Date: Mon, 7 Oct 2019 18:07:30 -0400
+Subject: [PATCH] configure: Fix cross-compilation errors
+
+AC_RUN_IFELSE does not work when cross-compiling so we need to provide
+fallback methods for those cases.
+
+I tried to use constructs that work with Autoconf 2.52.
+Alas, I wasn't able to generate a working build system with that version.
+
+Autoconf 2.58 / Automake 1.7.9 is the earliest combo that I could get
+to work (with and without this patch).
+Perhaps it's time for a slight bump for the required version numbers?
+
+Cross-compiles sucessfully against:
+riscv64-unknown-linux-gnu
+
+Downloaded from upstream PR:
+https://github.com/memcached/memcached/pull/552
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 80 +++++++++++++++++++++++++++-------------------------
+ 1 file changed, 41 insertions(+), 39 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fb78fc5..27dc939 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -264,23 +264,42 @@ return sizeof(void*) == 8 ? 0 : 1;
+     ],[
+       CFLAGS="-m64 $org_cflags"
+     ],[
+-    AC_MSG_ERROR([Don't know how to build a 64-bit object.])
++      AC_MSG_ERROR([Don't know how to build a 64-bit object.])
++    ],[
++       dnl cross compile
++       AC_MSG_WARN([Assuming no extra CFLAGS are required for cross-compiling 64bit version.])
+     ])
+ fi
+ 
+ dnl If data pointer is 64bit or not.
+-AC_RUN_IFELSE(
+-  [AC_LANG_PROGRAM([], [dnl
+-return sizeof(void*) == 8 ? 0 : 1;
+-  ])
+-],[
+-  have_64bit_ptr=yes
+-],[
++AC_CHECK_HEADERS([stdint.h])
++AS_IF([test -z "$have_64bit_ptr"],
++  [AC_RUN_IFELSE(
++     [AC_LANG_PROGRAM([], [return sizeof(void*) == 8 ? 0 : 1;])],
++     [have_64bit_ptr=yes ],
++     [have_64bit_ptr=no],
++     [dnl cross compile (this test requires C99)
++      AS_IF([test "x$ac_cv_header_stdint_h" = xyes],
++        [AC_COMPILE_IFELSE(
++           [AC_LANG_PROGRAM([
++              #include <stdint.h>
++              #if UINTPTR_MAX == 0xFFFFFFFFFFFFFFFFUL
++              /* 64 bit pointer */
++              #else
++              #error 32 bit pointer
++              #endif
++            ], [])],
++            [have_64bit_ptr=yes],
++            [have_64bit_ptr=no])],
++        [have_64bit_ptr=unknown])
++     ])
+ ])
+-
+-if test $have_64bit_ptr = yes; then
++AS_IF([test "$have_64bit_ptr" = "unknown" ],[
++  AC_MSG_ERROR([Cannot detect pointer size. Must pass have_64bit_ptr={yes,no} to configure.])
++])
++AS_IF([test "$have_64bit_ptr" = yes],[
+   AC_DEFINE(HAVE_64BIT_PTR, 1, [data pointer is 64bit])
+-fi
++])
+ 
+ # Issue 213: Search for clock_gettime to help people linking
+ #            with a static version of libevent
+@@ -570,30 +589,10 @@ fi
+ AC_C_SOCKLEN_T
+ 
+ dnl Check if we're a little-endian or a big-endian system, needed by hash code
+-AC_DEFUN([AC_C_ENDIAN],
+-[AC_CACHE_CHECK(for endianness, ac_cv_c_endian,
+-[
+-  AC_RUN_IFELSE(
+-    [AC_LANG_PROGRAM([], [dnl
+-        long val = 1;
+-        char *c = (char *) &val;
+-        exit(*c == 1);
+-    ])
+-  ],[
+-    ac_cv_c_endian=big
+-  ],[
+-    ac_cv_c_endian=little
+-  ])
+-])
+-if test $ac_cv_c_endian = big; then
+-  AC_DEFINE(ENDIAN_BIG, 1, [machine is bigendian])
+-fi
+-if test $ac_cv_c_endian = little; then
+-  AC_DEFINE(ENDIAN_LITTLE, 1, [machine is littleendian])
+-fi
+-])
+-
+-AC_C_ENDIAN
++AC_C_BIGENDIAN(
++  [AC_DEFINE(ENDIAN_BIG, 1, [machine is bigendian])],
++  [AC_DEFINE(ENDIAN_LITTLE, 1, [machine is littleendian])],
++  [AC_MSG_ERROR([Cannot detect endianness. Must pass ac_cv_c_bigendian={yes,no} to configure.])])
+ 
+ AC_DEFUN([AC_C_HTONLL],
+ [
+@@ -670,12 +669,15 @@ AC_DEFUN([AC_C_ALIGNMENT],
+   ],[
+     ac_cv_c_alignment=need
+   ],[
+-    ac_cv_c_alignment=need
++    dnl cross compile
++    ac_cv_c_alignment=maybe
+   ])
+ ])
+-if test $ac_cv_c_alignment = need; then
+-  AC_DEFINE(NEED_ALIGN, 1, [Machine need alignment])
+-fi
++AS_IF([test $ac_cv_c_alignment = need],
++  [AC_DEFINE(NEED_ALIGN, 1, [Machine need alignment])])
++AS_IF([test $ac_cv_c_alignment = maybe],
++  [AC_MSG_WARN([Assuming aligned access is required when cross-compiling])
++   AC_DEFINE(NEED_ALIGN, 1, [Machine need alignment])])
+ ])
+ 
+ AC_C_ALIGNMENT
+-- 
+2.20.1
+
diff --git a/package/memcached/0002-configure-Simplify-pointer-size-check.patch b/package/memcached/0002-configure-Simplify-pointer-size-check.patch
new file mode 100644
index 0000000000..1a5dc31963
--- /dev/null
+++ b/package/memcached/0002-configure-Simplify-pointer-size-check.patch
@@ -0,0 +1,76 @@
+From ec7f3bc97c53578d5ca332b9e86c4d08d155c5a0 Mon Sep 17 00:00:00 2001
+From: Ola Jeppsson <ola.jeppsson@gmail.com>
+Date: Mon, 7 Oct 2019 19:57:46 -0400
+Subject: [PATCH] configure: Simplify pointer size check
+
+Tested with:
+Autoconf 2.59 / Automake 1.7.9
+Autoconf 2.69 / Automake 1.16.1
+
+Downloaded from upstream PR:
+https://github.com/memcached/memcached/pull/552
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 31 ++-----------------------------
+ restart.h    |  2 +-
+ 2 files changed, 3 insertions(+), 30 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 27dc939..7e5bd5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -271,35 +271,8 @@ return sizeof(void*) == 8 ? 0 : 1;
+     ])
+ fi
+ 
+-dnl If data pointer is 64bit or not.
+-AC_CHECK_HEADERS([stdint.h])
+-AS_IF([test -z "$have_64bit_ptr"],
+-  [AC_RUN_IFELSE(
+-     [AC_LANG_PROGRAM([], [return sizeof(void*) == 8 ? 0 : 1;])],
+-     [have_64bit_ptr=yes ],
+-     [have_64bit_ptr=no],
+-     [dnl cross compile (this test requires C99)
+-      AS_IF([test "x$ac_cv_header_stdint_h" = xyes],
+-        [AC_COMPILE_IFELSE(
+-           [AC_LANG_PROGRAM([
+-              #include <stdint.h>
+-              #if UINTPTR_MAX == 0xFFFFFFFFFFFFFFFFUL
+-              /* 64 bit pointer */
+-              #else
+-              #error 32 bit pointer
+-              #endif
+-            ], [])],
+-            [have_64bit_ptr=yes],
+-            [have_64bit_ptr=no])],
+-        [have_64bit_ptr=unknown])
+-     ])
+-])
+-AS_IF([test "$have_64bit_ptr" = "unknown" ],[
+-  AC_MSG_ERROR([Cannot detect pointer size. Must pass have_64bit_ptr={yes,no} to configure.])
+-])
+-AS_IF([test "$have_64bit_ptr" = yes],[
+-  AC_DEFINE(HAVE_64BIT_PTR, 1, [data pointer is 64bit])
+-])
++dnl Check if data pointer is 64bit or not
++AC_CHECK_SIZEOF([void *])
+ 
+ # Issue 213: Search for clock_gettime to help people linking
+ #            with a static version of libevent
+diff --git a/restart.h b/restart.h
+index 76cd0a8..9de5096 100644
+--- a/restart.h
++++ b/restart.h
+@@ -4,7 +4,7 @@
+ #define RESTART_TAG_MAXLEN 255
+ 
+ // Track the pointer size for restart fiddling.
+-#ifdef HAVE_64BIT_PTR
++#if SIZEOF_VOID_P == 8
+     typedef uint64_t mc_ptr_t;
+ #else
+     typedef uint32_t mc_ptr_t;
+-- 
+2.20.1
+
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index df430cf4ff..98e47d6c07 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.5.12.tar.gz.sha1
-sha1 f67096ba64b0c47668bcad5b680010c4f8987d4c  memcached-1.5.12.tar.gz
+# From http://www.memcached.org/files/memcached-1.5.19.tar.gz.sha1
+sha1 14e6a02e743838696fcb620edf6a2fd7e60cabec  memcached-1.5.19.tar.gz
 
 # Locally computed
-sha256 c02f97d5685617b209fbe25f3464317b234d765b427d254c2413410a5c095b29  memcached-1.5.12.tar.gz
+sha256 3ddcdaa2d14d215f3111a7448b79c889c57618a26e97ad989581f1880a5a4be0  memcached-1.5.19.tar.gz
 sha256 bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index b7c36ec155..9b362d2a36 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,13 +4,16 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.5.12
+MEMCACHED_VERSION = 1.5.19
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 MEMCACHED_CONF_OPTS = --disable-coverage
 MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
+# 0001-configure-Fix-cross-compilation-errors.patch
+# 0002-configure-Simplify-pointer-size-check.patch
+MEMCACHED_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
-- 
2.20.1
