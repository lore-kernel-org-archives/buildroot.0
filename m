From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:48:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20061117114843.1DE2148612@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:48:42 -0800 (Fri, 17 Nov 2006)
New Revision: 16555

Log:
- bump version


Added:
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch

Modified:
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk


Changeset:
Added: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch	2006-11-17 11:47:04 UTC (rev 16554)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch	2006-11-17 11:48:42 UTC (rev 16555)
@@ -0,0 +1,45 @@
+diff -rup ipsec-tools-0.6.6.oorig/src/racoon/eaytest.c ipsec-tools-0.6.6/src/racoon/eaytest.c
+--- ipsec-tools-0.6.6.oorig/src/racoon/eaytest.c	2005-06-29 00:38:02.000000000 +0200
++++ ipsec-tools-0.6.6/src/racoon/eaytest.c	2006-10-11 16:01:45.000000000 +0200
+@@ -311,7 +311,7 @@ certtest(ac, av)
+ 
+ 	printf("exact match: succeed.\n");
+ 
+-	if (dnstr_w1) {
++	if (*dnstr_w1) {
+ 		asn1dn = eay_str2asn1dn(dnstr_w1, strlen(dnstr_w1));
+ 		if (asn1dn == NULL || asn1dn->l == asn1dn0.l)
+ 			errx(1, "asn1dn length wrong for wildcard 1\n");
+@@ -321,7 +321,7 @@ certtest(ac, av)
+ 		printf("wildcard 1 match: succeed.\n");
+ 	}
+ 
+-	if (dnstr_w1) {
++	if (*dnstr_w1) {
+ 		asn1dn = eay_str2asn1dn(dnstr_w2, strlen(dnstr_w2));
+ 		if (asn1dn == NULL || asn1dn->l == asn1dn0.l)
+ 			errx(1, "asn1dn length wrong for wildcard 2\n");
+diff -rup ipsec-tools-0.6.6.oorig/src/racoon/var.h ipsec-tools-0.6.6/src/racoon/var.h
+--- ipsec-tools-0.6.6.oorig/src/racoon/var.h	2004-11-20 17:16:59.000000000 +0100
++++ ipsec-tools-0.6.6/src/racoon/var.h	2006-10-11 16:00:15.000000000 +0200
+@@ -76,9 +76,9 @@
+ do { \
+ 	if (getnameinfo((x), sysdep_sa_len(x), (y), sizeof(y), (z), sizeof(z), \
+ 			NIFLAGS) != 0) { \
+-		if (y) \
++		if (*y) \
+ 			strncpy((y), "(invalid)", sizeof(y)); \
+-		if (z) \
++		if (*z) \
+ 			strncpy((z), "(invalid)", sizeof(z)); \
+ 	} \
+ } while (0);
+@@ -87,7 +87,7 @@ do { \
+ do { \
+ 	if (getnameinfo((x), sysdep_sa_len(x), (y), sizeof(y), NULL, 0, \
+ 			NIFLAGS) != 0) { \
+-		if (y) \
++		if (*y) \
+ 			strncpy((y), "(invalid)", sizeof(y)); \
+ 	} \
+ } while (0);

Added: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch	2006-11-17 11:47:04 UTC (rev 16554)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch	2006-11-17 11:48:42 UTC (rev 16555)
@@ -0,0 +1,32 @@
+diff -rup ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c ipsec-tools-0.6.6/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c
+--- ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c	2004-01-12 23:31:45.000000000 +0100
++++ ipsec-tools-0.6.6/src/racoon/missing/crypto/rijndael/rijndael-api-fst.c	2006-10-11 16:29:42.000000000 +0200
+@@ -30,8 +30,12 @@
+ #include <crypto/rijndael/rijndael_local.h>
+ 
+ #include <err.h>
++#ifndef bcopy
+ #define bcopy(a, b, c) memcpy(b, a, c)
++#endif
++#ifndef bzero
+ #define bzero(a, b) memset(a, 0, b)
++#endif
+ #define panic(a) err(1, (a))
+ 
+ int rijndael_makeKey(keyInstance *key, BYTE direction, int keyLen, char *keyMaterial) {
+diff -rup ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/sha2/sha2.c ipsec-tools-0.6.6/src/racoon/missing/crypto/sha2/sha2.c
+--- ipsec-tools-0.6.6.oorig/src/racoon/missing/crypto/sha2/sha2.c	2004-09-21 16:35:25.000000000 +0200
++++ ipsec-tools-0.6.6/src/racoon/missing/crypto/sha2/sha2.c	2006-10-11 16:29:08.000000000 +0200
+@@ -50,8 +50,12 @@
+ 
+ #include <err.h>
+ #include <string.h>
++#ifndef bcopy
+ #define bcopy(a, b, c) memcpy((b), (a), (c))
++#endif
++#ifndef bzero
+ #define bzero(a, b) memset((a), 0, (b))
++#endif
+ #define panic(a) err(1, (a))
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x00907000L

Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2006-11-17 11:47:04 UTC (rev 16554)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2006-11-17 11:48:42 UTC (rev 16555)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSEC_TOOLS_VER:=0.6.1
+IPSEC_TOOLS_VER:=0.6.6
 IPSEC_TOOLS_SOURCE:=ipsec-tools-$(IPSEC_TOOLS_VER).tar.bz2
 IPSEC_TOOLS_DIR:=$(BUILD_DIR)/ipsec-tools-$(IPSEC_TOOLS_VER)
 
@@ -65,6 +65,7 @@
 
 $(IPSEC_TOOLS_DIR)/.source: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
 	bunzip2 -c  $(DL_DIR)/$(IPSEC_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(IPSEC_TOOLS_DIR) package/ipsec-tools ipsec-tools-$(IPSEC_TOOLS_VER)\*.patch
 	touch $(IPSEC_TOOLS_DIR)/.source
 
 $(IPSEC_TOOLS_DIR)/.configured: $(IPSEC_TOOLS_DIR)/.source
