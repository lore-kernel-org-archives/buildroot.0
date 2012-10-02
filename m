From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Oct 2012 14:40:52 -0300
Subject: [Buildroot] [PATCH 5/5] wpa_supplicant: add openssl 1.0.1 patch
In-Reply-To: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
References: <1349199652-12928-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1349199652-12928-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../wpa_supplicant-openssl-1.0.1.patch             |   54 ++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/wpa_supplicant/wpa_supplicant-openssl-1.0.1.patch

diff --git a/package/wpa_supplicant/wpa_supplicant-openssl-1.0.1.patch b/package/wpa_supplicant/wpa_supplicant-openssl-1.0.1.patch
new file mode 100644
index 0000000..2e110f4
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-openssl-1.0.1.patch
@@ -0,0 +1,54 @@
+From e6e243d97795306aeb604948e7101f9f14e8b8ca Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Fri, 17 Aug 2012 23:55:14 +0300
+Subject: [PATCH] Fix EAP-FAST with OpenSSL 1.0.1
+
+The mechanism to figure out key block size based on ssl->read_hash
+does not seem to work with OpenSSL 1.0.1, so add an alternative
+mechanism to figure out the NAC key size that seems to work at
+least with the current OpenSSL 1.0.1 releases.
+
+Signed-hostap: Jouni Malinen <j@w1.fi>
+intended-for: hostap-1
+(cherry picked from commit 7f996409e7e5aa0bb066257906e87ab3294d4fd0)
+---
+ src/crypto/tls_openssl.c |   14 +++++++++++++-
+ 1 files changed, 13 insertions(+), 1 deletions(-)
+
+diff --git a/src/crypto/tls_openssl.c b/src/crypto/tls_openssl.c
+index 6380ce0..c4a76be 100644
+--- a/src/crypto/tls_openssl.c
++++ b/src/crypto/tls_openssl.c
+@@ -2785,6 +2785,7 @@ int tls_connection_get_keyblock_size(void *tls_ctx,
+ {
+ 	const EVP_CIPHER *c;
+ 	const EVP_MD *h;
++	int md_size;
+ 
+ 	if (conn == NULL || conn->ssl == NULL ||
+ 	    conn->ssl->enc_read_ctx == NULL ||
+@@ -2798,9 +2799,20 @@ int tls_connection_get_keyblock_size(void *tls_ctx,
+ #else
+ 	h = conn->ssl->read_hash;
+ #endif
++	if (h)
++		md_size = EVP_MD_size(h);
++#if OPENSSL_VERSION_NUMBER >= 0x10000000L
++	else if (conn->ssl->s3)
++		md_size = conn->ssl->s3->tmp.new_mac_secret_size;
++#endif
++	else
++		return -1;
+ 
++	wpa_printf(MSG_DEBUG, "OpenSSL: keyblock size: key_len=%d MD_size=%d "
++		   "IV_len=%d", EVP_CIPHER_key_length(c), md_size,
++		   EVP_CIPHER_iv_length(c));
+ 	return 2 * (EVP_CIPHER_key_length(c) +
+-		    EVP_MD_size(h) +
++		    md_size +
+ 		    EVP_CIPHER_iv_length(c));
+ }
+ 
+-- 
+1.7.4-rc1
+
-- 
1.7.8.6
