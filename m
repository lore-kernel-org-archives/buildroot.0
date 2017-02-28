From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 23:09:30 +0100
Subject: [Buildroot] [PATCH] lttng-libust: fix build on musl
Message-ID: <1488319770-6933-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit backports two upstream patches in lttng-libust, that fix
the build with the musl C library.

Fixes:

  http://autobuild.buildroot.net/results/8bbcac9f9debf76cd1f56734bfd494677f2acd21/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...the-presence-of-dlmopen-at-configure-time.patch | 130 +++++++++++++++++++++
 ...-include-config.h-to-resolve-HAVE_DLMOPEN.patch |  30 +++++
 package/lttng-libust/lttng-libust.mk               |   1 +
 3 files changed, 161 insertions(+)
 create mode 100644 package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
 create mode 100644 package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch

diff --git a/package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch b/package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
new file mode 100644
index 0000000..699f1e0
--- /dev/null
+++ b/package/lttng-libust/0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
@@ -0,0 +1,130 @@
+From 42330adcefcd1830dad89e2a960c93d8dd1da125 Mon Sep 17 00:00:00 2001
+From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Date: Tue, 21 Feb 2017 16:00:27 -0500
+Subject: [PATCH] Validate the presence of dlmopen at configure time
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+[Backport from upstream commit 42330adcefcd1830dad89e2a960c93d8dd1da125.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac                   | 8 ++++++++
+ liblttng-ust-dl/lttng-ust-dl.c | 8 ++++++++
+ liblttng-ust-dl/ust_dl.h       | 2 ++
+ 3 files changed, 18 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 450b43b..023cfd4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,15 +125,23 @@ AS_IF([test "x${ax_cv_sys_weak_alias}" = "xno"], [
+ # Checks for libraries.
+ AC_CHECK_LIB([dl], [dlopen], [
+ 	have_libdl=yes
++	libdl_name=dl
+ ], [
+ 	#libdl not found, check for dlopen in libc.
+ 	AC_CHECK_LIB([c], [dlopen], [
+ 		have_libc_dl=yes
++		libdl_name=c
+ 	], [
+ 		AC_MSG_ERROR([Cannot find dlopen in libdl nor libc. Use [LDFLAGS]=-Ldir to specify their location.])
+ 	])
+ ])
+ 
++# Check if libdl has dlmopen support.
++AH_TEMPLATE([HAVE_DLMOPEN], ["Define to 1 if dlmopen is available."])
++AC_CHECK_LIB([$libdl_name], [dlmopen],
++	[AC_DEFINE([HAVE_DLMOPEN], [1])]
++)
++
+ AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBDL], [test "x$have_libdl" = "xyes"])
+ AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBC_DL], [test "x$have_libc_dl" = "xyes"])
+ 
+diff --git a/liblttng-ust-dl/lttng-ust-dl.c b/liblttng-ust-dl/lttng-ust-dl.c
+index b0737b6..ce2ae0e 100644
+--- a/liblttng-ust-dl/lttng-ust-dl.c
++++ b/liblttng-ust-dl/lttng-ust-dl.c
+@@ -38,8 +38,10 @@
+ #include "ust_dl.h"
+ 
+ static void *(*__lttng_ust_plibc_dlopen)(const char *filename, int flags);
++#ifdef HAVE_DLMOPEN
+ static void *(*__lttng_ust_plibc_dlmopen)(Lmid_t nsid, const char *filename,
+ 		int flags);
++#endif
+ static int (*__lttng_ust_plibc_dlclose)(void *handle);
+ 
+ static
+@@ -55,6 +57,7 @@ void *_lttng_ust_dl_libc_dlopen(const char *filename, int flags)
+ 	return __lttng_ust_plibc_dlopen(filename, flags);
+ }
+ 
++#ifdef HAVE_DLMOPEN
+ static
+ void *_lttng_ust_dl_libc_dlmopen(Lmid_t nsid, const char *filename,
+ 		int flags)
+@@ -68,6 +71,7 @@ void *_lttng_ust_dl_libc_dlmopen(Lmid_t nsid, const char *filename,
+ 	}
+ 	return __lttng_ust_plibc_dlmopen(nsid, filename, flags);
+ }
++#endif
+ 
+ static
+ int _lttng_ust_dl_libc_dlclose(void *handle)
+@@ -143,6 +147,7 @@ end:
+ 	return;
+ }
+ 
++#ifdef HAVE_DLMOPEN
+ static
+ void lttng_ust_dl_dlmopen(void *so_base, Lmid_t nsid, const char *so_name,
+ 		int flags, void *ip)
+@@ -203,6 +208,7 @@ end:
+ 	lttng_ust_elf_destroy(elf);
+ 	return;
+ }
++#endif
+ 
+ void *dlopen(const char *filename, int flags)
+ {
+@@ -223,6 +229,7 @@ void *dlopen(const char *filename, int flags)
+ 	return handle;
+ }
+ 
++#ifdef HAVE_DLMOPEN
+ void *dlmopen(Lmid_t nsid, const char *filename, int flags)
+ {
+ 	void *handle;
+@@ -243,6 +250,7 @@ void *dlmopen(Lmid_t nsid, const char *filename, int flags)
+ 	return handle;
+ 
+ }
++#endif
+ 
+ int dlclose(void *handle)
+ {
+diff --git a/liblttng-ust-dl/ust_dl.h b/liblttng-ust-dl/ust_dl.h
+index b8cfe82..afa8e84 100644
+--- a/liblttng-ust-dl/ust_dl.h
++++ b/liblttng-ust-dl/ust_dl.h
+@@ -51,6 +51,7 @@ TRACEPOINT_EVENT(lttng_ust_dl, dlopen,
+ 	)
+ )
+ 
++#ifdef HAVE_DLMOPEN
+ TRACEPOINT_EVENT(lttng_ust_dl, dlmopen,
+ 	TP_ARGS(void *, ip, void *, baddr, Lmid_t, nsid,
+ 		const char *, path, int, flags,
+@@ -66,6 +67,7 @@ TRACEPOINT_EVENT(lttng_ust_dl, dlmopen,
+ 		ctf_integer(uint8_t, has_debug_link, has_debug_link)
+ 	)
+ )
++#endif
+ 
+ TRACEPOINT_EVENT(lttng_ust_dl, build_id,
+ 	TP_ARGS(
+-- 
+2.7.4
+
diff --git a/package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch b/package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch
new file mode 100644
index 0000000..734d3c4
--- /dev/null
+++ b/package/lttng-libust/0004-Fix-include-config.h-to-resolve-HAVE_DLMOPEN.patch
@@ -0,0 +1,30 @@
+From 0b2253f5c9af73904d49da32085036c16b9d2d75 Mon Sep 17 00:00:00 2001
+From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Date: Tue, 21 Feb 2017 18:10:11 -0500
+Subject: [PATCH] Fix: include config.h to resolve HAVE_DLMOPEN
+
+Fixes commit 42330adcefcd1830dad89e2a960c93d8dd1da125
+
+Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+[Backported from upstream commit 0b2253f5c9af73904d49da32085036c16b9d2d75.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ liblttng-ust-dl/ust_dl.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/liblttng-ust-dl/ust_dl.h b/liblttng-ust-dl/ust_dl.h
+index afa8e84..c8a0695 100644
+--- a/liblttng-ust-dl/ust_dl.h
++++ b/liblttng-ust-dl/ust_dl.h
+@@ -33,6 +33,7 @@ extern "C" {
+ 
+ #include <stdint.h>
+ #include <unistd.h>
++#include <config.h>
+ 
+ #define LTTNG_UST_DL_PROVIDER
+ #include <lttng/tracepoint.h>
+-- 
+2.7.4
+
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 5667abb..f8c4c11 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -13,6 +13,7 @@ LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS += --disable-man-pages
 # 0002-doc-examples-Makefile.am-define-C-and-C-compilers-fo.patch
+# 0003-Validate-the-presence-of-dlmopen-at-configure-time.patch
 LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-- 
2.7.4
