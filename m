From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 13:53:01 +0100
Subject: [Buildroot] [git commit] package/mbedtls: fix zlib support
Message-ID: <20170206125757.2CA0F81DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1a77961c1aca6cd50e3ad44b5b39350f1070286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To enable compression support using zlib it is necessary to uncomment
the define for MBEDTLS_ZLIB_SUPPORT in config.h [1].

Note, that enabling TLS compression may make mbedTLS vulnerable to the
CRIME attack [1]. It should not be enabled unless is is sure CRIME and
similar attacks are not applicable to the particulare situation.

As zlib is probably enabled in most systems, maybe it is best to make
the compression support a user choice and add the warning from [1]?

[1] https://tls.mbed.org/kb/how-to/deflate-compression-in-ssl-tls

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mbedtls/mbedtls.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index a8bd61f..7171af9 100644
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
