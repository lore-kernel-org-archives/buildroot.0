From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 23:54:12 +0200
Subject: [Buildroot] [git commit branch/next] package/iproute2: fix build
 with musl libc
Message-ID: <20190530215531.3E13F8E78D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64cefaab04c6de3764360ab738bffd2a28abd9ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch fixing collision of definitions between libc and kernel
headers.

Fixes:
http://autobuild.buildroot.net/results/d38d3a84c61f37747c652382646839a69de16463/
http://autobuild.buildroot.net/results/41bd8e53b51a96f1b29d7ba0d8661a6dfc958415/

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ink-fix-libc-and-kernel-headers-collision.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/iproute2/0001-devlink-fix-libc-and-kernel-headers-collision.patch b/package/iproute2/0001-devlink-fix-libc-and-kernel-headers-collision.patch
new file mode 100644
index 0000000000..e111b71032
--- /dev/null
+++ b/package/iproute2/0001-devlink-fix-libc-and-kernel-headers-collision.patch
@@ -0,0 +1,51 @@
+From 602128d22db86bd67e11dec8fe40a73832c222c9 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 30 May 2019 18:22:40 +0300
+Subject: [PATCH] devlink: fix libc and kernel headers collision
+
+Since commit 2f1242efe9d ("devlink: Add devlink health show command") we
+use the sys/sysinfo.h header for the sysinfo(2) system call. But since
+iproute2 carries a local version of the kernel struct sysinfo, this
+causes a collision with libc that do not rely on kernel defined sysinfo
+like musl libc:
+
+In file included from devlink.c:25:0:
+.../sysroot/usr/include/sys/sysinfo.h:10:8: error: redefinition of 'struct sysinfo'
+ struct sysinfo {
+        ^~~~~~~
+In file included from ../include/uapi/linux/kernel.h:5:0,
+                 from ../include/uapi/linux/netlink.h:5,
+                 from ../include/uapi/linux/genetlink.h:6,
+                 from devlink.c:21:
+../include/uapi/linux/sysinfo.h:8:8: note: originally defined here
+ struct sysinfo {
+		^~~~~~~
+
+Rely on the kernel header alone to avoid kernel and userspace headers
+collision of definitions.
+
+Cc: Aya Levin <ayal@mellanox.com>
+Cc: Moshe Shemesh <moshe@mellanox.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: http://patchwork.ozlabs.org/patch/1107817/
+
+ devlink/devlink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/devlink/devlink.c b/devlink/devlink.c
+index 436935f88bda..d7a6ce94f0e6 100644
+--- a/devlink/devlink.c
++++ b/devlink/devlink.c
+@@ -22,7 +22,7 @@
+ #include <linux/devlink.h>
+ #include <libmnl/libmnl.h>
+ #include <netinet/ether.h>
+-#include <sys/sysinfo.h>
++#include <linux/sysinfo.h>
+ #include <sys/queue.h>
+ 
+ #include "SNAPSHOT.h"
+-- 
+2.20.1
+
