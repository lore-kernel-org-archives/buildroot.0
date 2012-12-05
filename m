From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:40:40 -0800
Subject: [Buildroot] [git commit] hostapd: bump to version 1.1
Message-ID: <20121205091358.602A68F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba4021769d1aa9b72179c6da7960cc08d1c52d57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd-cve-2012-4445.patch |   49 ------------------------
 package/hostapd/hostapd-openssl-1.0.1.patch |   54 ---------------------------
 package/hostapd/hostapd.mk                  |    4 +-
 3 files changed, 3 insertions(+), 104 deletions(-)

diff --git a/package/hostapd/hostapd-cve-2012-4445.patch b/package/hostapd/hostapd-cve-2012-4445.patch
deleted file mode 100644
index 034a458..0000000
--- a/package/hostapd/hostapd-cve-2012-4445.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 567bacefd73782508bfe72d3624df495f0df4cd1 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sun, 7 Oct 2012 20:06:29 +0300
-Subject: [PATCH] EAP-TLS server: Fix TLS Message Length validation
-
-EAP-TLS/PEAP/TTLS/FAST server implementation did not validate TLS
-Message Length value properly and could end up trying to store more
-information into the message buffer than the allocated size if the first
-fragment is longer than the indicated size. This could result in hostapd
-process terminating in wpabuf length validation. Fix this by rejecting
-messages that have invalid TLS Message Length value.
-
-This would affect cases that use the internal EAP authentication server
-in hostapd either directly with IEEE 802.1X or when using hostapd as a
-RADIUS authentication server and when receiving an incorrectly
-constructed EAP-TLS message. Cases where hostapd uses an external
-authentication are not affected.
-
-Thanks to Timo Warns for finding and reporting this issue.
-
-Signed-hostap: Jouni Malinen <j@w1.fi>
-intended-for: hostap-1
-(cherry picked from commit 586c446e0ff42ae00315b014924ec669023bd8de)
----
- src/eap_server/eap_server_tls_common.c |    8 ++++++++
- 1 files changed, 8 insertions(+), 0 deletions(-)
-
-diff --git a/src/eap_server/eap_server_tls_common.c b/src/eap_server/eap_server_tls_common.c
-index e149ee3..2cbe700 100644
---- a/src/eap_server/eap_server_tls_common.c
-+++ b/src/eap_server/eap_server_tls_common.c
-@@ -224,6 +224,14 @@ static int eap_server_tls_process_fragment(struct eap_ssl_data *data,
- 			return -1;
- 		}
- 
-+		if (len > message_length) {
-+			wpa_printf(MSG_INFO, "SSL: Too much data (%d bytes) in "
-+				   "first fragment of frame (TLS Message "
-+				   "Length %d bytes)",
-+				   (int) len, (int) message_length);
-+			return -1;
-+		}
-+
- 		data->tls_in = wpabuf_alloc(message_length);
- 		if (data->tls_in == NULL) {
- 			wpa_printf(MSG_DEBUG, "SSL: No memory for message");
--- 
-1.7.4-rc1
-
diff --git a/package/hostapd/hostapd-openssl-1.0.1.patch b/package/hostapd/hostapd-openssl-1.0.1.patch
deleted file mode 100644
index 2e110f4..0000000
--- a/package/hostapd/hostapd-openssl-1.0.1.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From e6e243d97795306aeb604948e7101f9f14e8b8ca Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Fri, 17 Aug 2012 23:55:14 +0300
-Subject: [PATCH] Fix EAP-FAST with OpenSSL 1.0.1
-
-The mechanism to figure out key block size based on ssl->read_hash
-does not seem to work with OpenSSL 1.0.1, so add an alternative
-mechanism to figure out the NAC key size that seems to work at
-least with the current OpenSSL 1.0.1 releases.
-
-Signed-hostap: Jouni Malinen <j@w1.fi>
-intended-for: hostap-1
-(cherry picked from commit 7f996409e7e5aa0bb066257906e87ab3294d4fd0)
----
- src/crypto/tls_openssl.c |   14 +++++++++++++-
- 1 files changed, 13 insertions(+), 1 deletions(-)
-
-diff --git a/src/crypto/tls_openssl.c b/src/crypto/tls_openssl.c
-index 6380ce0..c4a76be 100644
---- a/src/crypto/tls_openssl.c
-+++ b/src/crypto/tls_openssl.c
-@@ -2785,6 +2785,7 @@ int tls_connection_get_keyblock_size(void *tls_ctx,
- {
- 	const EVP_CIPHER *c;
- 	const EVP_MD *h;
-+	int md_size;
- 
- 	if (conn == NULL || conn->ssl == NULL ||
- 	    conn->ssl->enc_read_ctx == NULL ||
-@@ -2798,9 +2799,20 @@ int tls_connection_get_keyblock_size(void *tls_ctx,
- #else
- 	h = conn->ssl->read_hash;
- #endif
-+	if (h)
-+		md_size = EVP_MD_size(h);
-+#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+	else if (conn->ssl->s3)
-+		md_size = conn->ssl->s3->tmp.new_mac_secret_size;
-+#endif
-+	else
-+		return -1;
- 
-+	wpa_printf(MSG_DEBUG, "OpenSSL: keyblock size: key_len=%d MD_size=%d "
-+		   "IV_len=%d", EVP_CIPHER_key_length(c), md_size,
-+		   EVP_CIPHER_iv_length(c));
- 	return 2 * (EVP_CIPHER_key_length(c) +
--		    EVP_MD_size(h) +
-+		    md_size +
- 		    EVP_CIPHER_iv_length(c));
- }
- 
--- 
-1.7.4-rc1
-
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 82d6231..45a93fc 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,13 +4,15 @@
 #
 #############################################################
 
-HOSTAPD_VERSION = 1.0
+HOSTAPD_VERSION = 1.1
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 HOSTAPD_LDFLAGS = $(TARGET_LDFLAGS)
+HOSTAPD_LICENSE = GPLv2/BSD-3c
+HOSTAPD_LICENSE_FILES = README
 
 # libnl needs -lm (for rint) if linking statically
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
