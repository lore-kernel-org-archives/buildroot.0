From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun,  5 Mar 2017 15:40:14 -0300
Subject: [Buildroot] [PATCH] chocolate-doom: bump to version 2.3.0
Message-ID: <1488739214-32676-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patches that have been merged upstream.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 ...ruct-attribute-directive-ignored-warnings.patch | 49 -------------
 ...-configure-fix-with-PACKAGE-option-checks.patch | 67 ------------------
 ...se-of-ioperm-inb-outb-to-x86-architecture.patch | 80 ----------------------
 package/chocolate-doom/chocolate-doom.hash         |  2 +-
 package/chocolate-doom/chocolate-doom.mk           |  2 +-
 5 files changed, 2 insertions(+), 198 deletions(-)
 delete mode 100644 package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
 delete mode 100644 package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-checks.patch
 delete mode 100644 package/chocolate-doom/0003-opl-limit-use-of-ioperm-inb-outb-to-x86-architecture.patch

diff --git a/package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch b/package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
deleted file mode 100644
index bff8e3e..0000000
--- a/package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d9c517d9a4e168c1f7ed28ad0eb9365d69f5ceb2 Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Thu, 22 Oct 2015 11:29:55 -0200
-Subject: [PATCH] Fix "`gcc_struct' attribute directive ignored" warnings
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Compilation for target architectures other than i386, x86_64 or PowerPC
-(e.g. ARM) caused multiple warnings like the following to appear:
-
-  doomdata.h:75:1: warning: ?gcc_struct? attribute directive ignored
-   } PACKEDATTR mapsidedef_t;
-   ^
-
-This was due to 'gcc_struct' being undefined for these architectures.
-Since that attribute was actually introduced by commit 87db726b9a9ae61ca
-to address the fact that -mms-bitfields became the default for GCC on
-Windows, limit it to that case.
-
-Upstream-status: accepted, not yet released.
-https://github.com/chocolate-doom/chocolate-doom/pull/629
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- src/doomtype.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/doomtype.h b/src/doomtype.h
-index bf0a40e..77c026c 100644
---- a/src/doomtype.h
-+++ b/src/doomtype.h
-@@ -52,10 +52,10 @@
- 
- #ifdef __GNUC__
- 
--#ifdef __clang__
--#define PACKEDATTR __attribute__((packed))
--#else
-+#if defined(_WIN32) && !defined(__clang__)
- #define PACKEDATTR __attribute__((packed,gcc_struct))
-+#else
-+#define PACKEDATTR __attribute__((packed))
- #endif
- 
- #else
--- 
-2.1.4
-
diff --git a/package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-checks.patch b/package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-checks.patch
deleted file mode 100644
index f4d09f5..0000000
--- a/package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-checks.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From fd12fa91aa8e35dbd3ffa5bfe055baf6bde0cd63 Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Thu, 22 Oct 2015 15:28:11 -0200
-Subject: [PATCH] configure: fix --with-PACKAGE option checks
-
-Options of the form --with-PACKAGE[=yes] (e.g. --with-libpng), when
-passed to configure, were being treated as though --without-PACKAGE had
-been given.
-
-Although the intention is to have configure check and use PACKAGE by
-default if it's available, thus requiring the user to pass an option
-only if PACKAGE must NOT be used, there are times when the opposite
-might be desired (i.e. the user wants to indicate PACKAGE MUST be used).
-Moreover, allowing --with-PACKAGE and behaving as if --without-PACKAGE
-had been specified is in itself quite confusing.
-
-Fix that by testing the result of 'with_PACKAGE' in configure.ac and
-acting accordingly instead of blindly assuming a 'no'.
-
-Upstream-status: accepted, not yet released.
-https://github.com/chocolate-doom/chocolate-doom/pull/630
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- configure.ac | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ee97fe2..7b03485 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -80,7 +80,14 @@ AC_SDL_MAIN_WORKAROUND([
-         [Build without libsamplerate @<:@default=check@:>@]),
-     [],
-     [
--        AC_CHECK_LIB(samplerate, src_new)
-+        [with_libsamplerate=check]
-+    ])
-+    AS_IF([test "x$with_libsamplerate" != xno], [
-+        AC_CHECK_LIB(samplerate, src_new, [], [
-+            AS_IF([test "x$with_libsamplerate" != xcheck], [AC_MSG_FAILURE(
-+                [--with-libsamplerate was given, but test for libsamplerate failed])
-+            ])
-+        ])
-     ])
-     # Check for libpng.
-     AC_ARG_WITH([libpng],
-@@ -88,8 +95,15 @@ AC_SDL_MAIN_WORKAROUND([
-         [Build without libpng @<:@default=check@:>@]),
-     [],
-     [
-+        [with_libpng=check]
-+    ])
-+    AS_IF([test "x$with_libpng" != xno], [
-         AC_CHECK_LIB(z, zlibVersion)
--        AC_CHECK_LIB(png, png_get_io_ptr)
-+        AC_CHECK_LIB(png, png_get_io_ptr, [], [
-+            AS_IF([test "x$with_libpng" != xcheck], [AC_MSG_FAILURE(
-+                [--with-libpng was given, but test for libpng failed])
-+            ])
-+        ])
-     ])
-     AC_CHECK_LIB(m, log)
- 
--- 
-2.1.4
-
diff --git a/package/chocolate-doom/0003-opl-limit-use-of-ioperm-inb-outb-to-x86-architecture.patch b/package/chocolate-doom/0003-opl-limit-use-of-ioperm-inb-outb-to-x86-architecture.patch
deleted file mode 100644
index 860f563..0000000
--- a/package/chocolate-doom/0003-opl-limit-use-of-ioperm-inb-outb-to-x86-architecture.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 87c7399305b30045a856d737bbfd8f59b8f52392 Mon Sep 17 00:00:00 2001
-From: Rodrigo Rebello <rprebello@gmail.com>
-Date: Fri, 6 Nov 2015 12:14:01 -0200
-Subject: [PATCH] opl: limit use of ioperm/inb/outb to x86 architecture
-
-The use of I/O ports in the Linux driver to directly control OPL chips
-is x86 specific and only really makes sense for x86-based PC's with
-compatible hardware.
-
-For some architectures (e.g. ARM), ioperm, inb and outb do exist and are
-detected by the configure script (via AC_CHECK_FUNCS(ioperm)), but their
-use is inappropriate in these cases and should be avoided.
-
-In some other scenarios, like when using a GNU toolchain + uClibc for
-PowerPC, the build even fails with the following error:
-
-  opl_linux.c:26:20: fatal error: sys/io.h: No such file or directory
-
-That is so because ioperm() is exported by uClibc and gets detected by
-configure, which enables the "Linux" driver via definition of
-HAVE_IOPERM, but in practice 'sys/io.h' is missing for ppc (inb/outb is
-not implemented, and the call to ioperm() would return EIO anyway).
-
-So, besides testing for HAVE_IOPERM, also test if either __i386__ or
-__x86_64__ are defined before enabling this OPL driver.
-
-Upstream-status: accepted, not yet released.
-https://github.com/chocolate-doom/chocolate-doom/pull/638
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- opl/opl.c       | 4 ++--
- opl/opl_linux.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/opl/opl.c b/opl/opl.c
-index 60f027d..0d25689 100644
---- a/opl/opl.c
-+++ b/opl/opl.c
-@@ -27,7 +27,7 @@
- 
- //#define OPL_DEBUG_TRACE
- 
--#ifdef HAVE_IOPERM
-+#if (defined(__i386__) || defined(__x86_64__)) && defined(HAVE_IOPERM)
- extern opl_driver_t opl_linux_driver;
- #endif
- #if defined(HAVE_LIBI386) || defined(HAVE_LIBAMD64)
-@@ -40,7 +40,7 @@ extern opl_driver_t opl_sdl_driver;
- 
- static opl_driver_t *drivers[] =
- {
--#ifdef HAVE_IOPERM
-+#if (defined(__i386__) || defined(__x86_64__)) && defined(HAVE_IOPERM)
-     &opl_linux_driver,
- #endif
- #if defined(HAVE_LIBI386) || defined(HAVE_LIBAMD64)
-diff --git a/opl/opl_linux.c b/opl/opl_linux.c
-index 5df5d46..19e4c3e 100644
---- a/opl/opl_linux.c
-+++ b/opl/opl_linux.c
-@@ -17,7 +17,7 @@
- 
- #include "config.h"
- 
--#ifdef HAVE_IOPERM
-+#if (defined(__i386__) || defined(__x86_64__)) && defined(HAVE_IOPERM)
- 
- #include <stdio.h>
- #include <string.h>
-@@ -99,5 +99,5 @@ opl_driver_t opl_linux_driver =
-     OPL_Timer_AdjustCallbacks,
- };
- 
--#endif /* #ifdef HAVE_IOPERM */
-+#endif /* #if (defined(__i386__) || defined(__x86_64__)) && defined(HAVE_IOPERM) */
- 
--- 
-2.1.4
-
diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
index bdf5698..6751c7d 100644
--- a/package/chocolate-doom/chocolate-doom.hash
+++ b/package/chocolate-doom/chocolate-doom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	ad11e2871667c6fa0658abf2dcba0cd9b26fbd651ee8df55adfdc18ad8fd674a	chocolate-doom-2.2.1.tar.gz
+sha256	3e6d1a82ac5c8b025a9695ce1e47d0dc6ed142ebb1129b1e4a70e2740f79150c	chocolate-doom-2.3.0.tar.gz
diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index dad7352..7283092 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHOCOLATE_DOOM_VERSION = 2.2.1
+CHOCOLATE_DOOM_VERSION = 2.3.0
 CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
 CHOCOLATE_DOOM_LICENSE = GPLv2+
 CHOCOLATE_DOOM_LICENSE_FILES = COPYING
-- 
2.1.4
