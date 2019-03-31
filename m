From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:03:04 +0200
Subject: [Buildroot] [git commit] package/rpm: add optional openssl
 dependency
Message-ID: <20190331130146.3393E88125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94198f037c19bf46d0ad4b924820219cc88fd9e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl support has been added in version 4.14.0 with
https://github.com/rpm-software-management/rpm/commit/64028f9a1c25ada8ffc7a48775f526600edcbf85

Add a patch from upstream to fix build with openssl ad MD2 is disabled
by default:
https://github.com/rpm-software-management/rpm/pull/453

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...port-for-unused-MD2-and-RIPEMD160-digests.patch | 82 ++++++++++++++++++++++
 package/rpm/Config.in                              |  2 +-
 package/rpm/rpm.mk                                 |  5 +-
 3 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch b/package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch
new file mode 100644
index 0000000000..e080d98fe8
--- /dev/null
+++ b/package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch
@@ -0,0 +1,82 @@
+From ff4b9111aeba01dd025dd133ce617fb80f7398a0 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Tue, 26 Jun 2018 10:46:14 +0300
+Subject: [PATCH] Rip out partial support for unused MD2 and RIPEMD160 digests
+
+Inspired by #453, adding configure-checks for unused digests algorithms
+seems nonsensical, at no point in rpm history have these algorithms been
+used for anything in rpm so there's not even backward compatibility to
+care about. So the question becomes why do we appear to have (some)
+support for those unused algorithms? So lets don't, problem solved...
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rpm-software-management/rpm/commit/ff4b9111aeba01dd025dd133ce617fb80f7398a0]
+---
+ rpmio/digest_beecrypt.c | 7 -------
+ rpmio/digest_nss.c      | 2 --
+ rpmio/digest_openssl.c  | 6 ------
+ 3 files changed, 15 deletions(-)
+
+diff --git a/rpmio/digest_beecrypt.c b/rpmio/digest_beecrypt.c
+index 597027e25..653a39491 100644
+--- a/rpmio/digest_beecrypt.c
++++ b/rpmio/digest_beecrypt.c
+@@ -132,10 +132,6 @@ DIGEST_CTX rpmDigestInit(int hashalgo, rpmDigestFlags flags)
+ 	ctx->Digest = (void *) sha512Digest;
+ 	break;
+ #endif
+-    case PGPHASHALGO_RIPEMD160:
+-    case PGPHASHALGO_MD2:
+-    case PGPHASHALGO_TIGER192:
+-    case PGPHASHALGO_HAVAL_5_160:
+     default:
+ 	free(ctx);
+ 	return NULL;
+@@ -292,9 +288,6 @@ static int pgpVerifySigRSA(pgpDigAlg pgpkey, pgpDigAlg pgpsig, uint8_t *hash, si
+     case PGPHASHALGO_SHA1:
+         prefix = "3021300906052b0e03021a05000414";
+         break;
+-    case PGPHASHALGO_MD2:
+-        prefix = "3020300c06082a864886f70d020205000410";
+-        break;
+     case PGPHASHALGO_SHA256:
+         prefix = "3031300d060960864801650304020105000420";
+         break;
+diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
+index 992d9acf6..50f8c8e90 100644
+--- a/rpmio/digest_nss.c
++++ b/rpmio/digest_nss.c
+@@ -116,7 +116,6 @@ static HASH_HashType getHashType(int hashalgo)
+ {
+     switch (hashalgo) {
+     case PGPHASHALGO_MD5:	return HASH_AlgMD5;
+-    case PGPHASHALGO_MD2:	return HASH_AlgMD2;
+     case PGPHASHALGO_SHA1:	return HASH_AlgSHA1;
+ #ifdef SHA224_LENGTH
+     case PGPHASHALGO_SHA224:	return HASH_AlgSHA224;
+@@ -216,7 +215,6 @@ static SECOidTag getHashAlg(unsigned int hashalgo)
+ {
+     switch (hashalgo) {
+     case PGPHASHALGO_MD5:	return SEC_OID_MD5;
+-    case PGPHASHALGO_MD2:	return SEC_OID_MD2;
+     case PGPHASHALGO_SHA1:	return SEC_OID_SHA1;
+ #ifdef SHA224_LENGTH
+     case PGPHASHALGO_SHA224:	return SEC_OID_SHA224;
+diff --git a/rpmio/digest_openssl.c b/rpmio/digest_openssl.c
+index 18e52a724..0ae48dd1d 100644
+--- a/rpmio/digest_openssl.c
++++ b/rpmio/digest_openssl.c
+@@ -172,12 +172,6 @@ static const EVP_MD *getEVPMD(int hashalgo)
+     case PGPHASHALGO_SHA1:
+         return EVP_sha1();
+ 
+-    case PGPHASHALGO_RIPEMD160:
+-        return EVP_ripemd160();
+-
+-    case PGPHASHALGO_MD2:
+-        return EVP_md2();
+-
+     case PGPHASHALGO_SHA256:
+         return EVP_sha256();
+ 
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 58451a9fcc..555ad12eff 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RPM
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_POPT
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fe9f898bd3..626e6bf94c 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -53,10 +53,13 @@ ifeq ($(BR2_PACKAGE_LIBNSS),y)
 RPM_DEPENDENCIES += libnss
 RPM_CONF_OPTS += --with-crypto=nss
 RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
-else
+else ifeq ($(BR2_PACKAGE_BEECRYPT),y)
 RPM_DEPENDENCIES += beecrypt
 RPM_CONF_OPTS += --with-crypto=beecrypt
 RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
+else
+RPM_DEPENDENCIES += openssl
+RPM_CONF_OPTS += --with-crypto=openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
