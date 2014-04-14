From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Apr 2014 12:46:08 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 3.14.0
Message-ID: <1397490368-29652-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../iproute2/iproute2-02-vxlan-optional-ipv6.patch | 35 +++++++++++-----------
 package/iproute2/iproute2.mk                       |  2 +-
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch b/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
index 0d6cf95..80ea97c 100644
--- a/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
+++ b/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
@@ -3,9 +3,9 @@ IPv6 support.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura iproute2-3.12.0.orig/ip/iplink_vxlan.c iproute2-3.12.0/ip/iplink_vxlan.c
---- iproute2-3.12.0.orig/ip/iplink_vxlan.c	2013-11-26 14:09:13.804908955 -0300
-+++ iproute2-3.12.0/ip/iplink_vxlan.c	2013-11-26 14:21:55.561997689 -0300
+diff -Nura iproute2-3.14.0/ip/iplink_vxlan.c iproute2-3.14.0-noipv6/ip/iplink_vxlan.c
+--- iproute2-3.14.0/ip/iplink_vxlan.c	2014-04-11 21:48:41.000000000 -0300
++++ iproute2-3.14.0-noipv6/ip/iplink_vxlan.c	2014-04-14 08:36:22.638235721 -0300
 @@ -9,6 +9,11 @@
   * Authors:     Stephen Hemminger <shemminger@vyatta.com
   */
@@ -18,10 +18,10 @@ diff -Nura iproute2-3.12.0.orig/ip/iplink_vxlan.c iproute2-3.12.0/ip/iplink_vxla
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
-@@ -179,26 +184,32 @@
- 		fprintf(stderr, "vxlan: missing virtual network identifier\n");
+@@ -188,12 +193,14 @@
  		return -1;
  	}
+ 
 +#ifndef NO_IPV6
  	if ((gaddr && daddr) ||
  		(memcmp(&gaddr6, &in6addr_any, sizeof(gaddr6)) &&
@@ -30,8 +30,10 @@ diff -Nura iproute2-3.12.0.orig/ip/iplink_vxlan.c iproute2-3.12.0/ip/iplink_vxla
  		return -1;
  	}
 +#endif
- 	addattr32(n, 1024, IFLA_VXLAN_ID, vni);
- 	if (gaddr)
+ 
+ 	if (!dst_port_set) {
+ 		fprintf(stderr, "vxlan: destination port not specified\n"
+@@ -208,15 +215,19 @@
  		addattr_l(n, 1024, IFLA_VXLAN_GROUP, &gaddr, 4);
  	else if (daddr)
  		addattr_l(n, 1024, IFLA_VXLAN_GROUP, &daddr, 4);
@@ -51,15 +53,15 @@ diff -Nura iproute2-3.12.0.orig/ip/iplink_vxlan.c iproute2-3.12.0/ip/iplink_vxla
  
  	if (link)
  		addattr32(n, 1024, IFLA_VXLAN_LINK, link);
-@@ -251,6 +262,7 @@
- 				fprintf(f, "remote %s ",
- 					format_host(AF_INET, 4, &addr, s1, sizeof(s1)));
- 		}
-+#ifndef NO_IPV6
+@@ -275,6 +286,7 @@
  	} else if (tb[IFLA_VXLAN_GROUP6]) {
  		struct in6_addr addr;
  		memcpy(&addr, RTA_DATA(tb[IFLA_VXLAN_GROUP6]), sizeof(struct in6_addr));
-@@ -262,6 +274,7 @@
++#ifndef NO_IPV6
+ 		if (memcmp(&addr, &in6addr_any, sizeof(addr)) != 0) {
+ 			if (IN6_IS_ADDR_MULTICAST(&addr))
+ 				fprintf(f, "group %s ",
+@@ -283,6 +295,7 @@
  				fprintf(f, "remote %s ",
  					format_host(AF_INET6, sizeof(struct in6_addr), &addr, s1, sizeof(s1)));
  		}
@@ -67,14 +69,11 @@ diff -Nura iproute2-3.12.0.orig/ip/iplink_vxlan.c iproute2-3.12.0/ip/iplink_vxla
  	}
  
  	if (tb[IFLA_VXLAN_LOCAL]) {
-@@ -269,12 +282,14 @@
- 		if (addr)
- 			fprintf(f, "local %s ",
- 				format_host(AF_INET, 4, &addr, s1, sizeof(s1)));
-+#ifndef NO_IPV6
+@@ -293,9 +306,11 @@
  	} else if (tb[IFLA_VXLAN_LOCAL6]) {
  		struct in6_addr addr;
  		memcpy(&addr, RTA_DATA(tb[IFLA_VXLAN_LOCAL6]), sizeof(struct in6_addr));
++#ifndef NO_IPV6
  		if (memcmp(&addr, &in6addr_any, sizeof(addr)) != 0)
  			fprintf(f, "local %s ",
  				format_host(AF_INET6, sizeof(struct in6_addr), &addr, s1, sizeof(s1)));
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 2350500..e51c33b 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.12.0
+IPROUTE2_VERSION = 3.14.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex
-- 
1.8.3.2
