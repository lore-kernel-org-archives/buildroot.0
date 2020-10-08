From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:05:39 +0200
Subject: [Buildroot] [git commit] package/strongswan: bump to version 5.9.0
Message-ID: <20201008195634.E804982875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da912a3d2abe2eb2b338c03ec56c7e39a4d640f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- wolfssl is an optional dependency since version 5.8.0 and
  https://github.com/strongswan/strongswan/commit/c92eade82c814e9f6b55f80d715bb51d28d5e1fb
- Update indentation of hash file (two spaces)

https://wiki.strongswan.org/versions/78

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/Config.in       |  4 ++++
 package/strongswan/strongswan.hash | 12 +++++-------
 package/strongswan/strongswan.mk   | 14 ++++----------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 0438eeced6..47c7107f59 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -44,6 +44,10 @@ config BR2_PACKAGE_STRONGSWAN_GMP
 	bool "GNU MP (libgmp)"
 	select BR2_PACKAGE_GMP
 
+config BR2_PACKAGE_STRONGSWAN_WOLFSSL
+	bool "wolfssl"
+	select BR2_PACKAGE_WOLFSSL
+
 endchoice
 
 config BR2_PACKAGE_STRONGSWAN_AF_ALG
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 4d1a593a5c..aa25d81f46 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,9 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.6.3.tar.bz2.md5
-md5	a6a28eeb22aa58080a7581771a5b63f9	strongswan-5.6.3.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.0.tar.bz2.md5
+md5  705628cddd5b7683ef8a688acd9514d8  strongswan-5.9.0.tar.bz2
 # Calculated based on the hash above
-sha256	c3c7dc8201f40625bba92ffd32eb602a8909210d8b3fac4d214c737ce079bf24	strongswan-5.6.3.tar.bz2
+sha256  72b47a385da5d1532b816d9fe04c50d074c29ed42ea3f0878fbd66335917bb66  strongswan-5.9.0.tar.bz2
 # Locally calculated
-sha256	e66c243593ee0713f5fd13bcd7f624bc50eebc54bf87f790ced429ff698077e7  strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
-sha256	415d104717cb0781770e9077d00b3df310b11e65e4b9c1d35b62fbba04549263  strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256	2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 7f1752ce57..a0290c5bf6 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.6.3
+STRONGSWAN_VERSION = 5.9.0
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
-STRONGSWAN_PATCH = \
-	$(STRONGSWAN_SITE)/patches/27_gmp_pkcs1_verify_patch/strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch \
-	$(STRONGSWAN_SITE)/patches/28_gmp_pkcs1_overflow_patch/strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
@@ -38,16 +35,12 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
+	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
 	--with-ipseclibdir=/usr/lib \
 	--with-plugindir=/usr/lib/ipsec/plugins \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
 	--with-dev-headers=/usr/include
 
-# strongswan-5.6.1-5.6.3_gmp-pkcs1-verify.patch
-STRONGSWAN_IGNORE_CVES += CVE-2018-16151 CVE-2018-16152
-# strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
-STRONGSWAN_IGNORE_CVES += CVE-2018-17540
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
@@ -80,7 +73,8 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2) \
-	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite)
+	$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite) \
+	$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),wolfssl)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
 STRONGSWAN_DEPENDENCIES += \
