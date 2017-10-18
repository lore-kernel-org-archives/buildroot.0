From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:34 -0400
Subject: [Buildroot] [PATCH 07/13] openldap: add libressl support patch
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-8-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a program checks for openssl 1.1 or higher, it will pass that
check because libressl sets it's version number to 2.x.

Add simple checks to see if LIBRESSL_VERSION_NUMBER is defined.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/openldap/0004-fix-libressl-support.patch | 104 +++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 package/openldap/0004-fix-libressl-support.patch

diff --git a/package/openldap/0004-fix-libressl-support.patch b/package/openldap/0004-fix-libressl-support.patch
new file mode 100644
index 0000000000..8f3bf5423c
--- /dev/null
+++ b/package/openldap/0004-fix-libressl-support.patch
@@ -0,0 +1,104 @@
+From 8093c506228e28c5cc8db9fd90b687004712168b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Thu, 3 Aug 2017 17:09:39 -0400
+Subject: [PATCH] fix libressl support
+
+When a program checks for openssl 1.1 or higher, it will pass that
+check because libressl sets it's version number to 2.x.
+
+Add simple checks to see if libressl_version_number is defined.
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
-- 
2.13.6
