From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Nov 2016 15:18:14 +0000
Subject: [Buildroot] [PATCH master] net-tools: fix field with incomplete
	type error
Message-ID: <20161107151814.48924-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update 0002 patch to match the one sent as a pull request. The previous
one introduced a new problem that has been addressed in the new version.

Some Linux headers included in certain toolchains may not have an
updated linux/if_tunnel.h which includes linux/ip.h, so we need to
include it unconditionally otherwise linux/if_tunnel.h will use the
struct iphdr before being defined and the compilation will fail in this
way:

In file included from iptunnel.c:33:0:
/usr/include/linux/if_tunnel.h:37:16: error: field 'iph' has incomplete
type
  struct iphdr  iph;
                  ^

Pull request URL:
  https://sourceforge.net/p/net-tools/code/merge-requests/4/

Fixes:
  http://autobuild.buildroot.net/results/34f/34f9b10ef6a613057e8f6457d8a0a2fa142ad123/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...02-iptunnel.c-do-not-include-netinet-ip.h.patch | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch b/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch
index 002c9da..a8658c4 100644
--- a/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch
+++ b/package/net-tools/0002-iptunnel.c-do-not-include-netinet-ip.h.patch
@@ -1,4 +1,4 @@
-From 7a9a369d9de784791a2ab384877aab5ff3801d4e Mon Sep 17 00:00:00 2001
+From eec38a200357b195efbb23bb645ab721c040f246 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Thu, 3 Nov 2016 12:59:39 +0000
 Subject: [PATCH] iptunnel.c: do not include netinet/ip.h
@@ -29,19 +29,32 @@ of that the compilation fails due to a struct redefinition.
 
 The problem can be solved by just not including netinet/ip.h.
 
+However, some Linux headers included in certain toolchains may not have
+an updated linux/if_tunnel.h which includes linux/ip.h, so we need to
+include it unconditionally otherwise linux/if_tunnel.h will use the
+struct iphdr before being defined and the compilation will also fail in
+this way:
+
+================================
+In file included from iptunnel.c:33:0:
+/usr/include/linux/if_tunnel.h:37:16: error: field 'iph' has incomplete type
+  struct iphdr  iph;
+                  ^
+================================
+
 Upstream status: merge request sent
-https://sourceforge.net/p/net-tools/code/merge-requests/3/
+https://sourceforge.net/p/net-tools/code/merge-requests/4/
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
- iptunnel.c | 1 -
- 1 file changed, 1 deletion(-)
+ iptunnel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/iptunnel.c b/iptunnel.c
-index 3fe1b84..247ae10 100644
+index 3fe1b84..e2ec2d8 100644
 --- a/iptunnel.c
 +++ b/iptunnel.c
-@@ -26,7 +26,6 @@
+@@ -26,11 +26,11 @@
  #include <sys/socket.h>
  #include <sys/ioctl.h>
  #include <netinet/in.h>
@@ -49,6 +62,11 @@ index 3fe1b84..247ae10 100644
  #include <arpa/inet.h>
  #include <net/if.h>
  #include <net/if_arp.h>
+ #include <linux/types.h>
++#include <linux/ip.h>
+ #include <linux/if_tunnel.h>
+
+ #include "config.h"
 -- 
 2.10.1
 
-- 
2.10.1
