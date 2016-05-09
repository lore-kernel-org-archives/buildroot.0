From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  9 May 2016 10:38:55 +0200
Subject: [Buildroot] [PATCH v2] kmsxx: new package
Message-ID: <1462783135-16131-1-git-send-email-maxime.ripard@free-electrons.com>
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
  - Added support for the python bindings
  - Added extra dependencies (gcc 4.8, libstdc++ installation)

 package/Config.in       |  1 +
 package/kmsxx/Config.in | 32 ++++++++++++++++++++++++++++
 package/kmsxx/kmsxx.mk  | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 package/kmsxx/Config.in
 create mode 100644 package/kmsxx/kmsxx.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad3364994..4bb60ead530b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -867,6 +867,7 @@ menu "Graphics"
 	source "package/imlib2/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
+	source "package/kmsxx/Config.in"
 	source "package/lcms2/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
new file mode 100644
index 000000000000..748f65342f3d
--- /dev/null
+++ b/package/kmsxx/Config.in
@@ -0,0 +1,32 @@
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
+config BR2_PACKAGE_KMSXX_BINDINGS_PYTHON
+	bool "Install Python bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Install the python bindings
+
+endif
+
+comment "kmsxx needs a toolchain w/ threads"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
new file mode 100644
index 000000000000..218a2a5e710a
--- /dev/null
+++ b/package/kmsxx/kmsxx.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# kmsxx
+#
+################################################################################
+
+KMSXX_VERSION = bef0109aa93971dd6cc6040661dc6494533e6bee
+KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
+KMSXX_LICENSE = MPLv2.0
+KMSXX_LICENSE_FILES = LICENSE
+
+KMSXX_DEPENDENCIES += libdrm
+
+ifeq ($(BR2_PACKAGE_KMSXX_BINDINGS_PYTHON),y)
+KMSXX_DEPENDENCIES += python3 host-swig
+KMSXX_CONF_OPTS += -DLIBKMS_ENABLE_PYTHON=ON
+
+define KMSXX_INSTALL_TARGET_BINDINGS
+	$(INSTALL) -D -m 0755 $(@D)/py/_pykms.so \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/_pykms.so
+	$(INSTALL) -D -m 0755 $(@D)/py/pykms.py \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pykms.py
+endef
+else
+KMSXX_CONF_OPTS += -DLIBKMS_ENABLE_PYTHON=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
+define KMSXX_INSTALL_TARGET_TESTS
+	$(INSTALL) -D -m 0755 $(@D)/tests/db \
+		$(TARGET_DIR)/usr/bin/db
+	$(INSTALL) -D -m 0755 $(@D)/tests/fbtestpat \
+		$(TARGET_DIR)/usr/bin/fbtestpat
+	$(INSTALL) -D -m 0755 $(@D)/tests/kmscapture \
+		$(TARGET_DIR)/usr/bin/kmscapture
+	$(INSTALL) -D -m 0755 $(@D)/tests/kmsprint \
+		$(TARGET_DIR)/usr/bin/kmsprint
+	$(INSTALL) -D -m 0755 $(@D)/tests/kmsview \
+		$(TARGET_DIR)/usr/bin/kmsview
+	$(INSTALL) -D -m 0755 $(@D)/tests/testpat \
+		$(TARGET_DIR)/usr/bin/testpat
+endef
+endif
+
+define KMSXX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libkms++/libkms++.so \
+		$(TARGET_DIR)/usr/lib/libkms++.so
+	$(INSTALL) -D -m 0755 $(@D)/libkmstest/libkmstest.so \
+		$(TARGET_DIR)/usr/lib/libkmstest.so
+
+	$(KMSXX_INSTALL_TARGET_TESTS)
+	$(KMSXX_INSTALL_TARGET_BINDINGS)
+endef
+
+$(eval $(cmake-package))
-- 
2.8.2
