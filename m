From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Nov 2010 13:48:39 +0100
Subject: [Buildroot] [git commit master 1/1] tcpdump: bump version
Message-ID: <20101106124925.1254A8DABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=94f2063773fb23431cce33ed19052c5b4eae6564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old version didn't build with the updated libpcap anymore.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch   |   21 --------------
 .../tcpdump/tcpdump.00-extern-inline-fixup.patch   |   30 --------------------
 package/tcpdump/tcpdump.mk                         |    2 +-
 3 files changed, 1 insertions(+), 52 deletions(-)
 delete mode 100644 package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch
 delete mode 100644 package/tcpdump/tcpdump.00-extern-inline-fixup.patch

diff --git a/package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch b/package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch
deleted file mode 100644
index 0df50cb..0000000
--- a/package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -rdup tcpdump-4.0.0.oorig/print-enc.c tcpdump-4.0.0/print-enc.c
---- tcpdump-4.0.0.oorig/print-enc.c	2008-09-01 04:44:22.000000000 +0200
-+++ tcpdump-4.0.0/print-enc.c	2009-10-07 21:21:41.000000000 +0200
-@@ -72,14 +72,16 @@ enc_if_print(const struct pcap_pkthdr *h
- 	length -= ENC_HDRLEN;
- 	caplen -= ENC_HDRLEN;
- 	p += ENC_HDRLEN;
--	
-+
- 	switch (hdr->af) {
- 	case AF_INET:
- 		ip_print(gndo, p, length);
- 		break;
-+#ifdef INET6
- 	case AF_INET6:
- 		ip6_print(p, length);
- 		break;
-+#endif /*INET6*/
- 	}
- 
- out:
diff --git a/package/tcpdump/tcpdump.00-extern-inline-fixup.patch b/package/tcpdump/tcpdump.00-extern-inline-fixup.patch
deleted file mode 100644
index 9236f63..0000000
--- a/package/tcpdump/tcpdump.00-extern-inline-fixup.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- tcpdump-3.9.5.oorig/tcpdump-stdinc.h	2006-06-23 04:07:27.000000000 +0200
-+++ tcpdump-3.9.5/tcpdump-stdinc.h	2007-05-14 10:26:25.000000000 +0200
-@@ -149,15 +149,15 @@ typedef char* caddr_t;
-   #undef htonl
-   #undef htons
- 
--  extern __inline__ unsigned long __ntohl (unsigned long x);
--  extern __inline__ unsigned short __ntohs (unsigned short x);
-+  static __inline__ unsigned long __ntohl (unsigned long x);
-+  static __inline__ unsigned short __ntohs (unsigned short x);
- 
-   #define ntohl(x)  __ntohl(x)
-   #define ntohs(x)  __ntohs(x)
-   #define htonl(x)  __ntohl(x)
-   #define htons(x)  __ntohs(x)
- 
--  extern __inline__ unsigned long __ntohl (unsigned long x)
-+  static __inline__ unsigned long __ntohl (unsigned long x)
-   {
-     __asm__ ("xchgb %b0, %h0\n\t"   /* swap lower bytes  */
-              "rorl  $16, %0\n\t"    /* swap words        */
-@@ -166,7 +166,7 @@ typedef char* caddr_t;
-     return (x);
-   }
- 
--  extern __inline__ unsigned short __ntohs (unsigned short x)
-+  static __inline__ unsigned short __ntohs (unsigned short x)
-   {
-     __asm__ ("xchgb %b0, %h0"       /* swap bytes */
-             : "=q" (x) : "0" (x));
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index b5e55df..e295e69 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -6,7 +6,7 @@
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
 
-TCPDUMP_VERSION:=4.0.0
+TCPDUMP_VERSION:=4.1.1
 TCPDUMP_SITE:=http://www.tcpdump.org/release
 TCPDUMP_SOURCE:=tcpdump-$(TCPDUMP_VERSION).tar.gz
 TCPDUMP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
-- 
1.7.1
