From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 15 Aug 2016 11:45:41 +0530
Subject: [Buildroot] [PATCH v2 1/2] mtd: fix musl build issue
Message-ID: <1471241742-28182-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With musl C library, we get following build error

  integck.c:37:28: fatal error: bits/stdio_lim.h: No such file or directory
   #include <bits/stdio_lim.h>
                              ^
  compilation terminated.
  make[2]: *** [integck] Error 1

Header <bits/stdio_lim.h> is not available in musl C library. However
<stdio.h> has all definition that <bits/stdio_lim.h> supposed to be
providing. Moreover <bits/stdio_lim.h> shouldn't be included directly
instead we should be using <stdio.h>.

Since we already include <stdio.h> and in case of uClibc or glibc
<bits/stdio_lim.h> gets included internally, we can safely remove it.

Fixes:

  http://autobuild.buildroot.net/results/175/1754861457af520480cc34d7d2d0edff2868ff66/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Changes v1 -> v2:
  - No changes 
---
 ...tegrity-don-t-include-header-bits-stdio_l.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch

diff --git a/package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch b/package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch
new file mode 100644
index 0000000..5c0a552
--- /dev/null
+++ b/package/mtd/0003-fs-tests-integrity-don-t-include-header-bits-stdio_l.patch
@@ -0,0 +1,45 @@
+From 600ab10e3b452cdffc6c82770b0bb2ff5c23ad70 Mon Sep 17 00:00:00 2001
+From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Date: Fri, 12 Aug 2016 22:59:35 +0530
+Subject: [PATCH 1/1] fs-tests: integrity: don't include header
+ <bits/stdio_lim.h>
+
+With musl C library, we get following build error
+
+integck.c:37:28: fatal error: bits/stdio_lim.h: No such file or directory
+ #include <bits/stdio_lim.h>
+                            ^
+compilation terminated.
+make[2]: *** [integck] Error 1
+
+Header <bits/stdio_lim.h> is not available in musl C library. However
+<stdio.h> has all definition that <bits/stdio_lim.h> supposed to be
+providing. Moreover <bits/stdio_lim.h> shouldn't be included directly
+instead we should be using <stdio.h>.
+
+Since we already include <stdio.h> and in case of uClibc or glibc
+<bits/stdio_lim.h> gets included internally, we can safely remove it.
+
+This build issue is found by Buildroot autobuilder
+http://autobuild.buildroot.net/results/175/1754861457af520480cc34d7d2d0edff2868ff66/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ tests/fs-tests/integrity/integck.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
+index 6ef817e..0bb9711 100644
+--- a/tests/fs-tests/integrity/integck.c
++++ b/tests/fs-tests/integrity/integck.c
+@@ -34,7 +34,6 @@
+ #ifdef INTEGCK_DEBUG
+ #include <execinfo.h>
+ #endif
+-#include <bits/stdio_lim.h>
+ #include <sys/mman.h>
+ #include <sys/vfs.h>
+ #include <sys/mount.h>
+-- 
+2.6.2
+
-- 
2.6.2
