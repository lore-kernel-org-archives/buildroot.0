From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Sun,  5 Apr 2020 01:04:28 +0800
Subject: [Buildroot] [PATCH v2 1/1] package/libuhttpd: new package
Message-ID: <20200404170428.28121-1-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>

---
Changes v1 -> v2:
  - Fix build fail when not found libdl
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libuhttpd/Config.in      |  8 +++++++
 package/libuhttpd/libuhttpd.hash |  3 +++
 package/libuhttpd/libuhttpd.mk   | 39 ++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/libuhttpd/Config.in
 create mode 100644 package/libuhttpd/libuhttpd.hash
 create mode 100644 package/libuhttpd/libuhttpd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f1bf5c263c..c34018405c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1273,6 +1273,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Jianhui Zhao <zhaojh329@gmail.com>
+F:	package/libuhttpd/
 F:	package/libuwsc/
 F:	package/rtty/
 
diff --git a/package/Config.in b/package/Config.in
index 4aaf2d93f8..09f92f0b85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1713,6 +1713,7 @@ menu "Networking"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
 	source "package/libtorrent-rasterbar/Config.in"
+	source "package/libuhttpd/Config.in"
 	source "package/libupnp/Config.in"
 	source "package/libupnp18/Config.in"
 	source "package/libupnpp/Config.in"
diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
new file mode 100644
index 0000000000..1ab39c5878
--- /dev/null
+++ b/package/libuhttpd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUHTTPD
+	bool "libuhttpd"
+	select BR2_PACKAGE_LIBEV
+	help
+	  A lightweight and fully asynchronous HTTP server
+	  library based on libev
+
+	  https://github.com/zhaojh329/libuhttpd
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
new file mode 100644
index 0000000000..65014cacf5
--- /dev/null
+++ b/package/libuhttpd/libuhttpd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 9f938b75074f812375c5079189f8299c328e94801117ab1190a29fae0806f1a8  libuhttpd-3.1.2.tar.gz
+sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
new file mode 100644
index 0000000000..ce805e8f08
--- /dev/null
+++ b/package/libuhttpd/libuhttpd.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# libuhttpd
+#
+################################################################################
+
+LIBUHTTPD_VERSION = 3.1.2
+LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
+LIBUHTTPD_LICENSE = MIT
+LIBUHTTPD_LICENSE_FILES = LICENSE
+LIBUHTTPD_INSTALL_STAGING = YES
+LIBUHTTPD_DEPENDENCIES = libev
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBUHTTPD_DEPENDENCIES += openssl
+LIBUHTTPD_CONF_OPTS += \
+	-DUHTTPD_SSL_SUPPORT=ON \
+	-DUHTTPD_USE_MBEDTLS=OFF \
+	-DUHTTPD_USE_OPENSSL=ON \
+	-DUHTTPD_USE_WOLFSSL=OFF
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+LIBUHTTPD_DEPENDENCIES += wolfssl
+LIBUHTTPD_CONF_OPTS += \
+	-DUHTTPD_SSL_SUPPORT=ON \
+	-DUHTTPD_USE_MBEDTLS=OFF \
+	-DUHTTPD_USE_OPENSSL=OFF \
+	-DUHTTPD_USE_WOLFSSL=ON
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBUHTTPD_DEPENDENCIES += mbedtls
+LIBUHTTPD_CONF_OPTS += \
+	-DUHTTPD_SSL_SUPPORT=ON \
+	-DUHTTPD_USE_MBEDTLS=ON \
+	-DUHTTPD_USE_OPENSSL=OFF \
+	-DUHTTPD_USE_WOLFSSL=OFF
+else
+LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
