From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 10:13:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.4.5,
 needs OpenSSL
Message-ID: <20180402081327.22491-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24

While building this defconfig

BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_OPENVPN=y

worked with OpenVPN 2.4.4, it is now broken:

In file included from crypto_openssl.c:44:0:
openssl_compat.h:717:1: error: conflicting types for 'SSL_CTX_set_min_proto_version'
 SSL_CTX_set_min_proto_version(SSL_CTX *ctx, long tls_ver_min)
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from openssl_compat.h:45:0,
                 from crypto_openssl.c:44:
/home/buildroot/br/output/host/i586-buildroot-linux-uclibc/sysroot/usr/include/openssl/ssl.h:1175:5: note: previous declaration of 'SSL_CTX_set_min_proto_version' was here
 int SSL_CTX_set_min_proto_version(SSL_CTX *ctx, uint16_t version);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from crypto_openssl.c:44:0:
openssl_compat.h:746:1: error: conflicting types for 'SSL_CTX_set_max_proto_version'
 SSL_CTX_set_max_proto_version(SSL_CTX *ctx, long tls_ver_max)
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from openssl_compat.h:45:0,
                 from crypto_openssl.c:44:
/home/buildroot/br/output/host/i586-buildroot-linux-uclibc/sysroot/usr/include/openssl/ssl.h:1176:5: note: previous declaration of 'SSL_CTX_set_max_proto_version' was here
 int SSL_CTX_set_max_proto_version(SSL_CTX *ctx, uint16_t version);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Makefile:678: recipe for target 'crypto_openssl.o' failed


Upstream does not provide support for LibreSSL, see
https://openvpn.net/index.php/download/community-downloads.html

"Please note that LibreSSL is not a supported crypto backend."

Added dependency on OpenSSL and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openvpn/Config.in    | 5 ++++-
 package/openvpn/openvpn.hash | 3 ++-
 package/openvpn/openvpn.mk   | 4 ++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 0a1675573a..f6bc776128 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,7 +1,10 @@
+comment "OpenVPN depends on SSL support provided by OpenSSL"
+	depends on !BR2_PACKAGE_LIBOPENSSL
+
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 318f9edb88..079595d440 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking signature
-sha256 96cd1b8fe1e8cb2920f07c3fd3985faea756e16fdeebd11d3e146d5bd2b04a80  openvpn-2.4.4.tar.xz
+sha256 43c0a363a332350f620d1cd93bb431e082bedbc93d4fb872f758650d53c1d29e  openvpn-2.4.5.tar.xz
+sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 086f99bf4d..58efd36336 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.4
+OPENVPN_VERSION = 2.4.5
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
-OPENVPN_DEPENDENCIES = host-pkgconf openssl
+OPENVPN_DEPENDENCIES = host-pkgconf libopenssl
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
-- 
2.14.2
