From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:52:59 +0200
Subject: [Buildroot] [git commit] aiccu: musl patches
Message-ID: <20150329125318.99256807EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ad167e25bc86bf0554e3c3711dd1329dbb95d0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8c666ef11310868097601b6de1dd25779729b878/

if_ether.h issue discussion: http://www.openwall.com/lists/musl/2012/10/11/1

Patch 0001-gnutls-and-uclibc-fixes split into gnutls part (0001) and res_ninit
part (0005) which is not uclibc-specific but happens to affect musl as well.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ls-and-uclibc-fixes.patch => 0001-gnutls.patch} |   31 ------------------
 package/aiccu/0004-if-ether-header.patch           |   23 ++++++++++++++
 package/aiccu/0005-res-ninit.patch                 |   33 ++++++++++++++++++++
 3 files changed, 56 insertions(+), 31 deletions(-)

diff --git a/package/aiccu/0001-gnutls-and-uclibc-fixes.patch b/package/aiccu/0001-gnutls.patch
similarity index 70%
rename from package/aiccu/0001-gnutls-and-uclibc-fixes.patch
rename to package/aiccu/0001-gnutls.patch
index d316f8f..462179e 100644
--- a/package/aiccu/0001-gnutls-and-uclibc-fixes.patch
+++ b/package/aiccu/0001-gnutls.patch
@@ -1,5 +1,4 @@
 aiccu.h, common.c, common.h: fixes for deprecated GNUTLS functions and types
-resolver.c: fixes for selection of wrong resolver function under uclibc
 
 Signed-off-by: Michael Rommel <rommel@layer-7.net>
 
@@ -72,33 +71,3 @@ diff -purN aiccu_20070115.orig/common/common.h aiccu_20070115/common/common.h
  #endif
  };
  
-diff -purN aiccu_20070115.orig/common/resolver.c aiccu_20070115/common/resolver.c
---- aiccu_20070115.orig/common/resolver.c	2006-07-23 16:55:14.000000000 +0200
-+++ aiccu_20070115/common/resolver.c	2013-08-31 23:44:31.574866862 +0200
-@@ -26,7 +26,7 @@
- 
- int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
- {
--#ifdef _LINUX
-+#if defined(_LINUX) && !defined(__UCLIBC__)
- 	struct __res_state	res;
- #endif
- 	unsigned char		answer[8192];
-@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype
- 	uint16_t		type = 0, class = 0;
- 	uint32_t		ttl = 0;
- 
--#ifdef _LINUX
-+#if defined(_LINUX) && !defined(__UCLIBC__)
- 	memset(&res, 0, sizeof(res));
- 	res.options = RES_DEBUG;
- 	res_ninit(&res);
-@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype
- #endif
- 
- 	memset(answer, 0, sizeof(answer));
--#ifdef _LINUX
-+#if defined(_LINUX) && !defined(__UCLIBC__)
- 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
- #else
- 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
diff --git a/package/aiccu/0004-if-ether-header.patch b/package/aiccu/0004-if-ether-header.patch
new file mode 100644
index 0000000..48e8ceb
--- /dev/null
+++ b/package/aiccu/0004-if-ether-header.patch
@@ -0,0 +1,23 @@
+musl does not allow using <netinet/*> together with <linux/*> headers.
+Since there are both netinet/if_ether.h and linux/if_ether.h providing
+the same definitions, use linux/if_ether.h whenever other linux/*
+headers are included.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- aiccu/common/common.h
++++ aiccu/common/common.h
+@@ -91,11 +91,12 @@
+ 	#include <sys/select.h>
+ 
+ 	#include <net/if.h>
+-	#include <netinet/if_ether.h>
+ #ifdef linux
+ 	#include <netpacket/packet.h>
++	#include <linux/if_ether.h>
+ 	#include <linux/if_tun.h>
+ #else
++	#include <netinet/if_ether.h>
+ #ifdef _DFBSD
+ 	#include <net/tun/if_tun.h>
+ #else
diff --git a/package/aiccu/0005-res-ninit.patch b/package/aiccu/0005-res-ninit.patch
new file mode 100644
index 0000000..89770fb
--- /dev/null
+++ b/package/aiccu/0005-res-ninit.patch
@@ -0,0 +1,33 @@
+res_ninit is available in glibc but not in uclibc or musl.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- aiccu/common/resolver.c
++++ aiccu/common/resolver.c
+@@ -26,7 +26,7 @@
+ 
+ int getrrs(const char *label, int rrtype, void gotrec(unsigned int num, int type, const char *record))
+ {
+-#ifdef _LINUX
++#ifdef __GLIBC__
+ 	struct __res_state	res;
+ #endif
+ 	unsigned char		answer[8192];
+@@ -38,7 +38,7 @@ int getrrs(const char *label, int rrtype
+ 	uint16_t		type = 0, class = 0;
+ 	uint32_t		ttl = 0;
+ 
+-#ifdef _LINUX
++#ifdef __GLIBC__
+ 	memset(&res, 0, sizeof(res));
+ 	res.options = RES_DEBUG;
+ 	res_ninit(&res);
+@@ -47,7 +47,7 @@ int getrrs(const char *label, int rrtype
+ #endif
+ 
+ 	memset(answer, 0, sizeof(answer));
+-#ifdef _LINUX
++#ifdef __GLIBC__
+ 	ret = res_nquery(&res, label, C_IN, rrtype, answer, sizeof(answer));
+ #else
+ 	ret = res_query(label, C_IN, rrtype, answer, sizeof(answer));
