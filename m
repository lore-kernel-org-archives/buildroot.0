From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2011 14:41:54 -0300
Subject: [Buildroot] [PATCH 2/7] iproute2: bump to version 2.6.38
In-Reply-To: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303321319-16553-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../iproute2/iproute2-2.6.37-optional-ipv6.patch   |   94 --------------------
 package/iproute2/iproute2-optional-ipv6.patch      |   94 ++++++++++++++++++++
 package/iproute2/iproute2.mk                       |    2 +-
 3 files changed, 95 insertions(+), 95 deletions(-)
 delete mode 100644 package/iproute2/iproute2-2.6.37-optional-ipv6.patch
 create mode 100644 package/iproute2/iproute2-optional-ipv6.patch

diff --git a/package/iproute2/iproute2-2.6.37-optional-ipv6.patch b/package/iproute2/iproute2-2.6.37-optional-ipv6.patch
deleted file mode 100644
index ef22c22..0000000
--- a/package/iproute2/iproute2-2.6.37-optional-ipv6.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-[PATCH] fix build on uClibc without IPv6 support
-
-Disable IPv6 support code when building with uClibc configured without IPv6
-support.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ip/ip6tunnel.c |    6 ++++++
- ip/ipprefix.c  |    8 ++++++++
- ip/iptunnel.c  |    6 ++++++
- 3 files changed, 20 insertions(+)
-
-Index: iproute2-2.6.37-orig/ip/ip6tunnel.c
-===================================================================
---- iproute2-2.6.37-orig.orig/ip/ip6tunnel.c
-+++ iproute2-2.6.37-orig/ip/ip6tunnel.c
-@@ -20,6 +20,10 @@
-  *	Masahide NAKAMURA @USAGI
-  */
- 
-+#include <features.h>
-+#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
-+#else
-+
- #include <stdio.h>
- #include <string.h>
- #include <stdlib.h>
-@@ -410,3 +414,5 @@ int do_ip6tunnel(int argc, char **argv)
- 	fprintf(stderr, "Command \"%s\" is unknown, try \"ip -f inet6 tunnel help\".\n", *argv);
- 	exit(-1);
- }
-+
-+#endif /* no ipv6 */
-Index: iproute2-2.6.37-orig/ip/ipprefix.c
-===================================================================
---- iproute2-2.6.37-orig.orig/ip/ipprefix.c
-+++ iproute2-2.6.37-orig/ip/ipprefix.c
-@@ -22,11 +22,17 @@
-  * Authors:
-  *	Masahide NAKAMURA @USAGI
-  */
-+#include <features.h>
-+#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
-+#define NO_IPV6
-+#endif
- 
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#ifndef NO_IPV6
- #include <netinet/icmp6.h>
-+#endif
- #include "utils.h"
- 
- /* prefix flags; see kernel's net/ipv6/addrconf.c and include/net/if_inet6.h */
-@@ -62,10 +68,12 @@ int print_prefix(const struct sockaddr_n
- 		fprintf(stderr, "wrong family %d\n", prefix->prefix_family);
- 		return 0;
- 	}
-+#ifdef ND_OPT_PREFIX_INFORMATION
- 	if (prefix->prefix_type != ND_OPT_PREFIX_INFORMATION) {
- 		fprintf(stderr, "wrong ND type %d\n", prefix->prefix_type);
- 		return 0;
- 	}
-+#endif
- 
- 	parse_rtattr(tb, RTA_MAX, RTM_RTA(prefix), len);
- 
-Index: iproute2-2.6.37-orig/ip/iptunnel.c
-===================================================================
---- iproute2-2.6.37-orig.orig/ip/iptunnel.c
-+++ iproute2-2.6.37-orig/ip/iptunnel.c
-@@ -9,6 +9,10 @@
-  * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
-  *
-  */
-+#include <features.h>
-+#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
-+#define NO_IPV6
-+#endif
- 
- #include <stdio.h>
- #include <stdlib.h>
-@@ -601,8 +605,10 @@ int do_iptunnel(int argc, char **argv)
- 	 * protocol-independent because of unarranged structure between
- 	 * IPv4 and IPv6.
- 	 */
-+#ifndef NO_IPV6
- 	case AF_INET6:
- 		return do_ip6tunnel(argc, argv);
-+#endif
- 	default:
- 		fprintf(stderr, "Unsupported family:%d\n", preferred_family);
- 		exit(-1);
diff --git a/package/iproute2/iproute2-optional-ipv6.patch b/package/iproute2/iproute2-optional-ipv6.patch
new file mode 100644
index 0000000..ef22c22
--- /dev/null
+++ b/package/iproute2/iproute2-optional-ipv6.patch
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
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index dfb8410..630fab4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 2.6.37
+IPROUTE2_VERSION = 2.6.38
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
-- 
1.7.3.4
