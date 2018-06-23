From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 22:43:02 +0200
Subject: [Buildroot] [git commit] iproute2: fix rdma build
Message-ID: <20180623204033.92186813A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0d19a208300a850b04ddf397e937ba0b2599692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieve upstream patch

Fixes:
 - http://autobuild.buildroot.net/results/63229f485f58be32238916cd997cbe92ac3ca953

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-rdma-sync-some-IP-headers-with-glibc.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch b/package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch
new file mode 100644
index 0000000000..f78a5d6b43
--- /dev/null
+++ b/package/iproute2/0001-rdma-sync-some-IP-headers-with-glibc.patch
@@ -0,0 +1,39 @@
+From 5887ff0922a06d978d3271df9f01fcb04fadc75f Mon Sep 17 00:00:00 2001
+From: Hoang Le <hoang.h.le@dektech.com.au>
+Date: Wed, 13 Jun 2018 11:09:56 +0700
+Subject: rdma: sync some IP headers with glibc
+
+In the commit 9a362cc71a45, new userspace header:
+  (i.e rdma/rdma_user_cm.h -> linux/in6.h)
+is included before the kernel space header:
+  (i.e utils.h -> resolv.h -> netinet/in.h).
+
+This leads to unsynchronous some IP headers and compiler got failure
+with error: redefinition of some structs IP.
+
+In this commit, just reorder this including to make them in-sync.
+
+Signed-off-by: Hoang Le <hoang.h.le@dektech.com.au>
+Acked-by: Leon Romanovsky <leonro@mellanox.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=5887ff0922a06d978d3271df9f01fcb04fadc75f]
+---
+ rdma/rdma.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/rdma/rdma.h b/rdma/rdma.h
+index fcaf9e6..d4b7ba1 100644
+--- a/rdma/rdma.h
++++ b/rdma/rdma.h
+@@ -15,6 +15,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <netinet/in.h>
+ #include <libmnl/libmnl.h>
+ #include <rdma/rdma_netlink.h>
+ #include <rdma/rdma_user_cm.h>
+-- 
+cgit v1.1
+
