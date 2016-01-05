From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Jan 2016 09:35:40 -0300
Subject: [Buildroot] [PATCH 2/2] openssl: remove additional engines option
In-Reply-To: <1451997340-4430-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451997340-4430-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1451997340-4430-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the libssl virtual and libressl inclusion, also
keeping with the KISS principle the engines can be removed in a
post-build script if need be, so remove the option and add it in legacy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy           | 8 ++++++++
 package/bind/bind.mk       | 9 ++-------
 package/openssl/Config.in  | 9 ---------
 package/openssl/openssl.mk | 7 -------
 4 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3bcd50d..45b5e23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_OPENSSL_ENGINES
+	bool "openssl additional engines option removed"
+	select BR2_LEGACY
+	help
+	  The openssl additional engines option has been removed. You
+	  can remove them from a post-build script if your target space
+	  is too constrained.
+
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary option removed"
 	select BR2_LEGACY
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2a06599..4d3fa86 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -52,13 +52,8 @@ BIND_CONF_ENV += \
 	ac_cv_func_EVP_sha512=yes
 BIND_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
-	--with-ecdsa=yes
-# GOST cipher support requires openssl extra engines
-ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-BIND_CONF_OPTS += --with-gost=yes
-else
-BIND_CONF_OPTS += --with-gost=no
-endif
+	--with-ecdsa=yes \
+	--with-gost=yes
 else
 BIND_CONF_OPTS += --with-openssl=no
 endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index dfbc850..baca05c 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -10,12 +10,3 @@ config BR2_PACKAGE_OPENSSL
 	  http://www.openssl.org/
 
 	  Note: Some helper scripts need perl.
-
-if BR2_PACKAGE_OPENSSL
-
-config BR2_PACKAGE_OPENSSL_ENGINES
-	bool "openssl additional engines"
-	help
-	  Install additional encryption engine libraries.
-
-endif
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 1e5ea9b..2c8a96f 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -151,12 +151,5 @@ endef
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_PERL_SCRIPTS
 endif
 
-ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-define OPENSSL_REMOVE_OPENSSL_ENGINES
-	rm -rf $(TARGET_DIR)/usr/lib/engines
-endef
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_ENGINES
-endif
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.4.10
