From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:59:24 +0200
Subject: [Buildroot] [git commit] Revert "package/rtty: remove unnecessary
 cmake options"
Message-ID: <20200329194729.7261D8907E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f1ea7dc752a417560510d5314ebc04f66bf6445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7f169e6bc3812d7f9160449d7724711e4df7e39e.

As pointed out by Yann E. Morin, we really want to explicitly disable
crypto backends, otherwise they will get automatically re-enabled if
one of the dependencies is found:

    elseif(OPENSSL_FOUND)
        set(RTTY_USE_OPENSSL ON)
    elseif(WOLFSSL_FOUND)
        set(RTTY_USE_WOLFSSL ON)
    elseif(MBEDTLS_FOUND)
        set(RTTY_USE_MBEDTLS ON)

But as usual, dependencies may incorrectly be found, so we want to
explicitly disable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/rtty.mk | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 5d1ef4a091..88599f6636 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -12,13 +12,25 @@ RTTY_DEPENDENCIES = libev
 
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
-RTTY_CONF_OPTS += -DRTTY_USE_MBEDTLS=ON
+RTTY_CONF_OPTS += \
+	-DRTTY_SSL_SUPPORT=ON \
+	-DRTTY_USE_MBEDTLS=ON \
+	-DRTTY_USE_OPENSSL=OFF \
+	-DRTTY_USE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 RTTY_DEPENDENCIES += host-pkgconf openssl
-RTTY_CONF_OPTS += -DRTTY_USE_OPENSSL=ON
+RTTY_CONF_OPTS += \
+	-DRTTY_SSL_SUPPORT=ON \
+	-DRTTY_USE_MBEDTLS=OFF \
+	-DRTTY_USE_OPENSSL=ON \
+	-DRTTY_USE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 RTTY_DEPENDENCIES += wolfssl
-RTTY_CONF_OPTS += -DRTTY_USE_WOLFSSL=ON
+RTTY_CONF_OPTS += \
+	-DRTTY_SSL_SUPPORT=ON \
+	-DRTTY_USE_MBEDTLS=OFF \
+	-DRTTY_USE_OPENSSL=OFF \
+	-DRTTY_USE_WOLFSSL=ON
 else
 RTTY_CONF_OPTS += -DRTTY_SSL_SUPPORT=OFF
 endif
