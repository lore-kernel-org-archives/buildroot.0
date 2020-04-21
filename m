From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 14:38:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: fix build with powerpc
Message-ID: <20200421123852.3529227-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-log.c-fix-build-with-powerpc.patch   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/mbuffer/0002-log.c-fix-build-with-powerpc.patch

diff --git a/package/mbuffer/0002-log.c-fix-build-with-powerpc.patch b/package/mbuffer/0002-log.c-fix-build-with-powerpc.patch
new file mode 100644
index 0000000000..9873a72d01
--- /dev/null
+++ b/package/mbuffer/0002-log.c-fix-build-with-powerpc.patch
@@ -0,0 +1,38 @@
+From 9fbda0adbf59a44f5f0d725f5c31f88ccec7ca56 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Apr 2020 14:30:20 +0200
+Subject: [PATCH] log.c: fix build with powerpc
+
+Include linux/limits.h if __linux__ is defined to avoid the following
+build failure:
+
+log.c: In function 'infomsg':
+log.c:123:12: error: 'PIPE_BUF' undeclared (first use in this function)
+   if (s <= PIPE_BUF) {
+            ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to thomas at maier-komor.de]
+---
+ log.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/log.c b/log.c
+index 6ea6507..738d493 100644
+--- a/log.c
++++ b/log.c
+@@ -29,7 +29,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#if defined(__linux)
++#if defined(__linux) || defined(__linux__)
+ #include <linux/limits.h>
+ #elif defined(__bsd)
+ #include <sys/syslimits.h>
+-- 
+2.25.1
+
-- 
2.25.1
