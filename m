From: Will Newton <will.newton@gmail.com>
Date: Mon, 22 Jun 2009 12:21:38 +0100
Subject: [Buildroot] [git commit] ipsec-tools: Bump version to 0.7.2.
Message-ID: <20090623074118.747FC76268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7af9cd3ac58e881e1ecfa9836ec54f3458b13564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Add support for configuring security context support to allow building for
non-SELinux targets.

Remove some obsolete patches.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ipsec-tools/Config.in                      |   41 +++++++++----
 .../ipsec-tools-0.6.7-printf-format-string.patch   |   64 --------------------
 ...ols-0.6.7.100-do_not_use_addr_as_truthval.patch |   45 --------------
 .../ipsec-tools-0.6.7.101-string_legacy.patch      |   32 ----------
 .../ipsec-tools-0.6.7.102-GLOB_TILDE.patch         |   15 -----
 package/ipsec-tools/ipsec-tools.mk                 |   14 ++++-
 6 files changed, 41 insertions(+), 170 deletions(-)
 delete mode 100644 package/ipsec-tools/ipsec-tools-0.6.7-printf-format-string.patch
 delete mode 100644 package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch
 delete mode 100644 package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch
 delete mode 100644 package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index 355616d..a55ff0c 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -11,29 +11,29 @@ config BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT
 	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable racoonctl(8)."
 	help
-		Lets racoon to listen to racoon admin port, which is to
-	        be contacted by racoonctl(8).
+	  Lets racoon to listen to racoon admin port, which is to
+	  be contacted by racoonctl(8).
 
 config BR2_PACKAGE_IPSEC_TOOLS_NATT
 	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable NAT-Traversal"
 	help
-		This needs kernel support, which is available on Linux. On
-		NetBSD, NAT-Traversal kernel support has not been integrated
-		yet, you can get it from here:
+	  This needs kernel support, which is available on Linux. On
+	  NetBSD, NAT-Traversal kernel support has not been integrated
+	  yet, you can get it from here:
 
-		http://ipsec-tools.sourceforge.net/netbsd_nat-t.diff If you
+	  http://ipsec-tools.sourceforge.net/netbsd_nat-t.diff If you
 
-		live in a country where software patents are legal, using
-		NAT-Traversal might infringe a patent.
+	  live in a country where software patents are legal, using
+	  NAT-Traversal might infringe a patent.
 
 
 config BR2_PACKAGE_IPSEC_TOOLS_FRAG
 	depends on BR2_PACKAGE_IPSEC_TOOLS
 	bool "Enable IKE fragmentation."
 	help
-	        Enable IKE fragmentation, which is a workaround for
-	        broken routers that drop fragmented packets
+	  Enable IKE fragmentation, which is a workaround for
+	  broken routers that drop fragmented packets
 
 config BR2_PACKAGE_IPSEC_TOOLS_STATS
 	default y
@@ -45,8 +45,8 @@ config BR2_PACKAGE_IPSEC_TOOLS_IPV6
 	depends on BR2_PACKAGE_IPSEC_TOOLS && BR2_INET_IPV6
 	bool "Enable IPv6 support"
 	help
-		This option has no effect if uClibc has been compiled without
-		IPv6 support.
+	  This option has no effect if uClibc has been compiled without
+	  IPv6 support.
 
 config BR2_PACKAGE_IPSEC_TOOLS_READLINE
 	depends on BR2_PACKAGE_IPSEC_TOOLS
@@ -60,3 +60,20 @@ config BR2_PACKAGE_IPSEC_TOOLS_LIBS
 	help
 	  Install libipsec.a and libracoon.a under staging_dir/lib for further
 	  development on a host machine.
