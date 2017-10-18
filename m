From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:31 -0400
Subject: [Buildroot] [PATCH 04/13] ffmpeg: add libressl suport patch
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-5-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: https://github.com/gentoo/libressl/blob/master/media-video/ffmpeg/files/ffmpeg-3.3-libressl.patch
Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/ffmpeg/0002-fix-libressl-support.patch | 74 ++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 package/ffmpeg/0002-fix-libressl-support.patch

diff --git a/package/ffmpeg/0002-fix-libressl-support.patch b/package/ffmpeg/0002-fix-libressl-support.patch
new file mode 100644
index 0000000000..5dc2595acf
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
-- 
2.13.6
