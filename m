From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 13 Sep 2010 20:40:46 -0700
Subject: [Buildroot] [PATCH 19/21] openssl: bump to 1.0.0a
In-Reply-To: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1284435648-15238-19-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 CHANGES                                            |    2 +-
 .../openssl/openssl-1.0.0a-do-not-build-docs.patch |   13 +++++
 .../openssl-1.0.0a-dont-force-large-file.patch     |   19 +++++++
 package/openssl/openssl-1.0.0a-optional-ipv6.patch |   20 +++++++
 package/openssl/openssl-do-not-build-docs.patch    |   13 -----
 .../openssl/openssl-dont-force-large-file.patch    |   19 -------
 package/openssl/openssl-nofips.patch               |   12 ----
 package/openssl/openssl-optional-ipv6.patch        |   55 --------------------
 package/openssl/openssl-uclibc-susv3-legacy.patch  |   18 ------
 package/openssl/openssl.mk                         |   11 ++--
 10 files changed, 58 insertions(+), 124 deletions(-)
 create mode 100644 package/openssl/openssl-1.0.0a-do-not-build-docs.patch
 create mode 100644 package/openssl/openssl-1.0.0a-dont-force-large-file.patch
 create mode 100644 package/openssl/openssl-1.0.0a-optional-ipv6.patch
 delete mode 100644 package/openssl/openssl-do-not-build-docs.patch
 delete mode 100644 package/openssl/openssl-dont-force-large-file.patch
 delete mode 100644 package/openssl/openssl-nofips.patch
 delete mode 100644 package/openssl/openssl-optional-ipv6.patch
 delete mode 100644 package/openssl/openssl-uclibc-susv3-legacy.patch

diff --git a/CHANGES b/CHANGES
index e4e185c..5f710b6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	Updated/fixed packages: alsa-lib, alsa-utils, autoconf, automake,
 	berkeleydb, bison, busybox, ccache, dropbear, fakeroot, genext2fs,
 	gmp, iptables, kismet, libdeamon, libelf, libogg, libvorbis, make,
-	module-init-tools, mpfr, nano, ntp, openvpn, qt, usbutils
+	module-init-tools, mpfr, nano, ntp, openssl, openvpn, qt, usbutils
 
 	Removed packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
diff --git a/package/openssl/openssl-1.0.0a-do-not-build-docs.patch b/package/openssl/openssl-1.0.0a-do-not-build-docs.patch
new file mode 100644
index 0000000..329efbe
--- /dev/null
+++ b/package/openssl/openssl-1.0.0a-do-not-build-docs.patch
@@ -0,0 +1,13 @@
+Dont waste time building manpages if we're not going to use em.
+
+--- openssl/Makefile.org
++++ openssl/Makefile.org
+@@ -492,7 +492,7 @@
+ dist_pem_h:
+ 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
+ 
+-install: all install_docs install_sw
++install: all install_sw
+ 
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
diff --git a/package/openssl/openssl-1.0.0a-dont-force-large-file.patch b/package/openssl/openssl-1.0.0a-dont-force-large-file.patch
new file mode 100644
index 0000000..5b04656
--- /dev/null
+++ b/package/openssl/openssl-1.0.0a-dont-force-large-file.patch
@@ -0,0 +1,19 @@
+[patch]: bss_file.c: don't force largefile mode
+---
+ crypto/bio/bss_file.c |    3 ---
+ 1 file changed, 3 deletions(-)
+
+Index: openssl-0.9.8g/crypto/bio/bss_file.c
+===================================================================
+--- openssl-0.9.8g.orig/crypto/bio/bss_file.c
++++ openssl-0.9.8g/crypto/bio/bss_file.c
+@@ -78,9 +78,6 @@
+  * sequential access of large files without extra "magic" comprise *BSD,
+  * Darwin, IRIX...
+  */
+-#ifndef _FILE_OFFSET_BITS
+-#define _FILE_OFFSET_BITS 64
+-#endif
+ #endif
+ 
+ #include <stdio.h>
diff --git a/package/openssl/openssl-1.0.0a-optional-ipv6.patch b/package/openssl/openssl-1.0.0a-optional-ipv6.patch
new file mode 100644
index 0000000..667d00f
--- /dev/null
+++ b/package/openssl/openssl-1.0.0a-optional-ipv6.patch
@@ -0,0 +1,20 @@
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
+@@ -61,6 +61,8 @@
+ 
+ #include <stdio.h>
+ #include <errno.h>
++#include <features.h>
++
+ #define USE_SOCKETS
+ #include "cryptlib.h"
+ 
diff --git a/package/openssl/openssl-do-not-build-docs.patch b/package/openssl/openssl-do-not-build-docs.patch
deleted file mode 100644
index 135a9d3..0000000
--- a/package/openssl/openssl-do-not-build-docs.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Dont waste time building manpages if we're not going to use em.
-
---- openssl/Makefile.org
-+++ openssl/Makefile.org
-@@ -792,7 +792,7 @@
- dist_pem_h:
- 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
- 
--install: all install_docs install_sw
-+install: all install_sw
- 
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
diff --git a/package/openssl/openssl-dont-force-large-file.patch b/package/openssl/openssl-dont-force-large-file.patch
deleted file mode 100644
index 5b04656..0000000
--- a/package/openssl/openssl-dont-force-large-file.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-[patch]: bss_file.c: don't force largefile mode
----
- crypto/bio/bss_file.c |    3 ---
- 1 file changed, 3 deletions(-)
-
-Index: openssl-0.9.8g/crypto/bio/bss_file.c
-===================================================================
---- openssl-0.9.8g.orig/crypto/bio/bss_file.c
-+++ openssl-0.9.8g/crypto/bio/bss_file.c
-@@ -78,9 +78,6 @@
-  * sequential access of large files without extra "magic" comprise *BSD,
-  * Darwin, IRIX...
-  */
--#ifndef _FILE_OFFSET_BITS
--#define _FILE_OFFSET_BITS 64
--#endif
- #endif
- 
- #include <stdio.h>
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
index edbfe8b..ebf4fb1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -3,7 +3,8 @@
 # openssl
 #
 #############################################################
-OPENSSL_VERSION:=0.9.8o
+OPENSSL_VERSION:=1.0.0a
+OPENSSL_SOURCE = openssl-$(OPENSSL_VERSION).tar.gz
 OPENSSL_SITE:=http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
@@ -32,10 +33,8 @@ define OPENSSL_CONFIGURE_CMDS
 			threads \
 			shared \
 			no-idea \
+			no-mdc2 \
 			no-rc5 \
-			enable-camellia \
-			enable-mdc2 \
-			enable-tlsext \
 			zlib-dynamic \
 	)
 	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
@@ -43,8 +42,8 @@ define OPENSSL_CONFIGURE_CMDS
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D) all build-shared
-	$(MAKE1) -C $(@D) do_linux-shared
+	$(MAKE1) CC="$(TARGET_CC)" -C $(@D) all build-shared
+	$(MAKE1) CC="$(TARGET_CC)" -C $(@D) do_linux-shared
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
-- 
1.7.2.3
