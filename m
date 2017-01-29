From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 29 Jan 2017 22:15:11 +0100
Subject: [Buildroot] [PATCH] package/mbedtls: fix zlib support
Message-ID: <20170129211511.9747-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To enable compression support using zlib it is necessary to uncomment
the define for MBEDTLS_ZLIB_SUPPORT in config.h [1].

Note, that enabling TLS compression may make mbedTLS vulnerable to the
CRIME attack [1]. It should not be enabled unless is is sure CRIME and
similar attacks are not applicable to the particulare situation.

As zlib is probably enabled in most systems, maybe it is best to make
the compression support a user choice and add the warning from [1]?

[1] https://tls.mbed.org/kb/how-to/deflate-compression-in-ssl-tls

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mbedtls/mbedtls.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index a8bd61f12..7171af9f9 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -42,6 +42,11 @@ endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
 MBEDTLS_DEPENDENCIES += zlib
+define MBEDTLS_ENABLE_ZLIB
+	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
+		$(@D)/include/mbedtls/config.h
+endef
+MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_ZLIB
 else
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
 endif
-- 
2.11.0
