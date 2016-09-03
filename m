From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Sep 2016 00:58:41 +0200
Subject: [Buildroot] [PATCH 2/4 v2] package/openssl: depend on the virtual
	cryptodev package
In-Reply-To: <cover.1472943074.git.yann.morin.1998@free.fr>
References: <cover.1472943074.git.yann.morin.1998@free.fr>
Message-ID: <bc9fc93a50d517dc5ef8717a70548f5b9311d4da.1472943074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of depending on each provider of cryptodev, make openssl depend
on the virtual package.

This is easy because in both cases the openssl build systems needs the
same configuration options.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/openssl/openssl.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index b926fe3..efe2b49 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -28,14 +28,9 @@ ifeq ($(BR2_USE_MMU),)
 OPENSSL_CFLAGS += -DHAVE_FORK=0
 endif
 
-ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
 OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-OPENSSL_DEPENDENCIES += cryptodev-linux
-endif
-
-ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-OPENSSL_DEPENDENCIES += ocf-linux
+OPENSSL_DEPENDENCIES += cryptodev
 endif
 
 # Some architectures are optimized in OpenSSL
-- 
2.7.4
