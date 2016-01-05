From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Jan 2016 09:35:39 -0300
Subject: [Buildroot] [PATCH 1/2] openssl: remove binary install option
Message-ID: <1451997340-4430-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the libssl virtual and libressl inclusion, also
keeping with the KISS principle the binary can be removed in a
post-build script if need be, so remove the option and add it in legacy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy           | 8 ++++++++
 package/openssl/Config.in  | 7 -------
 package/openssl/openssl.mk | 8 --------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2e6062c..3bcd50d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_OPENSSL_BIN
+	bool "openssl binary option removed"
+	select BR2_LEGACY
+	help
+	  The openssl binary option has been removed. You can remove the
+	  binary from a post-build script if your target space is too
+	  constrained.
+
 config BR2_PACKAGE_PYTHON_PYXML
 	bool "python-pyxml package has been removed"
 	select BR2_LEGACY
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index e08b648..dfbc850 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -13,13 +13,6 @@ config BR2_PACKAGE_OPENSSL
 
 if BR2_PACKAGE_OPENSSL
 
-config BR2_PACKAGE_OPENSSL_BIN
-	bool "openssl binary"
-	help
-	  Install the openssl binary and the associated helper scripts to the
-	  target file system. This is a command line tool for doing various
-	  cryptographic stuff.
-
 config BR2_PACKAGE_OPENSSL_ENGINES
 	bool "openssl additional engines"
 	help
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index c3ea08d..1e5ea9b 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -151,14 +151,6 @@ endef
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_PERL_SCRIPTS
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
-define OPENSSL_REMOVE_BIN
-	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
-	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
-endef
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_BIN
-endif
-
 ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 define OPENSSL_REMOVE_OPENSSL_ENGINES
 	rm -rf $(TARGET_DIR)/usr/lib/engines
-- 
2.4.10
