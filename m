From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 15 Jan 2019 20:18:14 +0100
Subject: [Buildroot] [PATCH 1/1] ltp: Bump version 20190115
Message-ID: <20190115191814.21480-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop statx patch as it's included in this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../0002-statx-fix-compile-errors.patch       | 35 -------------------
 package/ltp-testsuite/ltp-testsuite.hash      |  4 +--
 package/ltp-testsuite/ltp-testsuite.mk        |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/ltp-testsuite/0002-statx-fix-compile-errors.patch

diff --git a/package/ltp-testsuite/0002-statx-fix-compile-errors.patch b/package/ltp-testsuite/0002-statx-fix-compile-errors.patch
deleted file mode 100644
index 6ddd2c9054..0000000000
--- a/package/ltp-testsuite/0002-statx-fix-compile-errors.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a945304b6a2286d0665c70250cc5475eb07fd21e Mon Sep 17 00:00:00 2001
-From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
-Date: Wed, 26 Sep 2018 11:15:45 -0300
-Subject: [PATCH] statx: fix compile errors
-
-struct statx is only defined in sys/stat.h when _GNU_SOURCE is defined.
-The testcases do define _GNU_SOURCE, but not the m4 struct check.
-
-Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
----
- m4/ltp-statx.m4 | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ltp-statx.m4 b/m4/ltp-statx.m4
-index 44303d30c..5f79a94cd 100644
---- a/m4/ltp-statx.m4
-+++ b/m4/ltp-statx.m4
-@@ -23,6 +23,11 @@ dnl
- AC_DEFUN([LTP_CHECK_STATX],[
- AC_CHECK_FUNCS(statx,,,[[#include <sys/stat.h>]])
- AC_CHECK_HEADER(linux/fs.h,,,)
--AC_CHECK_TYPES([struct statx],,,[[#include <sys/stat.h>]])
--AC_CHECK_TYPES([struct statx_timestamp],,,[[#include <sys/stat.h>]])
-+AC_CHECK_TYPES([struct statx],,,[[
-+	#define _GNU_SOURCE
-+	#include <sys/stat.h>
-+]])
-+AC_CHECK_TYPES([struct statx_timestamp],,,[[
-+	#define _GNU_SOURCE
-+	#include <sys/stat.h>]])
- ])
--- 
-2.19.0
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 1f04aee482..ba0dcbe7e8 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20180926/ltp-full-20180926.tar.xz.sha1
-sha1 da5c8e847ed909dbd0b859c6918bc526cf6c2695  ltp-full-20180926.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20190115/ltp-full-20190115.tar.xz.sha1
+sha1 d87e2f96dc628f927e98ecba2e9dae581fc115b4  ltp-full-20190115.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 9001316fbd..ecd822b4d6 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20180926
+LTP_TESTSUITE_VERSION = 20190115
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
-- 
2.19.2
