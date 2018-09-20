From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:38:33 +0200
Subject: [Buildroot] [RFC v1] qt5base: fix libressl compile
In-Reply-To: <20180911200505.20234-1-ps.report@gmx.net>
References: <20180911200505.20234-1-ps.report@gmx.net>
Message-ID: <20180920233833.7391f81a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 22:05:05 +0200, Peter Seiderer wrote:
> Add freebsd provided patch to fix libressl compile (patch taken
> from [1]/[2], for upstream status see [3]), fixes bug #11341 ([4]).
> 
> [1] https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=228344
> [2] https://bz-attachments.freebsd.org/attachment.cgi?id=196994
> [3] https://bugreports.qt.io/browse/QTBUG-68374
> [4] https://bugs.busybox.net/show_bug.cgi?id=11341

Upstream is not very helpful "We don't support LibreSSL". Could you
perhaps participate to the bug report to say Buildroot is also
interested in seeing LibreSSL supported by Qt ?

> diff --git a/package/qt5/qt5base/5.11.1/0005-qtbase-fix-libressl-compile.patch b/package/qt5/qt5base/5.11.1/0005-qtbase-fix-libressl-compile.patch

Why are you patching only the 5.11.1 version, and not also the LTS
version ?

> +-#if !defined(OPENSSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER-0 < 0x10100000L
> ++#if !defined(OPENSSL_VERSION_NUMBER) || OPENSSL_VERSION_NUMBER-0 < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
> + #  error "OpenSSL >= 1.1 is required"

I don't have the full code context here, but isn't this going to #error
when using LibreSSL, because defined(LIBRESSL_VERSION_NUMBER) is true ?

> +-#if OPENSSL_VERSION_NUMBER >= 0x10002000L
> ++#if OPENSSL_VERSION_NUMBER >= 0x10002000L && !defined(LIBRESSL_VERSION_NUMBER)
> +     if (QSslSocket::sslLibraryVersionNumber() >= 0x10002000L) {
> +         QSharedPointer<SSL_CONF_CTX> cctx(q_SSL_CONF_CTX_new(), &q_SSL_CONF_CTX_free);
> +         if (cctx) {
> +diff --git a/src/network/ssl/qsslsocket_openssl_symbols.cpp b/src/network/ssl/qsslsocket_openssl_symbols.cpp
> +index 466eba0bd0..c7d89436ca 100644
> +--- a/src/network/ssl/qsslsocket_openssl_symbols.cpp
> ++++ b/src/network/ssl/qsslsocket_openssl_symbols.cpp
> +@@ -406,7 +406,7 @@ DEFINEFUNC2(int, SSL_CTX_use_PrivateKey, SSL_CTX *a, a, EVP_PKEY *b, b, return -
> + DEFINEFUNC2(int, SSL_CTX_use_RSAPrivateKey, SSL_CTX *a, a, RSA *b, b, return -1, return)
> + DEFINEFUNC3(int, SSL_CTX_use_PrivateKey_file, SSL_CTX *a, a, const char *b, b, int c, c, return -1, return)
> + DEFINEFUNC(X509_STORE *, SSL_CTX_get_cert_store, const SSL_CTX *a, a, return 0, return)
> +-#if OPENSSL_VERSION_NUMBER >= 0x10002000L
> ++#if OPENSSL_VERSION_NUMBER >= 0x10002000L && !defined(LIBRESSL_VERSION_NUMBER)
> + DEFINEFUNC(SSL_CONF_CTX *, SSL_CONF_CTX_new, DUMMYARG, DUMMYARG, return 0, return);
> + DEFINEFUNC(void, SSL_CONF_CTX_free, SSL_CONF_CTX *a, a, return ,return);
> + DEFINEFUNC2(void, SSL_CONF_CTX_set_ssl_ctx, SSL_CONF_CTX *a, a, SSL_CTX *b, b, return, return);
> +@@ -1123,12 +1123,14 @@ bool q_resolveOpenSslSymbols()
> +     RESOLVEFUNC(SSL_CTX_use_PrivateKey_file)
> +     RESOLVEFUNC(SSL_CTX_get_cert_store);
> + #if OPENSSL_VERSION_NUMBER >= 0x10002000L
> ++#if !defined(LIBRESSL_VERSION_NUMBER)

Why not && !defined(LIBRESSL_VERSION_NUMBER)

like is done in the previous chunk, and the next one ?

> +diff --git a/src/network/ssl/qsslsocket_openssl_symbols_p.h b/src/network/ssl/qsslsocket_openssl_symbols_p.h
> +index 68b519d74e..7f7f816803 100644
> +--- a/src/network/ssl/qsslsocket_openssl_symbols_p.h
> ++++ b/src/network/ssl/qsslsocket_openssl_symbols_p.h
> +@@ -356,7 +356,7 @@ int q_SSL_CTX_use_PrivateKey(SSL_CTX *a, EVP_PKEY *b);
> + int q_SSL_CTX_use_RSAPrivateKey(SSL_CTX *a, RSA *b);
> + int q_SSL_CTX_use_PrivateKey_file(SSL_CTX *a, const char *b, int c);
> + X509_STORE *q_SSL_CTX_get_cert_store(const SSL_CTX *a);
> +-#if OPENSSL_VERSION_NUMBER >= 0x10002000L
> ++#if OPENSSL_VERSION_NUMBER >= 0x10002000L && !defined(LIBRESSL_VERSION_NUMBER)
> + SSL_CONF_CTX *q_SSL_CONF_CTX_new();
> + void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
> + void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
