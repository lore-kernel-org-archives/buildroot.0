From: =?UTF-8?B?6LW15bu66L6J?= <zhaojh329@gmail.com>
Date: Tue, 3 Sep 2019 16:29:55 +0800
Subject: [Buildroot] [PATCH 1/1] libuwsc: new package
Message-ID: <CAGN0SiEwA6n-8wwmeLzNQoW16TAbRX7MmS_DmRpnrCOzost=vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: ??? <zhaojh329@gmail.com>
---
 package/Config.in            |  1 +
 package/libuwsc/Config.in    | 39 +++++++++++++++++++++++++++++++++
 package/libuwsc/libuwsc.hash |  3 +++
 package/libuwsc/libuwsc.mk   | 42 ++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/libuwsc/Config.in
 create mode 100644 package/libuwsc/libuwsc.hash
 create mode 100644 package/libuwsc/libuwsc.mk

diff --git a/package/Config.in b/package/Config.in
index 710ed12be0..d1ea644cd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1622,6 +1622,7 @@ menu "Networking"
        source "package/libupnp18/Config.in"
        source "package/libupnpp/Config.in"
        source "package/liburiparser/Config.in"
+       source "package/libuwsc/Config.in"
        source "package/libvncserver/Config.in"
        source "package/libwebsock/Config.in"
        source "package/libwebsockets/Config.in"
diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
new file mode 100644
index 0000000000..51a9acf8b1
--- /dev/null
+++ b/package/libuwsc/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_LIBUWSC
+       bool "libuwsc"
+       select BR2_PACKAGE_LIBEV
+       help
+         A Lightweight and fully asynchronous WebSocket client
+         library based on libev.
+
+         https://github.com/zhaojh329/libuwsc
+
+if BR2_PACKAGE_LIBUWSC
+
+config BR2_PACKAGE_LIBUWSC_TLS_SUPPORT
+       bool
+       default y if BR2_PACKAGE_OPENSSL
+       default y if BR2_PACKAGE_WOLFSSL
+       default y if BR2_PACKAGE_MBEDTLS
+
+choice
+       prompt "SSL/TLS library to use"
+       depends on BR2_PACKAGE_LIBUWSC_TLS_SUPPORT
+
+config BR2_PACKAGE_LIBUWSC_OPENSSL
+       bool "OpenSSL"
+       depends on BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_LIBUWSC_WOLFSSL
+       bool "wolfssl"
+       depends on BR2_PACKAGE_WOLFSSL
+
+config BR2_PACKAGE_LIBUWSC_MBEDTLS
+       bool "mbedtls"
+       depends on BR2_PACKAGE_MBEDTLS
+
+endchoice
+
+comment "A TLS library is needed for SSL/TLS support"
+       depends on !BR2_PACKAGE_LIBUWSC_TLS_SUPPORT
+
+endif
diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
new file mode 100644
index 0000000000..f137b3613b
--- /dev/null
+++ b/package/libuwsc/libuwsc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 bae2cd13eda86876ebcf99a38a069f5e8c01717713d2fec25031051b9c47624b
 libuwsc-3.3.2.tar.gz
+sha256 e557975decde6439395e72dce7690d974d1a493722a7be5228794ec944f0c5db
 LICENSE
diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
new file mode 100644
index 0000000000..31fddc648f
--- /dev/null
+++ b/package/libuwsc/libuwsc.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# libuwsc
+#
+################################################################################
+
+LIBUWSC_VERSION = 3.3.2
+LIBUWSC_SITE =
https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
+LIBUWSC_LICENSE = MIT
+LIBUWSC_LICENSE_FILES = LICENSE
+LIBUWSC_INSTALL_STAGING = YES
+LIBUWSC_DEPENDENCIES = libev
+
+ifeq ($(BR2_PACKAGE_LIBUWSC_OPENSSL),y)
+LIBUWSC_DEPENDENCIES += openssl
+LIBUWSC_CONF_OPTS += -DUWSC_USE_OPENSSL=ON
+else
+LIBUWSC_CONF_OPTS += -DUWSC_USE_OPENSSL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUWSC_WOLFSSL),y)
+LIBUWSC_DEPENDENCIES += wolfssl
+LIBUWSC_CONF_OPTS += -DUWSC_USE_WOLFSSL=ON
+else
+LIBUWSC_CONF_OPTS += -DUWSC_USE_WOLFSSL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUWSC_MBEDTLS),y)
+LIBUWSC_DEPENDENCIES += mbedtls
+LIBUWSC_CONF_OPTS += -DUWSC_USE_MBEDTLS=ON
+else
+LIBUWSC_CONF_OPTS += -DUWSC_USE_MBEDTLS=OFF
+endif
+
+ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_2),yy)
+LIBUWSC_DEPENDENCIES += lua
+LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=ON
+else
+LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
