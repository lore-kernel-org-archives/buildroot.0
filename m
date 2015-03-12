From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 12 Mar 2015 22:03:58 +0100
Subject: [Buildroot] [PATCH] package/gdb: fix build with glibc 2.20
Message-ID: <1426194238-622-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch from gdb 7.8.

Fixes:
http://autobuild.buildroot.net/results/3d5/3d5cb8bea0964f0d46733e47d04a053021e63643/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...lude-asm-ptrace.h-for-linux-aarch64-low.c.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch

diff --git a/package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch b/package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch
new file mode 100644
index 0000000..89e34be
--- /dev/null
+++ b/package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch
@@ -0,0 +1,36 @@
+From cbc39812c1721d7edd20285134fdf748d0f26127 Mon Sep 17 00:00:00 2001
+From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
+Date: Fri, 23 May 2014 09:01:14 +0100
+Subject: [PATCH] Include asm/ptrace.h for linux-aarch64-low.c
+
+A recent change to glibc removed asm/ptrace.h from user.h for AArch64.
+This meant that cross-native builds of gdbserver using trunk glibc broke
+because linux-aarch64-low.c because user_hwdebug_state couldn't be found.
+
+This is like commit #036cd38182bde32d8297b630cd5c861d53b8949e
+
+2014-05-23  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+        * linux-aarch64-low.c (asm/ptrace.h): Include.
+[Romain:
+  - rebase on top of 7.7.1]
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ gdb/gdbserver/linux-aarch64-low.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/gdbserver/linux-aarch64-low.c b/gdb/gdbserver/linux-aarch64-low.c
+index 1b0da6c..ba66bc8 100644
+--- a/gdb/gdbserver/linux-aarch64-low.c
++++ b/gdb/gdbserver/linux-aarch64-low.c
+@@ -26,6 +26,7 @@
+ #include <signal.h>
+ #include <sys/user.h>
+ #include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ #include <sys/uio.h>
+ 
+ #include "gdb_proc_service.h"
+-- 
+1.9.3
+
-- 
1.9.3
