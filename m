From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 21:43:45 +0100
Subject: [Buildroot] [git commit] package/rtty: add optional SSL support
Message-ID: <20200322203039.DE69E846EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fffd917eba275c151cc4ee525921a456058f595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds optional dependencies on mbedtls, openssl or wolfssl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/rtty.mk | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 21ba385018..bcd0fb3625 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -9,6 +9,30 @@ RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
 RTTY_DEPENDENCIES = libev
-RTTY_CONF_OPTS = -DRTTY_SSL_SUPPORT=OFF
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+RTTY_DEPENDENCIES += mbedtls
+RTTY_CONF_OPTS += \
+	-DRTTY_SSL_SUPPORT=ON \
+	-DRTTY_USE_MBEDTLS=ON \
+	-DRTTY_USE_OPENSSL=OFF \
+	-DRTTY_USE_WOLFSSL=OFF
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RTTY_DEPENDENCIES += openssl
+RTTY_CONF_OPTS += \
+	-DRTTY_SSL_SUPPORT=ON \
+	-DRTTY_USE_MBEDTLS=OFF \
+	-DRTTY_USE_OPENSSL=ON \
+	-DRTTY_USE_WOLFSSL=OFF
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+RTTY_DEPENDENCIES += wolfssl
+RTTY_CONF_OPTS += \
+	-DRTTY_SSL_SUPPORT=ON \
+	-DRTTY_USE_MBEDTLS=OFF \
+	-DRTTY_USE_OPENSSL=OFF \
+	-DRTTY_USE_WOLFSSL=ON
+else
+RTTY_CONF_OPTS += -DRTTY_SSL_SUPPORT=OFF
+endif
 
 $(eval $(cmake-package))
