From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 19:18:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libunwind: bump to version 1.3.1
Message-ID: <20190407171820.3379-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first, third and fourth patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} |  0
 .../0001-add-disable-tests-option.patch       | 68 --------------
 ...n-of-tests-on-alpine-linux-musl-libc.patch | 88 -------------------
 ...ind-arm-fix-build-failure-due-to-asm.patch | 43 ---------
 package/libunwind/libunwind.hash              |  5 +-
 package/libunwind/libunwind.mk                |  2 +-
 6 files changed, 5 insertions(+), 201 deletions(-)
 rename package/libunwind/{0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch => 0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} (100%)
 delete mode 100644 package/libunwind/0001-add-disable-tests-option.patch
 delete mode 100644 package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
 delete mode 100644 package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch

diff --git a/package/libunwind/0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
similarity index 100%
rename from package/libunwind/0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
rename to package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
diff --git a/package/libunwind/0001-add-disable-tests-option.patch b/package/libunwind/0001-add-disable-tests-option.patch
deleted file mode 100644
index 72a168615f..0000000000
--- a/package/libunwind/0001-add-disable-tests-option.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 208a430bcbab7d63a4c04242f13c4740e0246a56 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=D0=9A=D0=BE=D1=80=D0=BE=D0=BB=D0=B5=D0=B2=20=D0=A1=D0=B5?=
- =?UTF-8?q?=D1=80=D0=B3=D0=B5=D0=B9?= <korolev.sergey@gmail.com>
-Date: Wed, 11 May 2016 22:48:55 +0300
-Subject: [PATCH] add --disable-tests option
-
-Allows to skip tests build.
-
-Backported from upstream master branch:
-https://github.com/libunwind/libunwind/commit/208a430bcbab7d63a4c04242f13c4740e0246a56
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Makefile.am  |  6 +++++-
- configure.ac | 13 +++++++++++--
- 2 files changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 6a3ed9e..0c29b3e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -42,7 +42,11 @@ endif
- 
- nodist_include_HEADERS = include/libunwind-common.h
- 
--SUBDIRS = src tests
-+SUBDIRS = src
-+
-+if CONFIG_TESTS
-+SUBDIRS += tests
-+endif
- 
- if CONFIG_DOCS
- SUBDIRS += doc
-diff --git a/configure.ac b/configure.ac
-index 863fb8f..6c46cf3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,6 +129,10 @@ AC_ARG_ENABLE(documentation,
- 	AS_HELP_STRING([--disable-documentation],[Disable generating the man pages]),,
- 	[enable_documentation=yes])
- 
-+AC_ARG_ENABLE(tests,
-+ AS_HELP_STRING([--disable-tests],[Disable tests build]),,
-+ [enable_tests=yes])
-+
- AC_MSG_CHECKING([if we should build libunwind-setjmp])
- AC_MSG_RESULT([$enable_setjmp])
- 
-@@ -396,8 +400,13 @@ if test "x$enable_documentation" = "xyes"; then
-   AC_CONFIG_FILES(doc/Makefile doc/common.tex)
- fi
- 
--AC_CONFIG_FILES(Makefile src/Makefile tests/Makefile tests/check-namespace.sh
--		include/libunwind-common.h
-+AM_CONDITIONAL([CONFIG_TESTS], [test x$enable_tests = xyes])
-+if test "x$enable_tests" = "xyes"; then
-+  AC_CONFIG_FILES(tests/Makefile tests/check-namespace.sh)
-+fi
-+
-+AC_CONFIG_FILES(Makefile src/Makefile
-+                include/libunwind-common.h
-                 include/libunwind.h include/tdep/libunwind_i.h)
- AC_CONFIG_FILES(src/unwind/libunwind.pc src/coredump/libunwind-coredump.pc
-                 src/ptrace/libunwind-ptrace.pc src/setjmp/libunwind-setjmp.pc
--- 
-2.11.0
-
diff --git a/package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch b/package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
deleted file mode 100644
index 411b40d10a..0000000000
--- a/package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 5dcb7cd3cb63bf8a3a5f7531d10f937053930a25 Mon Sep 17 00:00:00 2001
-From: Tony Kelman <tony@kelman.net>
-Date: Sun, 31 Jan 2016 08:31:04 +0000
-Subject: [PATCH] Fix compilation of tests on alpine linux (musl libc)
-
-If we don't link to libexecinfo, as detected by the
-AC_SEARCH_LIBS(backtrace, execinfo) configure probe, we get
-
-```
-test-coredump-unwind.o: In function `handle_sigsegv':
-/home/libunwind/tests/test-coredump-unwind.c:246: undefined reference to
-`backtrace_symbols_fd'
-collect2: error: ld returned 1 exit status
-Makefile:1187: recipe for target 'test-coredump-unwind' failed
-```
-
-and
-
-```
-Gtest-init.o: In function `do_backtrace()':
-Gtest-init.cxx:(.text+0x2f): undefined reference to `_Ux86_64_getcontext'
-Gtest-init.cxx:(.text+0x48): undefined reference to `_Ux86_64_init_local'
-Gtest-init.cxx:(.text+0x63): undefined reference to `_Ux86_64_get_reg'
-Gtest-init.cxx:(.text+0x96): undefined reference to `_Ux86_64_get_proc_name'
-Gtest-init.cxx:(.text+0x171): undefined reference to `_Ux86_64_step'
-collect2: error: ld returned 1 exit status
-Makefile:1063: recipe for target 'Gtest-init' failed
-```
-
-There are 2 XFAIL and 6 FAIL tests, but it's a start
-
-Backported from upstream master branch:
-https://github.com/libunwind/libunwind/commit/5dcb7cd3cb63bf8a3a5f7531d10f937053930a25
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac      | 5 +++++
- tests/Makefile.am | 4 ++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6c46cf3..21bae90 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -373,6 +373,10 @@ old_LIBS="$LIBS"
- LIBS=""
- AC_SEARCH_LIBS(backtrace, execinfo)
- LIBS="$old_LIBS"
-+case "$ac_cv_search_backtrace" in
-+  -l*) BACKTRACELIB=$ac_cv_search_backtrace;;
-+  *) BACKTRACELIB="";;
-+esac
- 
- AC_SUBST(build_arch)
- AC_SUBST(target_os)
-@@ -388,6 +392,7 @@ AC_SUBST(PKG_MAINTAINER)
- AC_SUBST(enable_cxx_exceptions)
- AC_SUBST(enable_debug_frame)
- AC_SUBST(DLLIB)
-+AC_SUBST(BACKTRACELIB)
- 
- AC_PATH_PROG([LATEX2MAN],[latex2man])
- if test "x$LATEX2MAN" = "x"; then
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0a74881..cd3e589 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -179,7 +179,7 @@ Gtest_bt_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
- Gtest_concurrent_LDADD = $(LIBUNWIND) $(LIBUNWIND_local) -lpthread
- Gtest_dyn1_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
- Gtest_exc_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
--Gtest_init_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
-+Gtest_init_LDADD = $(LIBUNWIND) $(LIBUNWIND_local) @BACKTRACELIB@
- Gtest_resume_sig_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
- Gtest_resume_sig_rt_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
- Gperf_simple_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
-@@ -203,7 +203,7 @@ test_setjmp_LDADD = $(LIBUNWIND_setjmp)
- ia64_test_setjmp_LDADD = $(LIBUNWIND_setjmp)
- 
- if BUILD_COREDUMP
--test_coredump_unwind_LDADD = $(LIBUNWIND_coredump) $(LIBUNWIND)
-+test_coredump_unwind_LDADD = $(LIBUNWIND_coredump) $(LIBUNWIND) @BACKTRACELIB@
- endif
- 
- Gia64_test_nat_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
--- 
-2.11.0
-
diff --git a/package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch b/package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch
deleted file mode 100644
index cfd0c5501b..0000000000
--- a/package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c7ab998ec52b09d61ec3c0ea62aa07cd26077ea3 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Mon, 3 Jul 2017 14:43:02 +0200
-Subject: [PATCH] libunwind-arm: fix build failure due to asm()
-
-The gcc documentation [1] suggest to use __asm__ instead of asm.
-
-Fixes:
-http://autobuild.buildroot.net/results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53
-
-[1] https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- include/libunwind-arm.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/libunwind-arm.h b/include/libunwind-arm.h
-index f208487..1c856fa 100644
---- a/include/libunwind-arm.h
-+++ b/include/libunwind-arm.h
-@@ -265,7 +265,7 @@ unw_tdep_context_t;
- #ifndef __thumb__
- #define unw_tdep_getcontext(uc) (({                                     \
-   unw_tdep_context_t *unw_ctx = (uc);                                   \
--  register unsigned long *unw_base asm ("r0") = unw_ctx->regs;          \
-+  register unsigned long *unw_base __asm__ ("r0") = unw_ctx->regs;      \
-   __asm__ __volatile__ (                                                \
-     "stmia %[base], {r0-r15}"                                           \
-     : : [base] "r" (unw_base) : "memory");                              \
-@@ -273,7 +273,7 @@ unw_tdep_context_t;
- #else /* __thumb__ */
- #define unw_tdep_getcontext(uc) (({                                     \
-   unw_tdep_context_t *unw_ctx = (uc);                                   \
--  register unsigned long *unw_base asm ("r0") = unw_ctx->regs;          \
-+  register unsigned long *unw_base __asm__ ("r0") = unw_ctx->regs;      \
-   __asm__ __volatile__ (                                                \
-     ".align 2\nbx pc\nnop\n.code 32\n"                                  \
-     "stmia %[base], {r0-r15}\n"                                         \
--- 
-2.9.4
-
diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 2f6c8ec79b..394bef1287 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb  libunwind-1.2.1.tar.gz
+sha256 43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8  libunwind-1.3.1.tar.gz
+
+#?Hash for license file
+sha256 6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 7adf318962..94d1899bd3 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.2.1
+LIBUNWIND_VERSION = 1.3.1
 LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
-- 
2.20.1
