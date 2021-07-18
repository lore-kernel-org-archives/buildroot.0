From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 14:02:36 +0200
Subject: [Buildroot] [git commit] package/trinity: fix build with kernel >=
 5.13
Message-ID: <20210718112911.2468987F5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=2f0ae33afd371fa528d5872f62248d7b394794a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c58119baed8d7711da799e34a5ee1117f46b96f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...proto-ip-raw.c-fix-build-with-kernel-5.13.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch b/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch
new file mode 100644
index 0000000000..4c747f41c9
--- /dev/null
+++ b/package/trinity/0002-net-proto-ip-raw.c-fix-build-with-kernel-5.13.patch
@@ -0,0 +1,37 @@
+From da65f0aa2bfcb4a2d9a77abfaa2955c6be3d37c9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 17 Jul 2021 08:02:31 +0200
+Subject: [PATCH] net/proto-ip-raw.c: fix build with kernel >= 5.13
+
+Fix the following build failure with kernel >= 5.13:
+
+In file included from /home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/linux/icmp.h:23,
+                 from net/proto-ip-raw.c:1:
+/home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/netinet/in.h:33:5: error: redeclaration of enumerator 'IPPROTO_IP'
+   33 |     IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
+      |     ^~~~~~~~~~
+/home/buildroot/autobuild/instance-2/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/linux/in.h:29:3: note: previous definition of 'IPPROTO_IP' was here
+   29 |   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
+      |   ^~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c58119baed8d7711da799e34a5ee1117f46b96f4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kernelslacker/trinity/pull/35]
+---
+ net/proto-ip-raw.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/proto-ip-raw.c b/net/proto-ip-raw.c
+index 95f2cb13..b407bb68 100644
+--- a/net/proto-ip-raw.c
++++ b/net/proto-ip-raw.c
+@@ -1,3 +1,4 @@
++#include <netinet/in.h>
+ #include <linux/icmp.h>
+ #include "net.h"
+ #include "trinity.h"
+-- 
+2.30.2
+
