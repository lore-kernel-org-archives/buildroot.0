From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:42:10 +0200
Subject: [Buildroot] [git commit] package/libshout: bump to version 2.4.3
Message-ID: <20190731224011.469A680E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27868e696bbfe416b8c35dcba679794f5e1e6fa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patches (already in version) and so remove AUTORECONF
- Use new option to disable examples
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch      | 45 -----------------
 ...Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch | 55 --------------------
 ...3-libshout-tls-compile-with-OpenSSL-1.1.0.patch | 59 ----------------------
 package/libshout/libshout.hash                     |  8 +--
 package/libshout/libshout.mk                       |  6 +--
 5 files changed, 7 insertions(+), 166 deletions(-)

diff --git a/package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch b/package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch
deleted file mode 100644
index 4d173c51e9..0000000000
--- a/package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d96a3cafeebeb80b4796bacbe0e6da0bbd3ee48e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 28 Aug 2016 00:39:55 +0200
-Subject: [PATCH 1/2] Fix {THEORA,SPEEX}_LDFLAGS typo
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Needed to properly link against libshout, otherwise the build fails with:
-
-  error: LDFLAGS: No such file or directory
-
-Upstream status: pending
-https://github.com/xiph/Icecast-libshout/pull/4
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 87a7f55..85f18ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -134,7 +134,7 @@ PKG_CHECK_MODULES(THEORA, theora, [
-   ])
- fi
- XIPH_VAR_APPEND([XIPH_CPPFLAGS],[$THEORA_CFLAGS])
--XIPH_VAR_PREPEND([XIPH_LIBS],[$THEORA LDFLAGS $THEORA_LIBS])
-+XIPH_VAR_PREPEND([XIPH_LIBS],[$THEORA_LDFLAGS $THEORA_LIBS])
- AM_CONDITIONAL([HAVE_THEORA], [test -n "$THEORA_LIBS"])
- if test -n "$THEORA_LIBS"
- then
-@@ -153,7 +153,7 @@ PKG_CHECK_MODULES(SPEEX, speex, [
-   ])
- fi
- XIPH_VAR_APPEND([XIPH_CPPFLAGS],[$SPEEX_CFLAGS])
--XIPH_VAR_PREPEND([XIPH_LIBS],[$SPEEX LDFLAGS $SPEEX_LIBS])
-+XIPH_VAR_PREPEND([XIPH_LIBS],[$SPEEX_LDFLAGS $SPEEX_LIBS])
- AM_CONDITIONAL([HAVE_SPEEX], [test -n "$SPEEX_LIBS"])
- if test -n "$SPEEX_LIBS"
- then
--- 
-2.9.3
-
diff --git a/package/libshout/0002-Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch b/package/libshout/0002-Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch
deleted file mode 100644
index 08d7fa9176..0000000000
--- a/package/libshout/0002-Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 69774132422af1d017008eb5daed8e2099d2fa0a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 31 Aug 2016 21:55:51 +0200
-Subject: [PATCH 2/2] Make sure @SHOUT_REQUIRES@ contains OpenSSL
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Static linking userspace programs such as mpd against libshout
-currently doesn't work out of the box, because libshout is linked
-against libssl, but this isn't expressed in libshouts pkg-config
-file:
-
-```
-/usr/lib/libshout.a(tls.o): In function `tls_check_cert':
-tls.c:(.text+0x10): undefined reference to `SSL_get_peer_certificate'
-tls.c:(.text+0x24): undefined reference to `SSL_get_verify_result'
-tls.c:(.text+0x4c): undefined reference to `X509_get_subject_name'
-tls.c:(.text+0x60): undefined reference to `X509_NAME_get_text_by_NID'
-tls.c:(.text+0x118): undefined reference to `X509_NAME_get_entry'
-tls.c:(.text+0x11c): undefined reference to `X509_NAME_ENTRY_get_data'
-tls.c:(.text+0x120): undefined reference to `ASN1_STRING_length'
-tls.c:(.text+0x148): undefined reference to `X509_free'
-tls.c:(.text+0x178): undefined reference to `X509_NAME_get_index_by_NID'
-```
-
-Since OpenSSL installs its own .pc files, make sure that @SHOUT_REQUIRES@
-contains `ssl`.
-
-Upstream status: pending
-https://github.com/xiph/Icecast-libshout/pull/5
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 85f18ad..2b9c505 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -197,6 +197,10 @@ XIPH_PATH_OPENSSL([
-     ])
- AC_SUBST([SHOUT_TLS])
- AM_CONDITIONAL([HAVE_TLS], [test -n "$OPENSSL_LIBS"])
-+if test "$SHOUT_TLS" = "1"
-+then
-+  SHOUT_REQUIRES="$SHOUT_REQUIRES, libssl"
-+fi
- 
- SHOUT_VERSION="$VERSION"
- SHOUT_CPPFLAGS="-I$shout_includedir $VORBIS_CFLAGS $PTHREAD_CPPFLAGS"
--- 
-2.9.3
-
diff --git a/package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch b/package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch
deleted file mode 100644
index 49b71501ed..0000000000
--- a/package/libshout/0003-libshout-tls-compile-with-OpenSSL-1.1.0.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 01fafc449f0de56743d08e7976933c49e2915bfa Mon Sep 17 00:00:00 2001
-From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
-Date: Wed, 15 Nov 2017 12:46:25 +0000
-Subject: [PATCH] tls: compile with OpenSSL 1.1.0
-
-The init functions are not longer required in OpenSSL 1.1 so I dropped
-them.
-
-TLSv1_client_method() should not be used because it enables only the
-TLSv1.0 protocol. Better is to use SSLv23_client_method() which enable
-all the protocols including TLSv1.2. With this functions SSLv2 and SSLv3
-is theoretically possible but as of today those protocols are usually
-build-time disabled.
-To avoid all this OpenSSL 1.1 provides TLS_client_method() which is aim
-to provide to highest TLS protocol version (same as
-SSLv23_client_method() but it is deprecated in 1.1).
-
-Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
-Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
----
- src/tls.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/tls.c b/src/tls.c
-index 4562c7327077..e0e5c1a5f079 100644
---- a/src/tls.c
-+++ b/src/tls.c
-@@ -24,6 +24,7 @@
- #endif
- 
- #include <shout/shout.h>
-+#include <string.h>
- #include "shout_private.h"
- 
- #ifndef XXX_HAVE_X509_check_host
-@@ -61,14 +62,17 @@ shout_tls_t *shout_tls_new(shout_t *self, sock_t socket)
- 
- static inline int tls_setup(shout_tls_t *tls)
- {
--	SSL_METHOD *meth;
--
-+	const SSL_METHOD *meth;
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	SSL_library_init();
- 	SSL_load_error_strings();
- 	SSLeay_add_all_algorithms();
-- 	SSLeay_add_ssl_algorithms();
-+	SSLeay_add_ssl_algorithms();
- 
--	meth = TLSv1_client_method();
-+	meth = SSLv23_client_method();
-+#else
-+	meth = TLS_client_method();
-+#endif
- 	if (!meth)
- 		goto error;
- 
--- 
-2.15.0
diff --git a/package/libshout/libshout.hash b/package/libshout/libshout.hash
index 5b3ae2d446..06702891c0 100644
--- a/package/libshout/libshout.hash
+++ b/package/libshout/libshout.hash
@@ -1,3 +1,5 @@
-# From https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libshout/Manifest
-# hash from http://downloads.xiph.org/releases/libshout/SHA256SUMS is wrong!
-sha256	f3acb8dec26f2dbf6df778888e0e429a4ce9378a9d461b02a7ccbf2991bbf24d	libshout-2.4.1.tar.gz
+# From https://downloads.xiph.org/releases/libshout/SHA256SUMS
+sha256	0d8af55d1141bf90710bcd41a768c9cc5adb251502a0af1dd22c8da215d40dfe	libshout-2.4.3.tar.gz
+
+# Hash for license file
+sha256	7a4436f9ec37603356791c87de3bc444989befd2682d29efb3d97604e04c1852	COPYING
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 375ce05b4b..6537a1fea3 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-LIBSHOUT_VERSION = 2.4.1
+LIBSHOUT_VERSION = 2.4.3
 LIBSHOUT_SITE = https://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
 LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
-
-# patching configure.ac
-LIBSHOUT_AUTORECONF = YES
+LIBSHOUT_CONF_OPTS = --disable-examples
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 LIBSHOUT_CONF_OPTS += --enable-theora
