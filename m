From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:20 -0400
Subject: [Buildroot] [PATCH 09/10] add fix-libressl-support patches
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-10-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are 12 total packages need small patches to fix libressl support.
These patches are non-intrusive and will work with OpenSSL as well
as LibreSSL.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/apache/0003-fix-libressl-support.patch     | 277 +++++++++++++++++++++
 package/ffmpeg/0002-fix-libressl-support.patch     |  74 ++++++
 .../heirloom-mailx/0002-fix-libressl-support.patch |  54 ++++
 package/hostapd/0001-fix-libressl-support.patch    |  38 +++
 package/lftp/0003-libressl-support.patch           |  35 +++
 package/libevent/0002-fix-libressl-support.patch   |  26 ++
 package/mosquitto/0001-fix-libressl-support.patch  |  63 +++++
 package/ntp/0004-libressl-support.patch            | 106 ++++++++
 package/openldap/0004-fix-libressl-support.patch   |  99 ++++++++
 package/opusfile/0001-fix-libressl-support.patch   |  82 ++++++
 package/softether/0010-fix-libressl-support.patch  |  33 +++
 .../wpa_supplicant/0001-fix-libressl-support.patch |  70 ++++++
 12 files changed, 957 insertions(+)
 create mode 100644 package/apache/0003-fix-libressl-support.patch
 create mode 100644 package/ffmpeg/0002-fix-libressl-support.patch
 create mode 100644 package/heirloom-mailx/0002-fix-libressl-support.patch
 create mode 100644 package/hostapd/0001-fix-libressl-support.patch
 create mode 100644 package/lftp/0003-libressl-support.patch
 create mode 100644 package/libevent/0002-fix-libressl-support.patch
 create mode 100644 package/mosquitto/0001-fix-libressl-support.patch
 create mode 100644 package/ntp/0004-libressl-support.patch
 create mode 100644 package/openldap/0004-fix-libressl-support.patch
 create mode 100644 package/opusfile/0001-fix-libressl-support.patch
 create mode 100644 package/softether/0010-fix-libressl-support.patch
 create mode 100644 package/wpa_supplicant/0001-fix-libressl-support.patch

