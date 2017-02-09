From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  9 Feb 2017 14:45:55 +0100
Subject: [Buildroot] [PATCH 1/4] libscrypt: New package
Message-ID: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/Config.in                |  1 +
 package/libscrypt/Config.in      |  7 +++++++
 package/libscrypt/libscrypt.hash |  2 ++
 package/libscrypt/libscrypt.mk   | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/libscrypt/Config.in
 create mode 100644 package/libscrypt/libscrypt.hash
 create mode 100644 package/libscrypt/libscrypt.mk

diff --git a/package/Config.in b/package/Config.in
index 114a5ad..4a95749 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -928,6 +928,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
 	source "package/libsodium/Config.in"
diff --git a/package/libscrypt/Config.in b/package/libscrypt/Config.in
new file mode 100644
index 0000000..c443d0d
--- /dev/null
+++ b/package/libscrypt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBSCRYPT
+	bool "libscrypt"
+	help
+	  This is a library that implements the secure password
+	  hashing function "scrypt".
+
+	  http://www.lolware.net/libscrypt.html
diff --git a/package/libscrypt/libscrypt.hash b/package/libscrypt/libscrypt.hash
new file mode 100644
index 0000000..920d752
--- /dev/null
+++ b/package/libscrypt/libscrypt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	68e377e79745c10d489b759b970e52d819dbb80dd8ca61f8c975185df3f457d3	v1.21.tar.gz
diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
new file mode 100644
index 0000000..5da9928
--- /dev/null
+++ b/package/libscrypt/libscrypt.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libscrypt
+#
+################################################################################
+
+LIBSCRYPT_VERSION = 1.21
+LIBSCRYPT_SOURCE = v$(LIBSCRYPT_VERSION).tar.gz
+LIBSCRYPT_SITE = https://github.com/technion/libscrypt/archive
+LIBSCRYPT_LICENSE = BSD
+LIBSCRYPT_INSTALL_STAGING = YES
+
+define LIBSCRYPT_DISABLE_STACK_PROTECTOR
+	$(SED) 's/-fstack-protector//g' $(@D)/Makefile
+endef
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+LIBSCRYPT_POST_EXTRACT_HOOKS += LIBSCRYPT_DISABLE_STACK_PROTECTOR
+endif
+
+define LIBSCRYPT_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
+endef
+
+define LIBSCRYPT_INSTALL_STAGING_CMDS
+        $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBSCRYPT_INSTALL_TARGET_CMDS
+        $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
