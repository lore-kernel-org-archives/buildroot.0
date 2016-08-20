From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Sat, 20 Aug 2016 17:26:04 +0530
Subject: [Buildroot] [PATCH 1/1] trousers: fix build issue with musl
Message-ID: <1471694164-2094-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With musl C library, we get following build error when building trousers:

  tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
   #include <bits/local_lim.h>
                              ^
  compilation terminated.

Header <bits/local_lim.h> is not available in musl. tsp_tcsi_param.c
uses this for macro HOST_NAME_MAX.

This patch add support for checking presence of header <bits/local_lim.h>.
And based on that we include it or define macro HOST_NAME_MAX to 64 if
it is not already defined.

Value 64 is chosen because <bits/local_lim.h> also uses same value.

Fixes:

  http://autobuild.buildroot.net/results/c9b/c9b13ae8d4af9ae6a65921de142c0e8da30664e0/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../trousers/0003-fix-build-issue-with-musl.patch  | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/trousers/0003-fix-build-issue-with-musl.patch

diff --git a/package/trousers/0003-fix-build-issue-with-musl.patch b/package/trousers/0003-fix-build-issue-with-musl.patch
new file mode 100644
index 0000000..c34e6d4
--- /dev/null
+++ b/package/trousers/0003-fix-build-issue-with-musl.patch
@@ -0,0 +1,52 @@
+fix build issue with musl
+
+With musl C library, we get following build error when building trousers:
+
+  tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
+   #include <bits/local_lim.h>
+                              ^
+  compilation terminated.
+
+Header <bits/local_lim.h> is not available in musl. tsp_tcsi_param.c
+uses this for macro HOST_NAME_MAX.
+
+This patch add support for checking presence of header <bits/local_lim.h>.
+And based on that we include it or define macro HOST_NAME_MAX to 64 if
+it is not already defined.
+
+Value 64 is chosen because <bits/local_lim.h> also uses same value.
+
+This build issue is found by Buildroot autobuilder
+http://autobuild.buildroot.net/results/c9b/c9b13ae8d4af9ae6a65921de142c0e8da30664e0/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+
+--- trousers-0.3.13/configure.in.old	2016-08-20 16:35:56.887744480 +0530
++++ trousers-0.3.13/configure.in	2016-08-20 16:36:38.643744392 +0530
+@@ -13,7 +13,7 @@ TSS_VER_MINOR=3
+ AC_CANONICAL_TARGET
+ AM_INIT_AUTOMAKE([foreign 1.6])
+ AC_CONFIG_MACRO_DIR([m4])
+-
++AC_CHECK_HEADERS([bits/local_lim.h])
+ # Debugging support
+ AC_ARG_ENABLE([debug],
+     [AC_HELP_STRING([--enable-debug], [turn on all trousers debugging flags [default=off]])],
+--- trousers-0.3.13/./src/tspi/tsp_tcsi_param.c.old	2016-08-20 16:48:26.315742897 +0530
++++ trousers-0.3.13/src/tspi/tsp_tcsi_param.c	2016-08-20 16:51:03.683742564 +0530
+@@ -11,7 +11,15 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
++
++#ifdef HAVE_BITS_LOCAL_LIM_H
+ #include <bits/local_lim.h>
++#else
++#ifndef HOST_NAME_MAX
++#define HOST_NAME_MAX 64
++#endif
++#endif
++
+ #include "trousers/tss.h"
+ #include "trousers/trousers.h"
+ #include "trousers_types.h"
-- 
2.6.2
