From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 22 Nov 2017 17:55:30 -0500
Subject: [Buildroot] [PATCH 2/3] lttng-libust: bump version to 2.10.0
In-Reply-To: <20171122225531.26429-1-eeppeliteloop@gmail.com>
References: <20171122225531.26429-1-eeppeliteloop@gmail.com>
Message-ID: <20171122225531.26429-2-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The deleted patches are removed because they are now upstream as of
LTTng-UST v2.10.0.

Adding 0001-configure.ac-add-disable-examples-option-to-not-buil.patch
which will be part of a release eventually (in master branch as of this
date) to add the --disable-examples option. This option configures the
build so that examples are not built, so as to avoid build problems with
examples which involve CMake.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 ...c-add-disable-examples-option-to-not-buil.patch |  68 +++++++++++
 ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch |  34 ------
 ...s-Makefile.am-define-C-and-C-compilers-fo.patch |  49 --------
 ...the-presence-of-dlmopen-at-configure-time.patch | 130 ---------------------
 ...-include-config.h-to-resolve-HAVE_DLMOPEN.patch |  30 -----
 package/lttng-libust/lttng-libust.hash             |   6 +-
 package/lttng-libust/lttng-libust.mk               |   7 +-
 7 files changed, 74 insertions(+), 250 deletions(-)
 create mode 100644 package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch
 delete mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
 delete mode 100644 package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
 delete mode 100644 package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
 delete mode 100644 package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch

