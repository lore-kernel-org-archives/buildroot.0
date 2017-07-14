From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 15:42:01 -0400
Subject: [Buildroot] [PATCH v2 14/15] janus-gateway: support libressl
Message-ID: <20170714194201.7826-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In addition, add the patch 0003-support-libressl.
This fixes some preprocessor checks that determine whether
or not to use OpenSSL 1.1 or 1.0.x. Because LibreSSL returns 2.x
for the version numbers, the macros think that OpenSSL 1.1 should be
used. This patch checks to see if there is an LIBRESSL_VERSION_NUMBER
defined as well. This patch has been submitted to upstream.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fixed malformed 0003-support-libressl.patch.

 package/janus-gateway/0003-support-libressl.patch | 138 ++++++++++++++++++++++
 package/janus-gateway/Config.in                   |   2 +-
 package/janus-gateway/janus-gateway.mk            |   9 +-
 3 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 package/janus-gateway/0003-support-libressl.patch

diff --git a/package/janus-gateway/0003-support-libressl.patch b/package/janus-gateway/0003-support-libressl.patch
new file mode 100644
index 000000000..35ce538aa
--- /dev/null
+++ b/package/janus-gateway/0003-support-libressl.patch
@@ -0,0 +1,138 @@
+From ef83b0818fc2e8e610bcf2c3134aa62dc9c0b34c Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Fri, 14 Jul 2017 15:09:51 -0400
+Subject: [PATCH] support libressl
+
+This fixes some preprocessor checks that determine whether
+or not to use OpenSSL 1.1 or 1.0.x. Because LibreSSL returns 2.x
+the compiler thinks that OpenSSL 1.1 should be used. This patch
+checks to see if there is an LIBRESSL_VERSION_NUMBER defined
+as well as if the OPENSSL_VERSION_NUMBER is < 1.1.
+
+Upstream-Status: Pending
+https://github.com/meetecho/janus-gateway/pull/954
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ dtls-bio.c | 18 +++++++++---------
+ dtls.c     |  6 +++---
+ 2 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/dtls-bio.c b/dtls-bio.c
+index 24e4749..a97c7c5 100644
+--- a/dtls-bio.c
++++ b/dtls-bio.c
+@@ -36,7 +36,7 @@ int janus_dtls_bio_filter_new(BIO *h);
+ int janus_dtls_bio_filter_free(BIO *data);
+ 
+ /* Filter initialization */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ static BIO_METHOD janus_dtls_bio_filter_methods = {
+ 	BIO_TYPE_FILTER,
+ 	"janus filter",
+@@ -53,7 +53,7 @@ static BIO_METHOD janus_dtls_bio_filter_methods = {
+ static BIO_METHOD *janus_dtls_bio_filter_methods = NULL;
+ #endif
+ int janus_dtls_bio_filter_init(void) {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	/* No initialization needed for OpenSSL pre-1.1.0 */
+ #else
+ 	janus_dtls_bio_filter_methods = BIO_meth_new(BIO_TYPE_FILTER | BIO_get_new_index(), "janus filter");
+@@ -67,7 +67,7 @@ int janus_dtls_bio_filter_init(void) {
+ 	return 0;
+ }
+ BIO_METHOD *BIO_janus_dtls_filter(void) {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	return(&janus_dtls_bio_filter_methods);
+ #else
+ 	return janus_dtls_bio_filter_methods;
+@@ -88,7 +88,7 @@ int janus_dtls_bio_filter_new(BIO *bio) {
+ 	janus_mutex_init(&filter->mutex);
+ 	
+ 	/* Set the BIO as initialized */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	bio->init = 1;
+ 	bio->ptr = filter;
+ 	bio->flags = 0;
+@@ -105,7 +105,7 @@ int janus_dtls_bio_filter_free(BIO *bio) {
+ 		return 0;
+ 		
+ 	/* Get rid of the filter state */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	janus_dtls_bio_filter *filter = (janus_dtls_bio_filter *)bio->ptr;
+ #else
+ 	janus_dtls_bio_filter *filter = (janus_dtls_bio_filter *)BIO_get_data(bio);
+@@ -115,7 +115,7 @@ int janus_dtls_bio_filter_free(BIO *bio) {
+ 		filter->packets = NULL;
+ 		g_free(filter);
+ 	}
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	bio->ptr = NULL;
+ 	bio->init = 0;
+ 	bio->flags = 0;
+@@ -129,7 +129,7 @@ int janus_dtls_bio_filter_free(BIO *bio) {
+ int janus_dtls_bio_filter_write(BIO *bio, const char *in, int inl) {
+ 	JANUS_LOG(LOG_HUGE, "janus_dtls_bio_filter_write: %p, %d\n", in, inl);
+ 	/* Forward data to the write BIO */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	long ret = BIO_write(bio->next_bio, in, inl);
+ #else
+ 	long ret = BIO_write(BIO_next(bio), in, inl);
+@@ -137,7 +137,7 @@ int janus_dtls_bio_filter_write(BIO *bio, const char *in, int inl) {
+ 	JANUS_LOG(LOG_HUGE, "  -- %ld\n", ret);
+ 	
+ 	/* Keep track of the packet, as we'll advertize them one by one after a pending check */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	janus_dtls_bio_filter *filter = (janus_dtls_bio_filter *)bio->ptr;
+ #else
+ 	janus_dtls_bio_filter *filter = (janus_dtls_bio_filter *)BIO_get_data(bio);
+@@ -164,7 +164,7 @@ long janus_dtls_bio_filter_ctrl(BIO *bio, int cmd, long num, void *ptr) {
+ 			return 0L;
+ 		case BIO_CTRL_PENDING: {
+ 			/* We only advertize one packet at a time, as they may be fragmented */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 			janus_dtls_bio_filter *filter = (janus_dtls_bio_filter *)bio->ptr;
+ #else
+ 			janus_dtls_bio_filter *filter = (janus_dtls_bio_filter *)BIO_get_data(bio);
+diff --git a/dtls.c b/dtls.c
+index 58089cb..ea8d7c9 100644
+--- a/dtls.c
++++ b/dtls.c
+@@ -106,7 +106,7 @@ void *janus_dtls_sctp_setup_thread(void *data);
+ #endif
+ 
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /*
+  * DTLS locking stuff to make OpenSSL thread safe (not needed for 1.1.0)
+  *
+@@ -309,7 +309,7 @@ error:
+ /* DTLS-SRTP initialization */
+ gint janus_dtls_srtp_init(const char* server_pem, const char* server_key) {
+ 	const char *crypto_lib = NULL;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	crypto_lib = "OpenSSL pre-1.1.0";
+ 	/* First of all make OpenSSL thread safe (see note above on issue #316) */
+ 	janus_dtls_locks = g_malloc0(sizeof(*janus_dtls_locks) * CRYPTO_num_locks());
+@@ -328,7 +328,7 @@ gint janus_dtls_srtp_init(const char* server_pem, const char* server_key) {
+ 	JANUS_LOG(LOG_INFO, "Crypto: %s\n", crypto_lib);
+ 
+ 	/* Go on and create the DTLS context */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	ssl_ctx = SSL_CTX_new(DTLSv1_method());
+ #else
+ 	ssl_ctx = SSL_CTX_new(DTLS_method());
+-- 
+2.13.0
+
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 5bd4e9586..4062c6eca 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -8,7 +8,7 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index b32fc9ac5..858bd47a5 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -11,7 +11,14 @@ JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-	libsrtp host-gengetopt libglib2 openssl
+	libsrtp host-gengetopt libglib2
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+JANUS_GATEWAY_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+JANUS_GATEWAY_DEPENDENCIES += libressl
+endif
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
-- 
2.13.0
