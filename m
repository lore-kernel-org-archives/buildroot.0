From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat,  3 Oct 2020 00:10:32 +0200
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: bump to version
 20200930
In-Reply-To: <20201002221032.5627-1-petr.vorel@gmail.com>
References: <20201002221032.5627-1-petr.vorel@gmail.com>
Message-ID: <20201002221032.5627-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch form this version add 2 new patches for fixing build.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...001-fanotify.h-fix-build-with-uclibc.patch |  41 ----
 ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 203 ++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.hash      |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk        |   2 +-
 4 files changed, 206 insertions(+), 44 deletions(-)
 delete mode 100644 package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch
 create mode 100644 package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch

diff --git a/package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch b/package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch
deleted file mode 100644
index 5531756970..0000000000
--- a/package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cb11e718ce04261cb6ff4c09442b949da33b8797 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Sep 2020 17:55:45 +0200
-Subject: [PATCH] fanotify.h: fix build with uclibc
-
-MAX_HANDLE_SZ is used since version 20200515 and
-https://github.com/linux-test-project/ltp/commit/d20a3e8f9a794e0659277acfa9fbcf7454ba4631
-
-However, it is not defined by uclibc, so define it if needed to avoid
-the following build failure:
-
-fanotify.h:171:11: error: 'MAX_HANDLE_SZ' undeclared here (not in a function)
-  171 |  char buf[MAX_HANDLE_SZ];
-
-Fixes:
- - http://autobuild.buildroot.org/results/fb0a67b15482e76b379b4b4d9c43b45bb0fccae1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-[Retrieved from:
-https://github.com/linux-test-project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797]
----
- testcases/kernel/syscalls/fanotify/fanotify.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
-index a9a431ca2f..d271578e97 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify.h
-+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
-@@ -139,6 +139,11 @@ struct fanotify_event_info_fid {
- #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL */
- 
- #ifdef HAVE_NAME_TO_HANDLE_AT
-+
-+#ifndef MAX_HANDLE_SZ
-+#define MAX_HANDLE_SZ		128
-+#endif
-+
- /*
-  * Helper function used to obtain fsid and file_handle for a given path.
-  * Used by test files correlated to FAN_REPORT_FID functionality.
diff --git a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
new file mode 100644
index 0000000000..f1b6743f21
--- /dev/null
+++ b/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -0,0 +1,203 @@
+From ac3e262cba81889c0bb04ce87a50a1709f2726e7 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Thu, 1 Oct 2020 23:28:39 +0200
+Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The reason is to avoid indirect <linux/sysinfo.h> include when using
+some network headers: <linux/netlink.h> or others -> <linux/kernel.h>
+-> <linux/sysinfo.h>
+
+This indirect include causes on MUSL redefinition of struct sysinfo when
+included both <sys/sysinfo.h> and some of UAPI headers:
+
+In file included from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:5,
+                 from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:5,
+                 from ../include/tst_netlink.h:14,
+                 from tst_crypto.c:13:
+x86_64-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:8:8: error: redefinition of ?struct sysinfo?
+ struct sysinfo {
+        ^~~~~~~
+In file included from ../include/tst_safe_macros.h:15,
+                 from ../include/tst_test.h:93,
+                 from tst_crypto.c:11:
+x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel at gmail.com/ ]
+---
+ include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
+ include/tst_safe_macros.h                     |  2 +-
+ lib/safe_macros.c                             |  2 +-
+ lib/tst_memutils.c                            |  2 +-
+ testcases/kernel/mem/mtest01/mtest01.c        |  2 +-
+ testcases/kernel/syscalls/madvise/madvise06.c |  2 +-
+ testcases/kernel/syscalls/sysinfo/sysinfo01.c |  2 +-
+ testcases/kernel/syscalls/sysinfo/sysinfo02.c |  2 +-
+ testcases/kernel/syscalls/sysinfo/sysinfo03.c |  2 +-
+ 9 files changed, 30 insertions(+), 8 deletions(-)
+ create mode 100644 include/lapi/sysinfo.h
+
+diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
+new file mode 100644
+index 000000000..d0e0e93d7
+--- /dev/null
++++ b/include/lapi/sysinfo.h
+@@ -0,0 +1,22 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
++ */
++
++#ifndef SYSINFO_H__
++
++/*
++ * Don't use <sys/sysinfo.h> as it breaks build MUSL toolchain.
++ * Use <linux/sysinfo.h> instead.
++ *
++ * Some kernel UAPI headers do indirect <linux/sysinfo.h> include:
++ * <linux/netlink.h> or others -> <linux/kernel.h> -> <linux/sysinfo.h>
++ *
++ * This indirect include causes on MUSL redefinition of struct sysinfo when
++ * included both <sys/sysinfo.h> and some of UAPI headers:
++ */
++#include <linux/sysinfo.h>
++
++#define SYSINFO_H__
++
++#endif /* SYSINFO_H__ */
+diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
+index 053c3bcf9..61ea2076d 100644
+--- a/include/tst_safe_macros.h
++++ b/include/tst_safe_macros.h
+@@ -12,7 +12,7 @@
+ #include <sys/resource.h>
+ #include <sys/stat.h>
+ #include <sys/vfs.h>
+-#include <sys/sysinfo.h>
++#include <linux/sysinfo.h>
+ #include <fcntl.h>
+ #include <libgen.h>
+ #include <signal.h>
+diff --git a/lib/safe_macros.c b/lib/safe_macros.c
+index 4f48d7529..d8ee03dae 100644
+--- a/lib/safe_macros.c
++++ b/lib/safe_macros.c
+@@ -11,7 +11,6 @@
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <sys/xattr.h>
+-#include <sys/sysinfo.h>
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <libgen.h>
+@@ -23,6 +22,7 @@
+ #include <malloc.h>
+ #include "test.h"
+ #include "safe_macros.h"
++#include "lapi/sysinfo.h"
+
+ char *safe_basename(const char *file, const int lineno,
+ 		    void (*cleanup_fn) (void), char *path)
+diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
+index f134d90c9..647db951e 100644
+--- a/lib/tst_memutils.c
++++ b/lib/tst_memutils.c
+@@ -5,11 +5,11 @@
+
+ #include <unistd.h>
+ #include <limits.h>
+-#include <sys/sysinfo.h>
+ #include <stdlib.h>
+
+ #define TST_NO_DEFAULT_MAIN
+ #include "tst_test.h"
++#include "lapi/sysinfo.h"
+
+ #define BLOCKSIZE (16 * 1024 * 1024)
+
+diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
+index f08d3943f..9b4d856f8 100644
+--- a/testcases/kernel/mem/mtest01/mtest01.c
++++ b/testcases/kernel/mem/mtest01/mtest01.c
+@@ -20,7 +20,6 @@
+  */
+
+ #include <sys/types.h>
+-#include <sys/sysinfo.h>
+ #include <sys/wait.h>
+ #include <limits.h>
+ #include <signal.h>
+@@ -29,6 +28,7 @@
+ #include <unistd.h>
+
+ #include "lapi/abisize.h"
++#include "lapi/sysinfo.h"
+ #include "tst_test.h"
+
+ #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
+diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
+index f76f3f6aa..b2613670b 100644
+--- a/testcases/kernel/syscalls/madvise/madvise06.c
++++ b/testcases/kernel/syscalls/madvise/madvise06.c
+@@ -24,8 +24,8 @@
+ #include <errno.h>
+ #include <stdio.h>
+ #include <sys/mount.h>
+-#include <sys/sysinfo.h>
+ #include "tst_test.h"
++#include "lapi/sysinfo.h"
+
+ #define CHUNK_SZ (400*1024*1024L)
+ #define CHUNK_PAGES (CHUNK_SZ / pg_sz)
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
+index 2ea44a2be..a95066bf5 100644
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
+@@ -69,9 +69,9 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/signal.h>
+-#include <sys/sysinfo.h>
+
+ #include "test.h"
++#include "lapi/sysinfo.h"
+
+ void setup();
+ void cleanup();
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
+index 678b8f1d3..5ce65d20e 100644
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
+@@ -65,10 +65,10 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/signal.h>
+-#include <sys/sysinfo.h>
+ #include <stdint.h>
+
+ #include "test.h"
++#include "lapi/sysinfo.h"
+
+ #define INVALID_ADDRESS ((uintptr_t)-1)
+
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
+index af7cb6421..3b61a05b1 100644
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
+@@ -13,9 +13,9 @@
+
+  */
+
+-#include <sys/sysinfo.h>
+ #include "lapi/namespaces_constants.h"
+ #include "lapi/posix_clocks.h"
++#include "lapi/sysinfo.h"
+ #include "tst_test.h"
+
+ static int offsets[] = {
+--
+2.28.0
+
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index eb349e2929..9dce0405df 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20200515/ltp-full-20200515.tar.xz.sha1
-sha1 7b3932b46295328c64d6f235bc54fa68806b9ede  ltp-full-20200515.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20200930/ltp-full-20200930.tar.xz.sha1
+sha1 f380c7afe71e03eabb1de668c0399267042cb0f7  ltp-full-20200930.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 4cee77bcd0..a9a3173c4b 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20200515
+LTP_TESTSUITE_VERSION = 20200930
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
-- 
2.28.0
