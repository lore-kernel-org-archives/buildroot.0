From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Aug 2013 18:57:19 -0300
Subject: [Buildroot] [PATCH 3/5] iproute2: bump to version 3.10.0
In-Reply-To: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
References: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1377899841-26206-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2-optional-ipv6.patch | 57 ++++++++++++---------------
 package/iproute2/iproute2.mk                  |  4 +-
 2 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/package/iproute2/iproute2-optional-ipv6.patch b/package/iproute2/iproute2-optional-ipv6.patch
index ef22c22..c51f695 100644
--- a/package/iproute2/iproute2-optional-ipv6.patch
+++ b/package/iproute2/iproute2-optional-ipv6.patch
@@ -3,21 +3,17 @@
 Disable IPv6 support code when building with uClibc configured without IPv6
 support.
 
+[Gustavo: update for iproute2 3.10.0]
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- ip/ip6tunnel.c |    6 ++++++
- ip/ipprefix.c  |    8 ++++++++
- ip/iptunnel.c  |    6 ++++++
- 3 files changed, 20 insertions(+)
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Index: iproute2-2.6.37-orig/ip/ip6tunnel.c
-===================================================================
---- iproute2-2.6.37-orig.orig/ip/ip6tunnel.c
-+++ iproute2-2.6.37-orig/ip/ip6tunnel.c
+diff -Nura iproute2-3.10.0.orig/ip/ip6tunnel.c iproute2-3.10.0/ip/ip6tunnel.c
+--- iproute2-3.10.0.orig/ip/ip6tunnel.c	2013-08-14 09:17:56.538089916 -0300
++++ iproute2-3.10.0/ip/ip6tunnel.c	2013-08-14 09:18:02.952298534 -0300
 @@ -20,6 +20,10 @@
   *	Masahide NAKAMURA @USAGI
   */
- 
+
 +#include <features.h>
 +#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
 +#else
@@ -25,36 +21,36 @@ Index: iproute2-2.6.37-orig/ip/ip6tunnel.c
  #include <stdio.h>
  #include <string.h>
  #include <stdlib.h>
-@@ -410,3 +414,5 @@ int do_ip6tunnel(int argc, char **argv)
+@@ -425,3 +429,5 @@
  	fprintf(stderr, "Command \"%s\" is unknown, try \"ip -f inet6 tunnel help\".\n", *argv);
  	exit(-1);
  }
 +
 +#endif /* no ipv6 */
-Index: iproute2-2.6.37-orig/ip/ipprefix.c
-===================================================================
---- iproute2-2.6.37-orig.orig/ip/ipprefix.c
-+++ iproute2-2.6.37-orig/ip/ipprefix.c
-@@ -22,11 +22,17 @@
-  * Authors:
+diff -Nura iproute2-3.10.0.orig/ip/ipprefix.c iproute2-3.10.0/ip/ipprefix.c
+--- iproute2-3.10.0.orig/ip/ipprefix.c	2013-08-14 09:17:56.539089949 -0300
++++ iproute2-3.10.0/ip/ipprefix.c	2013-08-14 09:19:29.065099291 -0300
+@@ -23,11 +23,18 @@
   *	Masahide NAKAMURA @USAGI
   */
+
 +#include <features.h>
 +#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
 +#define NO_IPV6
 +#endif
- 
++
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
+ #include <sys/socket.h>
 +#ifndef NO_IPV6
  #include <netinet/icmp6.h>
 +#endif
+
  #include "utils.h"
- 
- /* prefix flags; see kernel's net/ipv6/addrconf.c and include/net/if_inet6.h */
-@@ -62,10 +68,12 @@ int print_prefix(const struct sockaddr_n
- 		fprintf(stderr, "wrong family %d\n", prefix->prefix_family);
+ #include "ip_common.h"
+@@ -65,10 +72,12 @@
+ 		fprintf(stderr, "incorrect protocol family: %d\n", prefix->prefix_family);
  		return 0;
  	}
 +#ifdef ND_OPT_PREFIX_INFORMATION
@@ -63,13 +59,12 @@ Index: iproute2-2.6.37-orig/ip/ipprefix.c
  		return 0;
  	}
 +#endif
- 
+
  	parse_rtattr(tb, RTA_MAX, RTM_RTA(prefix), len);
- 
-Index: iproute2-2.6.37-orig/ip/iptunnel.c
-===================================================================
---- iproute2-2.6.37-orig.orig/ip/iptunnel.c
-+++ iproute2-2.6.37-orig/ip/iptunnel.c
+
+diff -Nura iproute2-3.10.0.orig/ip/iptunnel.c iproute2-3.10.0/ip/iptunnel.c
+--- iproute2-3.10.0.orig/ip/iptunnel.c	2013-08-14 09:17:56.538089916 -0300
++++ iproute2-3.10.0/ip/iptunnel.c	2013-08-14 09:18:02.953298566 -0300
 @@ -9,6 +9,10 @@
   * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
   *
@@ -78,10 +73,10 @@ Index: iproute2-2.6.37-orig/ip/iptunnel.c
 +#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
 +#define NO_IPV6
 +#endif
- 
+
  #include <stdio.h>
  #include <stdlib.h>
-@@ -601,8 +605,10 @@ int do_iptunnel(int argc, char **argv)
+@@ -634,8 +638,10 @@
  	 * protocol-independent because of unarranged structure between
  	 * IPv4 and IPv6.
  	 */
@@ -90,5 +85,5 @@ Index: iproute2-2.6.37-orig/ip/iptunnel.c
  		return do_ip6tunnel(argc, argv);
 +#endif
  	default:
- 		fprintf(stderr, "Unsupported family:%d\n", preferred_family);
+ 		fprintf(stderr, "Unsupported protocol family: %d\n", preferred_family);
  		exit(-1);
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index cbbbc56..a3eff3b 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.7.0
+IPROUTE2_VERSION = 3.10.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 IPROUTE2_LICENSE = GPLv2
 IPROUTE2_LICENSE_FILES = COPYING
-
 IPROUTE2_DEPENDENCIES += host-bison host-flex
 
 # If both iproute2 and busybox are selected, make certain we win
@@ -38,6 +37,7 @@ define IPROUTE2_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	# arpd needs berkeleydb
 	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
+	$(SED) 's/-Werror//' $(IPROUTE2_DIR)/Makefile
 	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
 	$(IPROUTE2_WITH_IPTABLES)
 endef
-- 
1.8.1.5
