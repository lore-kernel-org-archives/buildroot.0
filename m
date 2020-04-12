From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:35:09 +0200
Subject: [Buildroot] [git commit] package/pkcs11-helper: new package
Message-ID: <20200412212155.DBE938E94B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dee4fbdf5a777aab2fb3d47128908879002aae21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkcs11-helper is a library that simplifies the interaction with
PKCS#11 providers for end-user applications. Pkcs11-helper allows
using multiple PKCS#11 providers at the same time, enumerating
available token certificates, or selecting a certificate directly by
serialized id, handling card removal and card insert events, handling
card re-insert to a different slot, supporting session expiration and
much more all using a simple API.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/pkcs11-helper/Config.in          | 19 ++++++++++++
 package/pkcs11-helper/pkcs11-helper.hash |  5 ++++
 package/pkcs11-helper/pkcs11-helper.mk   | 50 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f974f4c3e0..ac3d89dd0a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -54,6 +54,7 @@ F:	package/nginx-naxsi/
 F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
+F:	package/pkcs11-helper/
 F:	package/policycoreutils/
 F:	package/prelink-cross/
 F:	package/polkit/
diff --git a/package/Config.in b/package/Config.in
index d2b0a9c357..b5bf4e32d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1324,6 +1324,7 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
+	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/tpm2-tss/Config.in"
diff --git a/package/pkcs11-helper/Config.in b/package/pkcs11-helper/Config.in
new file mode 100644
index 0000000000..da000b7010
--- /dev/null
+++ b/package/pkcs11-helper/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PKCS11_HELPER
+	bool "pkcs11-helper"
+	help
+	  pkcs11-helper is a library that simplifies the interaction
+	  with PKCS#11 providers for end-user applications.
+
+	  pkcs11-helper allows using multiple PKCS#11 providers at the
+	  same time, enumerating available token certificates, or
+	  selecting a certificate directly by serialized id, handling
+	  card removal and card insert events, handling card re-insert
+	  to a different slot, supporting session expiration and much
+	  more all using a simple API.
+
+	  pkcs11-helper is not designed to manage card content, since
+	  object attributes are usually vendor specific, and 99% of
+	  application need to access existing objects in order to
+	  perform signature and decryption.
+
+	  https://github.com/OpenSC/pkcs11-helper
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
new file mode 100644
index 0000000000..c0411a2f45
--- /dev/null
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  fbcec9dd15a71d6ef22b09f63934c66d7d0292fefbaf3a60703ee4a9a73bf6a5  pkcs11-helper-1.25.1.tar.gz
+sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
+sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
+sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
new file mode 100644
index 0000000000..a86cabd65a
--- /dev/null
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# pkcs11-helper
+#
+################################################################################
+
+PKCS11_HELPER_VERSION = 1.25.1
+PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,pkcs11-helper-$(PKCS11_HELPER_VERSION))
+PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
+PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
+PKCS11_HELPER_AUTORECONF = YES
+PKCS11_HELPER_INSTALL_STAGING = YES
+
+PKCS11_HELPER_CONF_OPTS = \
+	--disable-crypto-engine-polarssl \
+	--disable-crypto-engine-cryptoapi
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+PKCS11_HELPER_DEPENDENCIES += gnutls
+PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-gnutls
+else
+PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+PKCS11_HELPER_DEPENDENCIES += libnss
+PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-nss
+else
+PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-nss
+endif
+
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+PKCS11_HELPER_DEPENDENCIES += mbedtls
+PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-mbedtls
+else
+PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-mbedtls
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PKCS11_HELPER_DEPENDENCIES += openssl
+PKCS11_HELPER_CONF_OPTS += \
+	--enable-openssl \
+	--enable-crypto-engine-openssl
+else
+PKCS11_HELPER_CONF_OPTS += \
+	--disable-openssl \
+	--disable-crypto-engine-openssl
+endif
+
+$(eval $(autotools-package))
