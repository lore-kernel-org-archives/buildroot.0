From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 20:50:06 +0200
Subject: [Buildroot] [git commit] package/lxc: add patch to fix musl build
Message-ID: <20160524185014.481DE81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=953a85439cb39345676cdce234de070475344783
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix a build issue with the musl C library.

struct in6_addr is both defined in the C library header <netinet/in.h> and the
Linux kernel header <linux/in6.h>.

lxc_user_nic.c includes both <netinet/in.h> and <linux/if_bridge.h>. The later
one includes <linux/in6.h>.

This breaks build with the musl libc:
  error: redefinition of ???struct in6_addr???

As lxc_user_nic.c does not use any references from <linux/if_bridge.h> it is
safe to remove this header.

Fixes:
http://autobuild.buildroot.net/results/f32/f321823be6b477be7dc55393e563a3a61794265d/
http://autobuild.buildroot.net/results/8ab/8ab2dc8e0634fbfb582db94cdf94cee5712711f9/
http://autobuild.buildroot.net/results/e27/e27d637b1bb7278ae30d86a72a2d88432d805d2c/
.. and more.

Upstream status: Pending
https://github.com/lxc/lxc/pull/1029

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Fix-redefinition-of-struct-in6_addr.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch b/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
new file mode 100644
index 0000000..b48ece3
--- /dev/null
+++ b/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
@@ -0,0 +1,43 @@
+From 245bba9aadf8e7aea487b6fbd851f86c75524552 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 19 May 2016 21:51:27 +0200
+Subject: [PATCH] Fix redefinition of struct in6_addr
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+struct in6_addr is both defined in the C library header <netinet/in.h>
+and the Linux kernel header <linux/in6.h>.
+
+lxc_user_nic.c includes both <netinet/in.h> and <linux/if_bridge.h>. The
+later one includes <linux/in6.h>.
+
+This breaks build with the musl libc:
+  error: redefinition of ???struct in6_addr???
+
+As lxc_user_nic.c does not use any references from <linux/if_bridge.h> it
+is safe to remove this header.
+
+Upstream status: Pending
+https://github.com/lxc/lxc/pull/1029
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/lxc/lxc_user_nic.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/lxc/lxc_user_nic.c b/src/lxc/lxc_user_nic.c
+index 87780ca..0cb38ba 100644
+--- a/src/lxc/lxc_user_nic.c
++++ b/src/lxc/lxc_user_nic.c
+@@ -41,7 +41,6 @@
+ #include <net/if.h>
+ #include <net/if_arp.h>
+ #include <netinet/in.h>
+-#include <linux/if_bridge.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/sockios.h>
+-- 
+2.8.2
+
