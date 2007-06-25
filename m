From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 02:41:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20070625094136.2E09FA45B5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 02:41:35 -0700 (Mon, 25 Jun 2007)
New Revision: 18914

Log:
- bump version
- add SUSV legacy fixups


Added:
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch

Removed:
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch

Modified:
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk


Changeset:
Deleted: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch	2007-06-25 09:07:08 UTC (rev 18913)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch	2007-06-25 09:41:35 UTC (rev 18914)
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

Deleted: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch	2007-06-25 09:07:08 UTC (rev 18913)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch	2007-06-25 09:41:35 UTC (rev 18914)
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

Deleted: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch	2007-06-25 09:07:08 UTC (rev 18913)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch	2007-06-25 09:41:35 UTC (rev 18914)
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

Copied: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch (from rev 18907, trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.100-do_not_use_addr_as_truthval.patch)
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch	                        (rev 0)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.100-do_not_use_addr_as_truthval.patch	2007-06-25 09:41:35 UTC (rev 18914)
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

Copied: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch (from rev 18907, trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.101-string_legacy.patch)
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.101-string_legacy.patch	2007-06-25 09:41:35 UTC (rev 18914)
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

Copied: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch (from rev 18907, trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch)
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch	                        (rev 0)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.7.102-GLOB_TILDE.patch	2007-06-25 09:41:35 UTC (rev 18914)
@@ -0,0 +1,15 @@
+--- ipsec-tools-0.6.6.oorig/src/racoon/cftoken.c	2006-06-13 10:49:01.000000000 +0200
++++ ipsec-tools-0.6.6/src/racoon/cftoken.c	2006-11-22 21:20:30.000000000 +0100
+@@ -4076,8 +4076,11 @@
+ 			"Includes nested too deeply");
+ 		return -1;
+ 	}
+-
++#ifdef GLOB_TILDE
+ 	if (glob(path, GLOB_TILDE, NULL, &incstack[incstackp].matches) != 0 ||
++#else
++	if (glob(path, 0, NULL, &incstack[incstackp].matches) != 0 ||
++#endif
+ 	    incstack[incstackp].matches.gl_pathc == 0) {
+ 		plog(LLV_ERROR, LOCATION, NULL,
+ 			"glob found no matches for path");

Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-06-25 09:07:08 UTC (rev 18913)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2007-06-25 09:41:35 UTC (rev 18914)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSEC_TOOLS_VER:=0.6.6
+IPSEC_TOOLS_VER:=0.6.7
 IPSEC_TOOLS_SOURCE:=ipsec-tools-$(IPSEC_TOOLS_VER).tar.bz2
 IPSEC_TOOLS_CAT:=$(BZCAT)
 IPSEC_TOOLS_DIR:=$(BUILD_DIR)/ipsec-tools-$(IPSEC_TOOLS_VER)
@@ -63,17 +63,15 @@
 $(DL_DIR)/$(IPSEC_TOOLS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(IPSEC_TOOLS_SITE)/$(IPSEC_TOOLS_SOURCE)
 
-
-$(IPSEC_TOOLS_DIR)/.source: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
+$(IPSEC_TOOLS_DIR)/.patched: $(DL_DIR)/$(IPSEC_TOOLS_SOURCE)
 	$(IPSEC_TOOLS_CAT) $(DL_DIR)/$(IPSEC_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(IPSEC_TOOLS_DIR) package/ipsec-tools ipsec-tools-$(IPSEC_TOOLS_VER)\*.patch
-	touch $(IPSEC_TOOLS_DIR)/.source
+	$(CONFIG_UPDATE) $(IPSEC_TOOLS_DIR)
+	touch $@
 
-$(IPSEC_TOOLS_DIR)/.configured: $(IPSEC_TOOLS_DIR)/.source
-	( cd $(IPSEC_TOOLS_DIR); \
+$(IPSEC_TOOLS_DIR)/.configured: $(IPSEC_TOOLS_DIR)/.patched
+	( cd $(IPSEC_TOOLS_DIR); rm -rf config.cache ; \
 	  $(TARGET_CONFIGURE_OPTS) \
-	  CFLAGS="$(TARGET_CFLAGS)" \
-	  LDFLAGS="$(TARGET_LDFLAGS)" \
 	  ./configure \
 	  --target=$(GNU_TARGET_NAME) \
 	  --host=$(GNU_TARGET_NAME) \
@@ -83,10 +81,18 @@
 	  --disable-hybrid \
 	  --without-libpam \
 	  --disable-gssapi \
-	  --with-kernel-headers=$(STAGING_DIR)/include \
+	  --with-kernel-headers=$(STAGING_DIR)/usr/include \
 	  $(IPSEC_TOOLS_CONFIG_FLAGS) \
 	); 
-	touch $(IPSEC_TOOLS_DIR)/.configured
+	# simpler than patching that cruft..
+	(echo '#undef bzero' ; \
+	 echo '#define bzero(a, b) memset((a), 0, (b))' ; \
+	 echo '#undef bcopy' ; \
+	 echo '#define bcopy(src, dest, len) memmove(dest, src, len)' ; \
+	 echo '#undef index' ; \
+	 echo '#define index(a, b) strchr(a, b)' ; \
+	) >> $(IPSEC_TOOLS_DIR)/config.h
+	touch $@
 
 $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_SETKEY) \
 $(IPSEC_TOOLS_DIR)/$(IPSEC_TOOLS_BINARY_RACOON) \
