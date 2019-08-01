From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Aug 2019 13:16:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtorrent: bump to version 0.13.8
Message-ID: <20190801111654.31714-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove both patches (already in version) and drop AUTORECONF as it is
not needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...s-compilation-based-on-OpenWRT-patch.patch |  54 ---------
 .../0002-Added-support-for-openssl-1.1.patch  | 112 ------------------
 package/libtorrent/libtorrent.hash            |   2 +-
 package/libtorrent/libtorrent.mk              |   3 +-
 4 files changed, 2 insertions(+), 169 deletions(-)
 delete mode 100644 package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch
 delete mode 100644 package/libtorrent/0002-Added-support-for-openssl-1.1.patch

diff --git a/package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch b/package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch
deleted file mode 100644
index ba0c6127af..0000000000
--- a/package/libtorrent/0001-Fix-cross-compilation-based-on-OpenWRT-patch.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c99179777d8f4cf69c51378b91ae580c49cb57a2 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 5 Oct 2015 00:40:25 +0100
-Subject: [PATCH] Fix cross compilation, based on OpenWRT patch.
-
-[Vincent: tweak the patch for version 0.13.6]
-[Bernd: tweak the patch for version 0.13.7]
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- scripts/checks.m4 | 2 +-
- scripts/common.m4 | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/checks.m4 b/scripts/checks.m4
-index 8d77fc5e..c446995b 100644
---- a/scripts/checks.m4
-+++ b/scripts/checks.m4
-@@ -96,7 +96,7 @@ AC_DEFUN([TORRENT_CHECK_KQUEUE], [
- AC_DEFUN([TORRENT_CHECK_KQUEUE_SOCKET_ONLY], [
-   AC_MSG_CHECKING(whether kqueue supports pipes and ptys)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <fcntl.h>
-       #include <stdlib.h>
-       #include <unistd.h>
-diff --git a/scripts/common.m4 b/scripts/common.m4
-index ff023928..932b205c 100644
---- a/scripts/common.m4
-+++ b/scripts/common.m4
-@@ -153,7 +153,7 @@ dnl   Need to fix this so that it uses the stuff defined by the system.
- AC_DEFUN([TORRENT_CHECK_EXECINFO], [
-   AC_MSG_CHECKING(for execinfo.h)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <execinfo.h>
-       int main() { backtrace((void**)0, 0); backtrace_symbols((char**)0, 0); return 0;}
-       ])],
-@@ -168,7 +168,7 @@ AC_DEFUN([TORRENT_CHECK_EXECINFO], [
- AC_DEFUN([TORRENT_CHECK_ALIGNED], [
-   AC_MSG_CHECKING(the byte alignment)
- 
--  AC_RUN_IFELSE([AC_LANG_SOURCE([
-+  AC_LINK_IFELSE([AC_LANG_SOURCE([
-       #include <inttypes.h>
-       int main() {
-         char buf@<:@8@:>@ = { 0, 0, 0, 0, 1, 0, 0, 0 };
--- 
-2.14.4
-
diff --git a/package/libtorrent/0002-Added-support-for-openssl-1.1.patch b/package/libtorrent/0002-Added-support-for-openssl-1.1.patch
deleted file mode 100644
index 463c8ac9bc..0000000000
--- a/package/libtorrent/0002-Added-support-for-openssl-1.1.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 9af3be81c75b44415a6e7efe19f8f89d55091f84 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Tue, 20 Dec 2016 19:51:02 +0900
-Subject: [PATCH] Added support for openssl 1.1.
-
-Downloaded from upstream commit
-https://github.com/rakshasa/libtorrent/commit/7b29b6bd2547e72e22b9b7981df27092842d2a10
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac                |  4 ++++
- src/utils/diffie_hellman.cc | 36 ++++++++++++++++++++++++++++++++++--
- 2 files changed, 38 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5b1ea237..b885714d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,12 +71,15 @@ AC_ARG_ENABLE(openssl,
-   [  --disable-openssl       Don't use OpenSSL's SHA1 implementation.],
-   [
-     if test "$enableval" = "yes"; then
-+dnl move to scripts.
-       PKG_CHECK_MODULES(OPENSSL, libcrypto,
-         CXXFLAGS="$CXXFLAGS $OPENSSL_CFLAGS";
-         LIBS="$LIBS $OPENSSL_LIBS")
- 
-       AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
-       AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
-+      AC_CHECK_LIB([crypto], [DH_set0_pqg], [AC_DEFINE(USE_OPENSSL_1_1, 1, Using OpenSSL 1.1.)])
-+
-     else
-       AC_DEFINE(USE_NSS_SHA, 1, Using Mozilla's SHA1 implementation.)
-     fi
-@@ -87,6 +90,7 @@ AC_ARG_ENABLE(openssl,
- 
-     AC_DEFINE(USE_OPENSSL, 1, Using OpenSSL.)
-     AC_DEFINE(USE_OPENSSL_SHA, 1, Using OpenSSL's SHA1 implementation.)
-+    AC_CHECK_LIB([crypto], [DH_set0_pqg], [AC_DEFINE(USE_OPENSSL_1_1, 1, Using OpenSSL 1.1.)])
-   ]
- )
- 
-diff --git a/src/utils/diffie_hellman.cc b/src/utils/diffie_hellman.cc
-index aa653d45..7ec13165 100644
---- a/src/utils/diffie_hellman.cc
-+++ b/src/utils/diffie_hellman.cc
-@@ -54,11 +54,23 @@ DiffieHellman::DiffieHellman(const unsigned char *prime, int primeLength,
-   m_secret(NULL), m_size(0) {
- 
- #ifdef USE_OPENSSL
-+
-   m_dh = DH_new();
-+
-+#ifdef USE_OPENSSL_1_1
-+  BIGNUM * const dh_p = BN_bin2bn(prime, primeLength, NULL);
-+  BIGNUM * const dh_g = BN_bin2bn(generator, generatorLength, NULL);
-+
-+  if (dh_p == NULL || dh_g == NULL ||
-+      !DH_set0_pqg(m_dh, dh_p, NULL, dh_g))
-+	  throw internal_error("Could not generate Diffie-Hellman parameters");
-+#else
-   m_dh->p = BN_bin2bn(prime, primeLength, NULL);
-   m_dh->g = BN_bin2bn(generator, generatorLength, NULL);
-+#endif
- 
-   DH_generate_key(m_dh);
-+
- #else
-   throw internal_error("Compiled without encryption support.");
- #endif
-@@ -74,7 +86,19 @@ DiffieHellman::~DiffieHellman() {
- bool
- DiffieHellman::is_valid() const {
- #ifdef USE_OPENSSL
-+  if (m_dh == NULL)
-+    return false;
-+
-+#ifdef USE_OPENSSL_1_1
-+  const BIGNUM *pub_key;
-+
-+  DH_get0_key(m_dh, &pub_key, NULL);
-+
-+  return pub_key != NULL;
-+#else
-   return m_dh != NULL && m_dh->pub_key != NULL;
-+#endif
-+
- #else
-   return false;
- #endif
-@@ -103,8 +127,16 @@ DiffieHellman::store_pub_key(unsigned char* dest, unsigned int length) {
- #ifdef USE_OPENSSL
-   std::memset(dest, 0, length);
- 
--  if ((int)length >= BN_num_bytes(m_dh->pub_key))
--    BN_bn2bin(m_dh->pub_key, dest + length - BN_num_bytes(m_dh->pub_key));
-+  const BIGNUM *pub_key;
-+
-+#ifdef USE_OPENSSL_1_1
-+  DH_get0_key(m_dh, &pub_key, NULL);
-+#else
-+  pub_key = m_dh->pub_key;
-+#endif
-+
-+  if ((int)length >= BN_num_bytes(pub_key))
-+    BN_bn2bin(pub_key, dest + length - BN_num_bytes(pub_key));
- #endif
- }
- 
--- 
-2.14.4
-
diff --git a/package/libtorrent/libtorrent.hash b/package/libtorrent/libtorrent.hash
index 8e0bc1caa4..3a4fe89a4e 100644
--- a/package/libtorrent/libtorrent.hash
+++ b/package/libtorrent/libtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c738f60f4d7b6879cd2745fb4310bf24c9287219c1fd619706a9d5499ca7ecc1  libtorrent-0.13.7.tar.gz
+sha256 ed115a28f4ae8cfcd33b94a597c076ca74fd549867a26e4fac9505c27288e983  libtorrent-0.13.8.tar.gz
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index de964b45ae..c8310cab65 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBTORRENT_VERSION = 0.13.7
+LIBTORRENT_VERSION = 0.13.8
 LIBTORRENT_SITE = http://rtorrent.net/downloads
 LIBTORRENT_DEPENDENCIES = host-pkgconf zlib
 LIBTORRENT_CONF_OPTS = --enable-aligned \
 	--disable-instrumentation \
 	--with-zlib=$(STAGING_DIR)/usr
 LIBTORRENT_INSTALL_STAGING = YES
-LIBTORRENT_AUTORECONF = YES
 LIBTORRENT_LICENSE = GPL-2.0
 LIBTORRENT_LICENSE_FILES = COPYING
 
-- 
2.20.1
