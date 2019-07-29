From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 29 Jul 2019 16:24:54 +0200
Subject: [Buildroot] [PATCH v2] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190729142337.14901-1-giulio.benetti@micronovasrl.com>
References: <20190729142337.14901-1-giulio.benetti@micronovasrl.com>
Message-ID: <08aa6409-7064-1afb-16d1-e88f66e7d924@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This must be v3 patch. Sorry for the noise.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

Il 29/07/2019 16:23, Giulio Benetti ha scritto:
> Actually libnss is configure with BUILD_OPT=1 that doesn't take into
> account TARGET_CFLAGS nor TARGET_LDFLAGS resulting in pre-chosen
> optimizations and debugging symbols.
> 
> Can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
> internal libnss one will be overwritten(i.e. -fPIC), so prefer to append
> TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS according
> to internal libnss Makefile system's names. And obviously remove
> BUILD_OPT=1 from BUILD_VARS. This reveals hidden bugs when building
> with -Os due to uninitialized variables so add patches to fix those
> bugs.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> V1->V2:
> - substitute all patches with upstreamed ones
> ---
>   ...ve-Wmaybe-uninitialized-warning-in-t.patch | 30 +++++++++++
>   ...ve-Wmaybe-uninitialized-warning-in-h.patch | 30 +++++++++++
>   ...ve-Wmaybe-uninitialized-warning-in-l.patch | 30 +++++++++++
>   ...ve-Wmaybe-uninitialized-warning-in-t.patch | 30 +++++++++++
>   ...ve-Wmaybe-uninitialized-warning-in-p.patch | 40 +++++++++++++++
>   ...ve-Wmaybe-uninitialized-warning-in-p.patch | 39 +++++++++++++++
>   ...ve-Wmaybe-uninitialized-warning-in-p.patch | 50 +++++++++++++++++++
>   package/libnss/libnss.mk                      | 10 +++-
>   8 files changed, 257 insertions(+), 2 deletions(-)
>   create mode 100644 package/libnss/0003-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
>   create mode 100644 package/libnss/0004-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
>   create mode 100644 package/libnss/0005-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
>   create mode 100644 package/libnss/0006-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
>   create mode 100644 package/libnss/0007-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in-p.patch
>   create mode 100644 package/libnss/0008-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
>   create mode 100644 package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch
> 
> diff --git a/package/libnss/0003-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch b/package/libnss/0003-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
> new file mode 100644
> index 0000000000..bfae2206cb
> --- /dev/null
> +++ b/package/libnss/0003-Bug-1561556-Remove-Wmaybe-uninitialized-warning-in-t.patch
> @@ -0,0 +1,30 @@
> +From 659daaa7e09c2a978cd71407d65bf8e1839104b7 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Wed, 10 Jul 2019 14:58:32 -0700
> +Subject: [PATCH 1/7] Bug 1561556 - Remove -Wmaybe-uninitialized warning in
> + tls13esni.c r=marcusburghardt,jcj
> +
> +--HG--
> +extra : source : 9ab49a84249573e6615e02f6b7f3060b925c1b8b
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/lib/ssl/tls13esni.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/ssl/tls13esni.c b/nss/lib/ssl/tls13esni.c
> +index 9b635a9cf..4d2e12d62 100644
> +--- a/nss/lib/ssl/tls13esni.c
> ++++ b/nss/lib/ssl/tls13esni.c
> +@@ -580,7 +580,7 @@ tls13_ClientSetupESNI(sslSocket *ss)
> +     size_t i;
> +     PRCList *cur;
> +     SECStatus rv;
> +-    TLS13KeyShareEntry *share;
> ++    TLS13KeyShareEntry *share = NULL;
> +     const sslNamedGroupDef *group = NULL;
> +     PRTime now = PR_Now() / PR_USEC_PER_SEC;
> +
> +--
> +2.17.1
> +
> diff --git a/package/libnss/0004-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch b/package/libnss/0004-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
> new file mode 100644
> index 0000000000..6e40d12242
> --- /dev/null
> +++ b/package/libnss/0004-Bug-1561558-Remove-Wmaybe-uninitialized-warning-in-h.patch
> @@ -0,0 +1,30 @@
> +From 453d97dff76635bfb4aba4a8f3626c1536ec07e7 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Wed, 10 Jul 2019 15:00:24 -0700
> +Subject: [PATCH 2/7] Bug 1561558 - Remove -Wmaybe-uninitialized warning in
> + httpserv.c r=marcusburghardt,jcj
> +
> +--HG--
> +extra : source : 2f3d66e0b4142e4cacf3fe11267176f0371c1b48
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/cmd/httpserv/httpserv.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/cmd/httpserv/httpserv.c b/nss/cmd/httpserv/httpserv.c
> +index 71e2ab88d..c7277f3bd 100644
> +--- a/nss/cmd/httpserv/httpserv.c
> ++++ b/nss/cmd/httpserv/httpserv.c
> +@@ -463,7 +463,7 @@ handle_connection(
> +     char *getData = NULL; /* inplace conversion */
> +     SECItem postData;
> +     PRBool isOcspRequest = PR_FALSE;
> +-    PRBool isPost;
> ++    PRBool isPost = PR_FALSE;
> +
> +     postData.data = NULL;
> +     postData.len = 0;
> +--
> +2.17.1
> +
> diff --git a/package/libnss/0005-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch b/package/libnss/0005-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
> new file mode 100644
> index 0000000000..0681ee48d1
> --- /dev/null
> +++ b/package/libnss/0005-Bug-1561587-Remove-Wmaybe-uninitialized-warning-in-l.patch
> @@ -0,0 +1,30 @@
> +From 6bedef511379d82babee408242aadb162eb732d6 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Wed, 10 Jul 2019 15:01:18 -0700
> +Subject: [PATCH 3/7] Bug 1561587 - Remove -Wmaybe-uninitialized warning in
> + lgattr.c r=marcusburghardt,jcj
> +
> +--HG--
> +extra : source : 346a2349d14872a63ca5e849750bfc6342a66a52
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/lib/softoken/legacydb/lgattr.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/softoken/legacydb/lgattr.c b/nss/lib/softoken/legacydb/lgattr.c
> +index 3d77bd056..c1865a38e 100644
> +--- a/nss/lib/softoken/legacydb/lgattr.c
> ++++ b/nss/lib/softoken/legacydb/lgattr.c
> +@@ -1069,7 +1069,7 @@ lg_FindTrustAttribute(LGObjectCache *obj, CK_ATTRIBUTE_TYPE type,
> +     NSSLOWCERTCertificate *cert;
> +     unsigned char hash[SHA1_LENGTH];
> +     unsigned int trustFlags;
> +-    CK_RV crv;
> ++    CK_RV crv = CKR_CANCEL;
> +
> +     switch (type) {
> +         case CKA_PRIVATE:
> +--
> +2.17.1
> +
> diff --git a/package/libnss/0006-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch b/package/libnss/0006-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
> new file mode 100644
> index 0000000000..bb9c4e9216
> --- /dev/null
> +++ b/package/libnss/0006-Bug-1561591-Remove-Wmaybe-uninitialized-warning-in-t.patch
> @@ -0,0 +1,30 @@
> +From 871c12951e98d8a098ea7dcc26e249553c6633fb Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Wed, 10 Jul 2019 15:01:49 -0700
> +Subject: [PATCH 4/7] Bug 1561591 - Remove -Wmaybe-uninitialized warning in
> + tstclnt.c r=marcusburghardt,jcj
> +
> +--HG--
> +extra : source : 4b09a45373c66567d8da9918f9ecaa053ebb10c7
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/cmd/tstclnt/tstclnt.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/cmd/tstclnt/tstclnt.c b/nss/cmd/tstclnt/tstclnt.c
> +index 12c6df045..bb626d903 100644
> +--- a/nss/cmd/tstclnt/tstclnt.c
> ++++ b/nss/cmd/tstclnt/tstclnt.c
> +@@ -924,7 +924,7 @@ restartHandshakeAfterServerCertIfNeeded(PRFileDesc *fd,
> +                                         PRBool override)
> + {
> +     SECStatus rv;
> +-    PRErrorCode error;
> ++    PRErrorCode error = 0;
> +
> +     if (!serverCertAuth->isPaused)
> +         return SECSuccess;
> +--
> +2.17.1
> +
> diff --git a/package/libnss/0007-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in-p.patch b/package/libnss/0007-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in-p.patch
> new file mode 100644
> index 0000000000..e49bda6cd6
> --- /dev/null
> +++ b/package/libnss/0007-Bug-1561548-Remove-Wmaybe-uninitialized-warning-in-p.patch
> @@ -0,0 +1,40 @@
> +From 09e48ebe2f29686c0f5ba2000303c6c88a5fd72d Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Fri, 19 Jul 2019 09:39:39 -0700
> +Subject: [PATCH 5/7] Bug 1561548 - Remove -Wmaybe-uninitialized warning in
> + pkix_pl_ldapdefaultclient.c r=marcusburghardt,jcj
> +
> +--HG--
> +extra : amend_source : 66d4681f81ad23b26160d286a4d12139538ac1a4
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c b/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c
> +index 3dc06be9a..9b6f8d688 100644
> +--- a/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c
> ++++ b/nss/lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.c
> +@@ -352,7 +352,9 @@ pkix_pl_LdapDefaultClient_VerifyBindResponse(
> +         SECItem decode = {siBuffer, NULL, 0};
> +         SECStatus rv = SECFailure;
> +         LDAPMessage msg;
> +-        LDAPBindResponse *ldapBindResponse = NULL;
> ++        LDAPBindResponse *ldapBindResponse = &msg.protocolOp.op.bindResponseMsg;
> ++
> ++        ldapBindResponse->resultCode.data = NULL;
> +
> +         PKIX_ENTER
> +                 (LDAPDEFAULTCLIENT,
> +@@ -367,7 +369,6 @@ pkix_pl_LdapDefaultClient_VerifyBindResponse(
> +                 PKIX_LDAPDEFAULTCLIENTDECODEBINDRESPONSEFAILED);
> +
> +         if (rv == SECSuccess) {
> +-                ldapBindResponse = &msg.protocolOp.op.bindResponseMsg;
> +                 if (*(ldapBindResponse->resultCode.data) == SUCCESS) {
> +                         client->connectStatus = BOUND;
> +                 } else {
> +--
> +2.17.1
> +
> diff --git a/package/libnss/0008-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch b/package/libnss/0008-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
> new file mode 100644
> index 0000000000..782b80aa86
> --- /dev/null
> +++ b/package/libnss/0008-Bug-1561588-Remove-Wmaybe-uninitialized-warning-in-p.patch
> @@ -0,0 +1,39 @@
> +From f8379a4edd0a8d5b6d7a411956b789785979e4c9 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Fri, 19 Jul 2019 09:40:51 -0700
> +Subject: [PATCH 6/7] Bug 1561588 - Remove -Wmaybe-uninitialized warning in
> + p7env.c r=marcusburghardt,jcj
> +
> +--HG--
> +extra : amend_source : 6acce3136f3b96899e8daca8df50d418d4ea0e02
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/cmd/p7env/p7env.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/nss/cmd/p7env/p7env.c b/nss/cmd/p7env/p7env.c
> +index b35bf9a98..453cbee19 100644
> +--- a/nss/cmd/p7env/p7env.c
> ++++ b/nss/cmd/p7env/p7env.c
> +@@ -66,7 +66,7 @@ EncryptFile(FILE *outFile, FILE *inFile, struct recipient *recipients,
> +     SEC_PKCS7ContentInfo *cinfo;
> +     SEC_PKCS7EncoderContext *ecx;
> +     struct recipient *rcpt;
> +-    SECStatus rv;
> ++    SECStatus rv = SECFailure;
> +
> +     if (outFile == NULL || inFile == NULL || recipients == NULL)
> +         return -1;
> +@@ -133,7 +133,7 @@ main(int argc, char **argv)
> +     struct recipient *recipients, *rcpt;
> +     PLOptState *optstate;
> +     PLOptStatus status;
> +-    SECStatus rv;
> ++    SECStatus rv = SECFailure;
> +
> +     progName = strrchr(argv[0], '/');
> +     progName = progName ? progName + 1 : argv[0];
> +--
> +2.17.1
> +
> diff --git a/package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch b/package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch
> new file mode 100644
> index 0000000000..de2ac62dc9
> --- /dev/null
> +++ b/package/libnss/0009-Bug-1561598-Remove-Wmaybe-uninitialized-warning-in-p.patch
> @@ -0,0 +1,50 @@
> +From e400efdc5cc4cd6e552afcab07e5775bc29feccd Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Fri, 26 Jul 2019 09:30:10 -0700
> +Subject: [PATCH] Bug 1561598 - Remove -Wmaybe-uninitialized warning in pqg.c
> + r=marcusburghardt,jcj
> +
> +--HG--
> +extra : amend_source : c8d49b08447a46283c205bfbf7b08d7e7a1f0587
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + nss/lib/freebl/pqg.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/nss/lib/freebl/pqg.c b/nss/lib/freebl/pqg.c
> +index 28930e2e4..626b2fb85 100644
> +--- a/nss/lib/freebl/pqg.c
> ++++ b/nss/lib/freebl/pqg.c
> +@@ -890,7 +890,7 @@ findQfromSeed(
> +     pqgGenType *typePtr,        /* output. Generation Type used */
> +     unsigned int *qgen_counter) /* output. q_counter */
> + {
> +-    HASH_HashType hashtype;
> ++    HASH_HashType hashtype = HASH_AlgNULL;
> +     SECItem firstseed = { 0, 0, 0 };
> +     SECItem qseed = { 0, 0, 0 };
> +     SECStatus rv;
> +@@ -1239,7 +1239,7 @@ pqg_ParamGen(unsigned int L, unsigned int N, pqgGenType type,
> +     unsigned int offset;  /* Per FIPS 186, app 2.2. 186-3 app A.1.1.2 */
> +     unsigned int outlen;  /* Per FIPS 186-3, appendix A.1.1.2. */
> +     unsigned int maxCount;
> +-    HASH_HashType hashtype;
> ++    HASH_HashType hashtype = HASH_AlgNULL;
> +     SECItem *seed; /* Per FIPS 186, app 2.2. 186-3 app A.1.1.2 */
> +     PLArenaPool *arena = NULL;
> +     PQGParams *params = NULL;
> +@@ -1630,8 +1630,8 @@ PQG_VerifyParams(const PQGParams *params,
> +     unsigned int qseed_len;
> +     unsigned int qgen_counter_ = 0;
> +     SECItem pseed_ = { 0, 0, 0 };
> +-    HASH_HashType hashtype;
> +-    pqgGenType type;
> ++    HASH_HashType hashtype = HASH_AlgNULL;
> ++    pqgGenType type = FIPS186_1_TYPE;
> +
> + #define CHECKPARAM(cond)      \
> +     if (!(cond)) {            \
> +--
> +2.17.1
> +
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 89d614fe1c..e1b9e02a77 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -13,6 +13,14 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
>   LIBNSS_LICENSE = MPL-2.0
>   LIBNSS_LICENSE_FILES = nss/COPYING
>   
> +# Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
> +define LIBNSS_FIXUP_LINUX_MK
> +	echo 'OS_CFLAGS += $(TARGET_CFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
> +	echo 'LDFLAGS += $(TARGET_LDFLAGS)' >> $(@D)/nss/coreconf/Linux.mk
> +endef
> +
> +LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_FIXUP_LINUX_MK
> +
>   # --gc-sections triggers binutils ld segfault
>   # https://sourceware.org/bugzilla/show_bug.cgi?id=21180
>   ifeq ($(BR2_microblaze),y)
> @@ -33,7 +41,6 @@ LIBNSS_BUILD_VARS = \
>   	MOZILLA_CLIENT=1 \
>   	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
>   	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
> -	BUILD_OPT=1 \
>   	NS_USE_GCC=1 \
>   	NSS_DISABLE_GTESTS=1 \
>   	NSS_USE_SYSTEM_SQLITE=1 \
> @@ -102,7 +109,6 @@ HOST_LIBNSS_BUILD_VARS = \
>   	MOZILLA_CLIENT=1 \
>   	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
>   	NSPR_LIB_DIR=$(HOST_DIR)/lib \
> -	BUILD_OPT=1 \
>   	NS_USE_GCC=1 \
>   	NSS_DISABLE_GTESTS=1 \
>   	NSS_USE_SYSTEM_SQLITE=1 \
> 
