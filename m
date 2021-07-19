From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:03:00 +0200
Subject: [Buildroot] [git commit] package/apitrace: fix musl build
Message-ID: <20210719203513.E78BC8842F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=68753ed38dc0a32389987f1f7af2413312ee667e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

build on musl is broken since bump to version 10.0 in commit
1d15817576b44c30eaa9bb8d1152934c6498b776

Fixes:
 - http://autobuild.buildroot.org/results/a10793d01efa3a1533ba37aa845b9ac2bb1dfb6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...libbacktrace-backtrace-h-include-config.h.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch b/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
new file mode 100644
index 0000000000..bc76e5e26b
--- /dev/null
+++ b/package/apitrace/0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
@@ -0,0 +1,40 @@
+From 36ff87a927092b4d62c587736d7684dea9c82e63 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 19 Jul 2021 08:27:48 +0200
+Subject: [PATCH] thirdparty/libbacktrace/backtrace/h: include config.h
+
+Build on musl is broken since version 10.0 because the include on
+config.h was removed by
+https://github.com/apitrace/apitrace/commit/1544abf59d68d74977b8b692bea4d7468d65547b:
+
+In file included from /home/buildroot/autobuild/instance-3/output-1/build/apitrace-10.0/thirdparty/libbacktrace/testlib.c:40:
+/home/buildroot/autobuild/instance-3/output-1/build/apitrace-10.0/thirdparty/libbacktrace/backtrace.h:53:10: fatal error: gstdint.h: No such file or directory
+   53 | #include "gstdint.h"
+      |          ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a10793d01efa3a1533ba37aa845b9ac2bb1dfb6b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not needed
+(https://github.com/apitrace/apitrace/issues/755)]
+---
+ thirdparty/libbacktrace/backtrace.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/thirdparty/libbacktrace/backtrace.h b/thirdparty/libbacktrace/backtrace.h
+index 2814763f..ab7679a0 100644
+--- a/thirdparty/libbacktrace/backtrace.h
++++ b/thirdparty/libbacktrace/backtrace.h
+@@ -33,6 +33,8 @@ POSSIBILITY OF SUCH DAMAGE.  */
+ #ifndef BACKTRACE_H
+ #define BACKTRACE_H
+ 
++#include "config.h"
++
+ #include <stddef.h>
+ #include <stdio.h>
+ 
+-- 
+2.30.2
+