+
+choice
+	prompt "Security context"
+	default BR2_PACKAGE_IPSEC_SECCTX_DISABLE
+	help
+	  Selects whether or not to enable security context support.
+
+config BR2_PACKAGE_IPSEC_SECCTX_DISABLE
+	bool "Disable security context support"
+
+config BR2_PACKAGE_IPSEC_SECCTX_ENABLE
+	bool "Enable SELinux security context support"
+
+config BR2_PACKAGE_IPSEC_SECCTX_KERNEL
+	bool "Enable kernel security context"
+
+endchoice
diff --git a/package/ipsec-tools/ipsec-tools-0.6.7-printf-format-string.patch b/package/ipsec-tools/ipsec-tools-0.6.7-printf-format-string.patch
deleted file mode 100644
index 5851737..0000000
--- a/package/ipsec-tools/ipsec-tools-0.6.7-printf-format-string.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-[patch]: ipsec-tools: fix printf format string for size_t
-
-Use %zu instead of %d for printing out size_t variables. Fixes a build issue
-on 64bit as ipsec-tools uses -Werror.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/racoon/algorithm.c |    6 +++---
- src/racoon/oakley.c    |    4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-Index: ipsec-tools-0.6.7/src/racoon/oakley.c
-===================================================================
---- ipsec-tools-0.6.7.orig/src/racoon/oakley.c
-+++ ipsec-tools-0.6.7/src/racoon/oakley.c
-@@ -252,7 +252,7 @@
- 
- #ifdef ENABLE_STATS
- 	gettimeofday(&end, NULL);
--	syslog(LOG_NOTICE, "%s(%s%d): %8.6f", __func__,
-+	syslog(LOG_NOTICE, "%s(%s%zu): %8.6f", __func__,
- 		s_attr_isakmp_group(dh->type), dh->prime->l << 3,
- 		timedelta(&start, &end));
- #endif
-@@ -299,7 +299,7 @@
- 
- #ifdef ENABLE_STATS
- 	gettimeofday(&end, NULL);
--	syslog(LOG_NOTICE, "%s(%s%d): %8.6f", __func__,
-+	syslog(LOG_NOTICE, "%s(%s%zu): %8.6f", __func__,
- 		s_attr_isakmp_group(dh->type), dh->prime->l << 3,
- 		timedelta(&start, &end));
- #endif
-Index: ipsec-tools-0.6.7/src/racoon/algorithm.c
-===================================================================
---- ipsec-tools-0.6.7.orig/src/racoon/algorithm.c
-+++ ipsec-tools-0.6.7/src/racoon/algorithm.c
-@@ -394,7 +394,7 @@
- 
- #ifdef ENABLE_STATS
- 	gettimeofday(&end, NULL);
--	syslog(LOG_NOTICE, "%s(%s size=%d): %8.6f", __func__,
-+	syslog(LOG_NOTICE, "%s(%s size=%zu): %8.6f", __func__,
- 		f->name, buf->l, timedelta(&start, &end));
- #endif
- 
-@@ -506,7 +506,7 @@
- 
- #ifdef ENABLE_STATS
- 	gettimeofday(&end, NULL);
--	syslog(LOG_NOTICE, "%s(%s klen=%d size=%d): %8.6f", __func__,
-+	syslog(LOG_NOTICE, "%s(%s klen=%zu size=%zu): %8.6f", __func__,
- 		f->name, key->l << 3, buf->l, timedelta(&start, &end));
- #endif
- 	return res;
-@@ -535,7 +535,7 @@
- 
- #ifdef ENABLE_STATS
- 	gettimeofday(&end, NULL);
--	syslog(LOG_NOTICE, "%s(%s klen=%d size=%d): %8.6f", __func__,
-+	syslog(LOG_NOTICE, "%s(%s klen=%zu size=%zu): %8.6f", __func__,
- 		f->name, key->l << 3, buf->l, timedelta(&start, &end));
- #endif
- 	return res;
diff --git a/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch b/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch
deleted file mode 100644
index 4988ee5..0000000
--- a/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-diff -rup ipsec-tools-0.6.6.oorig/src/racoon/eaytest.c ipsec-tools-0.6.6/src/racoon/eaytest.c
---- ipsec-tools-0.6.6.oorig/src/racoon/eaytest.c	2005-06-29 00:38:02.000000000 +0200
-+++ ipsec-tools-0.6.6/src/racoon/eaytest.c	2006-10-11 16:01:45.000000000 +0200
-@@ -311,7 +311,7 @@ certtest(ac, av)
- 
- 	printf("exact match: succeed.\n");
- 
--	if (dnstr_w1) {
-+	if (*dnstr_w1) {
- 		asn1dn = eay_str2asn1dn(dnstr_w1, strlen(dnstr_w1));
- 		if (asn1dn == NULL || asn1dn->l == asn1dn0.l)
- 			errx(1, "asn1dn length wrong for wildcard 1\n");
-@@ -321,7 +321,7 @@ certtest(ac, av)
- 		printf("wildcard 1 match: succeed.\n");
- 	}
- 
--	if (dnstr_w1) {
-+	if (*dnstr_w1) {
- 		asn1dn = eay_str2asn1dn(dnstr_w2, strlen(dnstr_w2));
- 		if (asn1dn == NULL || asn1dn->l == asn1dn0.l)
- 			errx(1, "asn1dn length wrong for wildcard 2\n");
-diff -rup ipsec-tools-0.6.6.oorig/src/racoon/var.h ipsec-tools-0.6.6/src/racoon/var.h
---- ipsec-tools-0.6.6.oorig/src/racoon/var.h	2004-11-20 17:16:59.000000000 +0100
-+++ ipsec-tools-0.6.6/src/racoon/var.h	2006-10-11 16:00:15.000000000 +0200
-@@ -76,9 +76,9 @@
- do { \
- 	if (getnameinfo((x), sysdep_sa_len(x), (y), sizeof(y), (z), sizeof(z), \
- 			NIFLAGS) != 0) { \
--		if (y) \
-+		if (*y) \
- 			strncpy((y), "(invalid)", sizeof(y)); \
--		if (z) \
-+		if (*z) \
- 			strncpy((z), "(invalid)", sizeof(z)); \
- 	} \
- } while (0);
-@@ -87,7 +87,7 @@ do { \
- do { \
- 	if (getnameinfo((x), sysdep_sa_len(x), (y), sizeof(y), NULL, 0, \
- 			NIFLAGS) != 0) { \
--		if (y) \
-+		if (*y) \
- 			strncpy((y), "(invalid)", sizeof(y)); \
- 	} \
- } while (0);
diff --git a/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch b/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch
deleted file mode 100644
index 976081a..0000000
--- a/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-diff -rup ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c ipsec-tools-0.6.6/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c
---- ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c	2004-01-12 23:31:45.000000000 +0100
-+++ ipsec-tools-0.6.6/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c	2006-10-11 16:29:42.000000000 +0200
-@@ -30,8 +30,12 @@
- #include <crypto/rijndael/rijndael_local.h>
- 
- #include <err.h>
-+#ifndef bcopy
- #define bcopy(a, b, c) memcpy(b, a, c)
-+#endif
-+#ifndef bzero
- #define bzero(a, b) memset(a, 0, b)
-+#endif
- #define panic(a) err(1, (a))
- 
- int rijndael_makeKey(keyInstance *key, BYTE direction, int keyLen, char *keyMaterial) {
-diff -rup ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/sha2/sha2.c ipsec-tools-0.6.6/src/racoon/missing/crypto/sha2/sha2.c
---- ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/sha2/sha2.c	2004-09-21 16:35:25.000000000 +0200
-+++ ipsec-tools-0.6.6/src/racoon/missing/crypto/sha2/sha2.c	2006-10-11 16:29:08.000000000 +0200
-@@ -50,8 +50,12 @@
- 
- #include <err.h>
- #include <string.h>
-+#ifndef bcopy
- #define bcopy(a, b, c) memcpy((b), (a), (c))
-+#endif
-+#ifndef bzero
- #define bzero(a, b) memset((a), 0, (b))
-+#endif
- #define panic(a) err(1, (a))
- 
- #if OPENSSL_VERSION_NUMBER >= 0x00907000L
diff --git a/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch b/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch
deleted file mode 100644
index 41d9c2b..0000000
--- a/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- ipsec-tools-0.6.6.oorig/src/racoon/cftoken.c	2006-06-13 10:49:01.000000000 +0200
-+++ ipsec-tools-0.6.6/src/racoon/cftoken.c	2006-11-22 21:20:30.000000000 +0100
-@@ -4076,8 +4076,11 @@
- 			"Includes nested too deeply");
- 		return -1;
- 	}
--
-+#ifdef GLOB_TILDE
- 	if (glob(path, GLOB_TILDE, NULL, &incstack[incstackp].matches) != 0 ||
-+#else
-+	if (glob(path, 0, NULL, &incstack[incstackp].matches) != 0 ||
-+#endif
- 	    incstack[incstackp].matches.gl_pathc == 0) {
- 		plog(LLV_ERROR, LOCATION, NULL,
- 			"glob found no matches for path");
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 2f67385..8190378 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSEC_TOOLS_VERSION:=0.6.7
+IPSEC_TOOLS_VERSION:=0.7.2
 IPSEC_TOOLS_SOURCE:=ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_CAT:=$(BZCAT)
 IPSEC_TOOLS_DIR:=$(BUILD_DIR)/ipsec-tools-$(IPSEC_TOOLS_VERSION)
@@ -16,7 +16,7 @@ IPSEC_TOOLS_BINARY_RACOONCTL:=src/racoon/racoonctl
 IPSEC_TOOLS_TARGET_BINARY_SETKEY:=usr/sbin/setkey
 IPSEC_TOOLS_TARGET_BINARY_RACOON:=usr/sbin/racoon
 IPSEC_TOOLS_TARGET_BINARY_RACOONCTL:=usr/sbin/racoonctl
-IPSEC_TOOLS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ipsec-tools/
+IPSEC_TOOLS_SITE=http://ftp.sunet.se/pub/NetBSD/misc/ipsec-tools/0.7/
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
 IPSEC_TOOLS_CONFIG_FLAGS+= --enable-adminport
@@ -58,6 +58,16 @@ ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE), y)
 IPSEC_TOOLS_CONFIG_FLAGS+= --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_DISABLE),y)
+IPSEC_TOOLS_CONFIG_FLAGS+= --enable-security-context=no
+endif
+ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_ENABLE),y)
+IPSEC_TOOLS_CONFIG_FLAGS+= --enable-security-context=yes
+endif
+ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
+IPSEC_TOOLS_CONFIG_FLAGS+= --enable-security-context=kernel
+endif
+
 $(DL_DIR)/$(IPSEC_TOOLS_SOURCE):
 	$(call DOWNLOAD,$(IPSEC_TOOLS_SITE),$(IPSEC_TOOLS_SOURCE))
 
-- 
1.6.0.6
