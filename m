From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Apr 2020 23:33:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with gcc 4.8
Message-ID: <20200411213318.972221-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/63f983aa22ca5303a55bc55e004f05a94e5f7259

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-frame-xchg.c-fix-build-with-gcc-4.8.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/iwd/0001-frame-xchg.c-fix-build-with-gcc-4.8.patch

diff --git a/package/iwd/0001-frame-xchg.c-fix-build-with-gcc-4.8.patch b/package/iwd/0001-frame-xchg.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..360f00a913
--- /dev/null
+++ b/package/iwd/0001-frame-xchg.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,41 @@
+From f0b875e652a5341c755480f3a3c93195ddcb7aba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 Apr 2020 23:21:42 +0200
+Subject: [PATCH] frame-xchg.c: fix build with gcc 4.8
+
+SOL_NETLINK is used since commit
+87a198111af1ea67053895f7435fb99e3cdd2159 resulting in the following
+build failure with gcc 4.8:
+
+src/frame-xchg.c: In function 'frame_watch_group_io_read':
+src/frame-xchg.c:328:27: error: 'SOL_NETLINK' undeclared (first use in this function)
+   if (cmsg->cmsg_level != SOL_NETLINK)
+                           ^
+Fixes:
+ - http://autobuild.buildroot.org/results/3485088b84111c271bbcfaf025aa4103c6452072
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://lists.01.org/hyperkitty/list/iwd at lists.01.org/thread/X72BFTKJWWKBXAKPEWUZ2XV53766VDID]
+---
+ src/frame-xchg.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/frame-xchg.c b/src/frame-xchg.c
+index 50351615..4c950fd3 100644
+--- a/src/frame-xchg.c
++++ b/src/frame-xchg.c
+@@ -42,6 +42,10 @@
+ #include "src/netdev.h"
+ #include "src/frame-xchg.h"
+ 
++#ifndef SOL_NETLINK
++#define SOL_NETLINK 270
++#endif
++
+ struct watch_group {
+ 	/*
+ 	 * Group IDs, except 0, are per wdev for user's convenience.
+-- 
+2.25.1
+
-- 
2.25.1