diff --git a/package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch b/package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch
new file mode 100644
index 0000000000..ef817e44bb
--- /dev/null
+++ b/package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch
@@ -0,0 +1,68 @@
+From 08aa9a26779d4ede3de7857fafd03bd6331ba948 Mon Sep 17 00:00:00 2001
+From: Philippe Proulx <eeppeliteloop@gmail.com>
+Date: Mon, 6 Nov 2017 15:46:03 -0500
+Subject: [PATCH] configure.ac: add --disable-examples option to not
+ build/install examples
+
+Some environments and distributions do not need the LTTng-UST examples
+to be built because they remove them anyway. Continue to build them by
+default, but add --disable-examples to explicitly disable them.
+
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+[Philippe: backport from upstream commit 08aa9a26]
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ configure.ac    | 16 ++++++++++++++++
+ doc/Makefile.am |  6 +++++-
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 10087f3f..68f41315 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -423,6 +423,19 @@ AC_DEFINE_UNQUOTED([LTTNG_SYSTEM_RUNDIR], ["$lttng_system_rundir"],
+ AC_CHECK_PROG([BUILD_GEN_TP_EXAMPLES], [python], ["yes"])
+ AM_CONDITIONAL([BUILD_GEN_TP_EXAMPLES], [test "x$BUILD_GEN_TP_EXAMPLES" = "xyes"])
+
++# Enable building examples
++AC_ARG_ENABLE(
++	examples,
++	AS_HELP_STRING(
++		[--disable-examples],
++		[Do not build and install examples]
++	),
++	[enable_examples=$enableval],
++	[enable_examples=yes]
++)
++
++AM_CONDITIONAL([ENABLE_EXAMPLES], [test "x$enable_examples" != "xno"])
++
+ # Set $IN_GIT_REPO if we're in the Git repository; the `bootstrap` file
+ # is not distributed in tarballs.
+ AS_IF([test -f "$srcdir/bootstrap"], [in_git_repo=yes], [in_git_repo=no])
+@@ -596,6 +609,9 @@ PPRINT_PROP_BOOL([NUMA], $value)
+ AS_ECHO
+ PPRINT_SET_INDENT(0)
+
++test "x$enable_examples" = xyes && value=1 || value=0
++PPRINT_PROP_BOOL([Build and install examples], $value, $PPRINT_COLOR_SUBTITLE)
++
+ # man pages build enabled/disabled
+ m4_pushdef([build_man_pages_msg], [Build and install man pages])
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index e110ed85..a67c8c22 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -1,3 +1,7 @@
+-SUBDIRS = . man examples
++SUBDIRS = . man
++
++if ENABLE_EXAMPLES
++SUBDIRS += examples
++endif
+
+ dist_doc_DATA = java-agent.txt
+--
+2.15.0
+
diff --git a/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
deleted file mode 100644
index 2e0c8b1da0..0000000000
--- a/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d400314757a8d5d52bd5722d263bfd5886bb6595 Mon Sep 17 00:00:00 2001
-From: Philippe Proulx <eeppeliteloop@gmail.com>
-Date: Sat, 29 Oct 2016 13:32:57 -0400
-Subject: [PATCH] lttng-ust-elf.c: define NT_GNU_BUILD_ID if not defined
-
-On uClibc, NT_GNU_BUILD_ID is not defined, so we define it
-manually in this case.
-
-Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
-[Philippe: grabbed from this pull request:
-    https://github.com/lttng/lttng-ust/pull/39
-]
----
- liblttng-ust/lttng-ust-elf.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/liblttng-ust/lttng-ust-elf.c b/liblttng-ust/lttng-ust-elf.c
-index 5f27920..beaa7f3 100644
---- a/liblttng-ust/lttng-ust-elf.c
-+++ b/liblttng-ust/lttng-ust-elf.c
-@@ -29,6 +29,10 @@
-
- #define BUF_LEN	4096
-
-+#ifndef NT_GNU_BUILD_ID
-+# define NT_GNU_BUILD_ID	3
-+#endif
-+
- /*
-  * Retrieve the nth (where n is the `index` argument) phdr (program
-  * header) from the given elf instance.
---
-2.9.3
-
diff --git a/package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch b/package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
deleted file mode 100644
index 5172dbbf20..0000000000
--- a/package/lttng-libust/0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f54894580da85e33f934c5c9bf5ab32d3fcce18b Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 30 Nov 2016 16:52:51 +0000
-Subject: [PATCH] doc/examples/Makefile.am: define C and C++ compilers for
- CMake
-
-This prevents build failures when cross-compiling.
-
-If we don't define the compiler, it will use the one from the host
-machine. For instance "/usr/bin/c++", which is incorrect.
-
-The failure looks like this:
-
-.............................................................
-[ 10%] Building CXX object CMakeFiles/tracepoint-provider.dir/tracepoint-provider.cpp.o
-/usr/bin/c++   -Dtracepoint_provider_EXPORTS -I/br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/. -isystem /br/output/build/lttng-libust-2.9.0/include  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC   -o CMakeFiles/tracepoint-provider.dir/tracepoint-provider.cpp.o -c /br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/tracepoint-provider.cpp
-In file included from /br/output/build/lttng-libust-2.9.0/include/lttng/tracepoint.h:29:0,
-                 from /br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/tracepoint-provider.h:32,
-                 from /br/output/build/lttng-libust-2.9.0/doc/examples/cmake-multiple-shared-libraries/tracepoint-provider.cpp:26:
-/br/output/build/lttng-libust-2.9.0/include/lttng/tracepoint-rcu.h:26:27: fatal error: urcu/compiler.h: No such file or directory
- #include <urcu/compiler.h>
-                           ^
-compilation terminated.
-.............................................................
-
-Pull request URL: https://github.com/lttng/lttng-ust/pull/41
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- doc/examples/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
-index 424b844..5bc1f4c 100644
---- a/doc/examples/Makefile.am
-+++ b/doc/examples/Makefile.am
-@@ -152,7 +152,9 @@ all-local:
- 				cmake \
- 				-DCMAKE_INCLUDE_PATH="$(abs_top_srcdir)/include;$(abs_top_builddir)/include" \
- 				-DCMAKE_LIBRARY_PATH="$(abs_top_builddir)/liblttng-ust/.libs" \
-+				-DCMAKE_C_COMPILER="$(CC)" \
- 				-DCMAKE_C_FLAGS="$(CFLAGS) $(CPPFLAGS)" \
-+				-DCMAKE_CXX_COMPILER="$(CXX)" \
- 				-DCMAKE_CXX_FLAGS="$(CXXFLAGS) $(CPPFLAGS)" \
- 				-DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" \
- 				.. && \
--- 
-2.10.1
-
diff --git a/package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch b/package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
deleted file mode 100644
index 699f1e0327..0000000000
--- a/package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 42330adcefcd1830dad89e2a960c93d8dd1da125 Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Tue, 21 Feb 2017 16:00:27 -0500
-Subject: [PATCH] Validate the presence of dlmopen at configure time
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-[Backport from upstream commit 42330adcefcd1830dad89e2a960c93d8dd1da125.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac                   | 8 ++++++++
- liblttng-ust-dl/lttng-ust-dl.c | 8 ++++++++
- liblttng-ust-dl/ust_dl.h       | 2 ++
- 3 files changed, 18 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 450b43b..023cfd4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -125,15 +125,23 @@ AS_IF([test "x${ax_cv_sys_weak_alias}" = "xno"], [
- # Checks for libraries.
- AC_CHECK_LIB([dl], [dlopen], [
- 	have_libdl=yes
-+	libdl_name=dl
- ], [
- 	#libdl not found, check for dlopen in libc.
- 	AC_CHECK_LIB([c], [dlopen], [
- 		have_libc_dl=yes
-+		libdl_name=c
- 	], [
- 		AC_MSG_ERROR([Cannot find dlopen in libdl nor libc. Use [LDFLAGS]=-Ldir to specify their location.])
- 	])
- ])
- 
-+# Check if libdl has dlmopen support.
-+AH_TEMPLATE([HAVE_DLMOPEN], ["Define to 1 if dlmopen is available."])
-+AC_CHECK_LIB([$libdl_name], [dlmopen],
-+	[AC_DEFINE([HAVE_DLMOPEN], [1])]
-+)
-+
- AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBDL], [test "x$have_libdl" = "xyes"])
- AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBC_DL], [test "x$have_libc_dl" = "xyes"])
- 
-diff --git a/liblttng-ust-dl/lttng-ust-dl.c b/liblttng-ust-dl/lttng-ust-dl.c
-index b0737b6..ce2ae0e 100644
---- a/liblttng-ust-dl/lttng-ust-dl.c
-+++ b/liblttng-ust-dl/lttng-ust-dl.c
-@@ -38,8 +38,10 @@
- #include "ust_dl.h"
- 
- static void *(*__lttng_ust_plibc_dlopen)(const char *filename, int flags);
-+#ifdef HAVE_DLMOPEN
- static void *(*__lttng_ust_plibc_dlmopen)(Lmid_t nsid, const char *filename,
- 		int flags);
-+#endif
- static int (*__lttng_ust_plibc_dlclose)(void *handle);
- 
- static
-@@ -55,6 +57,7 @@ void *_lttng_ust_dl_libc_dlopen(const char *filename, int flags)
- 	return __lttng_ust_plibc_dlopen(filename, flags);
- }
- 
-+#ifdef HAVE_DLMOPEN
- static
- void *_lttng_ust_dl_libc_dlmopen(Lmid_t nsid, const char *filename,
- 		int flags)
-@@ -68,6 +71,7 @@ void *_lttng_ust_dl_libc_dlmopen(Lmid_t nsid, const char *filename,
- 	}
- 	return __lttng_ust_plibc_dlmopen(nsid, filename, flags);
- }
-+#endif
- 
- static
- int _lttng_ust_dl_libc_dlclose(void *handle)
-@@ -143,6 +147,7 @@ end:
- 	return;
- }
- 
-+#ifdef HAVE_DLMOPEN
- static
- void lttng_ust_dl_dlmopen(void *so_base, Lmid_t nsid, const char *so_name,
- 		int flags, void *ip)
-@@ -203,6 +208,7 @@ end:
- 	lttng_ust_elf_destroy(elf);
- 	return;
- }
-+#endif
- 
- void *dlopen(const char *filename, int flags)
- {
-@@ -223,6 +229,7 @@ void *dlopen(const char *filename, int flags)
- 	return handle;
- }
- 
-+#ifdef HAVE_DLMOPEN
- void *dlmopen(Lmid_t nsid, const char *filename, int flags)
- {
- 	void *handle;
-@@ -243,6 +250,7 @@ void *dlmopen(Lmid_t nsid, const char *filename, int flags)
- 	return handle;
- 
- }
-+#endif
- 
- int dlclose(void *handle)
- {
-diff --git a/liblttng-ust-dl/ust_dl.h b/liblttng-ust-dl/ust_dl.h
-index b8cfe82..afa8e84 100644
---- a/liblttng-ust-dl/ust_dl.h
-+++ b/liblttng-ust-dl/ust_dl.h
-@@ -51,6 +51,7 @@ TRACEPOINT_EVENT(lttng_ust_dl, dlopen,
- 	)
- )
- 
-+#ifdef HAVE_DLMOPEN
- TRACEPOINT_EVENT(lttng_ust_dl, dlmopen,
- 	TP_ARGS(void *, ip, void *, baddr, Lmid_t, nsid,
- 		const char *, path, int, flags,
-@@ -66,6 +67,7 @@ TRACEPOINT_EVENT(lttng_ust_dl, dlmopen,
- 		ctf_integer(uint8_t, has_debug_link, has_debug_link)
- 	)
- )
-+#endif
- 
- TRACEPOINT_EVENT(lttng_ust_dl, build_id,
- 	TP_ARGS(
--- 
-2.7.4
-
diff --git a/package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch b/package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch
deleted file mode 100644
index 734d3c4c4a..0000000000
--- a/package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0b2253f5c9af73904d49da32085036c16b9d2d75 Mon Sep 17 00:00:00 2001
-From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Date: Tue, 21 Feb 2017 18:10:11 -0500
-Subject: [PATCH] Fix: include config.h to resolve HAVE_DLMOPEN
-
-Fixes commit 42330adcefcd1830dad89e2a960c93d8dd1da125
-
-Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-[Backported from upstream commit 0b2253f5c9af73904d49da32085036c16b9d2d75.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- liblttng-ust-dl/ust_dl.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/liblttng-ust-dl/ust_dl.h b/liblttng-ust-dl/ust_dl.h
-index afa8e84..c8a0695 100644
---- a/liblttng-ust-dl/ust_dl.h
-+++ b/liblttng-ust-dl/ust_dl.h
-@@ -33,6 +33,7 @@ extern "C" {
- 
- #include <stdint.h>
- #include <unistd.h>
-+#include <config.h>
- 
- #define LTTNG_UST_DL_PROVIDER
- #include <lttng/tracepoint.h>
--- 
-2.7.4
-
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index e080361a57..dd77690fef 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.9.0.tar.bz2.{md5,sha1}
-md5 77f3378ba37a36801420bce87b702e9c  lttng-ust-2.9.0.tar.bz2
-sha1 9937eae64540821b8597cce081e92be76e6b5568  lttng-ust-2.9.0.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.0.tar.bz2.{md5,sha1}
+md5 cc1f0938fa0d46d8d400864de0c1da02  lttng-ust-2.10.0-rc2.tar.bz2
+sha1 aba45026b05939a83b8d29414927ac8e2ce5c4a8  lttng-ust-2.10.0-rc2.tar.bz2
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 82923ded1f..5496e926d5 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,15 +5,14 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.9.0
+LTTNG_LIBUST_VERSION = 2.10.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
-LTTNG_LIBUST_CONF_OPTS += --disable-man-pages
-# 0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
-# 0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
+LTTNG_LIBUST_CONF_OPTS += --disable-man-pages --disable-examples
+# 0001-configure.ac-add-disable-examples-option-to-not-buil.patch
 LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-- 
2.15.0
