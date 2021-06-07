From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Mon,  7 Jun 2021 10:42:39 +0800
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.12.1
In-Reply-To: <20210607024239.2657720-1-zhaojh329@gmail.com>
References: <20210607024239.2657720-1-zhaojh329@gmail.com>
Message-ID: <20210607024239.2657720-2-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/libuhttpd/libuhttpd.hash |  2 +-
 package/libuhttpd/libuhttpd.mk   | 27 ++++++---------------------
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 4b0b5027c6..98bd6e513b 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6e7a9ad61e3d0ab5bd4d20b274b850542dff8057a8fcf6c36ce59eb34818f61f  libuhttpd-3.10.1.tar.gz
+sha256  c234dd3d491c4daa047e28870c6e740529b2eff2dd027dafb6bf02d8dba286b0  libuhttpd-3.12.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 326c78face..782e04a257 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.10.1
+LIBUHTTPD_VERSION = 3.12.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
@@ -13,34 +13,19 @@ LIBUHTTPD_DEPENDENCIES = libev
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
-LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=OFF \
-	-DUHTTPD_USE_OPENSSL=ON \
-	-DUHTTPD_USE_WOLFSSL=OFF
+LIBUHTTPD_CONF_OPTS += -DUSE_OPENSSL=ON
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 LIBUHTTPD_DEPENDENCIES += wolfssl
-LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=OFF \
-	-DUHTTPD_USE_OPENSSL=OFF \
-	-DUHTTPD_USE_WOLFSSL=ON
+LIBUHTTPD_CONF_OPTS += -DUSE_WOLFSSL=ON
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBUHTTPD_DEPENDENCIES += mbedtls
-LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=ON \
-	-DUHTTPD_USE_OPENSSL=OFF \
-	-DUHTTPD_USE_WOLFSSL=OFF
+LIBUHTTPD_CONF_OPTS += -DUSE_MBEDTLS=ON
 else
-LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
+LIBUHTTPD_CONF_OPTS += -DSSL_SUPPORT=OFF
 endif
 
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC=ON
 endif
 
 $(eval $(cmake-package))
-- 
2.25.1
