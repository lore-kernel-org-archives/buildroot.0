From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Oct 2017 11:14:52 +0200
Subject: [Buildroot] [PATCH v2] evemu: fix PATH_MAX related compile failure
Message-ID: <20171011091452.11162-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1] when building with musl:

  find_event_devices.c: In function 'find_event_devices':
find_event_devices.c:60:14: error: 'PATH_MAX' undeclared (first use in this function)
   char fname[PATH_MAX];
              ^~~~~~~~

[1] http://autobuild.buildroot.net/results/607/607bb29231f80a138e1b5423bc01c89e36efe78c/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - use limits.h instead of linux/limits.h, change patch commit message,
    add musl reference (suggested by Arnout Vandecappelle)
---
 .../evemu/0001-Include-limits.h-for-PATH_MAX.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/evemu/0001-Include-limits.h-for-PATH_MAX.patch

diff --git a/package/evemu/0001-Include-limits.h-for-PATH_MAX.patch b/package/evemu/0001-Include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 0000000000..04a0cc6b9a
--- /dev/null
+++ b/package/evemu/0001-Include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,35 @@
+From e80a13776e6d6df29fd704cd63e0744200c3df1b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 1 Oct 2017 19:54:53 +0200
+Subject: [PATCH] Include limits.h for PATH_MAX.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following compile failure when building with musl:
+
+  find_event_devices.c: In function ?find_event_devices?:
+  find_event_devices.c:60:14: error: ?PATH_MAX? undeclared (first use in this function)
+     char fname[PATH_MAX];
+                ^~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ tools/find_event_devices.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/find_event_devices.c b/tools/find_event_devices.c
+index 2a43d54..3a74096 100644
+--- a/tools/find_event_devices.c
++++ b/tools/find_event_devices.c
+@@ -24,6 +24,7 @@
+ 
+ #define _GNU_SOURCE
+ #include <linux/input.h>
++#include <limits.h>
+ #include <dirent.h>
+ #include <string.h>
+ #include <stdio.h>
+-- 
+2.14.2
+
-- 
2.14.2
