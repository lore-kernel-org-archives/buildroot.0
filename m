From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 22:57:11 +0200
Subject: [Buildroot] [git commit] pppd: fix build with Linux 4.8 headers
Message-ID: <20161020205844.B81578041E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=035567b2793f3649e2ddc6cd34b75dd643f47d73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the build of pppd with toolchain using Linux 4.8
headers. The patch has been taken from a pull request pending on the
Github project, which is unfortunately somewhat dead.

The fix is not the most beautiful one, but it does the job, in a piece
of source code that's anyway rather messy in terms of mixing userspace
headers and kernel headers.

Fixes:

  http://autobuild.buildroot.net/results/bdc4f274e527c5aebf9bd1b2ca85ba8e7da57e9d/
  and numerous similar other build failures

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../pppd/0001-fix-building-with-linux-4.8.patch    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/pppd/0001-fix-building-with-linux-4.8.patch b/package/pppd/0001-fix-building-with-linux-4.8.patch
new file mode 100644
index 0000000..d09e392
--- /dev/null
+++ b/package/pppd/0001-fix-building-with-linux-4.8.patch
@@ -0,0 +1,39 @@
+From 492e240a651e3d32b84cac66e4675ee99dcbe05a Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 13 Oct 2016 13:41:43 +0800
+Subject: [PATCH] ppp: fix building with linux-4.8
+
+Fix a build error when using the linux-4.8 headers that results in:
+
+In file included from pppoe.h:87:0,
+                 from plugin.c:29:
+../usr/include/netinet/in.h:211:8: note: originally defined here
+ struct in6_addr
+        ^~~~~~~~
+In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
+                 from ../usr/include/linux/if_pppox.h:26,
+                 from plugin.c:52:
+../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockaddr_in6'
+ struct sockaddr_in6 {
+        ^~~~~~~~~~~~
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+[Thomas: downloaded from https://github.com/paulusmack/ppp/pull/69.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ pppd/plugins/rp-pppoe/pppoe.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..96d2794 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
+ #include <linux/if_ether.h>
+ #endif
+ 
+-#include <netinet/in.h>
++#include <linux/in.h>
+ 
+ #ifdef HAVE_NETINET_IF_ETHER_H
+ #include <sys/types.h>
