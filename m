From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 11:30:31 +0200
Subject: [Buildroot] [git commit master 1/1] openssl: Bump to 1.0.0a
Message-ID: <20101018093103.8319F8C9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=567eee4f544b553165897e9732ed4f4d9ab8db98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                           |    2 +-
 package/openssl/openssl-nofips.patch              |   12 -----
 package/openssl/openssl-optional-ipv6.patch       |   55 ---------------------
 package/openssl/openssl-uclibc-susv3-legacy.patch |   18 -------
 package/openssl/openssl.mk                        |   21 ++++++--
 5 files changed, 16 insertions(+), 92 deletions(-)
 delete mode 100644 package/openssl/openssl-nofips.patch
 delete mode 100644 package/openssl/openssl-optional-ipv6.patch
 delete mode 100644 package/openssl/openssl-uclibc-susv3-legacy.patch

diff --git a/CHANGES b/CHANGES
index 9adcc91..72b7913 100644
--- a/CHANGES
+++ b/CHANGES
@@ -38,7 +38,7 @@
 	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
 	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
 	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
-	openssh, openvpn, oprofile, pango, patch, pcre, php,
+	openssh, openssl, openvpn, oprofile, pango, patch, pcre, php,
 	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
 	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
 	speex, sqlite, squashfs, startup-notification, strace,
diff --git a/package/openssl/openssl-nofips.patch b/package/openssl/openssl-nofips.patch
deleted file mode 100644
index 0edea3e..0000000
--- a/package/openssl/openssl-nofips.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -Nura openssl-0.9.8k/Makefile.org openssl-0.9.8k.nofips/Makefile.org
---- openssl-0.9.8k/Makefile.org	2009-03-03 20:40:29.000000000 -0200
-+++ openssl-0.9.8k.nofips/Makefile.org	2009-03-26 09:50:27.000000000 -0300
-@@ -131,7 +131,7 @@
- 
- BASEADDR=
- 
--DIRS=   crypto fips ssl engines apps test tools
-+DIRS=   crypto ssl engines apps test tools
- SHLIBDIRS= crypto ssl fips
- 
- # dirs in crypto to build
diff --git a/package/openssl/openssl-optional-ipv6.patch b/package/openssl/openssl-optional-ipv6.patch
deleted file mode 100644
index 2876058..0000000
--- a/package/openssl/openssl-optional-ipv6.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-[PATCH] openssl: fix build without IPv6 support
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- crypto/bio/bss_dgram.c |   10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-Index: openssl-0.9.8n/crypto/bio/bss_dgram.c
-===================================================================
---- openssl-0.9.8n.orig/crypto/bio/bss_dgram.c
-+++ openssl-0.9.8n/crypto/bio/bss_dgram.c
-@@ -61,6 +61,12 @@
- 
- #include <stdio.h>
- #include <errno.h>
-+#include <features.h>
-+
-+#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
-+#define NO_IPV6
-+#endif
-+
- #define USE_SOCKETS
- #include "cryptlib.h"
- 
-@@ -429,12 +435,14 @@ static long dgram_ctrl(BIO *b, int cmd,
- 				&sockopt_val, sizeof(sockopt_val))) < 0)
- 				perror("setsockopt");
- 			break;
-+#ifndef NO_IPV6
- 		case AF_INET6:
- 			sockopt_val = IPV6_PMTUDISC_DO;
- 			if ((ret = setsockopt(b->num, IPPROTO_IPV6, IPV6_MTU_DISCOVER,
- 				&sockopt_val, sizeof(sockopt_val))) < 0)
- 				perror("setsockopt");
- 			break;
-+#endif
- 		default:
- 			ret = -1;
- 			break;
-@@ -470,6 +478,7 @@ static long dgram_ctrl(BIO *b, int cmd,
- 				ret = data->mtu;
- 				}
- 			break;
-+#ifndef NO_IPV6
- 		case AF_INET6:
- 			if ((ret = getsockopt(b->num, IPPROTO_IPV6, IPV6_MTU, (void *)&sockopt_val,
- 				&sockopt_len)) < 0 || sockopt_val < 0)
-@@ -485,6 +494,7 @@ static long dgram_ctrl(BIO *b, int cmd,
- 				ret = data->mtu;
- 				}
- 			break;
-+#endif
- 		default:
- 			ret = 0;
- 			break;
diff --git a/package/openssl/openssl-uclibc-susv3-legacy.patch b/package/openssl/openssl-uclibc-susv3-legacy.patch
deleted file mode 100644
index eb1d277..0000000
--- a/package/openssl/openssl-uclibc-susv3-legacy.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-sys/timeb.h / ftime are legacy, so don't enable them for uClibc 
----
- apps/speed.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: openssl-0.9.8g/apps/speed.c
-===================================================================
---- openssl-0.9.8g.orig/apps/speed.c
-+++ openssl-0.9.8g/apps/speed.c
-@@ -113,7 +113,7 @@
- #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && (!defined(OPENSSL_SYS_VMS) || defined(__DECC))
- # define TIMES
- #endif
--#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
-+#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) && !defined(__UCLIBC__) /* FIXME */
- # define TIMEB
- #endif
- 
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 22b14f2..de20b81 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -3,19 +3,28 @@
 # openssl
 #
 #############################################################
-OPENSSL_VERSION:=0.9.8o
-OPENSSL_SITE:=http://www.openssl.org/source
+
+OPENSSL_VERSION = 1.0.0a
+OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-
-OPENSSL_TARGET_ARCH=generic32
+OPENSSL_TARGET_ARCH = generic32
 
 # Some architectures are optimized in OpenSSL
+ifeq ($(ARCH),arm)
+ifneq ($(BR2_generic_arm),y)
+ifneq ($(BR2_arm610),y)
+ifneq ($(BR2_arm710),y)
+	OPENSSL_TARGET_ARCH = armv4
+endif
+endif
+endif
+endif
 ifeq ($(ARCH),powerpc)
-OPENSSL_TARGET_ARCH=ppc
+	OPENSSL_TARGET_ARCH = ppc
 endif
 ifeq ($(ARCH),x86_64)
-OPENSSL_TARGET_ARCH=x86_64
+	OPENSSL_TARGET_ARCH = x86_64
 endif
 
 define OPENSSL_CONFIGURE_CMDS
-- 
1.7.1
