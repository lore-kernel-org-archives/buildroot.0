From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jun 2021 15:40:12 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.12.1
Message-ID: <20210620131454.2ABFE8A5A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d85defa7103aadc74223868fb83ed0bed144f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMake options have been renamed: UHTTPD_ prefix was dropped,
BUILD_STATIC_LIBS renamed to BUILD_STATIC.

Also fix handling of BUILD_STATIC: it should only be given when building
static libs, otherwise no dynamic lib is built.

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libuhttpd/libuhttpd.hash |  2 +-
 package/libuhttpd/libuhttpd.mk   | 40 +++++++++++++++++++++-------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 19a02e5be0..98bd6e513b 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dcd95fac7b29d43f57e942db6e9fb4c8745d4284684cd627d60c8a7f8c76cd32  libuhttpd-3.11.0.tar.gz
+sha256  c234dd3d491c4daa047e28870c6e740529b2eff2dd027dafb6bf02d8dba286b0  libuhttpd-3.12.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 61afec701e..3a99fe0613 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.11.0
+LIBUHTTPD_VERSION = 3.12.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
@@ -14,33 +14,35 @@ LIBUHTTPD_DEPENDENCIES = libev
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
 LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=OFF \
-	-DUHTTPD_USE_OPENSSL=ON \
-	-DUHTTPD_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=ON \
+	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 LIBUHTTPD_DEPENDENCIES += wolfssl
 LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=OFF \
-	-DUHTTPD_USE_OPENSSL=OFF \
-	-DUHTTPD_USE_WOLFSSL=ON
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=OFF \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=ON
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBUHTTPD_DEPENDENCIES += mbedtls
 LIBUHTTPD_CONF_OPTS += \
-	-DUHTTPD_SSL_SUPPORT=ON \
-	-DUHTTPD_USE_MBEDTLS=ON \
-	-DUHTTPD_USE_OPENSSL=OFF \
-	-DUHTTPD_USE_WOLFSSL=OFF
+	-DSSL_SUPPORT=ON \
+	-DUSE_MBEDTLS=ON \
+	-DUSE_OPENSSL=OFF \
+	-DUSE_WOLFSSL=OFF
 else
-LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
+LIBUHTTPD_CONF_OPTS += \
+	-DSSL_SUPPORT=OFF
 endif
 
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+# BUILD_STATIC builds *only* the static lib, which is not what we want for
+# BR2_SHARED_STATIC.
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC=ON
+else
+LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC=OFF
 endif
 
 $(eval $(cmake-package))
