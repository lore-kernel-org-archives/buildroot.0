From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 19 Nov 2016 20:35:03 +0100
Subject: [Buildroot] [PATCH v1] boringssl: new package
Message-ID: <1479584103-27488-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Not for general usage/buildroot include because the webpage states:

  Although BoringSSL is an open source project, it is not intended for
  general use, as OpenSSL is. We don't recommend that third parties depend
  upon it. Doing so is likely to be frustrating because there are no
  guarantees of API or ABI stability.

  Programs ship their own copies of BoringSSL when they use it and we
  update everything as needed when deciding to make API changes.
  This allows us to mostly avoid compromises in the name of
  compatibility. It works for us, but it may not work for you.
---
 package/Config.in              |  1 +
 package/boringssl/Config.in    | 17 +++++++++++++++++
 package/boringssl/boringssl.mk | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/boringssl/Config.in
 create mode 100644 package/boringssl/boringssl.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..0e02f10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -886,6 +886,7 @@ endmenu
 
 menu "Crypto"
 	source "package/beecrypt/Config.in"
+	source "package/boringssl/Config.in"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
 	source "package/cryptodev/Config.in"
diff --git a/package/boringssl/Config.in b/package/boringssl/Config.in
new file mode 100644
index 0000000..7b0f8b4
--- /dev/null
+++ b/package/boringssl/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_BORINGSSL
+	bool "boringssl"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	help
+	  BoringSSL is a fork of OpenSSL that is designed to meet Google's needs.
+
+	  Although BoringSSL is an open source project, it is not intended for
+	  general use, as OpenSSL is. We don't recommend that third parties depend
+	  upon it. Doing so is likely to be frustrating because there are no
+	  guarantees of API or ABI stability.
+
+	  https://boringssl.googlesource.com
+
+comment "boringssl nees a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/boringssl/boringssl.mk b/package/boringssl/boringssl.mk
new file mode 100644
index 0000000..ba9160e
--- /dev/null
+++ b/package/boringssl/boringssl.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# boringssl
+#
+################################################################################
+
+BORINGSSL_VERSION = 6f5f49f33d88f446f7f690bf991e835d5137af6c
+BORINGSSL_SITE = https://boringssl.googlesource.com/boringssl
+BORINGSSL_SITE_METHOD = git
+BORINGSSL_LICENSE = OpenSSL or SSLeay
+BORINGSSL_LICENSE_FILES = LICENSE
+BORINGSSL_INSTALL_STAGING = YES
+
+BORINGSSL_DEPENDENCIES = host-go
+
+# install to extra boringssl directory to not interfere with original openssl
+define BORINGSSL_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/boringssl
+	cp -r $(@D)/include/openssl  $(STAGING_DIR)/usr/include/boringssl
+	mkdir -p $(STAGING_DIR)/usr/lib/boringssl
+	cp $(@D)/crypto/libcrypto.so $(STAGING_DIR)/usr/lib/boringssl
+	cp $(@D)/decrepit/libdecrepit.so $(STAGING_DIR)/usr/lib/boringssl
+	cp $(@D)/ssl/libssl.so $(STAGING_DIR)/usr/lib/boringssl
+endef
+
+# install to extra boringssl directory to not interfere with original openssl
+define BORINGSSL_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/boringssl
+	cp $(@D)/crypto/libcrypto.so $(TARGET_DIR)/usr/lib/boringssl
+	cp $(@D)/decrepit/libdecrepit.so $(TARGET_DIR)/usr/lib/boringssl
+	cp $(@D)/ssl/libssl.so $(TARGET_DIR)/usr/lib/boringssl
+endef
+
+$(eval $(cmake-package))
-- 
2.8.1
