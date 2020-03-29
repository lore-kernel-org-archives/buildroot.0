From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 23:18:26 +0200
Subject: [Buildroot] [git commit] package/libuwsc: new package
Message-ID: <20200329210534.2C59A8366C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=120c04775d7ebe5a2cfc14848f5d11f3a333970b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui zhao <zhaojh329@gmail.com>
[Thomas:
 - add entry in DEVELOPERS file
 - be more explicit with SSL options
 - drop logic around luainterpreter since luajit is not properly
   detected]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libuwsc/Config.in    |  8 ++++++++
 package/libuwsc/libuwsc.hash |  3 +++
 package/libuwsc/libuwsc.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d4718a1ef..f1bf5c263c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1273,6 +1273,7 @@ F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
 N:	Jianhui Zhao <zhaojh329@gmail.com>
+F:	package/libuwsc/
 F:	package/rtty/
 
 N:	Joao Pinto <jpinto@synopsys.com>
diff --git a/package/Config.in b/package/Config.in
index b81952b5e1..4aaf2d93f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1717,6 +1717,7 @@ menu "Networking"
 	source "package/libupnp18/Config.in"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
+	source "package/libuwsc/Config.in"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
new file mode 100644
index 0000000000..ae99b6d2dc
--- /dev/null
+++ b/package/libuwsc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUWSC
+	bool "libuwsc"
+	select BR2_PACKAGE_LIBEV
+	help
+	  A Lightweight and fully asynchronous WebSocket client
+	  library based on libev.
+
+	  https://github.com/zhaojh329/libuwsc
diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
new file mode 100644
index 0000000000..f137b3613b
--- /dev/null
+++ b/package/libuwsc/libuwsc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 bae2cd13eda86876ebcf99a38a069f5e8c01717713d2fec25031051b9c47624b  libuwsc-3.3.2.tar.gz
+sha256 e557975decde6439395e72dce7690d974d1a493722a7be5228794ec944f0c5db  LICENSE
diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
new file mode 100644
index 0000000000..213b1d5891
--- /dev/null
+++ b/package/libuwsc/libuwsc.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# libuwsc
+#
+################################################################################
+
+LIBUWSC_VERSION = 3.3.2
+LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
+LIBUWSC_LICENSE = MIT
+LIBUWSC_LICENSE_FILES = LICENSE
+LIBUWSC_INSTALL_STAGING = YES
+LIBUWSC_DEPENDENCIES = libev
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBUWSC_DEPENDENCIES += openssl
+LIBUWSC_CONF_OPTS += \
+	-DUWSC_SSL_SUPPORT=ON \
+	-DUWSC_USE_MBEDTLS=OFF \
+	-DUWSC_USE_OPENSSL=ON \
+	-DUWSC_USE_WOLFSSL=OFF
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+LIBUWSC_DEPENDENCIES += wolfssl
+LIBUWSC_CONF_OPTS += \
+	-DUWSC_SSL_SUPPORT=ON \
+	-DUWSC_USE_MBEDTLS=OFF \
+	-DUWSC_USE_OPENSSL=OFF \
+	-DUWSC_USE_WOLFSSL=ON
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBUWSC_DEPENDENCIES += mbedtls
+LIBUWSC_CONF_OPTS += \
+	-DUWSC_SSL_SUPPORT=ON \
+	-DUWSC_USE_MBEDTLS=ON \
+	-DUWSC_USE_OPENSSL=OFF \
+	-DUWSC_USE_WOLFSSL=OFF
+else
+LIBUWSC_CONF_OPTS += -DUWSC_SSL_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+LIBUWSC_DEPENDENCIES += lua
+LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=ON
+else
+LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
