From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 01:37:24 +0100
Subject: [Buildroot] [git commit master 1/1] iproute2: fix build on configs
	without ipv6 support
Message-ID: <20110130003803.03AB18E24A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5568c8b632b5d00bea1d9032e49c60a7027d6884
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/Config.in                         |    4 -
 .../iproute2/iproute2-2.6.37-optional-ipv6.patch   |   94 ++++++++++++++++++++
 2 files changed, 94 insertions(+), 4 deletions(-)
 create mode 100644 package/iproute2/iproute2-2.6.37-optional-ipv6.patch

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index 2412d8e..b6ee86e 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
-	depends on BR2_INET_IPV6
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
-
-comment "iproute2 requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
diff --git a/package/iproute2/iproute2-2.6.37-optional-ipv6.patch b/package/iproute2/iproute2-2.6.37-optional-ipv6.patch
new file mode 100644
index 0000000..ef22c22
--- /dev/null
+++ b/package/iproute2/iproute2-2.6.37-optional-ipv6.patch
@@ -0,0 +1,94 @@
+[PATCH] fix build on uClibc without IPv6 support
+
+Disable IPv6 support code when building with uClibc configured without IPv6
+support.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ ip/ip6tunnel.c |    6 ++++++
+ ip/ipprefix.c  |    8 ++++++++
+ ip/iptunnel.c  |    6 ++++++
+ 3 files changed, 20 insertions(+)
+
+Index: iproute2-2.6.37-orig/ip/ip6tunnel.c
+===================================================================
+--- iproute2-2.6.37-orig.orig/ip/ip6tunnel.c
++++ iproute2-2.6.37-orig/ip/ip6tunnel.c
+@@ -20,6 +20,10 @@
+  *	Masahide NAKAMURA @USAGI
+  */
+ 
++#include <features.h>
++#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
++#else
++
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -410,3 +414,5 @@ int do_ip6tunnel(int argc, char **argv)
+ 	fprintf(stderr, "Command \"%s\" is unknown, try \"ip -f inet6 tunnel help\".\n", *argv);
+ 	exit(-1);
+ }
++
++#endif /* no ipv6 */
+Index: iproute2-2.6.37-orig/ip/ipprefix.c
+===================================================================
+--- iproute2-2.6.37-orig.orig/ip/ipprefix.c
++++ iproute2-2.6.37-orig/ip/ipprefix.c
+@@ -22,11 +22,17 @@
+  * Authors:
+  *	Masahide NAKAMURA @USAGI
+  */
++#include <features.h>
++#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
++#define NO_IPV6
++#endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#ifndef NO_IPV6
+ #include <netinet/icmp6.h>
++#endif
+ #include "utils.h"
+ 
+ /* prefix flags; see kernel's net/ipv6/addrconf.c and include/net/if_inet6.h */
+@@ -62,10 +68,12 @@ int print_prefix(const struct sockaddr_n
+ 		fprintf(stderr, "wrong family %d\n", prefix->prefix_family);
+ 		return 0;
+ 	}
++#ifdef ND_OPT_PREFIX_INFORMATION
+ 	if (prefix->prefix_type != ND_OPT_PREFIX_INFORMATION) {
+ 		fprintf(stderr, "wrong ND type %d\n", prefix->prefix_type);
+ 		return 0;
+ 	}
++#endif
+ 
+ 	parse_rtattr(tb, RTA_MAX, RTM_RTA(prefix), len);
+ 
+Index: iproute2-2.6.37-orig/ip/iptunnel.c
+===================================================================
+--- iproute2-2.6.37-orig.orig/ip/iptunnel.c
++++ iproute2-2.6.37-orig/ip/iptunnel.c
+@@ -9,6 +9,10 @@
+  * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
+  *
+  */
++#include <features.h>
++#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
++#define NO_IPV6
++#endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -601,8 +605,10 @@ int do_iptunnel(int argc, char **argv)
+ 	 * protocol-independent because of unarranged structure between
+ 	 * IPv4 and IPv6.
+ 	 */
++#ifndef NO_IPV6
+ 	case AF_INET6:
+ 		return do_ip6tunnel(argc, argv);
++#endif
+ 	default:
+ 		fprintf(stderr, "Unsupported family:%d\n", preferred_family);
+ 		exit(-1);
-- 
1.7.3.4
