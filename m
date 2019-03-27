From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:17:06 +0100
Subject: [Buildroot] [git commit] package/rdesktop: security bump to version
 1.8.4
Message-ID: <20190327221945.00EF887F43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=992e84c49ebfdef2fbe2fa3d475e0a388cf59218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github
- Remove second patch (already in version)
- Add hash for license file
- Fix memory corruption in process_bitmap_data - CVE-2018-8794
- Fix remote code execution in process_bitmap_data - CVE-2018-8795
- Fix remote code execution in process_plane - CVE-2018-8797
- Fix Denial of Service in mcs_recv_connect_response - CVE-2018-20175
- Fix Denial of Service in mcs_parse_domain_params - CVE-2018-20175
- Fix Denial of Service in sec_parse_crypt_info - CVE-2018-20176
- Fix Denial of Service in sec_recv - CVE-2018-20176
- Fix minor information leak in rdpdr_process - CVE-2018-8791
- Fix Denial of Service in cssp_read_tsrequest - CVE-2018-8792
- Fix remote code execution in cssp_read_tsrequest - CVE-2018-8793
- Fix Denial of Service in process_bitmap_data - CVE-2018-8796
- Fix minor information leak in rdpsnd_process_ping - CVE-2018-8798
- Fix Denial of Service in process_secondary_order - CVE-2018-8799
- Fix remote code execution in in ui_clip_handle_data - CVE-2018-8800
- Fix major information leak in ui_clip_handle_data - CVE-2018-20174
- Fix memory corruption in rdp_in_unistr - CVE-2018-20177
- Fix Denial of Service in process_demand_active - CVE-2018-20178
- Fix remote code execution in lspci_process - CVE-2018-20179
- Fix remote code execution in rdpsnddbg_process - CVE-2018-20180
- Fix remote code execution in seamless_process - CVE-2018-20181
- Fix remote code execution in seamless_process_line - CVE-2018-20182

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rdesktop/0002-openssl11.patch | 130 ----------------------------------
 package/rdesktop/rdesktop.hash        |   6 +-
 package/rdesktop/rdesktop.mk          |   6 +-
 3 files changed, 7 insertions(+), 135 deletions(-)

