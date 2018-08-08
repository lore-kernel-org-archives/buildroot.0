From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Aug 2018 16:20:10 +0200
Subject: [Buildroot] [git commit] libgit2: security bump to version 0.27.4
Message-ID: <20180808142437.B35518B609@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fffc281e6ecd7c460869e6098b30928334eb8b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-10887 and CVE-2018-10888: out-of-bounds reads when
reading objects from a packfile.

Also fixes out-of-bounds reads when processing smart-protocol "ng"
packets (no known CVE yet).

Drop upstream patch.

Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-By: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libgit2/0001-Fix-build-with-LibreSSL-2.7.patch | 45 ----------------------
 package/libgit2/libgit2.hash                       |  2 +-
 package/libgit2/libgit2.mk                         |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/libgit2/0001-Fix-build-with-LibreSSL-2.7.patch b/package/libgit2/0001-Fix-build-with-LibreSSL-2.7.patch
deleted file mode 100644
index f0be0f0d2f..0000000000
--- a/package/libgit2/0001-Fix-build-with-LibreSSL-2.7.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7490d449b518115a1ae86b01397e95c38e39cff1 Mon Sep 17 00:00:00 2001
-From: Bernard Spil <brnrd@FreeBSD.org>
-Date: Mon, 2 Apr 2018 20:00:07 +0200
-Subject: [PATCH] Fix build with LibreSSL 2.7
-
-LibreSSL 2.7 adds OpenSSL 1.1 API
-
-Signed-off-by: Bernard Spil <brnrd@FreeBSD.org>
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
----
- src/streams/openssl.c | 3 ++-
- src/streams/openssl.h | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/streams/openssl.c b/src/streams/openssl.c
-index 9cbb2746f..adcb7f14e 100644
---- a/src/streams/openssl.c
-+++ b/src/streams/openssl.c
-@@ -104,7 +104,8 @@ int git_openssl_stream_global_init(void)
- 	ssl_opts |= SSL_OP_NO_COMPRESSION;
- #endif
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
- 	SSL_load_error_strings();
- 	OpenSSL_add_ssl_algorithms();
- #else
-diff --git a/src/streams/openssl.h b/src/streams/openssl.h
-index 2bbad7c68..44329ec90 100644
---- a/src/streams/openssl.h
-+++ b/src/streams/openssl.h
-@@ -31,7 +31,8 @@ extern int git_openssl__set_cert_location(const char *file, const char *path);
- 
- 
- 
--# if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+# if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+     (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
- 
- GIT_INLINE(BIO_METHOD*) BIO_meth_new(int type, const char *name)
- {
--- 
-2.17.0
-
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 43d8f9930e..41ab87bf4d 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	837b11927bc5f64e7f9ab0376f57cfe3ca5aa52ffd2007ac41184b21124fb086  libgit2-v0.27.1.tar.gz
+sha256	0b7ca31cb959ff1b22afa0da8621782afe61f99242bf716c403802ffbdb21d51  libgit2-v0.27.4.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 8b7b9f6d77..551e3dea62 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = v0.27.1
+LIBGIT2_VERSION = v0.27.4
 LIBGIT2_SITE = $(call github,libgit2,libgit2,$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