diff --git a/package/apache/0003-fix-libressl-support.patch b/package/apache/0003-fix-libressl-support.patch
new file mode 100644
index 000000000..d3b19310d
--- /dev/null
+++ b/package/apache/0003-fix-libressl-support.patch
@@ -0,0 +1,277 @@
+From 0685acdcc42c198e3493313dfe979ce80082139c Mon Sep 17 00:00:00 2001
+From: Bernard Spil 
+Date: Fri, 4 Aug 2017 13:12:19 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://bz.apache.org/bugzilla/attachment.cgi?id=35070
+
+Original Author: Bernard Spil
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ modules/ssl/mod_ssl.c           |  8 ++++----
+ modules/ssl/ssl_engine_init.c   | 10 +++++-----
+ modules/ssl/ssl_engine_io.c     |  8 ++++----
+ modules/ssl/ssl_engine_kernel.c |  2 +-
+ modules/ssl/ssl_engine_vars.c   |  2 +-
+ modules/ssl/ssl_private.h       | 18 ++++++++++++++----
+ modules/ssl/ssl_util.c          |  2 +-
+ modules/ssl/ssl_util_ssl.h      |  2 +-
+ support/ab.c                    |  8 ++++++++
+ 9 files changed, 39 insertions(+), 21 deletions(-)
+
+diff --git a/modules/ssl/mod_ssl.c b/modules/ssl/mod_ssl.c
+index 131ec7e..c7bf32b 100644
+--- a/modules/ssl/mod_ssl.c
++++ b/modules/ssl/mod_ssl.c
+@@ -337,12 +337,12 @@ static apr_status_t ssl_cleanup_pre_config(void *data)
+ #if HAVE_ENGINE_LOAD_BUILTIN_ENGINES
+     ENGINE_cleanup();
+ #endif
+-#if OPENSSL_VERSION_NUMBER >= 0x1000200fL
++#if OPENSSL_VERSION_NUMBER >= 0x1000200fL && !defined(OPENSSL_NO_COMP)
+     SSL_COMP_free_compression_methods();
+ #endif
+ 
+     /* Usually needed per thread, but this parent process is single-threaded */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #if OPENSSL_VERSION_NUMBER >= 0x1000000fL
+     ERR_remove_thread_state(NULL);
+ #else
+@@ -383,14 +383,14 @@ static int ssl_hook_pre_config(apr_pool_t *pconf,
+     /* Some OpenSSL internals are allocated per-thread, make sure they
+      * are associated to the/our same thread-id until cleaned up.
+      */
+-#if APR_HAS_THREADS && OPENSSL_VERSION_NUMBER < 0x10100000L
++#if APR_HAS_THREADS && OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     ssl_util_thread_id_setup(pconf);
+ #endif
+ 
+     /* We must register the library in full, to ensure our configuration
+      * code can successfully test the SSL environment.
+      */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     CRYPTO_malloc_init();
+ #else
+     OPENSSL_malloc_init();
+diff --git a/modules/ssl/ssl_engine_init.c b/modules/ssl/ssl_engine_init.c
+index 3e11d56..630de3a 100644
+--- a/modules/ssl/ssl_engine_init.c
++++ b/modules/ssl/ssl_engine_init.c
+@@ -47,7 +47,7 @@ APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(ssl, SSL, int, init_server,
+ #define KEYTYPES "RSA or DSA"
+ #endif
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /* OpenSSL Pre-1.1.0 compatibility */
+ /* Taken from OpenSSL 1.1.0 snapshot 20160410 */
+ static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
+@@ -257,7 +257,7 @@ apr_status_t ssl_init_Module(apr_pool_t *p, apr_pool_t *plog,
+ #endif
+     }
+ 
+-#if APR_HAS_THREADS && OPENSSL_VERSION_NUMBER < 0x10100000L
++#if APR_HAS_THREADS && ( OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) )
+     ssl_util_thread_setup(p);
+ #endif
+ 
+@@ -380,7 +380,7 @@ apr_status_t ssl_init_Module(apr_pool_t *p, apr_pool_t *plog,
+     modssl_init_app_data2_idx(); /* for modssl_get_app_data2()@request time */
+ 
+     init_dh_params();
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
+     init_bio_methods();
+ #endif
+ 
+@@ -1301,7 +1301,7 @@ static apr_status_t ssl_init_server_certs(server_rec *s,
+      * or configure NIST P-256 (required to enable ECDHE for earlier versions)
+      * ECDH is always enabled in 1.1.0 unless excluded from SSLCipherList
+      */
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
+     else {
+ #if defined(SSL_CTX_set_ecdh_auto)
+         SSL_CTX_set_ecdh_auto(mctx->ssl_ctx, 1);
+@@ -2011,7 +2011,7 @@ apr_status_t ssl_init_ModuleKill(void *data)
+ 
+     }
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
+     free_bio_methods();
+ #endif
+     free_dh_params();
+diff --git a/modules/ssl/ssl_engine_io.c b/modules/ssl/ssl_engine_io.c
+index d1f44e9..0a3b43c 100644
+--- a/modules/ssl/ssl_engine_io.c
++++ b/modules/ssl/ssl_engine_io.c
+@@ -164,7 +164,7 @@ static int bio_filter_create(BIO *bio)
+ {
+     BIO_set_shutdown(bio, 1);
+     BIO_set_init(bio, 1);
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     /* No setter method for OpenSSL 1.1.0 available,
+      * but I can't find any functional use of the
+      * "num" field there either.
+@@ -549,7 +549,7 @@ static long bio_filter_in_ctrl(BIO *bio, int cmd, long num, void *ptr)
+     return -1;
+ }
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+         
+ static BIO_METHOD bio_filter_out_method = {
+     BIO_TYPE_MEM,
+@@ -2024,7 +2024,7 @@ static void ssl_io_input_add_filter(ssl_filter_ctx_t *filter_ctx, conn_rec *c,
+ 
+     filter_ctx->pInputFilter = ap_add_input_filter(ssl_io_filter, inctx, r, c);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     filter_ctx->pbioRead = BIO_new(&bio_filter_in_method);
+ #else
+     filter_ctx->pbioRead = BIO_new(bio_filter_in_method);
+@@ -2059,7 +2059,7 @@ void ssl_io_filter_init(conn_rec *c, request_rec *r, SSL *ssl)
+     filter_ctx->pOutputFilter   = ap_add_output_filter(ssl_io_filter,
+                                                        filter_ctx, r, c);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+     filter_ctx->pbioWrite       = BIO_new(&bio_filter_out_method);
+ #else
+     filter_ctx->pbioWrite       = BIO_new(bio_filter_out_method);
+diff --git a/modules/ssl/ssl_engine_kernel.c b/modules/ssl/ssl_engine_kernel.c
+index e8484ed..b29c35a 100644
+--- a/modules/ssl/ssl_engine_kernel.c
++++ b/modules/ssl/ssl_engine_kernel.c
+@@ -1733,7 +1733,7 @@ static void modssl_proxy_info_log(conn_rec *c,
+  * so we need to increment here to prevent them from
+  * being freed.
+  */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #define modssl_set_cert_info(info, cert, pkey) \
+     *cert = info->x509; \
+     CRYPTO_add(&(*cert)->references, +1, CRYPTO_LOCK_X509); \
+diff --git a/modules/ssl/ssl_engine_vars.c b/modules/ssl/ssl_engine_vars.c
+index 04b0879..b9064b3 100644
+--- a/modules/ssl/ssl_engine_vars.c
++++ b/modules/ssl/ssl_engine_vars.c
+@@ -529,7 +529,7 @@ static char *ssl_var_lookup_ssl_cert(apr_pool_t *p, request_rec *r, X509 *xs,
+         resdup = FALSE;
+     }
+     else if (strcEQ(var, "A_SIG")) {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+         nid = OBJ_obj2nid((ASN1_OBJECT *)(xs->cert_info->signature->algorithm));
+ #else
+         const ASN1_OBJECT *paobj;
+diff --git a/modules/ssl/ssl_private.h b/modules/ssl/ssl_private.h
+index 3e9602c..4a4db52 100644
+--- a/modules/ssl/ssl_private.h
++++ b/modules/ssl/ssl_private.h
+@@ -123,6 +123,16 @@
+ #define MODSSL_SSL_METHOD_CONST
+ #endif
+ 
++#if defined(LIBRESSL_VERSION_NUMBER)
++/* Missing from LibreSSL */
++#define SSL_CTRL_SET_MIN_PROTO_VERSION          123
++#define SSL_CTRL_SET_MAX_PROTO_VERSION          124
++#define SSL_CTX_set_min_proto_version(ctx, version) \
++        SSL_CTX_ctrl(ctx, SSL_CTRL_SET_MIN_PROTO_VERSION, version, NULL)
++#define SSL_CTX_set_max_proto_version(ctx, version) \
++        SSL_CTX_ctrl(ctx, SSL_CTRL_SET_MAX_PROTO_VERSION, version, NULL)
++#endif
++
+ #if defined(OPENSSL_FIPS)
+ #define HAVE_FIPS
+ #endif
+@@ -136,7 +146,7 @@
+ #endif
+ 
+ /* session id constness */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #define IDCONST
+ #else
+ #define IDCONST const
+@@ -199,7 +209,7 @@
+ 
+ #endif /* !defined(OPENSSL_NO_TLSEXT) && defined(SSL_set_tlsext_host_name) */
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #define BN_get_rfc2409_prime_768   get_rfc2409_prime_768
+ #define BN_get_rfc2409_prime_1024  get_rfc2409_prime_1024
+ #define BN_get_rfc3526_prime_1536  get_rfc3526_prime_1536
+@@ -219,7 +229,7 @@ void init_bio_methods(void);
+ void free_bio_methods(void);
+ #endif
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10002000L
++#if OPENSSL_VERSION_NUMBER < 0x10002000L || defined(LIBRESSL_VERSION_NUMBER)
+ #define X509_STORE_CTX_get0_store(x) (x->ctx)
+ #endif
+ 
+@@ -934,7 +944,7 @@ char        *ssl_util_readfilter(server_rec *, apr_pool_t *, const char *,
+                                  const char * const *);
+ BOOL         ssl_util_path_check(ssl_pathcheck_t, const char *, apr_pool_t *);
+ #if APR_HAS_THREADS
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ void         ssl_util_thread_setup(apr_pool_t *);
+ #endif
+ void         ssl_util_thread_id_setup(apr_pool_t *);
+diff --git a/modules/ssl/ssl_util.c b/modules/ssl/ssl_util.c
+index 9e4e719..efc9b90 100644
+--- a/modules/ssl/ssl_util.c
++++ b/modules/ssl/ssl_util.c
+@@ -247,7 +247,7 @@ void ssl_asn1_table_unset(apr_hash_t *table,
+ }
+ 
+ #if APR_HAS_THREADS
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /*
+  * To ensure thread-safetyness in OpenSSL - work in progress
+  */
+diff --git a/modules/ssl/ssl_util_ssl.h b/modules/ssl/ssl_util_ssl.h
+index 4f18f91..6514aaf 100644
+--- a/modules/ssl/ssl_util_ssl.h
++++ b/modules/ssl/ssl_util_ssl.h
+@@ -41,7 +41,7 @@
+ #define MODSSL_LIBRARY_VERSION OPENSSL_VERSION_NUMBER
+ #define MODSSL_LIBRARY_NAME    "OpenSSL"
+ #define MODSSL_LIBRARY_TEXT    OPENSSL_VERSION_TEXT
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #define MODSSL_LIBRARY_DYNTEXT SSLeay_version(SSLEAY_VERSION)
+ #else
+ #define MODSSL_LIBRARY_DYNTEXT OpenSSL_version(OPENSSL_VERSION)
+diff --git a/support/ab.c b/support/ab.c
+index 8429878..deeb686 100644
+--- a/support/ab.c
++++ b/support/ab.c
+@@ -197,6 +197,14 @@ typedef STACK_OF(X509) X509_STACK_TYPE;
+ #if !defined(OPENSSL_NO_TLSEXT) && defined(SSL_set_tlsext_host_name)
+ #define HAVE_TLSEXT
+ #endif
++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2060000f
++# define SSL_CTRL_SET_MIN_PROTO_VERSION    123
++# define SSL_CTRL_SET_MAX_PROTO_VERSION 124
++#define SSL_CTX_set_min_proto_version(ctx, version) \
++   SSL_CTX_ctrl(ctx, SSL_CTRL_SET_MIN_PROTO_VERSION, version, NULL)
++#define SSL_CTX_set_max_proto_version(ctx, version) \
++   SSL_CTX_ctrl(ctx, SSL_CTRL_SET_MAX_PROTO_VERSION, version, NULL)
++#endif
+ #endif
+ 
+ #include <math.h>
+-- 
+2.13.3
+
diff --git a/package/ffmpeg/0002-fix-libressl-support.patch b/package/ffmpeg/0002-fix-libressl-support.patch
new file mode 100644
index 000000000..5dc2595ac
--- /dev/null
+++ b/package/ffmpeg/0002-fix-libressl-support.patch
@@ -0,0 +1,74 @@
+From b02b11af7f0697a43f6c92011eaca7f914bd3bf1 Mon Sep 17 00:00:00 2001
+From: Aric Belsito <lluixhi@gmail.com>
+Date: Fri, 4 Aug 2017 13:06:15 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://github.com/gentoo/libressl/blob/master/media-video/ffmpeg/files/ffmpeg-3.3-libressl.patch
+
+Original author: Aric Belsito <lluixhi@gmail.com>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ libavformat/tls_openssl.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libavformat/tls_openssl.c b/libavformat/tls_openssl.c
+index 38af8a2..0599544 100644
+--- a/libavformat/tls_openssl.c
++++ b/libavformat/tls_openssl.c
+@@ -43,7 +43,7 @@ typedef struct TLSContext {
+     TLSShared tls_shared;
+     SSL_CTX *ctx;
+     SSL *ssl;
+-#if OPENSSL_VERSION_NUMBER >= 0x1010000fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010000fL && !defined(LIBRESSL_VERSION_NUMBER)
+     BIO_METHOD* url_bio_method;
+ #endif
+ } TLSContext;
+@@ -68,7 +68,7 @@ static unsigned long openssl_thread_id(void)
+ 
+ static int url_bio_create(BIO *b)
+ {
+-#if OPENSSL_VERSION_NUMBER >= 0x1010000fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010000fL && !defined(LIBRESSL_VERSION_NUMBER)
+     BIO_set_init(b, 1);
+     BIO_set_data(b, NULL);
+     BIO_set_flags(b, 0);
+@@ -85,7 +85,7 @@ static int url_bio_destroy(BIO *b)
+     return 1;
+ }
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x1010000fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010000fL && !defined(LIBRESSL_VERSION_NUMBER)
+ #define GET_BIO_DATA(x) BIO_get_data(x)
+ #else
+ #define GET_BIO_DATA(x) (x)->ptr
+@@ -129,7 +129,7 @@ static int url_bio_bputs(BIO *b, const char *str)
+     return url_bio_bwrite(b, str, strlen(str));
+ }
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x1010000fL
++#if OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
+ static BIO_METHOD url_bio_method = {
+     .type = BIO_TYPE_SOURCE_SINK,
+     .name = "urlprotocol bio",
+@@ -208,7 +208,7 @@ static int tls_close(URLContext *h)
+         SSL_CTX_free(c->ctx);
+     if (c->tls_shared.tcp)
+         ffurl_close(c->tls_shared.tcp);
+-#if OPENSSL_VERSION_NUMBER >= 0x1010000fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010000fL && !defined(LIBRESSL_VERSION_NUMBER)
+     if (c->url_bio_method)
+         BIO_meth_free(c->url_bio_method);
+ #endif
+@@ -266,7 +266,7 @@ static int tls_open(URLContext *h, const char *uri, int flags, AVDictionary **op
+         ret = AVERROR(EIO);
+         goto fail;
+     }
+-#if OPENSSL_VERSION_NUMBER >= 0x1010000fL
++#if OPENSSL_VERSION_NUMBER >= 0x1010000fL && !defined(LIBRESSL_VERSION_NUMBER)
+     p->url_bio_method = BIO_meth_new(BIO_TYPE_SOURCE_SINK, "urlprotocol bio");
+     BIO_meth_set_write(p->url_bio_method, url_bio_bwrite);
+     BIO_meth_set_read(p->url_bio_method, url_bio_bread);
+-- 
+2.13.3
+
diff --git a/package/heirloom-mailx/0002-fix-libressl-support.patch b/package/heirloom-mailx/0002-fix-libressl-support.patch
new file mode 100644
index 000000000..0fafa4ae0
--- /dev/null
+++ b/package/heirloom-mailx/0002-fix-libressl-support.patch
@@ -0,0 +1,54 @@
+From aad28d30af6c3a74c522dd61943788e908860c84 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Fri, 4 Aug 2017 07:22:47 -0400
+Subject: [PATCH] fix libressl support
+
+heirloom-mailx has two small issues when compiling against LibreSSL:
+  - RAND_egd is used (LibreSSL does not support RAND_egd)
+    Solution: "Guard" the code calling RAND_egd
+
+  - SSLv3_client_method function is used (LibreSSL does not support SSLv3)
+    Solution: "Guard" the code with #ifndef OPENSSL_NO_SSL3
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ openssl.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/openssl.c b/openssl.c
+index 44fe4e5..c4a1bb7 100644
+--- a/openssl.c
++++ b/openssl.c
+@@ -137,11 +137,13 @@ ssl_rand_init(void)
+ 
+ 	if ((cp = value("ssl-rand-egd")) != NULL) {
+ 		cp = expand(cp);
++#ifndef OPENSSL_NO_EGD
+ 		if (RAND_egd(cp) == -1) {
+ 			fprintf(stderr, catgets(catd, CATSET, 245,
+ 				"entropy daemon at \"%s\" not available\n"),
+ 					cp);
+ 		} else
++#endif
+ 			state = 1;
+ 	} else if ((cp = value("ssl-rand-file")) != NULL) {
+ 		cp = expand(cp);
+@@ -216,10 +218,15 @@ ssl_select_method(const char *uhp)
+ 
+ 	cp = ssl_method_string(uhp);
+ 	if (cp != NULL) {
++		#ifndef OPENSSL_NO_SSL3
+ 		if (equal(cp, "ssl3"))
+ 			method = SSLv3_client_method();
+ 		else if (equal(cp, "tls1"))
+ 			method = TLSv1_client_method();
++		#else
++		if (equal(cp, "tls1"))
++			method = TLSv1_client_method();
++		#endif
+ 		else {
+ 			fprintf(stderr, catgets(catd, CATSET, 244,
+ 					"Invalid SSL method \"%s\"\n"), cp);
+-- 
+2.13.3
+
diff --git a/package/hostapd/0001-fix-libressl-support.patch b/package/hostapd/0001-fix-libressl-support.patch
new file mode 100644
index 000000000..5e8d7afef
--- /dev/null
+++ b/package/hostapd/0001-fix-libressl-support.patch
@@ -0,0 +1,38 @@
+From 85c1ae0865c7221af98a60cc678c03c78d443389 Mon Sep 17 00:00:00 2001
+From: Aric Belsito <lluixhi@gmail.com>
+Date: Fri, 4 Aug 2017 13:02:17 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://github.com/gentoo/libressl/blob/master/net-wireless/hostapd/files/hostapd-2.6-libressl.patch
+
+Original Author: Aric Belsito <lluixhi@gmail.com>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/crypto/crypto_openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypto/crypto_openssl.c b/src/crypto/crypto_openssl.c
+index 19e0e2b..b3d1b07 100644
+--- a/src/crypto/crypto_openssl.c
++++ b/src/crypto/crypto_openssl.c
+@@ -611,7 +611,7 @@ void crypto_cipher_deinit(struct crypto_cipher *ctx)
+ 
+ void * dh5_init(struct wpabuf **priv, struct wpabuf **publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 	struct wpabuf *pubkey = NULL, *privkey = NULL;
+ 	size_t publen, privlen;
+@@ -712,7 +712,7 @@ err:
+ 
+ void * dh5_init_fixed(const struct wpabuf *priv, const struct wpabuf *publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 
+ 	dh = DH_new();
+-- 
+2.13.3
+
diff --git a/package/lftp/0003-libressl-support.patch b/package/lftp/0003-libressl-support.patch
new file mode 100644
index 000000000..f4083709a
--- /dev/null
+++ b/package/lftp/0003-libressl-support.patch
@@ -0,0 +1,35 @@
+From 773a7a03e54731eaa2c6f933891f30b310c1acb5 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Thu, 3 Aug 2017 16:30:59 -0400
+Subject: [PATCH] libressl-support
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/lftp_ssl.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index 7da28a0..c91308e 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -772,7 +772,7 @@ error:
+ #elif USE_OPENSSL
+ //static int lftp_ssl_passwd_callback(char *buf,int size,int rwflag,void *userdata);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ // for compatibility with older versions
+ X509_OBJECT *X509_OBJECT_new()
+ {
+@@ -795,7 +795,7 @@ X509_CRL *X509_OBJECT_get0_X509_CRL(X509_OBJECT *a)
+ # define X509_CRL_get0_nextUpdate(x) X509_CRL_get_nextUpdate(x)
+ # define ASN1_STRING_get0_data(x) ASN1_STRING_data(x)
+ # define X509_REVOKED_get0_serialNumber(x) (x->serialNumber)
+-#endif // OPENSSL_VERSION_NUMBER < 0x10100000L
++#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ Ref<lftp_ssl_openssl_instance> lftp_ssl_openssl::instance;
+ 
+-- 
+2.13.3
+
diff --git a/package/libevent/0002-fix-libressl-support.patch b/package/libevent/0002-fix-libressl-support.patch
new file mode 100644
index 000000000..88697c422
--- /dev/null
+++ b/package/libevent/0002-fix-libressl-support.patch
@@ -0,0 +1,26 @@
+From 10ca825cf8f52b14b6230db7de5e5df307212499 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 2 Aug 2017 11:38:11 -0400
+Subject: [PATCH 1/1] add libressl support
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ openssl-compat.h                     | 2 +-
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/openssl-compat.h b/openssl-compat.h
+index 69afc71..937fa4d 100644
+--- a/openssl-compat.h
++++ b/openssl-compat.h
+@@ -1,7 +1,7 @@
+ #ifndef OPENSSL_COMPAT_H
+ #define OPENSSL_COMPAT_H
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined (LIBRESSL_VERSION_NUMBER)
+ 
+ static inline BIO_METHOD *BIO_meth_new(int type, const char *name)
+ {
+-- 
+2.13.3
+
diff --git a/package/mosquitto/0001-fix-libressl-support.patch b/package/mosquitto/0001-fix-libressl-support.patch
new file mode 100644
index 000000000..f695e77c6
--- /dev/null
+++ b/package/mosquitto/0001-fix-libressl-support.patch
@@ -0,0 +1,63 @@
+From c2c5e05dc606a2f6299245004e222671cc41c625 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Thu, 3 Aug 2017 14:21:14 -0400
+Subject: [PATCH] fix libressl support
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ lib/net_mosq.c         | 2 +-
+ src/mosquitto_passwd.c | 4 ++--
+ src/security_default.c | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/net_mosq.c b/lib/net_mosq.c
+index 063c4a2..cdbc83f 100644
+--- a/lib/net_mosq.c
++++ b/lib/net_mosq.c
+@@ -114,7 +114,7 @@ void _mosquitto_net_init(void)
+ void _mosquitto_net_cleanup(void)
+ {
+ #ifdef WITH_TLS
+-	#if OPENSSL_VERSION_NUMBER < 0x10100000L
++	#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 		ERR_remove_state(0);
+ 	#endif
+ 	ENGINE_cleanup();
+diff --git a/src/mosquitto_passwd.c b/src/mosquitto_passwd.c
+index c3dd05a..6305ee0 100644
+--- a/src/mosquitto_passwd.c
++++ b/src/mosquitto_passwd.c
+@@ -90,7 +90,7 @@ int output_new_password(FILE *fptr, const char *username, const char *password)
+ 	unsigned char hash[EVP_MAX_MD_SIZE];
+ 	unsigned int hash_len;
+ 	const EVP_MD *digest;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	EVP_MD_CTX context;
+ #else
+ 	EVP_MD_CTX *context;
+@@ -117,7 +117,7 @@ int output_new_password(FILE *fptr, const char *username, const char *password)
+ 		return 1;
+ 	}
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	EVP_MD_CTX_init(&context);
+ 	EVP_DigestInit_ex(&context, digest, NULL);
+ 	EVP_DigestUpdate(&context, password, strlen(password));
+diff --git a/src/security_default.c b/src/security_default.c
+index 43cd3f0..e307b7a 100644
+--- a/src/security_default.c
++++ b/src/security_default.c
+@@ -790,7 +790,7 @@ int mosquitto_psk_key_get_default(struct mosquitto_db *db, const char *hint, con
+ int _pw_digest(const char *password, const unsigned char *salt, unsigned int salt_len, unsigned char *hash, unsigned int *hash_len)
+ {
+ 	const EVP_MD *digest;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	EVP_MD_CTX context;
+ 
+ 	digest = EVP_get_digestbyname("sha512");
+-- 
+2.13.3
+
diff --git a/package/ntp/0004-libressl-support.patch b/package/ntp/0004-libressl-support.patch
new file mode 100644
index 000000000..6a29c0696
--- /dev/null
+++ b/package/ntp/0004-libressl-support.patch
@@ -0,0 +1,106 @@
+From a3bd714d3028241c7546ded6ae6b93887a17a7fa Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 12 Jul 2017 09:14:38 -0400
+Subject: [PATCH] add libressl support
+
+Fix some preprocessor macros to add libressl support.
+Upstream-Status: Pending
+http://bugs.ntp.org/show_bug.cgi?id=3401#c3
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ include/libssl_compat.h                | 4 +++-
+ libntp/libssl_compat.c                 | 2 +-
+ libntp/ssl_init.c                      | 2 +-
+ ports/winnt/include/msvc_ssl_autolib.h | 2 +-
+ sntp/libevent/test/regress_ssl.c       | 4 ++--
+ 5 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/include/libssl_compat.h b/include/libssl_compat.h
+index 2a3697c..eede47b 100644
+--- a/include/libssl_compat.h
++++ b/include/libssl_compat.h
+@@ -25,8 +25,10 @@
+ #include "openssl/rsa.h"
+ 
+ #ifndef OPENSSL_VERSION_NUMBER
++#ifndef LIBRESSL_VERSION_NUMBER
+ #define OPENSSL_VERSION_NUMBER SSLEAY_VERSION_NUMBER
+ #endif
++#endif
+ 
+ #ifndef OPENSSL_VERSION_TEXT
+ #define OPENSSL_VERSION_TEXT SSLEAY_VERSION_TEXT
+@@ -37,7 +39,7 @@
+ #endif
+ 
+ /* ----------------------------------------------------------------- */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /* ----------------------------------------------------------------- */
+ 
+ # include <openssl/objects.h>
+diff --git a/libntp/libssl_compat.c b/libntp/libssl_compat.c
+index afe4d07..dae7017 100644
+--- a/libntp/libssl_compat.c
++++ b/libntp/libssl_compat.c
+@@ -26,7 +26,7 @@
+ /* ----------------------------------------------------------------- */
+ 
+ /* ----------------------------------------------------------------- */
+-#if defined(OPENSSL) && OPENSSL_VERSION_NUMBER < 0x10100000L
++#if defined(OPENSSL) && OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /* ----------------------------------------------------------------- */
+ 
+ #include "libssl_compat.h"
+diff --git a/libntp/ssl_init.c b/libntp/ssl_init.c
+index bebf6e1..0a27050 100644
+--- a/libntp/ssl_init.c
++++ b/libntp/ssl_init.c
+@@ -21,7 +21,7 @@
+ 
+ int ssl_init_done;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ static void
+ atexit_ssl_cleanup(void)
+diff --git a/ports/winnt/include/msvc_ssl_autolib.h b/ports/winnt/include/msvc_ssl_autolib.h
+index 688b5e2..393e1c9 100644
+--- a/ports/winnt/include/msvc_ssl_autolib.h
++++ b/ports/winnt/include/msvc_ssl_autolib.h
+@@ -85,7 +85,7 @@
+  * request in the object file, depending on the SSL version and the
+  * build variant.
+  */
+-# if OPENSSL_VERSION_NUMBER >= 0x10100000L
++# if OPENSSL_VERSION_NUMBER >= 0x10100000L && ! defined(LIBRESSL_VERSION_NUMBER)
+ #  pragma comment(lib, "libcrypto" LTAG_SIZE LTAG_RTLIB LTAG_DEBUG ".lib")
+ # else
+ #  pragma comment(lib, "libeay32" LTAG_RTLIB LTAG_DEBUG ".lib")
+diff --git a/sntp/libevent/test/regress_ssl.c b/sntp/libevent/test/regress_ssl.c
+index 226a2a3..dc761dc 100644
+--- a/sntp/libevent/test/regress_ssl.c
++++ b/sntp/libevent/test/regress_ssl.c
+@@ -61,7 +61,7 @@
+ 
+ #include <string.h>
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) || defined(LIBRESSL_VERSION_NUMBER)
+ #define OpenSSL_version_num SSLeay
+ #endif /* OPENSSL_VERSION_NUMBER */
+ 
+@@ -130,7 +130,7 @@ getcert(void)
+ 	X509_set_subject_name(x509, name);
+ 	X509_set_issuer_name(x509, name);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	X509_time_adj(X509_get_notBefore(x509), 0, &now);
+ 	now += 3600;
+ 	X509_time_adj(X509_get_notAfter(x509), 0, &now);
+-- 
+2.13.0
+
diff --git a/package/openldap/0004-fix-libressl-support.patch b/package/openldap/0004-fix-libressl-support.patch
new file mode 100644
index 000000000..43373dedc
--- /dev/null
+++ b/package/openldap/0004-fix-libressl-support.patch
@@ -0,0 +1,99 @@
+From 8093c506228e28c5cc8db9fd90b687004712168b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Thu, 3 Aug 2017 17:09:39 -0400
+Subject: [PATCH] fix libressl support
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ libraries/libldap/tls_o.c | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/libraries/libldap/tls_o.c b/libraries/libldap/tls_o.c
+index 2025c9f..41faf0d 100644
+--- a/libraries/libldap/tls_o.c
++++ b/libraries/libldap/tls_o.c
+@@ -47,7 +47,7 @@
+ #include <ssl.h>
+ #endif
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000
++#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
+ #define ASN1_STRING_data(x)	ASN1_STRING_get0_data(x)
+ #endif
+ 
+@@ -157,7 +157,7 @@ tlso_init( void )
+ 	(void) tlso_seed_PRNG( lo->ldo_tls_randfile );
+ #endif
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(LIBRESSL_VERSION_NUMBER)
+ 	SSL_load_error_strings();
+ 	SSL_library_init();
+ 	OpenSSL_add_all_digests();
+@@ -205,7 +205,7 @@ static void
+ tlso_ctx_ref( tls_ctx *ctx )
+ {
+ 	tlso_ctx *c = (tlso_ctx *)ctx;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(LIBRESSL_VERSION_NUMBER)
+ #define	SSL_CTX_up_ref(ctx)	CRYPTO_add( &(ctx->references), 1, CRYPTO_LOCK_SSL_CTX )
+ #endif
+ 	SSL_CTX_up_ref( c );
+@@ -464,7 +464,7 @@ tlso_session_my_dn( tls_session *sess, struct berval *der_dn )
+ 	if (!x) return LDAP_INVALID_CREDENTIALS;
+ 	
+ 	xn = X509_get_subject_name(x);
+-#if OPENSSL_VERSION_NUMBER < 0x10100000
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(LIBRESSL_VERSION_NUMBER)
+ 	der_dn->bv_len = i2d_X509_NAME( xn, NULL );
+ 	der_dn->bv_val = xn->bytes->data;
+ #else
+@@ -500,7 +500,7 @@ tlso_session_peer_dn( tls_session *sess, struct berval *der_dn )
+ 		return LDAP_INVALID_CREDENTIALS;
+ 
+ 	xn = X509_get_subject_name(x);
+-#if OPENSSL_VERSION_NUMBER < 0x10100000
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(LIBRESSL_VERSION_NUMBER)
+ 	der_dn->bv_len = i2d_X509_NAME( xn, NULL );
+ 	der_dn->bv_val = xn->bytes->data;
+ #else
+@@ -721,7 +721,7 @@ struct tls_data {
+ 	Sockbuf_IO_Desc		*sbiod;
+ };
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000
++#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(LIBRESSL_VERSION_NUMBER)
+ #define BIO_set_init(b, x)	b->init = x
+ #define BIO_set_data(b, x)	b->ptr = x
+ #define BIO_clear_flags(b, x)	b->flags &= ~(x)
+@@ -822,7 +822,7 @@ tlso_bio_puts( BIO *b, const char *str )
+ 	return tlso_bio_write( b, str, strlen( str ) );
+ }
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000
++#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
+ struct bio_method_st {
+     int type;
+     const char *name;
+@@ -1187,10 +1187,17 @@ tlso_seed_PRNG( const char *randfile )
+ 		 */
+ 		randfile = RAND_file_name( buffer, sizeof( buffer ) );
+ 
+-	} else if (RAND_egd(randfile) > 0) {
++	} 
++	#ifndef OPENSSL_NO_EGD
++	else if (RAND_egd(randfile) > 0) {
+ 		/* EGD socket */
+ 		return 0;
+ 	}
++	#else
++	else {
++		return 0;
++	}
++	#endif
+ 
+ 	if (randfile == NULL) {
+ 		Debug( LDAP_DEBUG_ANY,
+-- 
+2.13.3
+
diff --git a/package/opusfile/0001-fix-libressl-support.patch b/package/opusfile/0001-fix-libressl-support.patch
new file mode 100644
index 000000000..3c5430d05
--- /dev/null
+++ b/package/opusfile/0001-fix-libressl-support.patch
@@ -0,0 +1,82 @@
+From 65ed3d84a524df23da37d5674c432aa002c9232c Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Fri, 4 Aug 2017 12:56:27 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://git.alpinelinux.org/cgit/aports/tree/main/opusfile/libressl.patch?id=aea15c68f821ba167744f47ed2bd00daf0465d24
+
+Original author: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/http.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 99fa8c0..285955c 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -1517,14 +1517,14 @@ static long op_bio_retry_ctrl(BIO *_b,int _cmd,long _num,void *_ptr){
+   return ret;
+ }
+ 
+-# if OPENSSL_VERSION_NUMBER<0x10100000L
++# if OPENSSL_VERSION_NUMBER<0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #  define BIO_set_data(_b,_ptr) ((_b)->ptr=(_ptr))
+ #  define BIO_set_init(_b,_init) ((_b)->init=(_init))
+ # endif
+ 
+ static int op_bio_retry_new(BIO *_b){
+   BIO_set_init(_b,1);
+-# if OPENSSL_VERSION_NUMBER<0x10100000L
++# if OPENSSL_VERSION_NUMBER<0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+   _b->num=0;
+ # endif
+   BIO_set_data(_b,NULL);
+@@ -1535,7 +1535,7 @@ static int op_bio_retry_free(BIO *_b){
+   return _b!=NULL;
+ }
+ 
+-# if OPENSSL_VERSION_NUMBER<0x10100000L
++# if OPENSSL_VERSION_NUMBER<0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ /*This is not const because OpenSSL doesn't allow it, even though it won't
+    write to it.*/
+ static BIO_METHOD op_bio_retry_method={
+@@ -1556,7 +1556,7 @@ static BIO_METHOD op_bio_retry_method={
+    proxying https URL requests.*/
+ static int op_http_conn_establish_tunnel(OpusHTTPStream *_stream,
+  OpusHTTPConn *_conn,op_sock _fd,SSL *_ssl_conn,BIO *_ssl_bio){
+-# if OPENSSL_VERSION_NUMBER>=0x10100000L
++# if OPENSSL_VERSION_NUMBER>=0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
+   BIO_METHOD *bio_retry_method;
+ # endif
+   BIO  *retry_bio;
+@@ -1569,7 +1569,7 @@ static int op_http_conn_establish_tunnel(OpusHTTPStream *_stream,
+   ret=op_http_conn_write_fully(_conn,
+    _stream->proxy_connect.buf,_stream->proxy_connect.nbuf);
+   if(OP_UNLIKELY(ret<0))return ret;
+-# if OPENSSL_VERSION_NUMBER>=0x10100000L
++# if OPENSSL_VERSION_NUMBER>=0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
+   bio_retry_method=BIO_meth_new(BIO_TYPE_NULL,"retry");
+   if(bio_retry_method==NULL)return OP_EFAULT;
+   BIO_meth_set_write(bio_retry_method,op_bio_retry_write);
+@@ -1592,7 +1592,7 @@ static int op_http_conn_establish_tunnel(OpusHTTPStream *_stream,
+   /*This shouldn't succeed, since we can't read yet.*/
+   OP_ALWAYS_TRUE(SSL_connect(_ssl_conn)<0);
+   SSL_set_bio(_ssl_conn,_ssl_bio,_ssl_bio);
+-# if OPENSSL_VERSION_NUMBER>=0x10100000L
++# if OPENSSL_VERSION_NUMBER>=0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
+   BIO_meth_free(bio_retry_method);
+ # endif
+   /*Only now do we disable write coalescing, to allow the CONNECT
+@@ -2231,7 +2231,7 @@ static int op_http_stream_open(OpusHTTPStream *_stream,const char *_url,
+     /*Initialize the SSL library if necessary.*/
+     if(OP_URL_IS_SSL(&_stream->url)&&_stream->ssl_ctx==NULL){
+       SSL_CTX *ssl_ctx;
+-# if OPENSSL_VERSION_NUMBER<0x10100000L
++# if OPENSSL_VERSION_NUMBER<0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #  if !defined(OPENSSL_NO_LOCKING)
+       /*The documentation says SSL_library_init() is not reentrant.
+         We don't want to add our own depenencies on a threading library, and it
+-- 
+2.13.3
+
diff --git a/package/softether/0010-fix-libressl-support.patch b/package/softether/0010-fix-libressl-support.patch
new file mode 100644
index 000000000..e08858def
--- /dev/null
+++ b/package/softether/0010-fix-libressl-support.patch
@@ -0,0 +1,33 @@
+From f007aee66ed4e975b87bf35a00cea18ef5929d94 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Fri, 4 Aug 2017 07:36:08 -0400
+Subject: [PATCH] fix libressl support
+
+softether uses SSLv3_client_method which LibreSSL does not support.
+Guard the code with #ifndef OPENSSL_NO_SSL3 and return false if tls
+can't be used.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/Mayaqua/Network.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/Mayaqua/Network.c b/src/Mayaqua/Network.c
+index 41d69cc..bb9848f 100644
+--- a/src/Mayaqua/Network.c
++++ b/src/Mayaqua/Network.c
+@@ -13015,7 +13015,11 @@ bool StartSSLEx(SOCK *sock, X *x, K *priv, bool client_tls, UINT ssl_timeout, ch
+ 		{
+ 			if (client_tls == false)
+ 			{
++				#ifndef OPENSSL_NO_SSL3
+ 				SSL_CTX_set_ssl_version(ssl_ctx, SSLv3_method());
++				#else
++				return false;
++				#endif
+ 			}
+ 			else
+ 			{
+-- 
+2.13.3
+
diff --git a/package/wpa_supplicant/0001-fix-libressl-support.patch b/package/wpa_supplicant/0001-fix-libressl-support.patch
new file mode 100644
index 000000000..d6706ad48
--- /dev/null
+++ b/package/wpa_supplicant/0001-fix-libressl-support.patch
@@ -0,0 +1,70 @@
+From fd08ab1edce039ebefd305f7d8241cef6e4a397c Mon Sep 17 00:00:00 2001
+From: Stephan Raue <stephan@openelec.tv>
+Date: Fri, 4 Aug 2017 12:51:58 -0400
+Subject: [PATCH] fix libressl support
+
+From: https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/network/wpa_supplicant/patches/wpa_supplicant-libressl.patch
+
+Original author: Stephan Raue <stephan@openelec.tv>
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ src/crypto/crypto_openssl.c | 4 ++--
+ src/crypto/tls_openssl.c    | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/crypto/crypto_openssl.c b/src/crypto/crypto_openssl.c
+index 19e0e2b..b3d1b07 100644
+--- a/src/crypto/crypto_openssl.c
++++ b/src/crypto/crypto_openssl.c
+@@ -611,7 +611,7 @@ void crypto_cipher_deinit(struct crypto_cipher *ctx)
+ 
+ void * dh5_init(struct wpabuf **priv, struct wpabuf **publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 	struct wpabuf *pubkey = NULL, *privkey = NULL;
+ 	size_t publen, privlen;
+@@ -712,7 +712,7 @@ err:
+ 
+ void * dh5_init_fixed(const struct wpabuf *priv, const struct wpabuf *publ)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	DH *dh;
+ 
+ 	dh = DH_new();
+diff --git a/src/crypto/tls_openssl.c b/src/crypto/tls_openssl.c
+index 23ac64b..8ddcb7e 100644
+--- a/src/crypto/tls_openssl.c
++++ b/src/crypto/tls_openssl.c
+@@ -919,7 +919,7 @@ void * tls_init(const struct tls_config *conf)
+ 		}
+ #endif /* OPENSSL_FIPS */
+ #endif /* CONFIG_FIPS */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 		SSL_load_error_strings();
+ 		SSL_library_init();
+ #ifndef OPENSSL_NO_SHA256
+@@ -1043,7 +1043,7 @@ void tls_deinit(void *ssl_ctx)
+ 
+ 	tls_openssl_ref_count--;
+ 	if (tls_openssl_ref_count == 0) {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #ifndef OPENSSL_NO_ENGINE
+ 		ENGINE_cleanup();
+ #endif /* OPENSSL_NO_ENGINE */
+@@ -3976,7 +3976,7 @@ int tls_connection_set_params(void *tls_ctx, struct tls_connection *conn,
+ 		engine_id = "pkcs11";
+ 
+ #if defined(EAP_FAST) || defined(EAP_FAST_DYNAMIC) || defined(EAP_SERVER_FAST)
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 	if (params->flags & TLS_CONN_EAP_FAST) {
+ 		wpa_printf(MSG_DEBUG,
+ 			   "OpenSSL: Use TLSv1_method() for EAP-FAST");
+-- 
+2.13.3
+
-- 
2.13.3
