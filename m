From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 13:50:19 +0200
Subject: [Buildroot] [git commit] package/sane-backends: fix uclibc compile
 due o missing stdarg.h include
Message-ID: <20210718111650.0703487E99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=7bb4f886abfc227c704accbb880059bb8fc85064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing stdarg.h include for va_list/va_start/va_end.

Fixes:

  - http://autobuild.buildroot.net/results/88f4ea971875b1a5eb88662326d9343341eaaea2

  microtek.c: In function ???MDBG_INIT???:
  microtek.c:163:3: error: unknown type name ???va_list???
    163 |   va_list ap;
        |   ^~~~~~~
  microtek.c:78:1: note: ???va_list??? is defined in header ???<stdarg.h>???; did you forget to ???#include <stdarg.h>????
     77 | #include "microtek.h"
    +++ |+#include <stdarg.h>
     78 |
  microtek.c:164:3: warning: implicit declaration of function ???va_start???; did you mean ???sane_start???? [-Wimplicit-function-declaration]
    164 |   va_start(ap, format);
        |   ^~~~~~~~
        |   sane_start
  microtek.c:165:54: warning: passing argument 4 of ???vsnprintf??? makes pointer from integer without a cast [-Wint-conversion]
    165 |   vsnprintf(_mdebug_string, MAX_MDBG_LENGTH, format, ap);
        |                                                      ^~
        |                                                      |
        |                                                      int
  In file included from ../include/sane/sanei_config.h:50,
                   from microtek.c:70:
  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:359:57: note: expected ???__va_list_tag *??? but argument is of type ???int???
    359 |         const char *__restrict __format, __gnuc_va_list __arg)
        |                                          ~~~~~~~~~~~~~~~^~~~~
  microtek.c:166:3: warning: implicit declaration of function ???va_end??? [-Wimplicit-function-declaration]
    166 |   va_end(ap);
        |   ^~~~~~

and

  sm3600-scanutil.c: In function ???debug_printf???:
  sm3600-scanutil.c:69:3: error: unknown type name ???va_list???
     69 |   va_list ap;
        |   ^~~~~~~
  sm3600-scanutil.c:48:1: note: ???va_list??? is defined in header ???<stdarg.h>???; did you forget to ???#include <stdarg.h>????
     47 | #include "sm3600-scantool.h"
    +++ |+#include <stdarg.h>
     48 |
  sm3600-scanutil.c:75:3: warning: implicit declaration of function ???va_start???; did you mean ???sane_start???? [-Wimplicit-function-decla
ration]
     75 |   va_start(ap,szFormat);
        |   ^~~~~~~~
        |   sane_start
  sm3600-scanutil.c:76:28: warning: passing argument 3 of ???vfprintf??? makes pointer from integer without a cast [-Wint-conversion]
     76 |   vfprintf(stderr,szFormat,ap);
        |                            ^~
        |                            |
        |                            int
  In file included from ../include/sane/sanei_config.h:50,
                   from sm3600.c:70:
  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:339:23: note: expected ???__va_list_tag *??? but argument is of type
 ???int???
    339 |        __gnuc_va_list __arg);
        |        ~~~~~~~~~~~~~~~^~~~~
  In file included from sm3600.c:94:
  sm3600-scanutil.c:77:3: warning: implicit declaration of function ???va_end??? [-Wimplicit-function-declaration]
     77 |   va_end(ap);
        |   ^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rotek-fix-uclibc-compile-include-stdarg.h.patch | 58 +++++++++++++++++++++
 ...600-scanutil-fix-uclibc-compile-include-s.patch | 59 ++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch b/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
