From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:55:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: add upstream patch to fix
 CVE-2021-30004
Message-ID: <20210426215553.11099-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue for the internal TLS backend:

- CVE-2021-30004: In wpa_supplicant and hostapd 2.9, forging attacks may
  occur because AlgorithmIdentifier parameters are mishandled in tls/pkcs1.c
  and tls/x509v3.c.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...DigestAlgorithmIdentifier-parameters.patch | 116 ++++++++++++++++++
 package/hostapd/hostapd.mk                    |   5 +-
 2 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch

diff --git a/package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch b/package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
new file mode 100644
index 0000000000..5dcfed9406
--- /dev/null
+++ b/package/hostapd/0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
@@ -0,0 +1,116 @@
+From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 18:19:31 +0200
+Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
+
+The supported hash algorithms do not use AlgorithmIdentifier parameters.
+However, there are implementations that include NULL parameters in
+addition to ones that omit the parameters. Previous implementation did
+not check the parameters value at all which supported both these cases,
+but did not reject any other unexpected information.
+
+Use strict validation of digest algorithm parameters and reject any
+unexpected value when validating a signature. This is needed to prevent
+potential forging attacks.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/tls/pkcs1.c  | 21 +++++++++++++++++++++
+ src/tls/x509v3.c | 20 ++++++++++++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index bbdb0d72d..5761dfed0 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -244,6 +244,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
++		    hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -265,6 +267,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -273,6 +277,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
+ 		os_free(decrypted);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "PKCS #1: Unexpected digest algorithm parameters");
++		os_free(decrypted);
++		return -1;
++	}
+ 
+ 	if (!asn1_oid_equal(&oid, hash_alg)) {
+ 		char txt[100], txt2[100];
+diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
+index a8944dd2f..df337ec4d 100644
+--- a/src/tls/x509v3.c
++++ b/src/tls/x509v3.c
+@@ -1964,6 +1964,7 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
+ 
+ 	pos = hdr.payload;
+ 	end = pos + hdr.length;
+@@ -1985,6 +1986,8 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
++		    hdr.payload, hdr.length);
+ 	da_end = hdr.payload + hdr.length;
+ 
+ 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
+@@ -1992,6 +1995,23 @@ int x509_check_signature(struct x509_certificate *issuer,
+ 		os_free(data);
+ 		return -1;
+ 	}
++	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
++		    next, da_end - next);
++
++	/*
++	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
++	 * omit the parameters, but there are implementation that encode these
++	 * as a NULL element. Allow these two cases and reject anything else.
++	 */
++	if (da_end > next &&
++	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
++	     !asn1_is_null(&hdr) ||
++	     hdr.payload + hdr.length != da_end)) {
++		wpa_printf(MSG_DEBUG,
++			   "X509: Unexpected digest algorithm parameters");
++		os_free(data);
++		return -1;
++	}
+ 
+ 	if (x509_sha1_oid(&oid)) {
+ 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
+-- 
+2.20.1
+
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 2995545d18..8eff92eb1e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -23,6 +23,9 @@ HOSTAPD_IGNORE_CVES += CVE-2019-16275
 # 0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 HOSTAPD_IGNORE_CVES += CVE-2020-12695
 
+# 0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
+HOSTAPD_IGNORE_CVES += CVE-2021-30004
+
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_CONFIG_SET =
 
@@ -38,8 +41,6 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 HOSTAPD_DEPENDENCIES += host-pkgconf libopenssl
 HOSTAPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
-# Issue only affects the "internal" TLS implementation
-HOSTAPD_IGNORE_CVES += CVE-2021-30004
 else
 HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
-- 
2.20.1
