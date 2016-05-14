From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 10:33:47 -0300
Subject: [Buildroot] [PATCH v2 1/2] openvpn: remove polarssl crypto backend
	option
Message-ID: <1463232828-2957-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we need to bump openvpn to version 2.3.11 for security fixes
the time has come to remove the polarssl option.
Add legacy handling explaining the situation:
PolarSSL 1.2.x can coexist with mbedTLS 2.x+, but OpenVPN requires
PolarSSL/mbedTLS 1.3.x (the transition branch) >= 1.3.8 but doesn't
build/work with the 2.x series. And PolarSSL/mbedTLS 1.3.x can't coexist
with mbedTLS 2.x on the same target.
So, unfortunately, openssl is now the only option (until libressl
arrives) which means no more backend options in general.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Change for v2: remove legacy handling for openssl case.

 Config.in.legacy           | 11 +++++++++++
 package/openvpn/Config.in  | 21 +--------------------
 package/openvpn/openvpn.mk | 13 ++-----------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 824a220..b9c2f00 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,17 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL
+	bool "openvpn polarssl crypto backend removed"
+	select BR2_LEGACY
+	help
+	  The OpenVPN polarssl crypto backend option has been removed.
+	  Version from 2.3.10 onwards need polarssl >= 1.3.8 but aren't
+	  compatible with mbedtls (polarssl) series 2.x which is the
+	  version provided in buildroot. And both can't coexist.
+	  It now uses OpenSSL as the only option.
+
+
 config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
 	bool "nginx http spdy module removed"
 	select BR2_LEGACY
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 2e37125..8ba4ea1 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_OPENSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
@@ -33,24 +34,4 @@ config BR2_PACKAGE_OPENVPN_PWSAVE
 	  Allow --askpass and --auth-user-pass passwords to be read
 	  from a file.
 
-choice
-	prompt "Crypto backend"
-	default BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
-	help
-	  Select the cryptographic library to use.
-
-	config BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
-	bool "OpenSSL"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  Enable TLS-based key exchange and OpenSSL crypto support.
-
-	config BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL
-	bool "PolarSSL"
-	select BR2_PACKAGE_POLARSSL
-	help
-	  Enable TLS-based key exchange and PolarSSL crypto support.
-
-endchoice
-
 endif
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 8f02792..1d06636 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -7,12 +7,13 @@
 OPENVPN_VERSION = 2.3.9
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_DEPENDENCIES = host-pkgconf
+OPENVPN_DEPENDENCIES = host-pkgconf openssl
 OPENVPN_LICENSE = GPLv2
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
 	--disable-plugin-auth-pam \
 	--enable-iproute2 \
+	--with-crypto-library=openssl \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
@@ -47,16 +48,6 @@ else
 OPENVPN_CONF_OPTS += --disable-password-save
 endif
 
-ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
-OPENVPN_CONF_OPTS += --with-crypto-library=openssl
-OPENVPN_DEPENDENCIES += openssl
-endif
-
-ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL),y)
-OPENVPN_CONF_OPTS += --with-crypto-library=polarssl
-OPENVPN_DEPENDENCIES += polarssl
-endif
-
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
-- 
2.7.3
