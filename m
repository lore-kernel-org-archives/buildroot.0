From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 25 May 2015 19:20:25 +0200
Subject: [Buildroot] [PATCH] openssl: always install openssl.cnf
Message-ID: <1432574426-17098-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install openssl.cnf even when the OpenSSL binary is not selected,
because other packages that use the OpenSSL library may use it as
well.

E.g. PHP's methods to programmatically create private keys and
certificates depend on it.
See: http://php.net/manual/en/function.openssl-pkey-new.php

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/openssl/openssl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index f90c811..9cbf42d 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -19,7 +19,13 @@ define OPENSSL_DISABLE_APPS
 	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
 	$(SED) '/^DIRS=/ s/apps//' $(@D)/Makefile.org
 endef
+# Do always install openssl.cnf as other packages may depend on it
+define OPENSSL_INSTALL_CNF
+	$(INSTALL) -m 0644 $(@D)/apps/openssl.cnf \
+		$(TARGET_DIR)/etc/ssl/openssl.cnf
+endef
 OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
+OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_CNF
 endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-- 
2.1.4
