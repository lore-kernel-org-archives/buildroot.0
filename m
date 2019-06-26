From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 14:58:54 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190626125900.48230-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually libnss is configure with BUILD_OPT=1 that doesn't take into
account TARGET_CFLAGS nor TARGET_LDFLAGS resulting in pre-chosen
optimizations and debugging symbols.

Can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
internal libnss one will be overwritten(i.e. -fPIC), so prefer to append
TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS according
to internal libnss Makefile system's names. And obviously remove
BUILD_OPT=1 from BUILD_VARS. This reveals hidden bugs when building
with -Os due to uninitialized variables so add patches to fix those
bugs.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1->V2:
* use $() instead of ${}
* add patches to fix all warnings when building with -Os or -Og
---
 ...move-Wmaybe-uninitialized-warning-in.patch | 42 +++++++++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-t.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-h.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-l.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-p.patch | 26 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-t.patch | 27 ++++++++++++
 ...ve-Wmaybe-uninitialized-warning-in-p.patch | 28 +++++++++++++
 package/libnss/libnss.mk                      | 10 ++++-
 8 files changed, 212 insertions(+), 2 deletions(-)
 create mode 100644 package/libnss/0003-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in.patch
 create mode 100644 package/libnss/0004-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
 create mode 100644 package/libnss/0005-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
 create mode 100644 package/libnss/0006-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
 create mode 100644 package/libnss/0007-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
 create mode 100644 package/libnss/0008-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
 create mode 100644 package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch

