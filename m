From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:47:06 +0200
Subject: [Buildroot] [git commit] libgit2: fix build with LibreSSL 2.7
Message-ID: <20180604205103.04B5983914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd30292bd3b6a979e43095079d13fb94d74bdb34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By using a patch from upstream's master branch.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libgit2/0001-Fix-build-with-LibreSSL-2.7.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/libgit2/0001-Fix-build-with-LibreSSL-2.7.patch b/package/libgit2/0001-Fix-build-with-LibreSSL-2.7.patch
new file mode 100644
index 0000000000..f0be0f0d2f
--- /dev/null
+++ b/package/libgit2/0001-Fix-build-with-LibreSSL-2.7.patch
@@ -0,0 +1,45 @@
+From 7490d449b518115a1ae86b01397e95c38e39cff1 Mon Sep 17 00:00:00 2001
+From: Bernard Spil <brnrd@FreeBSD.org>
+Date: Mon, 2 Apr 2018 20:00:07 +0200
+Subject: [PATCH] Fix build with LibreSSL 2.7
+
+LibreSSL 2.7 adds OpenSSL 1.1 API
+
+Signed-off-by: Bernard Spil <brnrd@FreeBSD.org>
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+---
+ src/streams/openssl.c | 3 ++-
+ src/streams/openssl.h | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/streams/openssl.c b/src/streams/openssl.c
+index 9cbb2746f..adcb7f14e 100644
+--- a/src/streams/openssl.c
++++ b/src/streams/openssl.c
+@@ -104,7 +104,8 @@ int git_openssl_stream_global_init(void)
+ 	ssl_opts |= SSL_OP_NO_COMPRESSION;
+ #endif
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ 	SSL_load_error_strings();
+ 	OpenSSL_add_ssl_algorithms();
+ #else
+diff --git a/src/streams/openssl.h b/src/streams/openssl.h
+index 2bbad7c68..44329ec90 100644
+--- a/src/streams/openssl.h
++++ b/src/streams/openssl.h
+@@ -31,7 +31,8 @@ extern int git_openssl__set_cert_location(const char *file, const char *path);
+ 
+ 
+ 
+-# if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++# if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++     (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ 
+ GIT_INLINE(BIO_METHOD*) BIO_meth_new(int type, const char *name)
+ {
+-- 
+2.17.0
+
