From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:10:00 +0200
Subject: [Buildroot] [git commit] stress-ng: fix build with kernel headers
 v3.9
Message-ID: <20180702200709.A4A1181300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca54f17a0ec7f3722e339eb2772c2f2e5e004bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch correcting the kernel headers version test macro.

Fixes:
http://autobuild.buildroot.net/results/cbf/cbfb80117840bddd5712bcda3caeaaff61745b0b/
http://autobuild.buildroot.net/results/649/64941ac5b7dcd9c100bdc47cdfe73cce5f23c3d8/
http://autobuild.buildroot.net/results/741/741f5881d3cb745d1003ede3f762c20eb72de0b5/

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-netlink-proc-fix-build-with-kernel-v3.9.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch b/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
new file mode 100644
index 0000000000..6cbba5e729
--- /dev/null
+++ b/package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch
@@ -0,0 +1,38 @@
+From f3aa381322a4b73b9ca4e7940f802d74324ef24b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 2 Jul 2018 21:06:43 +0300
+Subject: [PATCH] stress-netlink-proc: fix build with kernel v3.9
+
+The PROC_EVENT_COREDUMP has been introduced in kernel version 3.10.
+Don't use it with 3.9 headers.
+
+Fixes build failure:
+
+stress-netlink-proc.c: In function 'monitor':
+stress-netlink-proc.c:108:8: error: 'PROC_EVENT_COREDUMP' undeclared (first use in this function)
+   case PROC_EVENT_COREDUMP:
+        ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/ColinIanKing/stress-ng/pull/24
+
+ stress-netlink-proc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stress-netlink-proc.c b/stress-netlink-proc.c
+index 5845610dc816..6114a0b92af1 100644
+--- a/stress-netlink-proc.c
++++ b/stress-netlink-proc.c
+@@ -104,7 +104,7 @@ static int monitor(const args_t *args, const int sock)
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31)
+ 		case PROC_EVENT_SID:
+ #endif
+-#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,9,0)
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,10,0)
+ 		case PROC_EVENT_COREDUMP:
+ #endif
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3,1,0)
+-- 
+2.18.0
+
