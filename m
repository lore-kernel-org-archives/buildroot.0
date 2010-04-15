From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Apr 2010 16:26:15 +0200
Subject: [Buildroot] [git commit master] openssl: fix build without ipv6
	support
Message-ID: <20100415142640.7810A20D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=65e209ca07416bc040fe98d16b60b6cb4304987f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1567

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    1 +
 package/openssl/openssl-optional-ipv6.patch |   55 +++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/openssl/openssl-optional-ipv6.patch

diff --git a/CHANGES b/CHANGES
index f4d412d..8f1b90a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -56,6 +56,7 @@
 	#1459: Misc QA fixes
 	#1489: radvd update to 1.6
 	#1513: Enable powerpc e300c2, e300c3 and e500mc optimization
+	#1567: openssl0.9.8n fails to compile
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/openssl/openssl-optional-ipv6.patch b/package/openssl/openssl-optional-ipv6.patch
new file mode 100644
index 0000000..2876058
--- /dev/null
+++ b/package/openssl/openssl-optional-ipv6.patch
@@ -0,0 +1,55 @@
+[PATCH] openssl: fix build without IPv6 support
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ crypto/bio/bss_dgram.c |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+Index: openssl-0.9.8n/crypto/bio/bss_dgram.c
+===================================================================
+--- openssl-0.9.8n.orig/crypto/bio/bss_dgram.c
++++ openssl-0.9.8n/crypto/bio/bss_dgram.c
+@@ -61,6 +61,12 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
++#include <features.h>
++
++#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
++#define NO_IPV6
++#endif
++
+ #define USE_SOCKETS
+ #include "cryptlib.h"
+ 
+@@ -429,12 +435,14 @@ static long dgram_ctrl(BIO *b, int cmd,
+ 				&sockopt_val, sizeof(sockopt_val))) < 0)
+ 				perror("setsockopt");
+ 			break;
++#ifndef NO_IPV6
+ 		case AF_INET6:
+ 			sockopt_val = IPV6_PMTUDISC_DO;
+ 			if ((ret = setsockopt(b->num, IPPROTO_IPV6, IPV6_MTU_DISCOVER,
+ 				&sockopt_val, sizeof(sockopt_val))) < 0)
+ 				perror("setsockopt");
+ 			break;
++#endif
+ 		default:
+ 			ret = -1;
+ 			break;
+@@ -470,6 +478,7 @@ static long dgram_ctrl(BIO *b, int cmd,
+ 				ret = data->mtu;
+ 				}
+ 			break;
++#ifndef NO_IPV6
+ 		case AF_INET6:
+ 			if ((ret = getsockopt(b->num, IPPROTO_IPV6, IPV6_MTU, (void *)&sockopt_val,
+ 				&sockopt_len)) < 0 || sockopt_val < 0)
+@@ -485,6 +494,7 @@ static long dgram_ctrl(BIO *b, int cmd,
+ 				ret = data->mtu;
+ 				}
+ 			break;
++#endif
+ 		default:
+ 			ret = 0;
+ 			break;
-- 
1.6.3.3
