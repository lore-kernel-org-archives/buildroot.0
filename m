From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 23 Oct 2016 14:19:05 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.19
Message-ID: <20161023121905.GA15479@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All patches are upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...remove-building-for-the-host-as-it-breaks.patch | 48 ------------
 ...uargp-remove-unneeded-and-false-linker-sc.patch | 89 ----------------------
 package/uclibc/0003-cleanup-libc.a.patch           | 42 ----------
 ...include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch | 31 --------
 ...5-fix-mips-mips64-build-for-old-compilers.patch | 28 -------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 7 files changed, 2 insertions(+), 240 deletions(-)
 delete mode 100644 package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch
 delete mode 100644 package/uclibc/0002-ubacktrace-uargp-remove-unneeded-and-false-linker-sc.patch
 delete mode 100644 package/uclibc/0003-cleanup-libc.a.patch
 delete mode 100644 package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch
 delete mode 100644 package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch

diff --git a/package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch b/package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch
deleted file mode 100644
index a04c6c6..0000000
--- a/package/uclibc/0001-locale-remove-building-for-the-host-as-it-breaks.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8c53e7524dfb9127b006e773307fdaa4df899a04 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Thu, 29 Sep 2016 11:40:52 +0200
-Subject: [PATCH] locale: remove building for the host, as it breaks
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- utils/Makefile.in | 10 +---------
- 1 file changed, 1 insertion(+), 9 deletions(-)
-
-diff --git a/utils/Makefile.in b/utils/Makefile.in
-index 5457776..8666f89 100644
---- a/utils/Makefile.in
-+++ b/utils/Makefile.in
-@@ -64,10 +64,6 @@ BUILD_CFLAGS-ldd.host      := \
- 				-I$(top_srcdir)ldso/ldso/$(TARGET_ARCH) \
- 				-I$(top_srcdir)ldso/include \
- 				-include $(top_srcdir)include/elf.h
--BUILD_CFLAGS-locale.host   := \
--				-DNOT_IN_libc \
--				-I$(top_srcdir)utils/ \
--				-I.
- BUILD_CFLAGS-iconv.host    := \
- 			-include $(top_builddir)extra/locale/c8tables.h \
- 			-I$(top_srcdir)libc/misc/wchar -DL_iconv_main
-@@ -97,7 +93,6 @@ endif
- utils_OBJ := $(patsubst %,$(utils_OUT)/%,$(utils_OBJ))
- 
- hostutils_OBJ := $(patsubst %,%.host,$(utils_OBJ))
--hostutils_LOCALE_OBJ := $(patsubst %,%.host,$(utils_LOCALE_OBJ))
- 
- utils: $(utils_OBJ) $(utils_LOCALE_OBJ)
- 
-@@ -109,10 +104,7 @@ $(utils_OBJ): $(utils_OUT)/% : $(utils_DIR)/%.c | $(libc)
- $(utils_OUT)/locale: $(top_srcdir)extra/locale/programs/locale.c | $(libc)
- 	$(compile.u)
- 
--$(utils_OUT)/locale.host: $(top_srcdir)extra/locale/programs/locale.c | $(libc)
--	$(hcompile.u)
--
--hostutils: $(hostutils_OBJ) $(hostutils_LOCALE_OBJ)
-+hostutils: $(hostutils_OBJ)
- 
- $(hostutils_OBJ): $(utils_OUT)/%.host : $(utils_DIR)/%.c
- 	$(hcompile.u)
--- 
-2.1.4
-
diff --git a/package/uclibc/0002-ubacktrace-uargp-remove-unneeded-and-false-linker-sc.patch b/package/uclibc/0002-ubacktrace-uargp-remove-unneeded-and-false-linker-sc.patch
deleted file mode 100644
index dbb65c6..0000000
--- a/package/uclibc/0002-ubacktrace-uargp-remove-unneeded-and-false-linker-sc.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 15186b99774df74cf8ab02acd1a3f0ffd4c54ca1 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Fri, 30 Sep 2016 04:49:58 +0200
-Subject: [PATCH] ubacktrace/uargp: remove unneeded and false linker scripts
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- Rules.mak               | 28 ----------------------------
- extra/Configs/Config.in |  9 +++------
- 2 files changed, 3 insertions(+), 34 deletions(-)
-
-diff --git a/Rules.mak b/Rules.mak
-index 15dfa37..67189ff 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -140,7 +140,6 @@ export MAJOR_VERSION MINOR_VERSION SUBLEVEL VERSION ABI_VERSION LC_ALL
- 
- LIBC := libc
- SHARED_LIBNAME := $(LIBC).so.$(ABI_VERSION)
--UBACKTRACE_DSO := libubacktrace.so.$(ABI_VERSION)
- 
- UCLIBC_LDSO_NAME := ld-uClibc
- ARCH_NATIVE_BIT := 32
-@@ -548,33 +547,6 @@ link.asneeded = $(if $(CC_FLAG_ASNEEDED),$(if $(CC_FLAG_NO_ASNEEDED),$(CC_FLAG_A
- # Check for AS_NEEDED support in linker script (binutils>=2.16.1 has it)
- ifndef ASNEEDED
- export ASNEEDED:=$(shell $(CC) -Wl,--help 2>/dev/null | grep -q -- --as-needed && echo "AS_NEEDED ( $(UCLIBC_LDSO) )" || echo "$(UCLIBC_LDSO)")
--
--# Only used in installed libc.so linker script
--ifeq ($(UCLIBC_HAS_BACKTRACE),y)
--ifeq ($(HARDWIRED_ABSPATH),y)
--UBACKTRACE_FULL_NAME := $(subst //,/,$(RUNTIME_PREFIX)$(MULTILIB_DIR)/$(UBACKTRACE_DSO))
--else
--UBACKTRACE_FULL_NAME := $(UBACKTRACE_DSO)
--endif
--export UBACKTRACE_ASNEEDED:=$(shell $(CC) -Wl,--help 2>/dev/null | grep -q -- --as-needed && \
--	echo "GROUP ( AS_NEEDED ( $(UBACKTRACE_FULL_NAME) ) )" || \
--	echo "GROUP ( $(UBACKTRACE_FULL_NAME) )")
--else
--export UBACKTRACE_ASNEEDED:=""
--endif
--ifeq ($(UCLIBC_HAS_ARGP),y)
--ifeq ($(HARDWIRED_ABSPATH),y)
--# Only used in installed libc.so linker script
--UARGP_FULL_NAME := $(subst //,/,$(RUNTIME_PREFIX)$(MULTILIB_DIR)/libuargp.so.$(MAJOR_VERSION))
--else
--UARGP_FULL_NAME := libuargp.so.$(MAJOR_VERSION)
--endif
--export UARGP_ASNEEDED:=$(shell $(CC) -Wl,--help 2>/dev/null | grep -q -- --as-needed && \
--	echo "GROUP ( AS_NEEDED ( $(UARGP_FULL_NAME) ) )" || \
--	echo "GROUP ( $(UARGP_FULL_NAME) )")
--else
--export UARGP_ASNEEDED:=""
--endif
- endif
- 
- # Add a bunch of extra pedantic annoyingly strict checks
-diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
-index fc6669b..c5e54e1 100644
---- a/extra/Configs/Config.in
-+++ b/extra/Configs/Config.in
-@@ -1896,8 +1896,6 @@ config UCLIBC_HAS_ARGP
- 	  `--help' and `--version' options.
- 	  A library can export an argp option parser, which programs can easily
- 	  use in conjunction with their own option parser.
--	  A new shared object "libuargp" is created. The "libc.so" linker script
--	  contains the AS_NEEDED entry for getting the libuargp linked automatically.
- 	  Argp support is needed by elfutils libdw.
- 
- 	  Most people can safely answer N.
-@@ -2391,12 +2389,11 @@ config UCLIBC_HAS_BACKTRACE
- 	bool "Add support for application self-debugging"
- 	depends on HAVE_SHARED
- 	help
--	  Answer Y here to compile support for application self-debugging, by adding
--	  a new shared object "libubacktrace.so" that provides the following new
--	  functions:
-+	  Answer Y here to compile support for application self-debugging that
-+	  provides the following new functions:
- 	  backtrace, backtrace_symbols, backtrace_symbols_fd
- 
--	  The backtrace functionality is currently supported on SH platform, and it
-+	  The backtrace functionality is currently supported on some platforms, and it
- 	  based on dwarf2 informations to properly work, so any application that
- 	  want to use backtrace needs to be built with -fexceptions flag.
- 
--- 
-2.1.4
-
diff --git a/package/uclibc/0003-cleanup-libc.a.patch b/package/uclibc/0003-cleanup-libc.a.patch
deleted file mode 100644
index 5fa2709..0000000
--- a/package/uclibc/0003-cleanup-libc.a.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9b1077dc70e52ee85a718bce3fcfec7ae9af2967 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sat, 8 Oct 2016 05:43:09 +0200
-Subject: [PATCH] cleanup libc.a
-
-The nested libpthread_nonshared.a and libdl.os shouldn't be included
-in the static libc.a. Fixes compile issues for static builds.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/Makefile.in            | 1 -
- libpthread/nptl/Makefile.in | 2 --
- 2 files changed, 3 deletions(-)
-
-diff --git a/libc/Makefile.in b/libc/Makefile.in
-index 55fd3d3..85986a7 100644
---- a/libc/Makefile.in
-+++ b/libc/Makefile.in
-@@ -44,7 +44,6 @@ endif
- 
- libc-a-y += $(libnsl-a-y)
- libc-a-y += $(libresolv-a-y)
--libc-a-$(HAVE_SHARED) += $(libdl-a-y)
- libc-a-y += $(libm-a-y)
- libc-a-$(UCLIBC_HAS_LIBUTIL) += $(libutil-a-y)
- libc-a-$(UCLIBC_HAS_CRYPT) += $(libcrypt-a-y)
-diff --git a/libpthread/nptl/Makefile.in b/libpthread/nptl/Makefile.in
-index 0fc83e2..068eee4 100644
---- a/libpthread/nptl/Makefile.in
-+++ b/libpthread/nptl/Makefile.in
-@@ -41,8 +41,6 @@ else
- libpthread-a-y := $(libpthread-static-y)
- endif
- 
--libpthread-a-y += $(top_builddir)lib/libpthread_nonshared.a
--
- libc-shared-routines-y := $(filter-out $(notdir $(libpthread_libc_OBJS:.o=.c)), $(libc-shared-routines-y))
- libc-static-routines-y := $(filter-out $(notdir $(libpthread_libc_OBJS:.o=.c)), $(libc-static-routines-y))
- libc-shared-routines-y := $(addprefix $(libpthread_OUT)/,$(libc-shared-routines-y:.c=.oS))
--- 
-2.1.4
-
diff --git a/package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch b/package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch
deleted file mode 100644
index 686e15f..0000000
--- a/package/uclibc/0004-ppc-do-not-include-copysgnl.c-if-UCLIBC_HAS_LONG_DOU.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7136bb422a0681d787d07dc2936f08395b8a1007 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sat, 8 Oct 2016 18:03:27 +0200
-Subject: [PATCH] ppc: do not include copysgnl.c if
- UCLIBC_HAS_LONG_DOUBLE_MATH enabled
-
-Fixes compilation of uClibc-ng when UCLIBC_HAS_LONG_DOUBLE_MATH is
-used.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/sysdeps/linux/powerpc/Makefile.arch | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/powerpc/Makefile.arch b/libc/sysdeps/linux/powerpc/Makefile.arch
-index 7c09c87..f0144e7 100644
---- a/libc/sysdeps/linux/powerpc/Makefile.arch
-+++ b/libc/sysdeps/linux/powerpc/Makefile.arch
-@@ -5,7 +5,8 @@
- # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
- #
- 
--CSRC-y := __syscall_error.c ioctl.c copysignl.c
-+CSRC-y := __syscall_error.c ioctl.c
-+CSRC-$(if $(UCLIBC_HAS_LONG_DOUBLE_MATH),,y) += copysignl.c
- 
- SSRC-y := \
- 	__longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
--- 
-2.1.4
-
diff --git a/package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch b/package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch
deleted file mode 100644
index 1475132..0000000
--- a/package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 43c4bbf3e0e61f5f487a00a0066816913503656c Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sun, 9 Oct 2016 20:15:00 +0200
-Subject: [PATCH] fix mips/mips64 build for old compilers
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- Rules.mak | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Rules.mak b/Rules.mak
-index 67189ff..b9dbf25 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -404,8 +404,8 @@ ifeq ($(TARGET_ARCH),mips)
- 	CPU_CFLAGS-$(CONFIG_MIPS_N64_ABI)+=-mabi=64
- 	CPU_CFLAGS-$(CONFIG_MIPS_O32_ABI)+=-mabi=32
- 	CPU_CFLAGS-$(CONFIG_MIPS_N32_ABI)+=-mabi=n32
--	CPU_CFLAGS-$(CONFIG_MIPS_NAN_LEGACY)+=-mnan=legacy
--	CPU_CFLAGS-$(CONFIG_MIPS_NAN_2008)+=-mnan=2008
-+	CPU_CFLAGS-$(CONFIG_MIPS_NAN_LEGACY)+=$(call check_gcc,-mnan=legacy)
-+	CPU_CFLAGS-$(CONFIG_MIPS_NAN_2008)+=$(call check_gcc,-mnan=2008)
- 	CPU_LDFLAGS-y += $(CPU_CFLAGS)
- endif
- 
--- 
-2.1.4
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index ebc2dc0..227c783 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  5430bb3acde31d70db906be33e3e2a022beba42b50f2c56695d37344560e253f        uClibc-ng-1.0.18.tar.xz
+sha256  b3f94d67e9afcefb158a37011584e0d41ef3bd55ad72255a26abb25ad49b77a1        uClibc-ng-1.0.19.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index da83d8a..3f383a8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.18
+UCLIBC_VERSION = 1.0.19
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
-- 
2.1.4
