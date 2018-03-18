From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Mar 2018 11:04:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.2.10
Message-ID: <20180318100426.2494-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest stable release, rebased patch 0001.

Release notes for 0.3.2.10:
https://blog.torproject.org/new-stable-tor-releases-security-fixes-and-dos-prevention-03210-03110-02915

Release notes for the first stable release of the 0.3.2 series, 0.3.2.9:
https://blog.torproject.org/tor-0329-released-we-have-new-stable-series

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/0001-openssl-libz.patch | 108 +++++++++++++++++++-----------------
 package/tor/tor.hash                |   2 +-
 package/tor/tor.mk                  |   2 +-
 3 files changed, 58 insertions(+), 54 deletions(-)

diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
index 9d3cf6e124..62a9a4a0ec 100644
--- a/package/tor/0001-openssl-libz.patch
+++ b/package/tor/0001-openssl-libz.patch
@@ -3,7 +3,7 @@ and remove host paths when looking for openssl.
 
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9 & 0.3.1.7]
+[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7 & 0.3.2.10]
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -11,91 +11,95 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 diff -uNr tor-0.3.1.7.org/configure.ac tor-0.3.1.7/configure.ac
 --- tor-0.3.1.7.org/configure.ac	2017-09-15 15:34:06.000000000 +0200
 +++ tor-0.3.1.7/configure.ac	2017-09-19 19:40:17.090538467 +0200
-@@ -709,11 +709,11 @@
-       fi
+@@ -735,7 +735,7 @@
    ])
  
--TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI],
-+TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI],
-     [#include <openssl/rand.h>],
-     [void RAND_add(const void *buf, int num, double entropy);],
-     [RAND_add((void*)0,0,0);], [],
--    [/usr/local/openssl /usr/lib/openssl /usr/local/ssl /usr/lib/ssl /usr/local /usr/athena /opt/openssl])
-+    [])
- 
- dnl XXXX check for OPENSSL_VERSION_NUMBER == SSLeay()
- 
+ AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
+-TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32],
++TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32],
+     [#include <openssl/ssl.h>],
+     [struct ssl_method_st; const struct ssl_method_st *TLSv1_1_method(void);],
+     [TLSv1_1_method();], [],
 diff -uNr tor-0.3.1.7.org/src/or/include.am tor-0.3.1.7/src/or/include.am
 --- tor-0.3.1.7.org/src/or/include.am	2017-06-19 17:56:51.000000000 +0200
 +++ tor-0.3.1.7/src/or/include.am	2017-09-19 19:41:02.015861546 +0200
-@@ -122,7 +122,7 @@
- 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
+@@ -135,7 +135,7 @@
  	src/common/libor-event.a src/trunnel/libor-trunnel.a \
  	src/trace/libor-trace.a \
+ 	$(rust_ldadd) \
+-	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
++	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
+ 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ @TOR_SYSTEMD_LIBS@ \
+ 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
+@@ -149,7 +149,7 @@
+ 	src/common/libor-ctime-testing.a \
+ 	src/common/libor-crypto-testing.a $(LIBKECCAK_TINY) $(LIBDONNA) \
+ 	src/common/libor-event-testing.a src/trunnel/libor-trunnel-testing.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
  	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ @TOR_SYSTEMD_LIBS@ \
- 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@ \
- 	$(rust_ldadd)
+ 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
+ endif
 diff -uNr tor-0.3.1.7.org/src/test/include.am tor-0.3.1.7/src/test/include.am
 --- tor-0.3.1.7.org/src/test/include.am	2017-08-29 17:01:19.000000000 +0200
 +++ tor-0.3.1.7/src/test/include.am	2017-09-19 19:42:39.103903406 +0200
-@@ -206,8 +206,8 @@
- 	src/common/libor-event-testing.a \
+@@ -222,8 +222,8 @@
  	src/trunnel/libor-trunnel-testing.a \
  	src/trace/libor-trace.a \
+ 	$(rust_ldadd) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
- 	@TOR_SYSTEMD_LIBS@ @TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@ \
- 	$(rust_ldadd)
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ \
+ 	@TOR_SYSTEMD_LIBS@ @TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
  
-@@ -231,8 +231,8 @@
- 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
+@@ -248,8 +248,8 @@
  	src/common/libor-event.a src/trunnel/libor-trunnel.a \
  	src/trace/libor-trace.a \
+ 	$(rust_ldadd) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
- 	@TOR_SYSTEMD_LIBS@ @TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@ \
- 	$(rust_ldadd)
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ \
+ 	@TOR_SYSTEMD_LIBS@ @TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
  
-@@ -244,8 +244,8 @@
- 	src/common/libor-crypto-testing.a $(LIBKECCAK_TINY) $(LIBDONNA) \
+@@ -262,8 +262,8 @@
  	src/common/libor-event-testing.a \
  	src/trace/libor-trace.a \
+ 	$(rust_ldadd) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
- 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@ \
- 	$(rust_ldadd)
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ \
+ 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
  
-@@ -256,8 +256,8 @@
- 	src/common/libor-ctime-testing.a \
+@@ -275,8 +275,8 @@
  	src/common/libor-event-testing.a \
  	src/common/libor-crypto-testing.a $(LIBKECCAK_TINY) $(LIBDONNA) \
+ 	$(rust_ldadd) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
 +	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
- 	@TOR_LZMA_LIBS@ \
- 	$(rust_ldadd)
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ \
+ 	@TOR_LZMA_LIBS@
  src_test_test_timers_LDFLAGS = $(src_test_test_LDFLAGS)
-@@ -286,8 +286,8 @@
- 	src/common/libor-ctime.a \
+@@ -307,8 +307,8 @@
  	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
  	src/trace/libor-trace.a \
+ 	$(rust_ldadd) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
+-	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
 +	@TOR_LIB_MATH@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
- 	@TOR_LZMA_LIBS@ \
- 	$(rust_ldadd)
++	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
-@@ -298,8 +298,8 @@
+ 	-I"$(top_srcdir)/src/or"
+@@ -318,8 +318,8 @@
  src_test_test_hs_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
  	src/common/libor-ctime.a \
  	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
@@ -109,15 +113,15 @@ diff -uNr tor-0.3.1.7.org/src/test/include.am tor-0.3.1.7/src/test/include.am
 diff -uNr tor-0.3.1.7.org/src/tools/include.am tor-0.3.1.7/src/tools/include.am
 --- tor-0.3.1.7.org/src/tools/include.am	2017-06-19 17:56:51.000000000 +0200
 +++ tor-0.3.1.7/src/tools/include.am	2017-09-19 19:43:08.880223260 +0200
-@@ -26,7 +26,7 @@
- 	src/common/libor-ctime.a \
+@@ -27,7 +27,7 @@
  	$(LIBKECCAK_TINY) \
  	$(LIBDONNA) \
+ 	$(rust_ldadd) \
 -	@TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
 +	@TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ \
- 	$(rust_ldadd)
+ 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
  
+ if COVERAGE_ENABLED
 @@ -40,7 +40,7 @@
      src/common/libor-ctime-testing.a \
      $(LIBKECCAK_TINY) \
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index db946eec07..2841d4099a 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c0e1a71e8e079ddd7951f846bcbd79d5e716b602faa5b890c70762fe95cd04e0  tor-0.3.1.10.tar.gz
+sha256 60df77c31dcf94fdd686c8ca8c34f3b70243b33a7344ecc0b719d5ca2617cbee  tor-0.3.2.10.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 1a6c69d724..42741d9f68 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.1.10
+TOR_VERSION = 0.3.2.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
