From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 15:36:58 +0100
Subject: [Buildroot] [git commit] package/tor: bump version to 0.3.5.7
Message-ID: <20190125144018.E8B828148E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=997480735df5f8e9f568e0fb0ca69d27a35c01b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch rebased and re-formatted with git.

Release notes:
https://blog.torproject.org/new-releases-tor-0357-03410-and-03311

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tor/0001-Fix-static-linking-with-OpenSSL.patch |  84 +++++++++++++
 package/tor/0001-openssl-libz.patch                | 133 ---------------------
 package/tor/tor.hash                               |   4 +-
 package/tor/tor.mk                                 |   2 +-
 4 files changed, 87 insertions(+), 136 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
new file mode 100644
index 0000000000..516dc16da3
--- /dev/null
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -0,0 +1,84 @@
+From ba6b8ee5b6dee19493a150c3715b0e202440d206 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 24 Jan 2019 18:19:51 +0100
+Subject: [PATCH] Fix static linking with OpenSSL
+
+Adjust link order of libz to solve bug with static linking
+and remove host paths when looking for openssl.
+
+[Vincent:
+ - Adapt the patch to make it apply on the new version.]
+[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10 &
+        0.3.4.8, 0.3.5.7]
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac         | 2 +-
+ src/test/include.am  | 8 ++++----
+ src/tools/include.am | 4 ++--
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 05e1392cf..580befa6b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -885,7 +885,7 @@ AC_ARG_WITH(ssl-dir,
+   ])
+ 
+ AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
+-TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32],
++TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32],
+     [#include <openssl/ssl.h>
+      char *getenv(const char *);],
+     [struct ssl_cipher_st;
+diff --git a/src/test/include.am b/src/test/include.am
+index ecb768957..39a622e88 100644
+--- a/src/test/include.am
++++ b/src/test/include.am
+@@ -317,8 +317,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
+ src_test_test_ntor_cl_LDADD = \
+ 	$(TOR_INTERNAL_LIBS) \
+ 	$(rust_ldadd) \
+-	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
+-	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
++	@TOR_LIB_MATH@ \
++	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@
+ src_test_test_ntor_cl_AM_CPPFLAGS =	       \
+ 	$(AM_CPPFLAGS)
+@@ -327,8 +327,8 @@ src_test_test_hs_ntor_cl_SOURCES  = src/test/test_hs_ntor_cl.c
+ src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
+ src_test_test_hs_ntor_cl_LDADD = \
+ 	$(TOR_INTERNAL_LIBS) \
+-	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
+-	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
++	@TOR_LIB_MATH@ \
++	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+ src_test_test_hs_ntor_cl_AM_CPPFLAGS =	       \
+ 	$(AM_CPPFLAGS)
+ 
+diff --git a/src/tools/include.am b/src/tools/include.am
+index f7aa7e0d1..4c4e8aa7a 100644
+--- a/src/tools/include.am
++++ b/src/tools/include.am
+@@ -30,7 +30,7 @@ src_tools_tor_gencert_LDADD = \
+ 	$(TOR_CRYPTO_LIBS) \
+ 	$(TOR_UTIL_LIBS) \
+ 	$(rust_ldadd) \
+-	@TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ $(TOR_LIBS_CRYPTLIB) \
++	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
+ 	@TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
+ endif
+ 
+@@ -40,7 +40,7 @@ src_tools_tor_print_ed_signing_cert_LDADD = \
+ 	src/trunnel/libor-trunnel.a \
+         $(TOR_CRYPTO_LIBS) \
+         $(TOR_UTIL_LIBS) \
+-	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) \
++	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
+ 	@TOR_LIB_WS32@ @TOR_LIB_USERENV@ @TOR_LIB_GDI@
+ 
+ if USE_NSS
+-- 
+2.20.1
+
diff --git a/package/tor/0001-openssl-libz.patch b/package/tor/0001-openssl-libz.patch
deleted file mode 100644
index cb2ed46b39..0000000000
--- a/package/tor/0001-openssl-libz.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-Adjust link order of libz to solve bug with static linking
-and remove host paths when looking for openssl.
-
-[Vincent:
- - Adapt the patch to make it apply on the new version.]
-[Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10 &
-        0.3.4.8]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -uNr tor-0.3.1.7.org/configure.ac tor-0.3.1.7/configure.ac
---- tor-0.3.1.7.org/configure.ac	2017-09-15 15:34:06.000000000 +0200
-+++ tor-0.3.1.7/configure.ac	2017-09-19 19:40:17.090538467 +0200
-@@ -735,7 +735,7 @@
-   ])
- 
- AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
--TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32],
-+TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32],
-     [#include <openssl/ssl.h>
-      char *getenv(const char *);],
-     [struct ssl_cipher_st;
-diff -uNr tor-0.3.1.7.org/src/or/include.am tor-0.3.1.7/src/or/include.am
---- tor-0.3.1.7.org/src/or/include.am	2017-06-19 17:56:51.000000000 +0200
-+++ tor-0.3.1.7/src/or/include.am	2017-09-19 19:41:02.015861546 +0200
-@@ -135,7 +135,7 @@
- 	src/common/libor-event.a src/trunnel/libor-trunnel.a \
- 	src/trace/libor-trace.a \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
-+	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ @TOR_SYSTEMD_LIBS@ \
- 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
-@@ -149,7 +149,7 @@
- 	src/common/libor-ctime-testing.a \
- 	src/common/libor-crypto-testing.a $(LIBKECCAK_TINY) $(LIBDONNA) \
- 	src/common/libor-event-testing.a src/trunnel/libor-trunnel-testing.a \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ \
-+	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@ @TOR_SYSTEMD_LIBS@ \
- 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
- endif
-diff -uNr tor-0.3.1.7.org/src/test/include.am tor-0.3.1.7/src/test/include.am
---- tor-0.3.1.7.org/src/test/include.am	2017-08-29 17:01:19.000000000 +0200
-+++ tor-0.3.1.7/src/test/include.am	2017-09-19 19:42:39.103903406 +0200
-@@ -222,8 +222,8 @@
- 	src/trunnel/libor-trunnel-testing.a \
- 	src/trace/libor-trace.a \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
-+	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ \
- 	@TOR_SYSTEMD_LIBS@ @TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
- 
-@@ -248,8 +248,8 @@
- 	src/common/libor-event.a src/trunnel/libor-trunnel.a \
- 	src/trace/libor-trace.a \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
-+	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ \
- 	@TOR_SYSTEMD_LIBS@ @TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
- 
-@@ -262,8 +262,8 @@
- 	src/common/libor-event-testing.a \
- 	src/trace/libor-trace.a \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
-+	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ \
- 	@TOR_LZMA_LIBS@ @TOR_ZSTD_LIBS@
- 
-@@ -275,8 +275,8 @@
- 	src/common/libor-event-testing.a \
- 	src/common/libor-crypto-testing.a $(LIBKECCAK_TINY) $(LIBDONNA) \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
-+	@TOR_LIB_MATH@ @TOR_LIBEVENT_LIBS@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ \
- 	@TOR_LZMA_LIBS@
- src_test_test_timers_LDFLAGS = $(src_test_test_LDFLAGS)
-@@ -307,8 +307,8 @@
- 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
- 	src/trace/libor-trace.a \
- 	$(rust_ldadd) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
-+	@TOR_LIB_MATH@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@
- src_test_test_ntor_cl_AM_CPPFLAGS =	       \
- 	-I"$(top_srcdir)/src/or"
-@@ -318,8 +318,8 @@
- src_test_test_hs_ntor_cl_LDADD = src/or/libtor.a src/common/libor.a \
- 	src/common/libor-ctime.a \
- 	src/common/libor-crypto.a $(LIBKECCAK_TINY) $(LIBDONNA) \
--	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	@TOR_OPENSSL_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
-+	@TOR_LIB_MATH@ \
-+	@TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
- src_test_test_hs_ntor_cl_AM_CPPFLAGS =	       \
- 	-I"$(top_srcdir)/src/or"
- 
-diff -uNr tor-0.3.1.7.org/src/tools/include.am tor-0.3.1.7/src/tools/include.am
---- tor-0.3.1.7.org/src/tools/include.am	2017-06-19 17:56:51.000000000 +0200
-+++ tor-0.3.1.7/src/tools/include.am	2017-09-19 19:43:08.880223260 +0200
-@@ -27,7 +27,7 @@
- 	$(LIBKECCAK_TINY) \
- 	$(LIBDONNA) \
- 	$(rust_ldadd) \
--	@TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
-+	@TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
- 
- if COVERAGE_ENABLED
-@@ -40,7 +40,7 @@
-     src/common/libor-ctime-testing.a \
-     $(LIBKECCAK_TINY) \
-     $(LIBDONNA) \
--    @TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ @TOR_OPENSSL_LIBS@ \
-+    @TOR_LIB_MATH@ @TOR_OPENSSL_LIBS@ @TOR_ZLIB_LIBS@ \
-     @TOR_LIB_WS32@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
- endif
- 
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 71aef25d79..a3a285fb04 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1a171081f02b9a6ff9e28c0898defb7670e5bbb3bdbcaddfcf4e4304aedd164a  tor-0.3.4.9.tar.gz
-sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
+sha256 1b0887fc21ac535befea7243c5d5f1e31394d7458d64b30807a3e98cca0d839e  tor-0.3.5.7.tar.gz
+sha256 db6ec24b24dfb2423ce75be99dec3acd35a27d050a9d7d708026b049fb8d3731  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 0a7691d4c8..99568fe1b2 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.4.9
+TOR_VERSION = 0.3.5.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
