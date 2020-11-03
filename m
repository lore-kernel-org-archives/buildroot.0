From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 23:22:54 +0100
Subject: [Buildroot] [git commit] package/openvpn: add mbedtls support
Message-ID: <20201103220958.C72A083616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b11f92ff0ec878efd37523e11f70edd305d80f37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls (former polarssl) support was dropped with commit
3380da69c5ab490e5c51dca0c4389b0da91743d0

Put it back as openvpn supports mbedtls 2.x since version 2.4.0 and
https://github.com/OpenVPN/openvpn/commit/86d8cd6860dfc74cb1a040ff8fe03140ebe7f930

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/Config.in  |  2 +-
 package/openvpn/openvpn.mk | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 0a1675573a..3f4a617fb7 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 4234675d9f..1008c47b5a 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -7,12 +7,11 @@
 OPENVPN_VERSION = 2.4.9
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_DEPENDENCIES = host-pkgconf openssl
+OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
 	--enable-iproute2 \
-	--with-crypto-library=openssl \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
@@ -51,6 +50,14 @@ else
 OPENVPN_CONF_OPTS += --disable-plugin-auth-pam
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENVPN_DEPENDENCIES += openssl
+OPENVPN_CONF_OPTS += --with-crypto-library=openssl
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+OPENVPN_DEPENDENCIES += mbedtls
+OPENVPN_CONF_OPTS += --with-crypto-library=mbedtls
+endif
+
 ifeq ($(BR2_PACKAGE_PKCS11_HELPER),y)
 OPENVPN_DEPENDENCIES += pkcs11-helper
 OPENVPN_CONF_OPTS += --enable-pkcs11
