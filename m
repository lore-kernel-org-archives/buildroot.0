From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 29 Oct 2019 17:56:03 -0700
Subject: [Buildroot] [PATCH v2] pkcs11-helper: new package
In-Reply-To: <20191030005604.81615-1-aduskett@gmail.com>
References: <20191030005604.81615-1-aduskett@gmail.com>
Message-ID: <20191030005604.81615-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

pkcs11-helper is a library that simplifies the interaction with PKCS#11
providers for end-user applications. Pkcs11-helper allows using multiple
PKCS#11 providers at the same time, enumerating available token
certificates, or selecting a certificate directly by serialized id, handling
card removal and card insert events, handling card re-insert to a different
slot, supporting session expiration and much more all using a simple API.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Moved the pkcs11-helper- prefix from PKCS11_HELPER_VERSION to
    PKCS11_HELPER_SITE. (Arnout)
  - Changed PKCS11_HELPER_LICENSE to read GPL-2.0 or BSD-3-Clause. (Arnout)
  - Added COPYING.BSD and COPYING.GPL to PKCS11_HELPER_LICENSE_FILES. (Arnout)
  - Removed --disable-dependency-tracking from PKCS11_HELPER_CONF_OPTS. (Arnout)

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/pkcs11-helper/Config.in          | 51 ++++++++++++++++++++++++
 package/pkcs11-helper/pkcs11-helper.hash |  5 +++
 package/pkcs11-helper/pkcs11-helper.mk   | 50 +++++++++++++++++++++++
 5 files changed, 108 insertions(+)
 create mode 100644 package/pkcs11-helper/Config.in
 create mode 100644 package/pkcs11-helper/pkcs11-helper.hash
 create mode 100644 package/pkcs11-helper/pkcs11-helper.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cdd44be37c..32e8d5ee8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -52,6 +52,7 @@ F:	package/nginx-naxsi/
 F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
+F:	package/pkcs11-helper/
 F:	package/policycoreutils/
 F:	package/python3/
 F:	package/python-aioredis/
diff --git a/package/Config.in b/package/Config.in
index dc5ec56d6b..c1f8d2dcbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1259,6 +1259,7 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
+	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/tpm2-tss/Config.in"
diff --git a/package/pkcs11-helper/Config.in b/package/pkcs11-helper/Config.in
new file mode 100644
index 0000000000..4ed9217fa9
--- /dev/null
+++ b/package/pkcs11-helper/Config.in
@@ -0,0 +1,51 @@
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
+
+if BR2_PACKAGE_PKCS11_HELPER
+
+config BR2_PACKAGE_PKCS11_HELPER_GNUTLS_ENGINE
+	bool "gnutls engine support"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+
+comment "gnutls support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_PKCS11_HELPER_MBEDTLS_ENGINE
+	bool "mbedtls engine support"
+	select BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_PKCS11_HELPER_NSS_ENGINE
+	bool "nss engine support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBNSS
+
+comment "nss support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_PKCS11_HELPER_OPENSSL_ENGINE
+	bool "openssl engine support"
+	select BR2_PACKAGE_OPENSSL
+
+endif
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
index 0000000000..7a81c917e9
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
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER_GNUTLS_ENGINE),y)
+PKCS11_HELPER_DEPENDENCIES += gnutls
+PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-gnutls
+else
+PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER_NSS_ENGINE),y)
+PKCS11_HELPER_DEPENDENCIES += libnss
+PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-nss
+else
+PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-nss
+endif
+
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER_MBEDTLS_ENGINE),y)
+PKCS11_HELPER_DEPENDENCIES += mbedtls
+PKCS11_HELPER_CONF_OPTS += --enable-crypto-engine-mbedtls
+else
+PKCS11_HELPER_CONF_OPTS += --disable-crypto-engine-mbedtls
+endif
+
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER_OPENSSL_ENGINE),y)
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
-- 
2.23.0
