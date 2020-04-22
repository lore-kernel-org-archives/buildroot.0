From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Apr 2020 21:20:57 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
Message-ID: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to enable
MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/Config.in  | 10 ++++++++++
 package/mbedtls/mbedtls.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index a39ba65d98..e48f0473b0 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -29,4 +29,14 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	  sure CRIME and similar attacks are not applicable to your
 	  particular situation.
 
+config BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
+	bool "allow X509 unsupported critical extension"
+	help
+	  If set, the X509 parser will not break-off when parsing an
+	  X509 certificate and encountering an unknown critical
+	  extension.
+
+	  Warning: Depending on your PKI use, enabling this can be a
+	  security risk!
+
 endif
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 50121fa6c7..155cb8db53 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -51,6 +51,14 @@ else
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION),y)
+define MBEDTLS_ENABLE_X509_UNSUPPORTED_CRITICAL_EXTENSION
+	$(SED) "s://#define MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION:#define MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION:" \
+		$(@D)/include/mbedtls/config.h
+endef
+MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_X509_UNSUPPORTED_CRITICAL_EXTENSION
+endif
+
 define MBEDTLS_DISABLE_ASM
 	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
 		$(@D)/include/mbedtls/config.h
-- 
2.25.1
