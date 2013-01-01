From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 22:19:11 +0100
Subject: [Buildroot] [git commit] lttng-tools: bump to 2.1.0
Message-ID: <20130101212114.174EF9A59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f538e53e1250263f7d2a3bc7d0f0c738265c940
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* add patch adding src/bin/lttng-sessiond/lttng-ust-error.h which is
  missing in the lttng-tools-2.1.0 release tarball.
* update the sync_file_range patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ng-tools-Support-new-lttng-ust-error-code.patch |   82 ++++++++++++++++++++
 .../lttng-tools-no-sync-file-range-in-uclibc.patch |   51 ++++++------
 package/lttng-tools/lttng-tools.mk                 |    5 +-
 3 files changed, 112 insertions(+), 26 deletions(-)

diff --git a/package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch b/package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch
new file mode 100644
index 0000000..73d0884
--- /dev/null
+++ b/package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch
@@ -0,0 +1,82 @@
+From 49c336c1679295a31b92223dca05feccfe3e3464 Mon Sep 17 00:00:00 2001
+From: David Goulet <dgoulet@efficios.com>
+Date: Fri, 9 Nov 2012 13:37:25 -0500
+Subject: [PATCH] Support new lttng-ust error code
+
+Signed-off-by: David Goulet <dgoulet@efficios.com>
+---
+
+Only keep the src/bin/lttng-sessiond/lttng-ust-error.h adding part,
+needed to build lttng-tool without the lttng-libust dependency, i.e.
+with --disable-lttng-ust. (Samuel Martin)
+
+---
+ src/bin/lttng-sessiond/lttng-ust-error.h | 56 ++++++++++++++++++++++++++++++++
+ 6 files changed, 75 insertions(+), 13 deletions(-)
+ create mode 100644 src/bin/lttng-sessiond/lttng-ust-error.h
+
+diff --git a/src/bin/lttng-sessiond/lttng-ust-error.h b/src/bin/lttng-sessiond/lttng-ust-error.h
+new file mode 100644
+index 0000000..d83ecb8
+--- /dev/null
++++ b/src/bin/lttng-sessiond/lttng-ust-error.h
+@@ -0,0 +1,56 @@
++#ifndef _LTTNG_UST_ERROR_H
++#define _LTTNG_UST_ERROR_H
++
++/*
++ * Copyright (C) 2011 - David Goulet <david.goulet@polymtl.ca>
++ *                      Julien Desfossez <julien.desfossez@polymtl.ca>
++ *                      Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; only
++ * version 2.1 of the License.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
++ */
++
++/*
++ * This header is meant for liblttng and libust internal use ONLY.
++ * These declarations should NOT be considered stable API.
++ */
++
++#include <limits.h>
++#include <unistd.h>
++
++#include "lttng-ust-abi.h"
++
++/*
++ * ustcomm error code.
++ */
++enum lttng_ust_error_code {
++	LTTNG_UST_OK = 0,			/* Ok */
++	LTTNG_UST_ERR = 1024,			/* Unknown Error */
++	LTTNG_UST_ERR_NOENT = 1025,		/* No entry */
++	LTTNG_UST_ERR_EXIST = 1026,     /* Object exists */
++	LTTNG_UST_ERR_INVAL = 1027,     /* Invalid argument */
++	LTTNG_UST_ERR_PERM  = 1028,     /* Permission denied */
++	LTTNG_UST_ERR_NOSYS = 1029,     /* Not implemented */
++
++	/* MUST be last element */
++	LTTNG_UST_ERR_NR,			/* Last element */
++};
++
++/*
++ * Return a human-readable error message for an lttng-ust error code.
++ * code must be a positive value (or 0).
++ */
++extern const char *lttng_ust_strerror(int code);
++
++#endif	/* _LTTNG_UST_ERROR_H */
+-- 
+1.8.0.3
+
diff --git a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
index 3a1807e..fcaaa3e 100644
--- a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
+++ b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
@@ -16,35 +16,36 @@ diff --git a/configure.ac b/configure.ac
 index 5808c79..065b9cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -120,7 +120,7 @@ AS_IF([test "x$lttng_ust_support" = "xyes"], [
-
- AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [ test "x$ac_cv_lib_lttng_ust_ctl_ustctl_create_session" = "xyes" ])
-
+@@ -150,7 +150,7 @@ AS_IF([test "x$lttng_ust_support" = "xyes"], [
+ 	)
+ ])
+ AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [test "x$lttng_ust_ctl_found" = xyes])
 -AC_CHECK_FUNCS([sched_getcpu sysconf])
 +AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
-
+ 
  # check for dlopen
  AC_CHECK_LIB([dl], [dlopen],
-diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
-index 58c1579..dafb33e 100644
---- a/src/common/compat/fcntl.h
-+++ b/src/common/compat/fcntl.h
-@@ -23,10 +23,15 @@
-
- #ifdef __linux__
-
-+#if defined(HAVE_SYNC_FILE_RANGE)
- extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
- 		unsigned int flags);
- #define lttng_sync_file_range(fd, offset, nbytes, flags) \
- 	compat_sync_file_range(fd, offset, nbytes, flags)
+@@ -394,4 +394,3 @@ AS_IF([test "x$consumerd_only" = "xno"],[
+ ])
+ 
+ AS_ECHO()
+-
+diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat-fcntl.c
+index 5a1c757..7ff63a3 100644
+--- a/src/common/compat/compat-fcntl.c
++++ b/src/common/compat/compat-fcntl.c
+@@ -23,7 +23,11 @@
+ int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
+ 		unsigned int flags)
+ {
++#ifdef HAVE_SYNC_FILE_RANGE
+ 	return sync_file_range(fd, offset, nbytes, flags);
 +#else
-+#define lttng_sync_file_range(fd, offset, nbytes, flags) \
-+	fdatasync(fd);
++	return fdatasync(fd);
 +#endif
-
- #elif defined(__FreeBSD__)
-
---
-1.7.10
+ }
+ 
+ #endif /* __linux__ */
+-- 
+1.8.0.3
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index fe48ac6..18477ba 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -3,7 +3,7 @@
 # LTTng-Tools: the trace control client
 #
 #############################################################
-LTTNG_TOOLS_VERSION = 2.0.4
+LTTNG_TOOLS_VERSION = 2.1.0
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 
@@ -11,6 +11,9 @@ LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 # dependency. However, having the babeltrace utilities built for the
 # host is very useful, since those tools allow to convert the binary
 # trace format into an human readable format.
+# Since the 2.1.0 release, lttng-tools depends on flex and bison,
+# but they are not added to the dependency list since they are
+# already Buildroot dependencies.
 LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace
 
 LTTNG_AUTORECONF = YES
