From: Ed Spiridonov <edo.rus@gmail.com>
Date: Tue, 12 May 2020 01:31:07 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
Message-ID: <20200511223108.4184-1-edo.rus@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 2.4 version, OpenVPN can be built using mbeb TLS as it's
crypto backend, instead of OpenSSL.

About 2 Mb of uncompressed image size can be saved by replacing
OpenSSL with mbed TLS.

Signed-off-by: Ed Spiridonov <edo.rus@gmail.com>
---
 DEVELOPERS                 |  3 +++
 package/openvpn/Config.in  | 24 +++++++++++++++++++++++-
 package/openvpn/openvpn.mk | 17 +++++++++++++++--
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab1..3437f31 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -719,6 +719,9 @@ F:	package/unscd/
 N:	Dushara Jayasinghe <nidujay@gmail.com>
 F:	package/prosody/
 
+N:	Ed Spiridonov <edo.rus@gmail.com>
+F:	package/openvpn/
+
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 0a16755..254fe74 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
@@ -14,6 +13,29 @@ config BR2_PACKAGE_OPENVPN
 
 if BR2_PACKAGE_OPENVPN
 
+choice
+	prompt "crypto backend"
+	default BR2_PACKAGE_OPENVPN_OPENSSL
+	help
+	  Select crypto backend (OpenSSL/LibreSSL or mbed TLS)
+
+config BR2_PACKAGE_OPENVPN_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  OpenSSL/LibreSSL is a default crypto backend
+
+config BR2_PACKAGE_OPENVPN_MBEDTLS
+	bool "mbedtls"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  mbed TLS is a compact crypto backend
+
+	  https://community.openvpn.net/openvpn/wiki/Using-mbedtls
+
+endchoice
+
+
 config BR2_PACKAGE_OPENVPN_LZ4
 	bool "LZ4 compression"
 	default y
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 4234675..20cebf0 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -7,18 +7,31 @@
 OPENVPN_VERSION = 2.4.9
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_DEPENDENCIES = host-pkgconf openssl
+OPENVPN_DEPENDENCIES = host-pkgconf
+ifeq ($(BR2_PACKAGE_OPENVPN_MBEDTLS),y)
+OPENVPN_DEPENDENCIES += mbedtls
+else
+OPENVPN_DEPENDENCIES += openssl
+endif
+
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
 	--enable-iproute2 \
-	--with-crypto-library=openssl \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
 	ROUTE=/sbin/route \
 	IPROUTE=/sbin/ip
 
+ifeq ($(BR2_PACKAGE_OPENVPN_MBEDTLS),y)
+OPENVPN_CONF_OPTS += \
+	--with-crypto-library=mbedtls
+else
+OPENVPN_CONF_OPTS += \
+	--with-crypto-library=openssl
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
 OPENVPN_CONF_OPTS += \
 	--enable-small \
-- 
2.26.2
