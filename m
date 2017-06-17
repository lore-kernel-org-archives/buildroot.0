From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 16:38:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libunwind: bump version to 1.2.1
Message-ID: <20170617143808.30559-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backported patch from master branch which implements --disable-tests
configure option, removed original patch 0001, added _CONF_OPTS.

Removed patch 0003, applied upstream:
https://github.com/libunwind/libunwind/commit/f1684379dfaf8018d5d4c1945e292a56d0fab245

Added upstream patch to fix musl build.

Tested using this defconfig

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_LTRACE=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_LIBJPEG=y
BR2_PACKAGE_LIBUNWIND=y

with test-pkg

                armv5-ctng-linux-gnueabi [ 1/49]: OK
              armv7-ctng-linux-gnueabihf [ 2/49]: OK
                        br-aarch64-glibc [ 3/49]: SKIPPED
                           br-arcle-hs38 [ 4/49]: SKIPPED
                            br-arm-basic [ 5/49]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/49]: OK
                   br-arm-cortex-a9-musl [ 7/49]: SKIPPED
                   br-arm-cortex-m4-full [ 8/49]: SKIPPED
                             br-arm-full [ 9/49]: OK
                    br-arm-full-nothread [10/49]: SKIPPED
                      br-arm-full-static [11/49]: SKIPPED
                            br-bfin-full [12/49]: SKIPPED
                   br-i386-pentium4-full [13/49]: SKIPPED
                br-i386-pentium-mmx-musl [14/49]: SKIPPED
                       br-m68k-5208-full [15/49]: SKIPPED
                      br-m68k-68040-full [16/49]: SKIPPED
                    br-microblazeel-full [17/49]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/49]: OK
                      br-mips64-n64-full [19/49]: SKIPPED
                 br-mips64r6-el-hf-glibc [20/49]: SKIPPED
                      br-mipsel-o32-full [21/49]: OK
                          br-nios2-glibc [22/49]: SKIPPED
                      br-openrisc-uclibc [23/49]: SKIPPED
               br-powerpc-603e-basic-cpp [24/49]: SKIPPED
             br-powerpc64le-power8-glibc [25/49]: SKIPPED
               br-powerpc64-power7-glibc [26/49]: SKIPPED
                  br-powerpc-e500mc-full [27/49]: SKIPPED
                             br-sh4-full [28/49]: SKIPPED
                        br-sparc64-glibc [29/49]: SKIPPED
                         br-sparc-uclibc [30/49]: SKIPPED
                    br-x86-64-core2-full [31/49]: OK
                          br-x86-64-musl [32/49]: SKIPPED
                          br-xtensa-full [33/49]: SKIPPED
                     i686-ctng-linux-gnu [34/49]: OK
                          linaro-aarch64 [35/49]: SKIPPED
                              linaro-arm [36/49]: OK
             mips64el-ctng_n32-linux-gnu [37/49]: SKIPPED
             mips64el-ctng_n64-linux-gnu [38/49]: SKIPPED
        powerpc-ctng_e500v2-linux-gnuspe [39/49]: OK
                     sourcery-arm-armv4t [40/49]: OK
                            sourcery-arm [41/49]: OK
                     sourcery-arm-thumb2 [42/49]: OK
                         sourcery-mips64 [43/49]: SKIPPED
                           sourcery-mips [44/49]: OK
                          sourcery-nios2 [45/49]: SKIPPED
                             sourcery-sh [46/49]: SKIPPED
                         sourcery-x86-64 [47/49]: OK
                            sourcery-x86 [48/49]: OK
           x86_64-ctng_locales-linux-gnu [49/49]: OK

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../libunwind/0001-add-disable-tests-option.patch  | 68 +++++++++++++++++
 package/libunwind/0001-disable-tests.patch         | 32 --------
 ...lation-of-tests-on-alpine-linux-musl-libc.patch | 88 ++++++++++++++++++++++
 ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 41 ----------
 package/libunwind/libunwind.hash                   |  2 +-
 package/libunwind/libunwind.mk                     |  4 +-
 6 files changed, 160 insertions(+), 75 deletions(-)
 create mode 100644 package/libunwind/0001-add-disable-tests-option.patch
 delete mode 100644 package/libunwind/0001-disable-tests.patch
 create mode 100644 package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
 delete mode 100644 package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch

