From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:17:17 +0100
Subject: [Buildroot] [git commit] net-tools: add a patch to avoid struct
	redefinition
Message-ID: <20161103212904.39584818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=108b9c1e6b15d74d2e3a3241901fbdaca42df524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a struct redefinition problem like this one:

================================
In file included from /usr/include/linux/if_tunnel.h:6:0,
from iptunnel.c:34:
/usr/include/linux/ip.h:85:8: error: redefinition of 'struct iphdr'
struct iphdr {
^
In file included from iptunnel.c:29:0:
/usr/include/netinet/ip.h:45:8: note: originally defined here
struct iphdr
^
================================

iptunnel.c includes netinet/ip.h which contains a definition of the
iphdr struct.

iptunnel.c also includes linux/if_tunnel.h which includes linux/ip.h
which contains a definition of the iphdr struct.

So, both netinet/ip.h and linux/ip.h define the iphdr struct, and both
of them have been included directly or indirectly by iptunnel.c. Because
of that the compilation fails due to a struct redefinition.

The problem can be solved by just not including netinet/ip.h.

The patch has been sent upstream as a merge request:
  https://sourceforge.net/p/net-tools/code/merge-requests/3/

Fixes:
  http://autobuild.buildroot.net/results/dce/dce499da84b2a41bab946d5109a283ccb85c8b81/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...02-iptunnel.c-do-not-include-netinet-ip.h.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch b/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch
new file mode 100644
index 0000000..002c9da
--- /dev/null
+++ b/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch
@@ -0,0 +1,54 @@
+From 7a9a369d9de784791a2ab384877aab5ff3801d4e Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 3 Nov 2016 12:59:39 +0000
+Subject: [PATCH] iptunnel.c: do not include netinet/ip.h
+
+This fixes a struct redefinition problem like this one:
+
+================================
+In file included from /usr/include/linux/if_tunnel.h:6:0,
+                 from iptunnel.c:34:
+/usr/include/linux/ip.h:85:8: error: redefinition of 'struct iphdr'
+ struct iphdr {
+        ^
+In file included from iptunnel.c:29:0:
+/usr/include/netinet/ip.h:45:8: note: originally defined here
+ struct iphdr
+        ^
+================================
+
+iptunnel.c includes netinet/ip.h which contains a definition of the
+iphdr struct.
+
+iptunnel.c also includes linux/if_tunnel.h which includes linux/ip.h
+which contains a definition of the iphdr struct.
+
+So, both netinet/ip.h and linux/ip.h define the iphdr struct, and both
+of them have been included directly or indirectly by iptunnel.c. Because
+of that the compilation fails due to a struct redefinition.
+
+The problem can be solved by just not including netinet/ip.h.
+
+Upstream status: merge request sent
+https://sourceforge.net/p/net-tools/code/merge-requests/3/
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ iptunnel.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/iptunnel.c b/iptunnel.c
+index 3fe1b84..247ae10 100644
+--- a/iptunnel.c
++++ b/iptunnel.c
+@@ -26,7 +26,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <netinet/in.h>
+-#include <netinet/ip.h>
+ #include <arpa/inet.h>
+ #include <net/if.h>
+ #include <net/if_arp.h>
+-- 
+2.10.1
+
