From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Apr 2012 11:36:21 -0300
Subject: [Buildroot] [PATCH 1/2] libupnp: bump to version 1.6.17
Message-ID: <1334154982-23530-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libupnp/libupnp-1.6.14-no-ipv6.patch |   23 ----------------
 package/libupnp/libupnp-1.6.17-no-ipv6.patch |   37 ++++++++++++++++++++++++++
 package/libupnp/libupnp.mk                   |    2 +-
 3 files changed, 38 insertions(+), 24 deletions(-)
 delete mode 100644 package/libupnp/libupnp-1.6.14-no-ipv6.patch
 create mode 100644 package/libupnp/libupnp-1.6.17-no-ipv6.patch

diff --git a/package/libupnp/libupnp-1.6.14-no-ipv6.patch b/package/libupnp/libupnp-1.6.14-no-ipv6.patch
deleted file mode 100644
index 929c309..0000000
--- a/package/libupnp/libupnp-1.6.14-no-ipv6.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix missing knob to properly disable IPv6 support when headers lack it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libupnp-1.6.15/upnp/src/ssdp/ssdp_device.c libupnp-1.6.15-noipv6/upnp/src/ssdp/ssdp_device.c
---- libupnp-1.6.15/upnp/src/ssdp/ssdp_device.c	2011-11-04 19:33:59.000000000 -0300
-+++ libupnp-1.6.15-noipv6/upnp/src/ssdp/ssdp_device.c	2012-03-20 21:00:26.274098343 -0300
-@@ -199,6 +199,7 @@
- 		setsockopt(ReplySock, IPPROTO_IP, IP_MULTICAST_TTL,
- 			   (char *)&ttl, sizeof(int));
- 		socklen = sizeof(struct sockaddr_in);
-+#ifdef UPNP_ENABLE_IPV6
- 	} else if (DestAddr->sa_family == AF_INET6) {
- 		inet_ntop(AF_INET6,
- 			  &((struct sockaddr_in6 *)DestAddr)->sin6_addr,
-@@ -207,6 +208,7 @@
- 			   (char *)&gIF_INDEX, sizeof(gIF_INDEX));
- 		setsockopt(ReplySock, IPPROTO_IPV6, IPV6_MULTICAST_HOPS,
- 			   (char *)&hops, sizeof(hops));
-+#endif
- 	} else {
- 		UpnpPrintf(UPNP_CRITICAL, SSDP, __FILE__, __LINE__,
- 			   "Invalid destination address specified.");
diff --git a/package/libupnp/libupnp-1.6.17-no-ipv6.patch b/package/libupnp/libupnp-1.6.17-no-ipv6.patch
new file mode 100644
index 0000000..67b3895
--- /dev/null
+++ b/package/libupnp/libupnp-1.6.17-no-ipv6.patch
@@ -0,0 +1,37 @@
+From 812bdabc2c293173ea943059a577d480884a6cc1 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 11 Apr 2012 11:17:45 -0300
+Subject: [PATCH] ssdp_device: exclude IPv6 stuff when there's no IPv6
+
+Add an additional INET_IPV6 exclusion around IPV6_MULTICAST_HOPS since
+the definition isn't guaranteed to exist when the toolchain lacks IPv6
+support.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ upnp/src/ssdp/ssdp_device.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/upnp/src/ssdp/ssdp_device.c b/upnp/src/ssdp/ssdp_device.c
+index d3517cc..a439005 100644
+--- a/upnp/src/ssdp/ssdp_device.c
++++ b/upnp/src/ssdp/ssdp_device.c
+@@ -210,6 +210,7 @@ static int NewRequestHandler(
+ 			   (char *)&ttl, sizeof(int));
+ 		socklen = sizeof(struct sockaddr_in);
+ 		break;
++#ifdef INET_IPV6
+ 	case AF_INET6:
+ 		inet_ntop(AF_INET6,
+ 			  &((struct sockaddr_in6 *)DestAddr)->sin6_addr,
+@@ -219,6 +220,7 @@ static int NewRequestHandler(
+ 		setsockopt(ReplySock, IPPROTO_IPV6, IPV6_MULTICAST_HOPS,
+ 			   (char *)&hops, sizeof(hops));
+ 		break;
++#endif
+ 	default:
+ 		UpnpPrintf(UPNP_CRITICAL, SSDP, __FILE__, __LINE__,
+ 			   "Invalid destination address specified.");
+-- 
+1.7.3.4
+
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 5ac68c3..a6028e1 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBUPNP_VERSION = 1.6.14
+LIBUPNP_VERSION = 1.6.17
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-- 
1.7.3.4
