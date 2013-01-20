From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:26:30 +0100
Subject: [Buildroot] [git commit] lttng-tools: bump to version 2.1.1
Message-ID: <20130120203919.23F119A4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cb4e19a136a9172228fd546562fd715be30b675
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* remove lttng-tools-Support-new-lttng-ust-error-code.patch (tarball
  fixed)
* remove lttng-tools-no-sync-file-range-in-uclibc.patch (merged
  upstream)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ng-tools-Support-new-lttng-ust-error-code.patch |   82 --------------------
 .../lttng-tools-no-sync-file-range-in-uclibc.patch |   51 ------------
 package/lttng-tools/lttng-tools.mk                 |    2 +-
 3 files changed, 1 insertions(+), 134 deletions(-)

diff --git a/package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch b/package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch
deleted file mode 100644
index 73d0884..0000000
--- a/package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 49c336c1679295a31b92223dca05feccfe3e3464 Mon Sep 17 00:00:00 2001
-From: David Goulet <dgoulet@efficios.com>
-Date: Fri, 9 Nov 2012 13:37:25 -0500
-Subject: [PATCH] Support new lttng-ust error code
-
-Signed-off-by: David Goulet <dgoulet@efficios.com>
----
-
-Only keep the src/bin/lttng-sessiond/lttng-ust-error.h adding part,
-needed to build lttng-tool without the lttng-libust dependency, i.e.
-with --disable-lttng-ust. (Samuel Martin)
-
----
- src/bin/lttng-sessiond/lttng-ust-error.h | 56 ++++++++++++++++++++++++++++++++
- 6 files changed, 75 insertions(+), 13 deletions(-)
- create mode 100644 src/bin/lttng-sessiond/lttng-ust-error.h
-
-diff --git a/src/bin/lttng-sessiond/lttng-ust-error.h b/src/bin/lttng-sessiond/lttng-ust-error.h
-new file mode 100644
-index 0000000..d83ecb8
---- /dev/null
-+++ b/src/bin/lttng-sessiond/lttng-ust-error.h
-@@ -0,0 +1,56 @@
-+#ifndef _LTTNG_UST_ERROR_H
-+#define _LTTNG_UST_ERROR_H
-+
-+/*
-+ * Copyright (C) 2011 - David Goulet <david.goulet@polymtl.ca>
-+ *                      Julien Desfossez <julien.desfossez@polymtl.ca>
-+ *                      Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; only
-+ * version 2.1 of the License.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ */
-+
-+/*
-+ * This header is meant for liblttng and libust internal use ONLY.
-+ * These declarations should NOT be considered stable API.
-+ */
-+
-+#include <limits.h>
-+#include <unistd.h>
-+
-+#include "lttng-ust-abi.h"
-+
-+/*
-+ * ustcomm error code.
-+ */
-+enum lttng_ust_error_code {
-+	LTTNG_UST_OK = 0,			/* Ok */
-+	LTTNG_UST_ERR = 1024,			/* Unknown Error */
-+	LTTNG_UST_ERR_NOENT = 1025,		/* No entry */
-+	LTTNG_UST_ERR_EXIST = 1026,     /* Object exists */
-+	LTTNG_UST_ERR_INVAL = 1027,     /* Invalid argument */
-+	LTTNG_UST_ERR_PERM  = 1028,     /* Permission denied */
-+	LTTNG_UST_ERR_NOSYS = 1029,     /* Not implemented */
-+
-+	/* MUST be last element */
-+	LTTNG_UST_ERR_NR,			/* Last element */
-+};
-+
-+/*
-+ * Return a human-readable error message for an lttng-ust error code.
-+ * code must be a positive value (or 0).
-+ */
-+extern const char *lttng_ust_strerror(int code);
-+
-+#endif	/* _LTTNG_UST_ERROR_H */
--- 
-1.8.0.3
-
diff --git a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
deleted file mode 100644
index fcaaa3e..0000000
--- a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Make sync_file_range() usage optional
-
-Under uClibc, sync_file_range() is not available under all
-architectures, so we fall back to fdatasync() in this case.
-
-Inspired by the patch done by Thomas Petazzoni for the
-2.0-pre25 version.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- configure.ac              |    2 +-
- src/common/compat/fcntl.h |    5 +++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5808c79..065b9cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -150,7 +150,7 @@ AS_IF([test "x$lttng_ust_support" = "xyes"], [
- 	)
- ])
- AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [test "x$lttng_ust_ctl_found" = xyes])
--AC_CHECK_FUNCS([sched_getcpu sysconf])
-+AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
- 
- # check for dlopen
- AC_CHECK_LIB([dl], [dlopen],
-@@ -394,4 +394,3 @@ AS_IF([test "x$consumerd_only" = "xno"],[
- ])
- 
- AS_ECHO()
--
-diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat-fcntl.c
-index 5a1c757..7ff63a3 100644
---- a/src/common/compat/compat-fcntl.c
-+++ b/src/common/compat/compat-fcntl.c
-@@ -23,7 +23,11 @@
- int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
- 		unsigned int flags)
- {
-+#ifdef HAVE_SYNC_FILE_RANGE
- 	return sync_file_range(fd, offset, nbytes, flags);
-+#else
-+	return fdatasync(fd);
-+#endif
- }
- 
- #endif /* __linux__ */
--- 
-1.8.0.3
-
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 18477ba..5be3abb 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -3,7 +3,7 @@
 # LTTng-Tools: the trace control client
 #
 #############################################################
-LTTNG_TOOLS_VERSION = 2.1.0
+LTTNG_TOOLS_VERSION = 2.1.1
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 
