From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:14:13 +0100
Subject: [Buildroot] [git commit] package/trinity: fix build with kernel
 headers v4.19
Message-ID: <20181213201023.331F38B759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=badc3c9f04b01c065a8cc5a07b57ec43c96b4c5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel v4.19 introduced a change in linux/rds.h UAPI header that causes
networking definitions collision with libc headers. Add a patch fixing
that be reordering the include list.

Fixes:
http://autobuild.buildroot.net/results/b30/b30993de10c909602ec2e9098a91e400fa9c91f6/
http://autobuild.buildroot.net/results/96d/96deb94e5f959c844060d449fae5668c5f3c5571/
http://autobuild.buildroot.net/results/c7a/c7aa75fd8faad7ac49492497807d1a7fe4c4f955/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...to-rds-include-libc-network-headers-first.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/trinity/0005-proto-rds-include-libc-network-headers-first.patch b/package/trinity/0005-proto-rds-include-libc-network-headers-first.patch
new file mode 100644
index 0000000000..438bbfb56a
--- /dev/null
+++ b/package/trinity/0005-proto-rds-include-libc-network-headers-first.patch
@@ -0,0 +1,48 @@
+From 350c05e5c0d7af5941a9c17f2f86e1c6297d7475 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 12 Dec 2018 20:52:50 +0200
+Subject: [PATCH] proto-rds: include libc network headers first
+
+To avoid collisions between libc networking headers and header kernels
+the libc headers must appear first in the list of headers. This fixes a
+build issue with kernel headers v4.19:
+
+In file included from include/net.h:5:0,
+                 from net/proto-rds.c:6:
+.../sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
+ struct in6_addr {
+        ^~~~~~~~
+In file included from .../sysroot/usr/include/linux/rds.h:40:0,
+                 from net/proto-rds.c:4:
+.../sysroot/usr/include/linux/in6.h:33:8: note: originally defined here
+ struct in6_addr {
+		^~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/kernelslacker/trinity/pull/29
+
+ net/proto-rds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/proto-rds.c b/net/proto-rds.c
+index c8ff22f886c3..06e36e82d990 100644
+--- a/net/proto-rds.c
++++ b/net/proto-rds.c
+@@ -1,12 +1,12 @@
+ #ifdef USE_RDS
+ #include <sys/socket.h>
+ #include <stdint.h>
+-#include <linux/rds.h>
+ #include <stdlib.h>
+ #include "net.h"
+ #include "compat.h"
+ #include "random.h"
+ #include "utils.h"	// RAND_ARRAY
++#include <linux/rds.h>
+ 
+ static void rds_gen_sockaddr(struct sockaddr **addr, socklen_t *addrlen)
+ {
+-- 
+2.19.2
+
