From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 27 Dec 2019 21:45:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/tio: fix termio redefinition
Message-ID: <20191227204520.1500501-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/1a7418b9cd11374a250f7509d5bddcc864375e1c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tspeed2.c-fix-redefinition-of-termio.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/tio/0001-src-setspeed2.c-fix-redefinition-of-termio.patch

diff --git a/package/tio/0001-src-setspeed2.c-fix-redefinition-of-termio.patch b/package/tio/0001-src-setspeed2.c-fix-redefinition-of-termio.patch
new file mode 100644
index 0000000000..de47290a0d
--- /dev/null
+++ b/package/tio/0001-src-setspeed2.c-fix-redefinition-of-termio.patch
@@ -0,0 +1,45 @@
+From 7a84120f7bfbe698fa8050953b7a3e7a7dc63ca0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Dec 2019 17:41:14 +0100
+Subject: [PATCH] src/setspeed2.c: fix redefinition of termio
+
+Include ioctls.h and termbits.h from asm-generic instead of asm to avoid
+the following build failure:
+
+In file included from setspeed2.c:24:0:
+/home/naourr/work/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/asm/termbits.h:17:8: error: redefinition of 'struct termio'
+ struct termio {
+        ^~~~~~
+In file included from /home/naourr/work/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/sys/ioctl.h:29:0,
+                 from setspeed2.c:22:
+/home/naourr/work/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/bits/ioctl-types.h:36:8: note: originally defined here
+ struct termio
+        ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1a7418b9cd11374a250f7509d5bddcc864375e1c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/tio/tio/pull/98]
+---
+ src/setspeed2.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/setspeed2.c b/src/setspeed2.c
+index 0adf695..6d82e66 100644
+--- a/src/setspeed2.c
++++ b/src/setspeed2.c
+@@ -20,8 +20,8 @@
+  */
+ 
+ #include <sys/ioctl.h>
+-#include <asm/ioctls.h>
+-#include <asm/termbits.h>
++#include <asm-generic/ioctls.h>
++#include <asm-generic/termbits.h>
+ 
+ int setspeed2(int fd, int baudrate)
+ {
+-- 
+2.24.0
+
-- 
2.24.0
