From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 28 Jul 2016 21:38:25 +0200
Subject: [Buildroot] [PATCH v3] kmsxx: new package
Message-ID: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

KMS++ is a suite of library and test tools to interact with KMS drivers in
the linux kernel.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

---
Changes from v2:
  - Dropped the python bindings
  - Rebased on top of master
  - Updated the version

 package/Config.in       |  1 +
 package/kmsxx/Config.in | 26 ++++++++++++++++++++++++++
 package/kmsxx/kmsxx.mk  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 package/kmsxx/Config.in
 create mode 100644 package/kmsxx/kmsxx.mk

diff --git a/package/Config.in b/package/Config.in
index 0f0c3769ab33..9867a84db06c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -941,6 +941,7 @@ menu "Graphics"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
+	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
new file mode 100644
index 000000000000..db3c74b45310
--- /dev/null
+++ b/package/kmsxx/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_KMSXX
+	bool "kmsxx"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
+	select BR2_PACKAGE_LIBDRM
+	help
+	  libkms++ is a C++11 library for kernel mode setting.
+
+	  Also included are simple test tools for KMS and python wrapper for
+	  libkms++.
+
+	  https://github.com/tomba/kmsxx
+
+if BR2_PACKAGE_KMSXX
+
+config BR2_PACKAGE_KMSXX_INSTALL_TESTS
+	bool "Install test programs"
+	help
+	  This option allows to install the kmsxx test programs.
+
+endif
+
+comment "kmsxx needs a toolchain w/ threads"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
new file mode 100644
index 000000000000..6eaa85452dfb
--- /dev/null
+++ b/package/kmsxx/kmsxx.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# kmsxx
+#
+################################################################################
+
+KMSXX_VERSION = a706f157b86e90696808025db01de99646d51a77
+KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
+KMSXX_LICENSE = MPLv2.0
+KMSXX_LICENSE_FILES = LICENSE
+
+KMSXX_DEPENDENCIES += libdrm
+KMSXX_CONF_OPTS += -DKMSXX_ENABLE_PYTHON=OFF
+
+ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
+define KMSXX_INSTALL_TARGET_TESTS
+	$(INSTALL) -D -m 0755 $(@D)/bin/fbtestpat \
+		$(TARGET_DIR)/usr/bin/fbtestpat
+	$(INSTALL) -D -m 0755 $(@D)/bin/kmsblank \
+		$(TARGET_DIR)/usr/bin/kmsblank
+	$(INSTALL) -D -m 0755 $(@D)/bin/kmscapture \
+		$(TARGET_DIR)/usr/bin/kmscapture
+	$(INSTALL) -D -m 0755 $(@D)/bin/kmsprint \
+		$(TARGET_DIR)/usr/bin/kmsprint
+	$(INSTALL) -D -m 0755 $(@D)/bin/kmsview \
+		$(TARGET_DIR)/usr/bin/kmsview
+	$(INSTALL) -D -m 0755 $(@D)/bin/testpat \
+		$(TARGET_DIR)/usr/bin/testpat
+	$(INSTALL) -D -m 0755 $(@D)/bin/wbcap \
+		$(TARGET_DIR)/usr/bin/wbcap
+	$(INSTALL) -D -m 0755 $(@D)/bin/wbm2m \
+		$(TARGET_DIR)/usr/bin/wbm2m
+endef
+endif
+
+define KMSXX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/libkms++.so \
+		$(TARGET_DIR)/usr/lib/libkms++.so
+	$(INSTALL) -D -m 0755 $(@D)/lib/libkms++util.so \
+		$(TARGET_DIR)/usr/lib/libkms++util.so
+
+	$(KMSXX_INSTALL_TARGET_TESTS)
+endef
+
+$(eval $(cmake-package))
-- 
2.9.2
