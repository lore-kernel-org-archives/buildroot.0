From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  7 Feb 2020 16:14:26 +0100
Subject: [Buildroot] [PATCH 2/3] package/exim: fix various build failures
In-Reply-To: <20200207151427.12475-1-luca@lucaceresoli.net>
References: <20200207151427.12475-1-luca@lucaceresoli.net>
Message-ID: <20200207151427.12475-3-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ..._lock-fix-lstat-related-build-errors.patch | 50 +++++++++++++++++++
 .../exim/0006-sieve-fix-build-errors.patch    | 41 +++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch
 create mode 100644 package/exim/0006-sieve-fix-build-errors.patch

diff --git a/package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch b/package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch
new file mode 100644
index 000000000000..9da97b6720a1
--- /dev/null
+++ b/package/exim/0005-exim_lock-fix-lstat-related-build-errors.patch
@@ -0,0 +1,50 @@
+From bbcf4320134efd8a01ce5a02bb9af62019ca05f6 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Tue, 4 Feb 2020 15:57:48 +0100
+Subject: [PATCH] exim_lock: fix lstat-related build errors
+
+exim_lock fails to cross-compile with the Sourcery CodeBench ARM 2014.05
+toolchain due the a missing include of sys/types.h, needed for the
+constants used by fstat() and lstat().
+
+Discovered when cross-compiling with the Buildroot embedded Linux
+buildsystem.
+
+Fixes:
+
+  exim_lock.c:427:30: error: 'S_IFMT' undeclared (first use in this function)
+         if ((statbuf.st_mode & S_IFMT) == S_IFLNK)
+                                ^
+  exim_lock.c:427:30: note: each undeclared identifier is reported only once for each function it appears in
+  exim_lock.c:427:41: error: 'S_IFLNK' undeclared (first use in this function)
+         if ((statbuf.st_mode & S_IFMT) == S_IFLNK)
+                                           ^
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ src/exim_lock.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/exim_lock.c b/src/exim_lock.c
+index 068216816054..cb140aff6436 100644
+--- a/src/exim_lock.c
++++ b/src/exim_lock.c
+@@ -13,6 +13,8 @@ Argument: the name of the lock file
+ Copyright (c) The Exim Maintainers 2016
+ */
+
++#define _XOPEN_SOURCE
++
+ #include "os.h"
+
+ #include <stdio.h>
+@@ -26,6 +28,7 @@ Copyright (c) The Exim Maintainers 2016
+ #include <unistd.h>
+ #include <utime.h>
+ #include <sys/utsname.h>
++#include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
+ #include <pwd.h>
+--
+2.25.0
diff --git a/package/exim/0006-sieve-fix-build-errors.patch b/package/exim/0006-sieve-fix-build-errors.patch
new file mode 100644
index 000000000000..147dc2ff9b22
--- /dev/null
+++ b/package/exim/0006-sieve-fix-build-errors.patch
@@ -0,0 +1,41 @@
+From e9d0b5b022df172d3615e9e2875506c74e6d7cd1 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Wed, 5 Feb 2020 17:13:57 +0100
+Subject: [PATCH] sieve: fix build errors
+
+sieve fails to cross-compile with the Sourcery CodeBench ARM 2014.05
+toolchain with a huge number of errors, including:
+
+  .../sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
+    const u_char *_msg, *_eom;
+    ^
+  .../sysroot/usr/include/arpa/nameser.h:474:1: error: unknown type name 'u_long'
+   u_long  ns_get32 (const u_char *) __THROW;
+   ^
+  .../sysroot/usr/include/arpa/nameser.h:475:31: error: expected ')' before '*' token
+   void  ns_put16 (u_int, u_char *) __THROW;
+                                 ^
+
+Discovered when cross-compiling with the Buildroot embedded Linux
+buildsystem.
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ src/sieve.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/sieve.c b/src/sieve.c
+index 5e8d1e6f4776..9632f2d43810 100644
+--- a/src/sieve.c
++++ b/src/sieve.c
+@@ -12,6 +12,8 @@
+
+ /* Sieve mail filter. */
+
++#define _BSD_SOURCE
++
+ #include <ctype.h>
+ #include <errno.h>
+ #include <limits.h>
+--
+2.25.0
-- 
2.25.0
