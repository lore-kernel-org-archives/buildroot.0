From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 18 Feb 2021 22:35:08 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/tor: bump version to 0.4.5.6
Message-ID: <20210218213508.102398-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch, part of it was committed upstream:
https://gitweb.torproject.org/tor.git/commit/?id=c5817a0dafc67882f15730ee818fbcdba1b7b915

Release notes: https://blog.torproject.org/node/2000

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Also verified that the patch is still needed for a static build.

 ...0001-Fix-static-linking-with-OpenSSL.patch | 49 +++++++------------
 package/tor/tor.hash                          |  2 +-
 package/tor/tor.mk                            |  2 +-
 3 files changed, 19 insertions(+), 34 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
index 128b6ed0ce..8385c28972 100644
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -9,45 +9,31 @@ and remove host paths when looking for openssl.
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
 [Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10,
-        0.3.4.8, 0.3.5.7 & 0.4.4.5]
+        0.3.4.8, 0.3.5.7, 0.4.4.5 & 0.4.5.6]
 [Fabrice: fix detection of openssl functions in 0.3.5.8]
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- acinclude.m4         | 2 +-
  configure.ac         | 4 ++--
  src/test/include.am  | 8 ++++----
  src/tools/include.am | 4 ++--
  4 files changed, 9 insertions(+), 9 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index 5ecdf1d5c..be5633f4f 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -166,7 +166,7 @@ AC_CACHE_CHECK([for $1 directory], tor_cv_library_$1_dir, [
-
-   for tor_trydir in "$try$1dir" "(system)" "$prefix" /usr/local /usr/pkg $8; do
-     LDFLAGS="$tor_saved_LDFLAGS"
--    LIBS="$tor_saved_LIBS $3"
-+    LIBS="$3 $tor_saved_LIBS"
-     CPPFLAGS="$tor_saved_CPPFLAGS"
-
-     if test -z "$tor_trydir" ; then
 diff --git a/configure.ac b/configure.ac
 index 05e1392cf..580befa6b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -973,7 +973,7 @@ AC_ARG_WITH(ssl-dir,
+@@ -1056,7 +1056,7 @@ AC_ARG_WITH(ssl-dir,
    ])
  
  AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
--TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32],
-+TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32],
+-TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto $TOR_LIB_GDI $TOR_LIB_WS32 $TOR_LIB_CRYPT32],
++TOR_SEARCH_LIBRARY(openssl, $tryssldir, [-lssl -lcrypto -lz $TOR_LIB_GDI $TOR_LIB_WS32 $TOR_LIB_CRYPT32],
      [#include <openssl/ssl.h>
       char *getenv(const char *);],
      [struct ssl_cipher_st;
-@@ -1005,7 +1005,7 @@ dnl Now check for particular openssl functions.
+@@ -1086,7 +1086,7 @@ dnl Now check for particular openssl functions.
  save_LIBS="$LIBS"
  save_LDFLAGS="$LDFLAGS"
  save_CPPFLAGS="$CPPFLAGS"
@@ -60,28 +46,28 @@ diff --git a/src/test/include.am b/src/test/include.am
 index ecb768957..39a622e88 100644
 --- a/src/test/include.am
 +++ b/src/test/include.am
-@@ -400,8 +400,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
+@@ -404,8 +404,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_ntor_cl_LDADD = \
- 	$(TOR_INTERNAL_LIBS) \
+ 	libtor.a \
  	$(rust_ldadd) \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+-	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
 +	@TOR_LIB_MATH@ \
-+	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
- 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@
++	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ \
+ 	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@ @TOR_TRACE_LIBS@
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
  	$(AM_CPPFLAGS)
-@@ -410,8 +410,8 @@ src_test_test_hs_ntor_cl_SOURCES  = src/test/test_hs_ntor_cl.c
+@@ -414,8 +414,8 @@
  src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_hs_ntor_cl_LDADD = \
- 	$(TOR_INTERNAL_LIBS) \
+ 	libtor.a \
 -	@TOR_ZLIB_LIBS@ @TOR_LIB_MATH@ \
--	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
+-	$(TOR_LIBS_CRYPTLIB) @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ \
 +	@TOR_LIB_MATH@ \
-+	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @CURVE25519_LIBS@
++	$(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ @TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ \
+         @CURVE25519_LIBS@ @TOR_TRACE_LIBS@
  src_test_test_hs_ntor_cl_AM_CPPFLAGS =	       \
  	$(AM_CPPFLAGS)
- 
 diff --git a/src/tools/include.am b/src/tools/include.am
 index f7aa7e0d1..4c4e8aa7a 100644
 --- a/src/tools/include.am
@@ -92,7 +78,7 @@ index f7aa7e0d1..4c4e8aa7a 100644
  	$(rust_ldadd) \
 -	@TOR_LIB_MATH@ @TOR_ZLIB_LIBS@ $(TOR_LIBS_CRYPTLIB) \
 +	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
+ 	@TOR_LIB_WS32@ @TOR_LIB_IPHLPAPI@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@ @TOR_LIB_USERENV@ @CURVE25519_LIBS@
  endif
  
 @@ -45,7 +45,7 @@ src_tools_tor_print_ed_signing_cert_LDADD = \
@@ -101,9 +87,8 @@ index f7aa7e0d1..4c4e8aa7a 100644
          $(TOR_UTIL_LIBS) \
 -	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) \
 +	@TOR_LIB_MATH@ $(TOR_LIBS_CRYPTLIB) @TOR_ZLIB_LIBS@ \
- 	@TOR_LIB_WS32@ @TOR_LIB_USERENV@ @TOR_LIB_GDI@
+ 	@TOR_LIB_WS32@ @TOR_LIB_USERENV@ @TOR_LIB_SHLWAPI@ @TOR_LIB_GDI@
  
  if USE_NSS
 -- 
 2.20.1
-
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 4dd86e51f5..ecbe738574 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  326d2926177f0c7838cac213456d0056817d57f3f2e46714a2911c7d7a9b05ee  tor-0.4.4.7.tar.gz
+sha256  22cba3794fedd5fa87afc1e512c6ce2c21bc20b4e1c6f8079d832dc1e545e733  tor-0.4.5.6.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 8ad4a7a825..1c9d2f2367 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.4.7
+TOR_VERSION = 0.4.5.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.29.2
