From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jan 2020 22:44:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/rpm: bump to version 4.15.1
Message-ID: <20200113214410.1439881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop both patches (already in version)
- Add libgcrypt optional dependency (added in version 4.15.1 with
  https://github.com/rpm-software-management/rpm/commit/037106ecc899bad6d6e6f9d95768699542b871ea)
- Add openmp support (added in version 4.15.1 with
  https://github.com/rpm-software-management/rpm/commit/464d21dc8c176222c6586e2ee503fec6207f0d29)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...for-unused-MD2-and-RIPEMD160-digests.patch | 82 -------------------
 ...-prefer-pkg-config-to-find-libgcrypt.patch | 52 ++++++++++++
 ...rpmio-digest_nss.c-fix-build-on-musl.patch | 32 --------
 package/rpm/Config.in                         |  2 +-
 package/rpm/rpm.hash                          |  4 +-
 package/rpm/rpm.mk                            | 17 +++-
 6 files changed, 69 insertions(+), 120 deletions(-)
 delete mode 100644 package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch
 create mode 100644 package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch
 delete mode 100644 package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch

diff --git a/package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch b/package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch
deleted file mode 100644
index e080d98fe8..0000000000
--- a/package/rpm/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160-digests.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From ff4b9111aeba01dd025dd133ce617fb80f7398a0 Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Tue, 26 Jun 2018 10:46:14 +0300
-Subject: [PATCH] Rip out partial support for unused MD2 and RIPEMD160 digests
-
-Inspired by #453, adding configure-checks for unused digests algorithms
-seems nonsensical, at no point in rpm history have these algorithms been
-used for anything in rpm so there's not even backward compatibility to
-care about. So the question becomes why do we appear to have (some)
-support for those unused algorithms? So lets don't, problem solved...
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rpm-software-management/rpm/commit/ff4b9111aeba01dd025dd133ce617fb80f7398a0]
----
- rpmio/digest_beecrypt.c | 7 -------
- rpmio/digest_nss.c      | 2 --
- rpmio/digest_openssl.c  | 6 ------
- 3 files changed, 15 deletions(-)
-
-diff --git a/rpmio/digest_beecrypt.c b/rpmio/digest_beecrypt.c
-index 597027e25..653a39491 100644
---- a/rpmio/digest_beecrypt.c
-+++ b/rpmio/digest_beecrypt.c
-@@ -132,10 +132,6 @@ DIGEST_CTX rpmDigestInit(int hashalgo, rpmDigestFlags flags)
- 	ctx->Digest = (void *) sha512Digest;
- 	break;
- #endif
--    case PGPHASHALGO_RIPEMD160:
--    case PGPHASHALGO_MD2:
--    case PGPHASHALGO_TIGER192:
--    case PGPHASHALGO_HAVAL_5_160:
-     default:
- 	free(ctx);
- 	return NULL;
-@@ -292,9 +288,6 @@ static int pgpVerifySigRSA(pgpDigAlg pgpkey, pgpDigAlg pgpsig, uint8_t *hash, si
-     case PGPHASHALGO_SHA1:
-         prefix = "3021300906052b0e03021a05000414";
-         break;
--    case PGPHASHALGO_MD2:
--        prefix = "3020300c06082a864886f70d020205000410";
--        break;
-     case PGPHASHALGO_SHA256:
-         prefix = "3031300d060960864801650304020105000420";
-         break;
-diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
-index 992d9acf6..50f8c8e90 100644
---- a/rpmio/digest_nss.c
-+++ b/rpmio/digest_nss.c
-@@ -116,7 +116,6 @@ static HASH_HashType getHashType(int hashalgo)
- {
-     switch (hashalgo) {
-     case PGPHASHALGO_MD5:	return HASH_AlgMD5;
--    case PGPHASHALGO_MD2:	return HASH_AlgMD2;
-     case PGPHASHALGO_SHA1:	return HASH_AlgSHA1;
- #ifdef SHA224_LENGTH
-     case PGPHASHALGO_SHA224:	return HASH_AlgSHA224;
-@@ -216,7 +215,6 @@ static SECOidTag getHashAlg(unsigned int hashalgo)
- {
-     switch (hashalgo) {
-     case PGPHASHALGO_MD5:	return SEC_OID_MD5;
--    case PGPHASHALGO_MD2:	return SEC_OID_MD2;
-     case PGPHASHALGO_SHA1:	return SEC_OID_SHA1;
- #ifdef SHA224_LENGTH
-     case PGPHASHALGO_SHA224:	return SEC_OID_SHA224;
-diff --git a/rpmio/digest_openssl.c b/rpmio/digest_openssl.c
-index 18e52a724..0ae48dd1d 100644
---- a/rpmio/digest_openssl.c
-+++ b/rpmio/digest_openssl.c
-@@ -172,12 +172,6 @@ static const EVP_MD *getEVPMD(int hashalgo)
-     case PGPHASHALGO_SHA1:
-         return EVP_sha1();
- 
--    case PGPHASHALGO_RIPEMD160:
--        return EVP_ripemd160();
--
--    case PGPHASHALGO_MD2:
--        return EVP_md2();
--
-     case PGPHASHALGO_SHA256:
-         return EVP_sha256();
- 
diff --git a/package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch b/package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch
new file mode 100644
index 0000000000..035fe154db
--- /dev/null
+++ b/package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch
@@ -0,0 +1,52 @@
+From 22ed98efe3d5198e4141948af7569cfa10d9d25f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 20 Nov 2019 13:06:51 +0000
+Subject: [PATCH] configure.ac: prefer pkg-config to find libgcrypt
+
+libgcrypt from 1.8.5 provides a pkg-config file as well as the traditional
+libgcrypt-config script.  As pkg-config is more resiliant in the face of
+complicated build environments (for example cross-compilation and sysroots)
+prefer the pkg-config file, falling back to libgcrypt-config if that doesn't
+exist.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rpm-software-management/rpm/commit/22ed98efe3d5198e4141948af7569cfa10d9d25f]
+---
+ configure.ac | 23 +++++++++++++++--------
+ 1 file changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0a3a9bbf4..6a3ea3615 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -395,14 +395,21 @@ AC_SUBST(WITH_OPENSSL_LIB)
+ WITH_LIBGCRYPT_INCLUDE=
+ WITH_LIBGCRYPT_LIB=
+ if test "$with_crypto" = libgcrypt ; then
+-AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
+-if test notfound != "$LIBGCRYPT_CONFIG" ; then
+-WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
+-WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
+-fi
+-if test -z "$WITH_LIBGCRYPT_LIB" ; then
+-AC_MSG_ERROR([libgcrypt not found])
+-fi
++  # libgcrypt 1.8.5 onwards ships a pkg-config file so prefer that
++  PKG_CHECK_MODULES([LIBGCRYPT], [libgcrypt], [have_libgcrypt=yes], [have_libgcrypt=no])
++  if test "$have_libgcrypt" = "yes"; then
++    WITH_LIBGCRYPT_INCLUDE="$LIBGCRYPT_CFLAGS"
++    WITH_LIBGCRYPT_LIB="$LIBGCRYPT_LIBS"
++  else
++    AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
++      if test notfound != "$LIBGCRYPT_CONFIG" ; then
++        WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
++        WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
++     fi
++     if test -z "$WITH_LIBGCRYPT_LIB" ; then
++       AC_MSG_ERROR([libgcrypt not found])
++    fi
++  fi
+ fi
+ 
+ AM_CONDITIONAL([WITH_LIBGCRYPT],[test "$with_crypto" = libgcrypt])
diff --git a/package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch b/package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch
deleted file mode 100644
index 66aeb64786..0000000000
--- a/package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 817dbe77e3e5a6d89540000a48584358efb4b03a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 1 Apr 2019 07:33:19 +0200
-Subject: [PATCH] rpmio/digest_nss.c: fix build on musl
-
-signal.h must be included to be able to use sigaction
-
-Fixes:
- - http://autobuild.buildroot.org/results/395fd44a930dfc2ad380bc735c26d9ce62344295
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/rpm-software-management/rpm/pull/650]
----
- rpmio/digest_nss.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
-index 50f8c8e90..1692a9221 100644
---- a/rpmio/digest_nss.c
-+++ b/rpmio/digest_nss.c
-@@ -3,6 +3,7 @@
- #include <pthread.h>
- #include <nss.h>
- #include <sechash.h>
-+#include <signal.h>
- #include <keyhi.h>
- #include <cryptohi.h>
- #include <blapit.h>
--- 
-2.14.1
-
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 555ad12eff..fc702c3097 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RPM
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_POPT
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index f7cbd0cbc3..cdb20e3b8f 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.14.2.1.html
-sha256 1139c24b7372f89c0a697096bf9809be70ba55e006c23ff47305c1849d98acda  rpm-4.14.2.1.tar.bz2
+# From https://rpm.org/wiki/Releases/4.15.1.html
+sha256 ddef45f9601cd12042edfc9b6e37efcca32814e1e0f4bb8682d08144a3e2d230  rpm-4.15.1.tar.bz2
 
 # Hash for license file
 sha256 d56f4f1f290f6920cb053aef0dbcd0b853cda289e2568b364ddbfce220a6f3e0  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index bcdc8c5fee..d29c3febaa 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.14
-RPM_VERSION = $(RPM_VERSION_MAJOR).2.1
+RPM_VERSION_MAJOR = 4.15
+RPM_VERSION = $(RPM_VERSION_MAJOR).1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
@@ -20,6 +20,8 @@ RPM_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
+# We're patching configure.ac
+RPM_AUTORECONF = YES
 
 RPM_CONF_OPTS = \
 	--disable-python \
@@ -50,7 +52,10 @@ else
 RPM_CONF_OPTS += --without-cap
 endif
 
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+RPM_DEPENDENCIES += libgcrypt
+RPM_CONF_OPTS += --with-crypto=libgcrypt
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 RPM_DEPENDENCIES += libnss
 RPM_CONF_OPTS += --with-crypto=nss
 RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
@@ -90,6 +95,12 @@ else
 RPM_CONF_OPTS += --disable-zstd
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
+RPM_CONF_OPTS += --enable-openmp
+else
+RPM_CONF_OPTS += --disable-openmp
+endif
+
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-- 
2.24.1