diff --git a/package/libnss/0003-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in.patch b/package/libnss/0003-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in.patch
new file mode 100644
index 0000000000..7de1f5004c
--- /dev/null
+++ b/package/libnss/0003-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in.patch
@@ -0,0 +1,42 @@
+From b1a1686154d8ebb5c70184abc7e583a4612b102e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 11:30:20 +0200
+Subject: [PATCH] Bug 1561548 - Remove -Wmaybe-uninitialized warning in
+ pkix_pl_ldapdefaultclient.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c b/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c
+index 3dc06be9a..32ebc98eb 100644
+--- a/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c
++++ b/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c
+@@ -352,7 +352,7 @@ pkix_pl_LdapDefaultClient_VerifyBindResponse(
+         SECItem decode = {siBuffer, NULL, 0};
+         SECStatus rv = SECFailure;
+         LDAPMessage msg;
+-        LDAPBindResponse *ldapBindResponse = NULL;
++        LDAPBindResponse *ldapBindResponse = &msg.protocolOp.op.bindResponseMsg;
+ 
+         PKIX_ENTER
+                 (LDAPDEFAULTCLIENT,
+@@ -362,12 +362,13 @@ pkix_pl_LdapDefaultClient_VerifyBindResponse(
+         decode.data = (unsigned char *)(client->rcvBuf);
+         decode.len = bufLen;
+ 
++        ldapBindResponse->resultCode.data = NULL;
++
+         PKIX_CHECK(pkix_pl_LdapDefaultClient_DecodeBindResponse
+                 (client->arena, &decode, &msg, &rv, plContext),
+                 PKIX_LDAPDEFAULTCLIENTDECODEBINDRESPONSEFAILED);
+ 
+         if (rv == SECSuccess) {
+-                ldapBindResponse = &msg.protocolOp.op.bindResponseMsg;
+                 if (*(ldapBindResponse->resultCode.data) == SUCCESS) {
+                         client->connectStatus = BOUND;
+                 } else {
+-- 
+2.17.1
+
diff --git a/package/libnss/0004-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch b/package/libnss/0004-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
new file mode 100644
index 0000000000..3e62b9383e
--- /dev/null
+++ b/package/libnss/0004-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
@@ -0,0 +1,27 @@
+From 16bd93137043c54c91b4f606945e57b922273868 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 11:35:30 +0200
+Subject: [PATCH] Bug 1561556 - Remove -Wmaybe-uninitialized warning in
+ tls13esni.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/lib/ssl/tls13esni.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/ssl/tls13esni.c b/nss/lib/ssl/tls13esni.c
+index 9b635a9cf..4d2e12d62 100644
+--- a/nss/lib/ssl/tls13esni.c
++++ b/nss/lib/ssl/tls13esni.c
+@@ -580,7 +580,7 @@ tls13_ClientSetupESNI(sslSocket *ss)
+     size_t i;
+     PRCList *cur;
+     SECStatus rv;
+-    TLS13KeyShareEntry *share;
++    TLS13KeyShareEntry *share = NULL;
+     const sslNamedGroupDef *group = NULL;
+     PRTime now = PR_Now() / PR_USEC_PER_SEC;
+ 
+-- 
+2.17.1
+
diff --git a/package/libnss/0005-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch b/package/libnss/0005-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
new file mode 100644
index 0000000000..1d2d4ad3a7
--- /dev/null
+++ b/package/libnss/0005-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
@@ -0,0 +1,27 @@
+From fa00b21b9630a991a9b5ec2fbdff80cf940af4fc Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 11:42:21 +0200
+Subject: [PATCH] Bug 1561558 - Remove -Wmaybe-uninitialized warning in
+ httpserv.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/cmd/httpserv/httpserv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/cmd/httpserv/httpserv.c b/nss/cmd/httpserv/httpserv.c
+index 71e2ab88d..c7277f3bd 100644
+--- a/nss/cmd/httpserv/httpserv.c
++++ b/nss/cmd/httpserv/httpserv.c
+@@ -463,7 +463,7 @@ handle_connection(
+     char *getData = NULL; /* inplace conversion */
+     SECItem postData;
+     PRBool isOcspRequest = PR_FALSE;
+-    PRBool isPost;
++    PRBool isPost = PR_FALSE;
+ 
+     postData.data = NULL;
+     postData.len = 0;
+-- 
+2.17.1
+
diff --git a/package/libnss/0006-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch b/package/libnss/0006-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
new file mode 100644
index 0000000000..d83cbe1d92
--- /dev/null
+++ b/package/libnss/0006-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
@@ -0,0 +1,27 @@
+From 6cb90c22d577c7d276ca9a984e542e3e4ae4a713 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 13:34:51 +0200
+Subject: [PATCH] Bug 1561587 - Remove -Wmaybe-uninitialized warning in
+ lgattr.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/lib/softoken/legacydb/lgattr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/softoken/legacydb/lgattr.c b/nss/lib/softoken/legacydb/lgattr.c
+index 542b0c968..b91b7fab9 100644
+--- a/nss/lib/softoken/legacydb/lgattr.c
++++ b/nss/lib/softoken/legacydb/lgattr.c
+@@ -1069,7 +1069,7 @@ lg_FindTrustAttribute(LGObjectCache *obj, CK_ATTRIBUTE_TYPE type,
+     NSSLOWCERTCertificate *cert;
+     unsigned char hash[SHA1_LENGTH];
+     unsigned int trustFlags;
+-    CK_RV crv;
++    CK_RV crv = CKR_CANCEL;
+ 
+     switch (type) {
+         case CKA_PRIVATE:
+-- 
+2.17.1
+
diff --git a/package/libnss/0007-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch b/package/libnss/0007-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
new file mode 100644
index 0000000000..88e4f851e2
--- /dev/null
+++ b/package/libnss/0007-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
@@ -0,0 +1,26 @@
+From a15fff0564da8af100ae036c33b2c61b89aa1868 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 13:41:08 +0200
+Subject: [PATCH] Bug 1561588 - Remove -Wmaybe-uninitialized warning in p7env.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/cmd/p7env/p7env.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/cmd/p7env/p7env.c b/nss/cmd/p7env/p7env.c
+index b35bf9a98..d7a337f1c 100644
+--- a/nss/cmd/p7env/p7env.c
++++ b/nss/cmd/p7env/p7env.c
+@@ -66,7 +66,7 @@ EncryptFile(FILE *outFile, FILE *inFile, struct recipient *recipients,
+     SEC_PKCS7ContentInfo *cinfo;
+     SEC_PKCS7EncoderContext *ecx;
+     struct recipient *rcpt;
+-    SECStatus rv;
++    SECStatus rv = SECFailure;
+ 
+     if (outFile == NULL || inFile == NULL || recipients == NULL)
+         return -1;
+-- 
+2.17.1
+
diff --git a/package/libnss/0008-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch b/package/libnss/0008-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
new file mode 100644
index 0000000000..7c08717390
--- /dev/null
+++ b/package/libnss/0008-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
@@ -0,0 +1,27 @@
+From 4114677303bddf9c91003da59cc76429d42b6d88 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 13:56:12 +0200
+Subject: [PATCH] Bug 1561591 - Remove -Wmaybe-uninitialized warning in
+ tstclnt.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/cmd/tstclnt/tstclnt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/cmd/tstclnt/tstclnt.c b/nss/cmd/tstclnt/tstclnt.c
+index bc0cbfa76..fc9994906 100644
+--- a/nss/cmd/tstclnt/tstclnt.c
++++ b/nss/cmd/tstclnt/tstclnt.c
+@@ -920,7 +920,7 @@ restartHandshakeAfterServerCertIfNeeded(PRFileDesc *fd,
+                                         PRBool override)
+ {
+     SECStatus rv;
+-    PRErrorCode error;
++    PRErrorCode error = 0;
+ 
+     if (!serverCertAuth->isPaused)
+         return SECSuccess;
+-- 
+2.17.1
+
diff --git a/package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch b/package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch
new file mode 100644
index 0000000000..48d2de30f8
--- /dev/null
+++ b/package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch
@@ -0,0 +1,28 @@
+From eba1f9a59d4d9fe7e3c96c82891a57802a1ed230 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 26 Jun 2019 14:39:16 +0200
+Subject: [PATCH] Bug 1561598 - Remove -Wmaybe-uninitialized warning in pqg.c
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ nss/lib/freebl/pqg.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/freebl/pqg.c b/lib/nss/freebl/pqg.c
+index 28930e2e4..2c4ae48e2 100644
+--- a/nss/lib/freebl/pqg.c
++++ b/nss/lib/freebl/pqg.c
+@@ -1630,8 +1630,8 @@ PQG_VerifyParams(const PQGParams *params,
+     unsigned int qseed_len;
+     unsigned int qgen_counter_ = 0;
+     SECItem pseed_ = { 0, 0, 0 };
+-    HASH_HashType hashtype;
+-    pqgGenType type;
++    HASH_HashType hashtype = HASH_AlgNULL;
++    pqgGenType type = FIPS186_1_TYPE;
+ 
+ #define CHECKPARAM(cond)      \
+     if (!(cond)) {            \
+-- 
+2.17.1
+
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 89d614fe1c..e1b9e02a77 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -13,6 +13,14 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 LIBNSS_LICENSE = MPL-2.0
 LIBNSS_LICENSE_FILES = nss/COPYING
 
+# Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
+define LIBNSS_FIXUP_LINUX_MK
+	echo 'OS_CFLAGS += $(TARGET_CFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
+	echo 'LDFLAGS += $(TARGET_LDFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
+endef
+
+LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_FIXUP_LINUX_MK
+
 # --gc-sections triggers binutils ld segfault
 # https://sourceware.org/bugzilla/show_bug.cgi?id=21180
 ifeq ($(BR2_microblaze),y)
@@ -33,7 +41,6 @@ LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
 	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
-	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
@@ -102,7 +109,6 @@ HOST_LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
 	NSPR_LIB_DIR=$(HOST_DIR)/lib \
-	BUILD_OPT=1 \
 	NS_USE_GCC=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
-- 
2.17.1