diff --git a/package/rdesktop/0002-openssl11.patch b/package/rdesktop/0002-openssl11.patch
deleted file mode 100644
index 050d6f6903..0000000000
--- a/package/rdesktop/0002-openssl11.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From bd6aa6acddf0ba640a49834807872f4cc0d0a773 Mon Sep 17 00:00:00 2001
-From: Jani Hakala <jjhakala@gmail.com>
-Date: Thu, 16 Jun 2016 14:28:15 +0300
-Subject: [PATCH] Fix OpenSSL 1.1 compability issues
-
-Some data types have been made opaque in OpenSSL version 1.1 so
-stack allocation and accessing struct fields directly does not work.
-
-Downloaded from upstream commit
-https://github.com/rdesktop/rdesktop/commit/bd6aa6acddf0ba640a49834807872f4cc0d0a773
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ssl.c | 65 ++++++++++++++++++++++++++++++++++++-----------------------
- 1 file changed, 40 insertions(+), 25 deletions(-)
-
-diff --git a/ssl.c b/ssl.c
-index 48751255..032e9b9e 100644
---- a/ssl.c
-+++ b/ssl.c
-@@ -88,7 +88,7 @@ rdssl_rsa_encrypt(uint8 * out, uint8 * in, int len, uint32 modulus_size, uint8 *
- 		  uint8 * exponent)
- {
- 	BN_CTX *ctx;
--	BIGNUM mod, exp, x, y;
-+	BIGNUM *mod, *exp, *x, *y;
- 	uint8 inr[SEC_MAX_MODULUS_SIZE];
- 	int outlen;
- 
-@@ -98,24 +98,24 @@ rdssl_rsa_encrypt(uint8 * out, uint8 * in, int len, uint32 modulus_size, uint8 *
- 	reverse(inr, len);
- 
- 	ctx = BN_CTX_new();
--	BN_init(&mod);
--	BN_init(&exp);
--	BN_init(&x);
--	BN_init(&y);
--
--	BN_bin2bn(modulus, modulus_size, &mod);
--	BN_bin2bn(exponent, SEC_EXPONENT_SIZE, &exp);
--	BN_bin2bn(inr, len, &x);
--	BN_mod_exp(&y, &x, &exp, &mod, ctx);
--	outlen = BN_bn2bin(&y, out);
-+	mod = BN_new();
-+	exp = BN_new();
-+	x = BN_new();
-+	y = BN_new();
-+
-+	BN_bin2bn(modulus, modulus_size, mod);
-+	BN_bin2bn(exponent, SEC_EXPONENT_SIZE, exp);
-+	BN_bin2bn(inr, len, x);
-+	BN_mod_exp(y, x, exp, mod, ctx);
-+	outlen = BN_bn2bin(y, out);
- 	reverse(out, outlen);
- 	if (outlen < (int) modulus_size)
- 		memset(out + outlen, 0, modulus_size - outlen);
- 
--	BN_free(&y);
--	BN_clear_free(&x);
--	BN_free(&exp);
--	BN_free(&mod);
-+	BN_free(y);
-+	BN_clear_free(x);
-+	BN_free(exp);
-+	BN_free(mod);
- 	BN_CTX_free(ctx);
- }
- 
-@@ -146,12 +146,20 @@ rdssl_cert_to_rkey(RDSSL_CERT * cert, uint32 * key_len)
- 
- 	   Kudos to Richard Levitte for the following (. intiutive .) 
- 	   lines of code that resets the OID and let's us extract the key. */
--	nid = OBJ_obj2nid(cert->cert_info->key->algor->algorithm);
-+
-+	X509_PUBKEY *key = NULL;
-+	X509_ALGOR *algor = NULL;
-+
-+	key = X509_get_X509_PUBKEY(cert);
-+	algor = X509_PUBKEY_get0_param(NULL, NULL, 0, &algor, key);
-+
-+	nid = OBJ_obj2nid(algor->algorithm);
-+
- 	if ((nid == NID_md5WithRSAEncryption) || (nid == NID_shaWithRSAEncryption))
- 	{
- 		DEBUG_RDP5(("Re-setting algorithm type to RSA in server certificate\n"));
--		ASN1_OBJECT_free(cert->cert_info->key->algor->algorithm);
--		cert->cert_info->key->algor->algorithm = OBJ_nid2obj(NID_rsaEncryption);
-+		X509_PUBKEY_set0_param(key, OBJ_nid2obj(NID_rsaEncryption),
-+				       0, NULL, NULL, 0);
- 	}
- 	epk = X509_get_pubkey(cert);
- 	if (NULL == epk)
-@@ -201,14 +209,24 @@ rdssl_rkey_get_exp_mod(RDSSL_RKEY * rkey, uint8 * exponent, uint32 max_exp_len,
- {
- 	int len;
- 
--	if ((BN_num_bytes(rkey->e) > (int) max_exp_len) ||
--	    (BN_num_bytes(rkey->n) > (int) max_mod_len))
-+	BIGNUM *e = NULL;
-+	BIGNUM *n = NULL;
-+
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+	e = rkey->e;
-+	n = rkey->n;
-+#else
-+	RSA_get0_key(rkey, &e, &n, NULL);
-+#endif
-+
-+	if ((BN_num_bytes(e) > (int) max_exp_len) ||
-+	    (BN_num_bytes(n) > (int) max_mod_len))
- 	{
- 		return 1;
- 	}
--	len = BN_bn2bin(rkey->e, exponent);
-+	len = BN_bn2bin(e, exponent);
- 	reverse(exponent, len);
--	len = BN_bn2bin(rkey->n, modulus);
-+	len = BN_bn2bin(n, modulus);
- 	reverse(modulus, len);
- 	return 0;
- }
-@@ -229,8 +247,5 @@ void
- rdssl_hmac_md5(const void *key, int key_len, const unsigned char *msg, int msg_len,
- 	       unsigned char *md)
- {
--	HMAC_CTX ctx;
--	HMAC_CTX_init(&ctx);
- 	HMAC(EVP_md5(), key, key_len, msg, msg_len, md, NULL);
--	HMAC_CTX_cleanup(&ctx);
- }
diff --git a/package/rdesktop/rdesktop.hash b/package/rdesktop/rdesktop.hash
index cc1f55b771..a43fab76fa 100644
--- a/package/rdesktop/rdesktop.hash
+++ b/package/rdesktop/rdesktop.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/rdesktop/files/rdesktop/1.8.3/
-md5	86e8b368a7c715e74ded92e0d7912dc5	rdesktop-1.8.3.tar.gz
-sha1	aa1e56043782e04a0121357b24874e3ad6ae7b1d	rdesktop-1.8.3.tar.gz
+# Locally calculated
+sha256	516f04df92f16eba04c96bbf9aeb05b9da686689c2bb5c107e0941583e09f933	rdesktop-1.8.4.tar.gz
+sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index da8a80ef92..d97422cf13 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RDESKTOP_VERSION = 1.8.3
-RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
+RDESKTOP_VERSION = 1.8.4
+RDESKTOP_SITE = $(call github,rdesktop,rdesktop,v$(RDESKTOP_VERSION))
 RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBAO),libao) \
@@ -13,6 +13,8 @@ RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 RDESKTOP_CONF_OPTS = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
 RDESKTOP_LICENSE = GPL-3.0+
 RDESKTOP_LICENSE_FILES = COPYING
+# From git
+RDESKTOP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
 RDESKTOP_DEPENDENCIES += pcsc-lite