new file mode 100644
index 0000000000..c5af162469
--- /dev/null
+++ b/package/sane-backends/0004-backend-microtek-fix-uclibc-compile-include-stdarg.h.patch
@@ -0,0 +1,58 @@
+From 145e16008e7479ea58278e55f71d6dfcd4db714b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 18 Jun 2021 19:51:45 +0200
+Subject: [PATCH] backend/microtek: fix uclibc compile (include stdarg.h for
+ va_list/va_start/va_end)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  microtek.c: In function ???MDBG_INIT???:
+  microtek.c:163:3: error: unknown type name ???va_list???
+    163 |   va_list ap;
+        |   ^~~~~~~
+  microtek.c:78:1: note: ???va_list??? is defined in header ???<stdarg.h>???; did you forget to ???#include <stdarg.h>????
+     77 | #include "microtek.h"
+    +++ |+#include <stdarg.h>
+     78 |
+  microtek.c:164:3: warning: implicit declaration of function ???va_start???; did you mean ???sane_start???? [-Wimplicit-function-declaration]
+    164 |   va_start(ap, format);
+        |   ^~~~~~~~
+        |   sane_start
+  microtek.c:165:54: warning: passing argument 4 of ???vsnprintf??? makes pointer from integer without a cast [-Wint-conversion]
+    165 |   vsnprintf(_mdebug_string, MAX_MDBG_LENGTH, format, ap);
+        |                                                      ^~
+        |                                                      |
+        |                                                      int
+  In file included from ../include/sane/sanei_config.h:50,
+                   from microtek.c:70:
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:359:57: note: expected ???__va_list_tag *??? but argument is of type ???int???
+    359 |         const char *__restrict __format, __gnuc_va_list __arg)
+        |                                          ~~~~~~~~~~~~~~~^~~~~
+  microtek.c:166:3: warning: implicit declaration of function ???va_end??? [-Wimplicit-function-declaration]
+    166 |   va_end(ap);
+        |   ^~~~~~
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/microtek.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/backend/microtek.c b/backend/microtek.c
+index 200a69c1a..63560179c 100644
+--- a/backend/microtek.c
++++ b/backend/microtek.c
+@@ -57,6 +57,7 @@
+ 
+ #include "../include/sane/config.h"
+ 
++#include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+-- 
+2.31.1
+
diff --git a/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch b/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch
new file mode 100644
index 0000000000..0ea9de245e
--- /dev/null
+++ b/package/sane-backends/0005-backend-sm3600-scanutil-fix-uclibc-compile-include-s.patch
@@ -0,0 +1,59 @@
+From 7dafc52dda96fa68f39058b10eec3d822fd5ea9d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 18 Jun 2021 19:56:56 +0200
+Subject: [PATCH] backend/sm3600-scanutil: fix uclibc compile (include stdarg.h
+ for va_list/va_start/va_end)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  sm3600-scanutil.c: In function ???debug_printf???:
+  sm3600-scanutil.c:69:3: error: unknown type name ???va_list???
+     69 |   va_list ap;
+        |   ^~~~~~~
+  sm3600-scanutil.c:48:1: note: ???va_list??? is defined in header ???<stdarg.h>???; did you forget to ???#include <stdarg.h>????
+     47 | #include "sm3600-scantool.h"
+    +++ |+#include <stdarg.h>
+     48 |
+  sm3600-scanutil.c:75:3: warning: implicit declaration of function ???va_start???; did you mean ???sane_start???? [-Wimplicit-function-declaration]
+     75 |   va_start(ap,szFormat);
+        |   ^~~~~~~~
+        |   sane_start
+  sm3600-scanutil.c:76:28: warning: passing argument 3 of ???vfprintf??? makes pointer from integer without a cast [-Wint-conversion]
+     76 |   vfprintf(stderr,szFormat,ap);
+        |                            ^~
+        |                            |
+        |                            int
+  In file included from ../include/sane/sanei_config.h:50,
+                   from sm3600.c:70:
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:339:23: note: expected ???__va_list_tag *??? but argument is of type ???int???
+    339 |        __gnuc_va_list __arg);
+        |        ~~~~~~~~~~~~~~~^~~~~
+  In file included from sm3600.c:94:
+  sm3600-scanutil.c:77:3: warning: implicit declaration of function ???va_end??? [-Wimplicit-function-declaration]
+     77 |   va_end(ap);
+        |   ^~~~~~
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/638]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/sm3600-scanutil.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/backend/sm3600-scanutil.c b/backend/sm3600-scanutil.c
+index 6fe67ed0c..616bf3f4c 100644
+--- a/backend/sm3600-scanutil.c
++++ b/backend/sm3600-scanutil.c
+@@ -43,6 +43,7 @@ Userspace scan tool for the Microtek 3600 scanner
+ 
+ ====================================================================== */
+ 
++#include <stdarg.h>
+ #include <unistd.h>
+ #include "sm3600-scantool.h"
+ 
+-- 
+2.31.1
+
