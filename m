From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 11 May 2020 17:26:02 +0300
Subject: [Buildroot] [PATCH] package/tio: fix build with termio redefinition
Message-ID: <20200511142602.46170-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Include termbits.h from asm-generic/ which does not have termio
definition which is already defined by sys/ioctl.h -> ioctl-types.h

Same approach is also used by flashrom tool.

Fixes: http://autobuild.buildroot.net/results/076d5f166631450d25f25916381f0bfd6f1d58da

Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
---
 ...01-setspeed2-fix-termio-redefinition.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/tio/0001-setspeed2-fix-termio-redefinition.patch

diff --git a/package/tio/0001-setspeed2-fix-termio-redefinition.patch b/package/tio/0001-setspeed2-fix-termio-redefinition.patch
new file mode 100644
index 0000000000..89a555eceb
--- /dev/null
+++ b/package/tio/0001-setspeed2-fix-termio-redefinition.patch
@@ -0,0 +1,30 @@
+From 02e13b011b9fee00cafaf3ed95cb04a414e0aa35 Mon Sep 17 00:00:00 2001
+From: Vadym Kochan <vadim4j@gmail.com>
+Date: Sun, 10 May 2020 01:49:30 +0300
+Subject: [PATCH] setspeed2: fix termio redefinition
+
+Include termbits.h from asm-generic which does not defines 'struct
+termio' which causes redefinition issue with already declared one from
+the sys/ioctl.h -> ioctl-types.h by glibc.
+
+Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
+---
+ src/setspeed2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/setspeed2.c b/src/setspeed2.c
+index 0adf695..f80f0c2 100644
+--- a/src/setspeed2.c
++++ b/src/setspeed2.c
+@@ -21,7 +21,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <asm/ioctls.h>
+-#include <asm/termbits.h>
++#include <asm-generic/termbits.h>
+ 
+ int setspeed2(int fd, int baudrate)
+ {
+-- 
+2.26.2
+
-- 
2.26.2
