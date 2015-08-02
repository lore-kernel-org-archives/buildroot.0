From: Brendan Heading <brendanheading@gmail.com>
Date: Sun,  2 Aug 2015 22:53:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/arptables: fix musl compilation
	issues
Message-ID: <1438552426-6135-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/841/841129b8f49df205e1dabc2c2a5be70fa266768b/

Backported two patches from upstream which had solved this problem.
Please note that 0002-src-Use-stdint-types.patch is modified to apply
cleanly - details in the patch file.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
v1 -> v2 - clarified comments to show that one of the patches was
    modified relative to the upstream commit to make it apply.

 package/arptables/0002-src-Use-stdint-types.patch  | 134 +++++++++++++++++++++
 .../0003-src-Remove-support-for-libc5.patch        |  64 ++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 package/arptables/0002-src-Use-stdint-types.patch
 create mode 100644 package/arptables/0003-src-Remove-support-for-libc5.patch

diff --git a/package/arptables/0002-src-Use-stdint-types.patch b/package/arptables/0002-src-Use-stdint-types.patch
new file mode 100644
index 0000000..8a85e70
--- /dev/null
+++ b/package/arptables/0002-src-Use-stdint-types.patch
@@ -0,0 +1,134 @@
+From 24957c135eaacd718f3c788285de33d64316b32e Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 10:31:24 +0200
+Subject: [PATCH 1/2] src: Use stdint types
+
+Backport of upstream commit 047f37b1d5d865084a435fd7594b8c5c332ccb8d
+
+Please note that the backported patch does not include two changes
+to arptables.h from the upstream - these modified lines added in commit
+dbbe9f7de36aa3c7dd61dc89092c03f7902e474e which was committed after
+the 0.0.4 release.
+
+Upstream-status: backport
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ arptables.c                 | 8 ++++----
+ include/arptables.h         | 3 ++-
+ include/libarptc/libarptc.h | 7 ++++---
+ libarptc/libarptc.c         | 4 ++--
+ libarptc/libarptc_incl.c    | 2 +-
+ 5 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/arptables.c b/arptables.c
+index 5535ab2..6d1377f 100644
+--- a/arptables.c
++++ b/arptables.c
+@@ -230,7 +230,7 @@ extern void dump_entries(const arptc_handle_t handle);
+    /etc/protocols */
+ struct pprot {
+ 	char *name;
+-	u_int8_t num;
++	uint8_t num;
+ };
+ 
+ /* Primitive headers... */
+@@ -925,7 +925,7 @@ mask_to_dotted(const struct in_addr *mask)
+ {
+ 	int i;
+ 	static char buf[20];
+-	u_int32_t maskaddr, bits;
++	uint32_t maskaddr, bits;
+ 
+ 	maskaddr = ntohl(mask->s_addr);
+ 
+@@ -967,7 +967,7 @@ string_to_number(const char *s, unsigned int min, unsigned int max,
+ }
+ 
+ static void
+-set_option(unsigned int *options, unsigned int option, u_int16_t *invflg,
++set_option(unsigned int *options, unsigned int option, uint16_t *invflg,
+ 	   int invert)
+ {
+ 	if (*options & option)
+@@ -1107,7 +1107,7 @@ register_target(struct arptables_target *me)
+ }
+ 
+ static void
+-print_num(u_int64_t number, unsigned int format)
++print_num(uint64_t number, unsigned int format)
+ {
+ 	if (format & FMT_KILOMEGAGIGA) {
+ 		if (number > 99999) {
+diff --git a/include/arptables.h b/include/arptables.h
+index 820b664..e6a6ba6 100644
+--- a/include/arptables.h
++++ b/include/arptables.h
+@@ -1,6 +1,7 @@
+ #ifndef _ARPTABLES_USER_H
+ #define _ARPTABLES_USER_H
+ 
++#include <stdint.h>
+ #include "arptables_common.h"
+ #include "libarptc/libarptc.h"
+ 
+@@ -126,7 +127,7 @@ extern char *mask_to_dotted(const struct in_addr *mask);
+ 
+ extern void parse_hostnetworkmask(const char *name, struct in_addr **addrpp,
+                       struct in_addr *maskp, unsigned int *naddrs);
+-extern u_int16_t parse_protocol(const char *s);
++extern uint16_t parse_protocol(const char *s);
+ 
+ extern int do_command(int argc, char *argv[], char **table,
+ 		      arptc_handle_t *handle);
+diff --git a/include/libarptc/libarptc.h b/include/libarptc/libarptc.h
+index e4f1175..76fbfab 100644
+--- a/include/libarptc/libarptc.h
++++ b/include/libarptc/libarptc.h
+@@ -6,9 +6,10 @@
+ #include <linux/netfilter_arp/arp_tables.h>
+ 
+ #ifndef ARPT_MIN_ALIGN
+-/* arpt_entry has pointers and u_int64_t's in it, so if you align to
+-   it, you'll also align to any crazy matches and targets someone
+-   might write */
++/* arpt_entry has pointers and uint64_t's in it, so if you align to
++ * it, you'll also align to any crazy matches and targets someone
++ * might write.
++ */
+ #define ARPT_MIN_ALIGN (__alignof__(struct arpt_entry))
+ #endif
+ 
+diff --git a/libarptc/libarptc.c b/libarptc/libarptc.c
+index 2dcaaef..701bae0 100644
+--- a/libarptc/libarptc.c
++++ b/libarptc/libarptc.c
+@@ -256,8 +256,8 @@ unconditional(const struct arpt_arp *arp)
+ {
+ 	unsigned int i;
+ 
+-	for (i = 0; i < sizeof(*arp)/sizeof(u_int32_t); i++)
+-		if (((u_int32_t *)arp)[i])
++	for (i = 0; i < sizeof(*arp) / sizeof(uint32_t); i++)
++		if (((uint32_t *)arp)[i])
+ 			return 0;
+ 
+ 	return 1;
+diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
+index 2fa3d43..b41fcb2 100644
+--- a/libarptc/libarptc_incl.c
++++ b/libarptc/libarptc_incl.c
+@@ -1706,7 +1706,7 @@ TC_COMMIT(TC_HANDLE_T *handle)
+ 		/* Kernel will think that pointer should be 64-bits, and get
+ 		   padding.  So we accomodate here (assumption: alignment of
+ 		   `counters' is on 64-bit boundary). */
+-		u_int64_t *kernptr = (u_int64_t *)&newcounters->counters;
++		uint64_t *kernptr = (uint64_t *)&newcounters->counters;
+ 		if ((unsigned long)&newcounters->counters % 8 != 0) {
+ 			fprintf(stderr,
+ 				"counters alignment incorrect! Mail rusty!\n");
+-- 
+2.4.3
+
diff --git a/package/arptables/0003-src-Remove-support-for-libc5.patch b/package/arptables/0003-src-Remove-support-for-libc5.patch
new file mode 100644
index 0000000..15e893d
--- /dev/null
+++ b/package/arptables/0003-src-Remove-support-for-libc5.patch
@@ -0,0 +1,64 @@
+From 5f1379ff68bfedb56309527bee266a591b27a19e Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sat, 16 May 2015 10:31:41 +0200
+Subject: [PATCH 2/2] src: Remove support for libc5
+
+Fixes compilation with musl libc
+
+Backport of upstream commit f4ab8f63f11a72f14687a6646d04ae1bae3fa45f
+Upstream status: backport
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ include/libarptc/arpt_kernel_headers.h | 12 ------------
+ libarptc/libarptc.c                    |  4 ----
+ 2 files changed, 16 deletions(-)
+
+diff --git a/include/libarptc/arpt_kernel_headers.h b/include/libarptc/arpt_kernel_headers.h
+index 442cc54..140e999 100644
+--- a/include/libarptc/arpt_kernel_headers.h
++++ b/include/libarptc/arpt_kernel_headers.h
+@@ -5,7 +5,6 @@
+ 
+ #include <limits.h>
+ 
+-#if defined(__GLIBC__) && __GLIBC__ == 2
+ #include <netinet/ip.h>
+ #include <netinet/in.h>
+ #include <netinet/ip_icmp.h>
+@@ -14,16 +13,5 @@
+ #include <netinet/ether.h>
+ #include <net/if.h>
+ #include <sys/types.h>
+-#else
+-#include <sys/socket.h>
+-#include <linux/ip.h>
+-#include <linux/in.h>
+-#include <linux/if.h>
+-#include <linux/icmp.h>
+-#include <linux/tcp.h>
+-#include <linux/udp.h>
+-#include <linux/types.h>
+-#include <linux/in6.h>
+-#endif
+ 
+ #endif
+diff --git a/libarptc/libarptc.c b/libarptc/libarptc.c
+index 701bae0..9c5a5b0 100644
+--- a/libarptc/libarptc.c
++++ b/libarptc/libarptc.c
+@@ -23,10 +23,6 @@
+ #define inline
+ #endif
+ 
+-#if !defined(__GLIBC__) || (__GLIBC__ < 2)
+-typedef unsigned int socklen_t;
+-#endif
+-
+ #include "libarptc/libarptc.h"
+ 
+ #define IP_VERSION	4
+-- 
+2.4.3
+
-- 
2.4.3
