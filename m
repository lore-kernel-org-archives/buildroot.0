From: dusan.ivanco at gmail.com <dusan.ivanco@gmail.com>
Date: Fri,  7 May 2021 21:19:47 +0200
Subject: [Buildroot] [PATCH] package/fscrypt: new package
Message-ID: <20210507191957.29678-1-dusan.ivanco@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Du?an Ivan?o <dusan.ivanco@gmail.com>

---
 package/Config.in            |  1 +
 package/fscrypt/Config.in    | 11 +++++++++++
 package/fscrypt/fscrypt.hash |  3 +++
 package/fscrypt/fscrypt.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/fscrypt/Config.in
 create mode 100644 package/fscrypt/fscrypt.hash
 create mode 100644 package/fscrypt/fscrypt.mk

diff --git a/package/Config.in b/package/Config.in
index 6888e824a0..bbb31a66dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -210,6 +210,7 @@ menu "Filesystem and flash utilities"
 	source "package/exfatprogs/Config.in"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
+	source "package/fscrypt/Config.in"
 	source "package/fscryptctl/Config.in"
 	source "package/fuse-overlayfs/Config.in"
 	source "package/fwup/Config.in"
diff --git a/package/fscrypt/Config.in b/package/fscrypt/Config.in
new file mode 100644
index 0000000000..17abe021af
--- /dev/null
+++ b/package/fscrypt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FSCRYPT
+	bool "fscrypt"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LINUX_PAM
+	help
+	  fscrypt is a high-level tool for the
+	  management of Linux filesystem encryption
+
+	  https://github.com/google/fscrypt
diff --git a/package/fscrypt/fscrypt.hash b/package/fscrypt/fscrypt.hash
new file mode 100644
index 0000000000..7a50a55015
--- /dev/null
+++ b/package/fscrypt/fscrypt.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 0d6e79ef73c996f9cab2436fd3f446bb89a2d2b36b64a97743d6274d6445e922  fscrypt-0.3.0.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscrypt/fscrypt.mk b/package/fscrypt/fscrypt.mk
new file mode 100644
index 0000000000..2f67f2ed75
--- /dev/null
+++ b/package/fscrypt/fscrypt.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# fscrypt
+#
+################################################################################
+
+FSCRYPT_VERSION = 0.3.0
+FSCRYPT_SITE = $(call github,google,fscrypt,v$(FSCRYPT_VERSION))
+FSCRYPT_LICENSE = Apache-2.0
+FSCRYPT_LICENSE_FILES = LICENSE
+FSCRYPT_DEPENDENCIES = host-go linux-pam
+FSCRYPT_MAKE_ENV = GOOS=linux GOARCH=arm CGO_ENABLED=1
+
+define FSCRYPT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FS_ENCRYPTION)
+endef
+
+define FSCRYPT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(FSCRYPT_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define FSCRYPT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/fscrypt $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0755 $(@D)/bin/pam_fscrypt.so $(TARGET_DIR)/usr/lib/security
+endef
+
+$(eval $(generic-package))
-- 
2.21.1 (Apple Git-122.3)
