From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 11:41:52 +0100
Subject: [Buildroot] [git commit] libupnp: bump to version 1.6.15
Message-ID: <20120321104258.5FF93953FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23d73ece1f04eaf633b45da5ffc42fe7e706e049
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libupnp/libupnp-1.6.15-no-ipv6.patch       |   23 ++++++++++++++++++++
 .../libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch |   11 ---------
 package/libupnp/libupnp.mk                         |    9 +++----
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/package/libupnp/libupnp-1.6.15-no-ipv6.patch b/package/libupnp/libupnp-1.6.15-no-ipv6.patch
new file mode 100644
index 0000000..929c309
--- /dev/null
+++ b/package/libupnp/libupnp-1.6.15-no-ipv6.patch
@@ -0,0 +1,23 @@
+Fix missing knob to properly disable IPv6 support when headers lack it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libupnp-1.6.15/upnp/src/ssdp/ssdp_device.c libupnp-1.6.15-noipv6/upnp/src/ssdp/ssdp_device.c
+--- libupnp-1.6.15/upnp/src/ssdp/ssdp_device.c	2011-11-04 19:33:59.000000000 -0300
++++ libupnp-1.6.15-noipv6/upnp/src/ssdp/ssdp_device.c	2012-03-20 21:00:26.274098343 -0300
+@@ -199,6 +199,7 @@
+ 		setsockopt(ReplySock, IPPROTO_IP, IP_MULTICAST_TTL,
+ 			   (char *)&ttl, sizeof(int));
+ 		socklen = sizeof(struct sockaddr_in);
++#ifdef UPNP_ENABLE_IPV6
+ 	} else if (DestAddr->sa_family == AF_INET6) {
+ 		inet_ntop(AF_INET6,
+ 			  &((struct sockaddr_in6 *)DestAddr)->sin6_addr,
+@@ -207,6 +208,7 @@
+ 			   (char *)&gIF_INDEX, sizeof(gIF_INDEX));
+ 		setsockopt(ReplySock, IPPROTO_IPV6, IPV6_MULTICAST_HOPS,
+ 			   (char *)&hops, sizeof(hops));
++#endif
+ 	} else {
+ 		UpnpPrintf(UPNP_CRITICAL, SSDP, __FILE__, __LINE__,
+ 			   "Invalid destination address specified.");
diff --git a/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch b/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
deleted file mode 100644
index e425392..0000000
--- a/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urN libupnp-1.6.6-0rig/configure libupnp-1.6.6/configure
---- libupnp-1.6.6-0rig/configure	2008-04-25 13:47:24.000000000 +0200
-+++ libupnp-1.6.6/configure	2009-01-14 21:55:16.000000000 +0100
-@@ -21096,7 +21096,6 @@
- 	sys/ioctl.h \
- 	sys/socket.h \
- 	sys/time.h \
--	sys/timeb.h \
- 	syslog.h \
- 	unistd.h \
- 
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index d5b4ee1..1fa07ca 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -3,12 +3,11 @@
 # libupnp
 #
 #############################################################
-LIBUPNP_VERSION:=1.6.6
-LIBUPNP_SOURCE:=libupnp-$(LIBUPNP_VERSION).tar.bz2
-LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pupnp
 
+LIBUPNP_VERSION = 1.6.15
+LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
+LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-
-LIBUPNP_INSTALL_STAGING:=YES
+LIBUPNP_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
