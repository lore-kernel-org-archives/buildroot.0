From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon,  9 Nov 2020 17:41:48 +0100
Subject: [Buildroot] [PATCH] package/mono: bump to version 6.12.0.90
Message-ID: <20201109164148.2382455-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While bumping:
* removing upstreamed patches
* adding a dependency on libatomic_ops required by the newer version

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...le-backtrace-on-not-supported-uclibc.patch | 27 -------------
 ...ath-depending-on-C-library-being-use.patch | 34 ----------------
 ...03-configure.ac-checks-for-libunwind.patch | 40 -------------------
 ...-leftover-code-from-pre-monoctx-area.patch | 33 ---------------
 package/mono/Config.in                        |  2 +
 package/mono/mono.hash                        |  2 +-
 package/mono/mono.mk                          |  2 +-
 package/monolite/monolite.hash                |  2 +-
 package/monolite/monolite.mk                  |  2 +-
 9 files changed, 6 insertions(+), 138 deletions(-)
 delete mode 100644 package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch
 delete mode 100644 package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch
 delete mode 100644 package/mono/0003-configure.ac-checks-for-libunwind.patch
 delete mode 100644 package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch

diff --git a/package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch b/package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch
deleted file mode 100644
index 7bc7384ad0..0000000000
--- a/package/mono/0001-Disable-backtrace-on-not-supported-uclibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5232ec11c74eb49fb220a7e2df80e46ac621e941 Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Sat, 7 Feb 2015 09:49:37 +0100
-Subject: [PATCH] Disable backtrace on not supported uclibc
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libgc/include/gc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgc/include/gc.h b/libgc/include/gc.h
-index 2265fdb..6485fc0 100644
---- a/libgc/include/gc.h
-+++ b/libgc/include/gc.h
-@@ -500,7 +500,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_off_page GC_PROTO((size_t lb));
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
--- 
-2.1.0
-
diff --git a/package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch b/package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch
deleted file mode 100644
index 4c1d522429..0000000000
--- a/package/mono/0002-Adjust-libc.so-path-depending-on-C-library-being-use.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6f8346438e0257259867b5dca6bb6db54eb96705 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 7 Feb 2015 09:50:24 +0100
-Subject: [PATCH] Adjust libc.so path depending on C library being used
-
-By default, on Linux systems, Mono assumes that the C library is
-libc.so.6. While this is true for glibc, it is not true for uClibc and
-Musl based systems. This patch adds support for such systems.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 5d9961a..f6a7909 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2978,6 +2978,12 @@ case "$host" in
-         SQLITE="libsqlite.so"
-         SQLITE3="libsqlite3.so"
- 	;;
-+    *-*-*uclibc*)
-+	LIBC="libc.so.0"
-+	;;
-+    *-*-*musl*)
-+	LIBC="libc.so"
-+	;;
-     *-*-*linux*)
- 	AC_PATH_X
- 	dlsearch_path=`(libtool --config ; echo eval echo \\$sys_lib_dlsearch_path_spec) | sh`
--- 
-2.1.0
-
diff --git a/package/mono/0003-configure.ac-checks-for-libunwind.patch b/package/mono/0003-configure.ac-checks-for-libunwind.patch
deleted file mode 100644
index 8ff6b2f5c7..0000000000
--- a/package/mono/0003-configure.ac-checks-for-libunwind.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4dc1d1fe553f3a8ad00919324419aba54675239e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 May 2019 22:30:01 +0200
-Subject: [PATCH] configure.ac: checks for libunwind
-
-_Unwind_GetIP is used in build_stack_trace however this function can be
-provided by libunwind so check for it to avoid the following build
-failure:
-
-/home/buildroot/autobuild/run/instance-1/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ./.libs/libmini.a(libmini_la-mini-exceptions.o): in function `build_stack_trace':
-/home/buildroot/autobuild/run/instance-1/output/build/mono-5.20.1.27/mono/mini/mini-exceptions.c:365: undefined reference to `_Unwind_GetIP'
-collect2: error: ld returned 1 exit status
-
-Fixes:
- - http://autobuild.buildroot.net/results/dbd64c89815d393a4e28b312d74fd80ee6de92da
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index d724f9e2d27..c3067246f08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2206,6 +2206,11 @@ if test x$host_win32 = xno; then
- 	dnl *****************************
- 	AC_CHECK_LIB(socket, socket, LIBS="$LIBS -lsocket")
- 
-+	dnl *****************************
-+	dnl *** Checks for libunwind ***
-+	dnl ****************************
-+	AC_CHECK_LIB(unwind, _Unwind_GetIP, LIBS="$LIBS -lunwind")
-+
- 	case "$host" in
- 		*-*-*freebsd*)
- 			dnl *****************************
--- 
-2.20.1
-
diff --git a/package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch b/package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch
deleted file mode 100644
index cfda7fdfaa..0000000000
--- a/package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 121928d29ac1e0aebb80531b3ebcca1a9ffcd618 Mon Sep 17 00:00:00 2001
-From: Bernhard Urban-Forster <lewurm@gmail.com>
-Date: Fri, 6 Dec 2019 11:35:11 +0100
-Subject: [PATCH] [ppc32] delete leftover code from pre-monoctx area (#18072)
-
-Also update assert which doesn't make sense since we have moved over to MonoContext
-
-Some context: e7011c780f676914f559f14f25e76c192bb2b0b2
-
-Fixes: https://github.com/mono/mono/issues/18064
-[Retrieved from:
-https://github.com/mono/mono/commit/121928d29ac1e0aebb80531b3ebcca1a9ffcd618]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- mono/mini/exceptions-ppc.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/mono/mini/exceptions-ppc.c b/mono/mini/exceptions-ppc.c
-index 44d09bcaba1d..d14f8383eba9 100644
---- a/mono/mini/exceptions-ppc.c
-+++ b/mono/mini/exceptions-ppc.c
-@@ -692,10 +692,7 @@ mono_arch_handle_altstack_exception (void *sigctx, MONO_SIG_HANDLER_INFO_TYPE *s
- 	/* may need to adjust pointers in the new struct copy, depending on the OS */
- 	uc_copy = (MonoContext*)(sp + 16);
- 	mono_sigctx_to_monoctx (uc, uc_copy);
--#if defined(__linux__) && !defined(__mono_ppc64__)
--	uc_copy->uc_mcontext.uc_regs = (gpointer)((char*)uc_copy + ((char*)uc->uc_mcontext.uc_regs - (char*)uc));
--#endif
--	g_assert (mono_arch_ip_from_context (uc) == mono_arch_ip_from_context (uc_copy));
-+	g_assert (mono_arch_ip_from_context (uc) == MONO_CONTEXT_GET_IP (uc_copy));
- 	/* at the return form the signal handler execution starts in altstack_handle_and_restore() */
- 	UCONTEXT_REG_LNK(uc) = UCONTEXT_REG_NIP(uc);
- #ifdef PPC_USES_FUNCTION_DESCRIPTOR
diff --git a/package/mono/Config.in b/package/mono/Config.in
index 0d555bfa82..93cac60d78 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_MONO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index fa5333867c..2477e9231c 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 ed5df4ec663a4e228e89e910e954fa18d33f72e790c11174e1b62fc8cca90ba0  mono-6.8.0.96.tar.xz
+sha256 51de5c02ad511333f93ff585bca54c8784de35af4ff27b759d16b46c4402cdac  mono-6.12.0.90.tar.xz
 sha256 923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
 sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 274d9817e5..ea76f124ea 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 6.8.0.96
+MONO_VERSION = 6.12.0.90
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index bd953591b4..b008d42ebb 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 4b75a73bb4a99b8e3b51837afb72192cce27b482cb5ec70cc136b293071f902e  monolite-linux-ABB721D6-116A-4555-B4FD-9248146D2051-latest.tar.gz
+sha256 0ac314f75ca2bc4455785f12ceb50da89b6dac90162f9f46afbbb988a8752d4b  monolite-linux-1A5E0066-58DC-428A-B21C-0AD6CDAE2789-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index b9e3990c42..b0042aabf7 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = ABB721D6-116A-4555-B4FD-9248146D2051
+MONOLITE_VERSION = 1A5E0066-58DC-428A-B21C-0AD6CDAE2789
 MONOLITE_SITE = http://download.mono-project.com/monolite
 MONOLITE_SOURCE = monolite-linux-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
-- 
2.25.1
