From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Dec 2019 23:11:34 +0100
Subject: [Buildroot] [PATCH v1] package/zip: fix musl compile
Message-ID: <20191217221134.2619-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For musl toolchain timezone.c needs time.h include.

Fixes:
  http://autobuild.buildroot.net/results/77346a2cdb9eeef661527fb9566019f3cd1b82c9

  In file included from util.c:28:
  timezone.c: In function 'mktime':
  timezone.c:644:18: error: dereferencing pointer to incomplete type 'struct tm'
       save_isdst = tm->tm_isdst;

  timezone.c:661:11: warning: implicit declaration of function 'localtime'; did you mean 'dostime'? [-Wimplicit-function-declaration]
       ltm = localtime(&then);

  timezone.c:661:9: warning: assignment to 'struct tm *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
       ltm = localtime(&then);

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ne.c-needs-time.h-fixes-musl-compile.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch

diff --git a/package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch b/package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch
new file mode 100644
index 0000000000..bdaa638f61
--- /dev/null
+++ b/package/zip/0007-timezone.c-needs-time.h-fixes-musl-compile.patch
@@ -0,0 +1,38 @@
+From 68abba9fb2ed114ac35712756b1f7700a865c498 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 17 Dec 2019 21:25:01 +0100
+Subject: [PATCH] timezone.c: needs time.h (fixes musl compile)
+
+Fixes:
+
+  In file included from util.c:28:
+  timezone.c: In function 'mktime':
+  timezone.c:644:18: error: dereferencing pointer to incomplete type 'struct tm'
+       save_isdst = tm->tm_isdst;
+
+  timezone.c:661:11: warning: implicit declaration of function 'localtime'; did you mean 'dostime'? [-Wimplicit-function-declaration]
+       ltm = localtime(&then);
+
+  timezone.c:661:9: warning: assignment to 'struct tm *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
+       ltm = localtime(&then);
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ timezone.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/timezone.c b/timezone.c
+index 485ec02..18aecbd 100644
+--- a/timezone.c
++++ b/timezone.c
+@@ -41,6 +41,7 @@
+ #include "timezone.h"
+ #include <ctype.h>
+ #include <errno.h>
++#include <time.h>
+ 
+ #ifdef IZTZ_DEFINESTDGLOBALS
+ long timezone = 0;
+-- 
+2.24.0
+
-- 
2.24.0