diff --git a/package/libunwind/0001-add-disable-tests-option.patch b/package/libunwind/0001-add-disable-tests-option.patch
new file mode 100644
index 000000000..72a168615
--- /dev/null
+++ b/package/libunwind/0001-add-disable-tests-option.patch
@@ -0,0 +1,68 @@
+From 208a430bcbab7d63a4c04242f13c4740e0246a56 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=D0=9A=D0=BE=D1=80=D0=BE=D0=BB=D0=B5=D0=B2=20=D0=A1=D0=B5?=
+ =?UTF-8?q?=D1=80=D0=B3=D0=B5=D0=B9?= <korolev.sergey@gmail.com>
+Date: Wed, 11 May 2016 22:48:55 +0300
+Subject: [PATCH] add --disable-tests option
+
+Allows to skip tests build.
+
+Backported from upstream master branch:
+https://github.com/libunwind/libunwind/commit/208a430bcbab7d63a4c04242f13c4740e0246a56
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 13 +++++++++++--
+ 2 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6a3ed9e..0c29b3e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -42,7 +42,11 @@ endif
+ 
+ nodist_include_HEADERS = include/libunwind-common.h
+ 
+-SUBDIRS = src tests
++SUBDIRS = src
++
++if CONFIG_TESTS
++SUBDIRS += tests
++endif
+ 
+ if CONFIG_DOCS
+ SUBDIRS += doc
+diff --git a/configure.ac b/configure.ac
+index 863fb8f..6c46cf3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,6 +129,10 @@ AC_ARG_ENABLE(documentation,
+ 	AS_HELP_STRING([--disable-documentation],[Disable generating the man pages]),,
+ 	[enable_documentation=yes])
+ 
++AC_ARG_ENABLE(tests,
++ AS_HELP_STRING([--disable-tests],[Disable tests build]),,
++ [enable_tests=yes])
++
+ AC_MSG_CHECKING([if we should build libunwind-setjmp])
+ AC_MSG_RESULT([$enable_setjmp])
+ 
+@@ -396,8 +400,13 @@ if test "x$enable_documentation" = "xyes"; then
+   AC_CONFIG_FILES(doc/Makefile doc/common.tex)
+ fi
+ 
+-AC_CONFIG_FILES(Makefile src/Makefile tests/Makefile tests/check-namespace.sh
+-		include/libunwind-common.h
++AM_CONDITIONAL([CONFIG_TESTS], [test x$enable_tests = xyes])
++if test "x$enable_tests" = "xyes"; then
++  AC_CONFIG_FILES(tests/Makefile tests/check-namespace.sh)
++fi
++
++AC_CONFIG_FILES(Makefile src/Makefile
++                include/libunwind-common.h
+                 include/libunwind.h include/tdep/libunwind_i.h)
+ AC_CONFIG_FILES(src/unwind/libunwind.pc src/coredump/libunwind-coredump.pc
+                 src/ptrace/libunwind-ptrace.pc src/setjmp/libunwind-setjmp.pc
+-- 
+2.11.0
+
diff --git a/package/libunwind/0001-disable-tests.patch b/package/libunwind/0001-disable-tests.patch
deleted file mode 100644
index 05475a5d6..000000000
--- a/package/libunwind/0001-disable-tests.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Disable building of tests
-
-libunwind tests do not build with uClibc, so we disable them.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -36,7 +36,7 @@
- 
- nodist_include_HEADERS = include/libunwind-common.h
- 
--SUBDIRS = src tests doc
-+SUBDIRS = src doc
- 
- noinst_HEADERS = include/dwarf.h include/dwarf_i.h include/dwarf-eh.h	\
- 	include/compiler.h include/libunwind_i.h include/mempool.h	\
-Index: b/Makefile.in
-===================================================================
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -313,7 +313,7 @@
- 	$(am__append_7) $(am__append_8) $(am__append_9) \
- 	$(am__append_10)
- nodist_include_HEADERS = include/libunwind-common.h
--SUBDIRS = src tests doc
-+SUBDIRS = src doc
- noinst_HEADERS = include/dwarf.h include/dwarf_i.h include/dwarf-eh.h	\
- 	include/compiler.h include/libunwind_i.h include/mempool.h	\
- 	include/remote.h						\
diff --git a/package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch b/package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
new file mode 100644
index 000000000..411b40d10
--- /dev/null
+++ b/package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
@@ -0,0 +1,88 @@
+From 5dcb7cd3cb63bf8a3a5f7531d10f937053930a25 Mon Sep 17 00:00:00 2001
+From: Tony Kelman <tony@kelman.net>
+Date: Sun, 31 Jan 2016 08:31:04 +0000
+Subject: [PATCH] Fix compilation of tests on alpine linux (musl libc)
+
+If we don't link to libexecinfo, as detected by the
+AC_SEARCH_LIBS(backtrace, execinfo) configure probe, we get
+
+```
+test-coredump-unwind.o: In function `handle_sigsegv':
+/home/libunwind/tests/test-coredump-unwind.c:246: undefined reference to
+`backtrace_symbols_fd'
+collect2: error: ld returned 1 exit status
+Makefile:1187: recipe for target 'test-coredump-unwind' failed
+```
+
+and
+
+```
+Gtest-init.o: In function `do_backtrace()':
+Gtest-init.cxx:(.text+0x2f): undefined reference to `_Ux86_64_getcontext'
+Gtest-init.cxx:(.text+0x48): undefined reference to `_Ux86_64_init_local'
+Gtest-init.cxx:(.text+0x63): undefined reference to `_Ux86_64_get_reg'
+Gtest-init.cxx:(.text+0x96): undefined reference to `_Ux86_64_get_proc_name'
+Gtest-init.cxx:(.text+0x171): undefined reference to `_Ux86_64_step'
+collect2: error: ld returned 1 exit status
+Makefile:1063: recipe for target 'Gtest-init' failed
+```
+
+There are 2 XFAIL and 6 FAIL tests, but it's a start
+
+Backported from upstream master branch:
+https://github.com/libunwind/libunwind/commit/5dcb7cd3cb63bf8a3a5f7531d10f937053930a25
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac      | 5 +++++
+ tests/Makefile.am | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6c46cf3..21bae90 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -373,6 +373,10 @@ old_LIBS="$LIBS"
+ LIBS=""
+ AC_SEARCH_LIBS(backtrace, execinfo)
+ LIBS="$old_LIBS"
++case "$ac_cv_search_backtrace" in
++  -l*) BACKTRACELIB=$ac_cv_search_backtrace;;
++  *) BACKTRACELIB="";;
++esac
+ 
+ AC_SUBST(build_arch)
+ AC_SUBST(target_os)
+@@ -388,6 +392,7 @@ AC_SUBST(PKG_MAINTAINER)
+ AC_SUBST(enable_cxx_exceptions)
+ AC_SUBST(enable_debug_frame)
+ AC_SUBST(DLLIB)
++AC_SUBST(BACKTRACELIB)
+ 
+ AC_PATH_PROG([LATEX2MAN],[latex2man])
+ if test "x$LATEX2MAN" = "x"; then
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0a74881..cd3e589 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -179,7 +179,7 @@ Gtest_bt_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+ Gtest_concurrent_LDADD = $(LIBUNWIND) $(LIBUNWIND_local) -lpthread
+ Gtest_dyn1_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+ Gtest_exc_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+-Gtest_init_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
++Gtest_init_LDADD = $(LIBUNWIND) $(LIBUNWIND_local) @BACKTRACELIB@
+ Gtest_resume_sig_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+ Gtest_resume_sig_rt_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+ Gperf_simple_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+@@ -203,7 +203,7 @@ test_setjmp_LDADD = $(LIBUNWIND_setjmp)
+ ia64_test_setjmp_LDADD = $(LIBUNWIND_setjmp)
+ 
+ if BUILD_COREDUMP
+-test_coredump_unwind_LDADD = $(LIBUNWIND_coredump) $(LIBUNWIND)
++test_coredump_unwind_LDADD = $(LIBUNWIND_coredump) $(LIBUNWIND) @BACKTRACELIB@
+ endif
+ 
+ Gia64_test_nat_LDADD = $(LIBUNWIND) $(LIBUNWIND_local)
+-- 
+2.11.0
+
diff --git a/package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch b/package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
deleted file mode 100644
index 7ea25129f..000000000
--- a/package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f1684379dfaf8018d5d4c1945e292a56d0fab245 Mon Sep 17 00:00:00 2001
-From: Thierry Reding <treding@nvidia.com>
-Date: Fri, 27 Jun 2014 08:40:33 +0200
-Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
-
-For some architectures, -lgcc and -lgcc_s are not equivalent. On ARM for
-example, libgcc_s.so.1 contains some symbols needed by libunwind which
-are not present in libgcc.
-
-This causes the following link error when building the X.Org X server
-with libunwind support:
-
-	  CCLD     Xorg
-	/usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr0'
-	/usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr1'
-
-Linking against libgcc_s explicitly solves this problem.
-
-Signed-off-by: Thierry Reding <treding@nvidia.com>
-[yann.morin.1998 at free.fr: backport to libunwind 1.1]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4e2fd23..a77cf01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -258,7 +258,7 @@ else
- 
- if test x$GCC = xyes -a x$intel_compiler != xyes; then
-   CFLAGS="${CFLAGS} -fexceptions -Wall -Wsign-compare"
--  LIBCRTS="-lgcc"
-+  LIBCRTS="-lgcc_s"
- fi
- AC_MSG_RESULT([$intel_compiler])
- 
--- 
-1.9.1
-
diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 7ec47fab5..2f6c8ec79 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a  libunwind-1.1.tar.gz
+sha256 3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb  libunwind-1.2.1.tar.gz
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index a75a88848..7adf31896 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.1
+LIBUNWIND_VERSION = 1.2.1
 LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_AUTORECONF = YES
 
+LIBUNWIND_CONF_OPTS = --disable-tests
+
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBUNWIND_DEPENDENCIES = libatomic_ops
 endif
-- 
2.11.0
