From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Sep 2019 17:09:02 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/iptables: bump to
 version 1.8.3
Message-ID: <20190919152221.2C9AE8EBD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca6fe7ad5fb27254708af91f2772c203b3d6cc72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Drop upstream patches.

Fixes a buffer overflow issue in iptables-save parsing.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 326a9ae2e5cd1e13abd1ea3de2a17909086e221c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...an-fix-userspace-kernel-headers-collision.patch | 45 -------------
 ...tables-monitor-fix-build-with-older-glibc.patch | 77 ----------------------
 ...-fix-build-with-kernel-headers-before-4.2.patch | 51 --------------
 ...-xtables-monitor-fix-build-with-musl-libc.patch | 44 -------------
 ...end-the-headers-conflict-workaround-to-in.patch | 37 -----------
 package/iptables/iptables.hash                     |  2 +-
 package/iptables/iptables.mk                       |  2 +-
 7 files changed, 2 insertions(+), 256 deletions(-)

diff --git a/package/iptables/0001-ebtables-vlan-fix-userspace-kernel-headers-collision.patch b/package/iptables/0001-ebtables-vlan-fix-userspace-kernel-headers-collision.patch
deleted file mode 100644
index 37c6f96af4..0000000000
--- a/package/iptables/0001-ebtables-vlan-fix-userspace-kernel-headers-collision.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 51d374ba41ae4f1bb851228c06b030b83dd2092f Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 13 Nov 2018 19:22:08 +0200
-Subject: [PATCH] ebtables: vlan: fix userspace/kernel headers collision
-
-Build with musl libc fails because of conflicting struct ethhdr
-definitions:
-
-In file included from .../sysroot/usr/include/net/ethernet.h:10:0,
-                 from ../iptables/nft-bridge.h:8,
-                 from libebt_vlan.c:18:
-.../sysroot/usr/include/netinet/if_ether.h:107:8: error: redefinition of ???struct ethhdr???
- struct ethhdr {
-        ^~~~~~
-In file included from libebt_vlan.c:16:0:
-.../sysroot/usr/include/linux/if_ether.h:160:8: note: originally defined here
- struct ethhdr {
-        ^~~~~~
-
-Include the userspace header first for the definition suppression logic
-to do the right thing.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
-Upstream status: commit 51d374ba41ae
-
- extensions/libebt_vlan.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/extensions/libebt_vlan.c b/extensions/libebt_vlan.c
-index 4a2eb7126895..be269c6cdb4c 100644
---- a/extensions/libebt_vlan.c
-+++ b/extensions/libebt_vlan.c
-@@ -12,6 +12,7 @@
- #include <getopt.h>
- #include <ctype.h>
- #include <xtables.h>
-+#include <netinet/if_ether.h>
- #include <linux/netfilter_bridge/ebt_vlan.h>
- #include <linux/if_ether.h>
- #include "iptables/nft.h"
--- 
-2.19.1
-
diff --git a/package/iptables/0002-xtables-monitor-fix-build-with-older-glibc.patch b/package/iptables/0002-xtables-monitor-fix-build-with-older-glibc.patch
deleted file mode 100644
index 18dbc28f91..0000000000
--- a/package/iptables/0002-xtables-monitor-fix-build-with-older-glibc.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 7c8791edac3e74f6ce0bf21f98bc820db8e55e62 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 16 Nov 2018 07:23:32 +0200
-Subject: [PATCH] xtables-monitor: fix build with older glibc
-
-glibc older than 2.19 only expose BSD style fields of struct tcphdr when
-_BSD_SOURCE is define. Current glibc however, warn that _BSD_SOURCE is
-deprecated. Migrate to the GNU style of tcphdr fields to make the code
-compatible with any glibc version.
-
-Fix the following build failure:
-
-xtables-monitor.c: In function 'trace_print_packet':
-xtables-monitor.c:406:43: error: 'const struct tcphdr' has no member named 'th_sport'
-    printf("SPORT=%d DPORT=%d ", ntohs(tcph->th_sport), ntohs(tcph->th_dport));
-                                           ^
-xtables-monitor.c:406:66: error: 'const struct tcphdr' has no member named 'th_dport'
-    printf("SPORT=%d DPORT=%d ", ntohs(tcph->th_sport), ntohs(tcph->th_dport));
-                                                                  ^
-...
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream status: commit 7c8791edac3e74
-
- iptables/xtables-monitor.c | 30 ++++++++++++++----------------
- 1 file changed, 14 insertions(+), 16 deletions(-)
-
-diff --git a/iptables/xtables-monitor.c b/iptables/xtables-monitor.c
-index 3b1ca777a28a..5d1611122df5 100644
---- a/iptables/xtables-monitor.c
-+++ b/iptables/xtables-monitor.c
-@@ -403,26 +403,24 @@ static void trace_print_packet(const struct nftnl_trace *nlt, struct cb_arg *arg
- 		case IPPROTO_UDP:
- 			if (len < 4)
- 				break;
--			printf("SPORT=%d DPORT=%d ", ntohs(tcph->th_sport), ntohs(tcph->th_dport));
-+			printf("SPORT=%d DPORT=%d ", ntohs(tcph->source), ntohs(tcph->dest));
- 			break;
- 		case IPPROTO_TCP:
- 			if (len < sizeof(*tcph))
- 				break;
--			printf("SPORT=%d DPORT=%d ", ntohs(tcph->th_sport), ntohs(tcph->th_dport));
--			if (tcph->th_flags & (TH_FIN|TH_SYN|TH_RST|TH_PUSH|TH_ACK|TH_URG)) {
--				if (tcph->th_flags & TH_SYN)
--					printf("SYN ");
--				if (tcph->th_flags & TH_ACK)
--					printf("ACK ");
--				if (tcph->th_flags & TH_FIN)
--					printf("FIN ");
--				if (tcph->th_flags & TH_RST)
--					printf("RST ");
--				if (tcph->th_flags & TH_PUSH)
--					printf("PSH ");
--				if (tcph->th_flags & TH_URG)
--					printf("URG ");
--			}
-+			printf("SPORT=%d DPORT=%d ", ntohs(tcph->source), ntohs(tcph->dest));
-+			if (tcph->syn)
-+				printf("SYN ");
-+			if (tcph->ack)
-+				printf("ACK ");
-+			if (tcph->fin)
-+				printf("FIN ");
-+			if (tcph->rst)
-+				printf("RST ");
-+			if (tcph->psh)
-+				printf("PSH ");
-+			if (tcph->urg)
-+				printf("URG ");
- 			break;
- 		default:
- 			break;
--- 
-2.19.1
-
diff --git a/package/iptables/0003-include-fix-build-with-kernel-headers-before-4.2.patch b/package/iptables/0003-include-fix-build-with-kernel-headers-before-4.2.patch
deleted file mode 100644
index c5cd6437f0..0000000000
--- a/package/iptables/0003-include-fix-build-with-kernel-headers-before-4.2.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8d9d7e4b9ef4c6e6abab2cf35c747d7ca36824bd Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 16 Nov 2018 09:30:33 +0200
-Subject: [PATCH] include: fix build with kernel headers before 4.2
-
-Commit 672accf1530 (include: update kernel netfilter header files)
-updated linux/netfilter.h and brought with it the update from kernel
-commit a263653ed798 (netfilter: don't pull include/linux/netfilter.h
-from netns headers). This triggers conflict of headers that is fixed in
-kernel commit 279c6c7fa64f (api: fix compatibility of linux/in.h with
-netinet/in.h) included in kernel version 4.2. For earlier kernel headers
-we need a workaround that prevents the headers conflict.
-
-Fixes the following build failure:
-
-In file included from .../sysroot/usr/include/netinet/ip.h:25:0,
-                 from ../include/libiptc/ipt_kernel_headers.h:8,
-                 from ../include/libiptc/libiptc.h:6,
-                 from libip4tc.c:29:
-.../sysroot/usr/include/linux/in.h:26:3: error: redeclaration of enumerator ???IPPROTO_IP???
-   IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
-   ^
-.../sysroot/usr/include/netinet/in.h:33:5: note: previous definition of ???IPPROTO_IP??? was here
-     IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
-     ^~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream status: commit 8d9d7e4b9ef4c6
-
- include/linux/netfilter.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
-index c3f087ac680c..bacf8cd92116 100644
---- a/include/linux/netfilter.h
-+++ b/include/linux/netfilter.h
-@@ -3,7 +3,9 @@
- 
- #include <linux/types.h>
- 
-+#ifndef _NETINET_IN_H
- #include <linux/in.h>
-+#endif
- #include <linux/in6.h>
- #include <limits.h>
- 
--- 
-2.19.1
-
diff --git a/package/iptables/0004-xtables-monitor-fix-build-with-musl-libc.patch b/package/iptables/0004-xtables-monitor-fix-build-with-musl-libc.patch
deleted file mode 100644
index 0b6358b255..0000000000
--- a/package/iptables/0004-xtables-monitor-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 90b0d3abfc0b4150b198eb17080d75acc5838a59 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sat, 17 Nov 2018 22:20:08 +0200
-Subject: [PATCH] xtables-monitor: fix build with musl libc
-
-Commit 7c8791edac3 ("xtables-monitor: fix build with older glibc")
-changed the code to use GNU style tcphdr fields. Unfortunately, musl
-libc requires _GNU_SOURCE definition to expose these fields.
-
-Fix the following build failure:
-
-xtables-monitor.c: In function ???trace_print_packet???:
-xtables-monitor.c:406:43: error: ???const struct tcphdr??? has no member named ???source???
-    printf("SPORT=%d DPORT=%d ", ntohs(tcph->source), ntohs(tcph->dest));
-                                           ^~
-xtables-monitor.c:406:64: error: ???const struct tcphdr??? has no member named ???dest???
-    printf("SPORT=%d DPORT=%d ", ntohs(tcph->source), ntohs(tcph->dest));
-                                                                ^~
-...
-
-Cc: Florian Westphal <fw@strlen.de>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Florian Westphal <fw@strlen.de>
----
-Upstream status: commit 90b0d3abfc0b
-
- iptables/xtables-monitor.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/iptables/xtables-monitor.c b/iptables/xtables-monitor.c
-index 5d1611122df5..f835c5e503e0 100644
---- a/iptables/xtables-monitor.c
-+++ b/iptables/xtables-monitor.c
-@@ -9,6 +9,7 @@
-  * This software has been sponsored by Sophos Astaro <http://www.sophos.com>
-  */
- 
-+#define _GNU_SOURCE
- #include <stdlib.h>
- #include <time.h>
- #include <string.h>
--- 
-2.19.1
-
diff --git a/package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch b/package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch
deleted file mode 100644
index 6b1ffbd639..0000000000
--- a/package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 23dee088cd54aae94f1b71046f2ab2b206eedd42 Mon Sep 17 00:00:00 2001
-Message-Id: <23dee088cd54aae94f1b71046f2ab2b206eedd42.1543092537.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sat, 24 Nov 2018 22:33:37 +0200
-Subject: [PATCH] include: extend the headers conflict workaround to in6.h
-
-Commit 8d9d7e4b9ef ("include: fix build with kernel headers before 4.2")
-introduced a kernel/user headers conflict workaround that allows build
-of iptables with kernel headers older than 4.2. This minor extension
-allows build with kernel headers older than 3.12, which is the version
-that introduced explicit IP headers synchronization.
-
-Cc: Florian Westphal <fw@strlen.de>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://www.spinics.net/lists/netfilter-devel/msg57029.html
-
- include/linux/netfilter.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
-index bacf8cd92116..042d8b1478e0 100644
---- a/include/linux/netfilter.h
-+++ b/include/linux/netfilter.h
-@@ -5,8 +5,8 @@
- 
- #ifndef _NETINET_IN_H
- #include <linux/in.h>
--#endif
- #include <linux/in6.h>
-+#endif
- #include <limits.h>
- 
- /* Responses from hook functions. */
--- 
-2.19.1
-
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index d84bd3af98..2e149aa11b 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256 a3778b50ed1a3256f9ca975de82c2204e508001fc2471238c8c97f3d1c4c12af  iptables-1.8.2.tar.bz2
+sha256 a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80  iptables-1.8.3.tar.bz2
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 54494937af..ae5cf4ddd3 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.2
+IPTABLES_VERSION = 1.8.3
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
