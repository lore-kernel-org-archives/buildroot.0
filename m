From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:24 +0200
Subject: [Buildroot] [PATCH 3/7] new package: ti-sgx/ti-sgx-um binary
	libraries SGX graphics accelerator
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-4-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the binary libraries required to use the SGX graphics
accelerator. It corresponds to the ti-sgx/ti-sgx-km kernel module package.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-sgx/ti-sgx-um/Config.in      |  4 +++
 package/ti-sgx/ti-sgx-um/S80ti-sgx      | 16 +++++++++++
 package/ti-sgx/ti-sgx-um/powervr.ini    |  5 ++++
 package/ti-sgx/ti-sgx-um/ti-sgx-um.hash |  2 ++
 package/ti-sgx/ti-sgx-um/ti-sgx-um.mk   | 49 +++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 package/ti-sgx/ti-sgx-um/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-um/S80ti-sgx
 create mode 100644 package/ti-sgx/ti-sgx-um/powervr.ini
 create mode 100644 package/ti-sgx/ti-sgx-um/ti-sgx-um.hash
 create mode 100644 package/ti-sgx/ti-sgx-um/ti-sgx-um.mk

diff --git a/package/ti-sgx/ti-sgx-um/Config.in b/package/ti-sgx/ti-sgx-um/Config.in
new file mode 100644
index 0000000..b6d81bd
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-um/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_TI_SGX_UM
+	bool "userspace libraries"
+	help
+	  TI SGX userspace libraries
diff --git a/package/ti-sgx/ti-sgx-um/S80ti-sgx b/package/ti-sgx/ti-sgx-um/S80ti-sgx
new file mode 100644
index 0000000..8eb497e
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-um/S80ti-sgx
@@ -0,0 +1,16 @@
+#!/bin/sh
+case "$1" in
+  start)
+
+	echo "Initializing SGX graphics driver"
+	/usr/bin/pvrsrvinit
+	echo " OK"
+
+  ;;
+  stop)
+  ;;
+  *)
+    echo "Usage: $0 {start|stop}"
+    exit 1
+  ;;
+esac
diff --git a/package/ti-sgx/ti-sgx-um/powervr.ini b/package/ti-sgx/ti-sgx-um/powervr.ini
new file mode 100644
index 0000000..1d0c5e9
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-um/powervr.ini
@@ -0,0 +1,5 @@
+[default]
+WindowSystem=libpvrDRMWSEGL_FRONT.so
+#WindowSystem=libpvrDRMWSEGL.so
+DisableHWTQTextureUpload=1
+
diff --git a/package/ti-sgx/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx/ti-sgx-um/ti-sgx-um.hash
new file mode 100644
index 0000000..a6a0566
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-um/ti-sgx-um.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 c17f23d255cff8fe72fc3f5cae3d7550e387af07d036954b4f08e573379406d0 ti-sgx-um-e15f1543bab4de9e8927a2c4934addf3fd16ffcb.tar.gz
diff --git a/package/ti-sgx/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx/ti-sgx-um/ti-sgx-um.mk
new file mode 100644
index 0000000..c1b5f9f
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-um/ti-sgx-um.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# ti-sgx-um
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_UM_VERSION = e15f1543bab4de9e8927a2c4934addf3fd16ffcb
+TI_SGX_UM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git
+TI_SGX_UM_LICENSE = TI TSPA License
+TI_SGX_UM_LICENSE_FILES = OMAP5-Linux-Graphics-DDK-UM-Manifest.doc
+TI_SGX_UM_INSTALL_STAGING = YES
+
+TI_SGX_UM_DEPENDENCIES = linux ti-sgx-km ti-sgx-libgbm
+
+TI_SGX_UM_MAKE_STAGING_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	DISCIMAGE=$(STAGING_DIR) 
+
+TI_SGX_UM_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	DISCIMAGE=$(TARGET_DIR) 
+
+define TI_SGX_UM_BUILD_CMDS
+	$(MAKE) $(TI_SGX_UM_MAKE_OPTS) -C $(@D)
+endef
+
+define TI_SGX_UM_INSTALL_STAGING_CMDS
+	$(MAKE) $(TI_SGX_UM_MAKE_STAGING_OPTS) install -C $(@D)
+endef
+
+define TI_SGX_UM_INSTALL_TARGET_CMDS
+	$(MAKE) $(TI_SGX_UM_MAKE_OPTS) install -C $(@D)
+endef
+
+define TI_SGX_UM_INSTALL_CONF_CMDS
+        # libs use the following file for configuration.
+        $(INSTALL) -D -m 0644 package/ti-sgx/ti-sgx-um/powervr.ini \
+                $(TARGET_DIR)/etc/powervr.ini
+endef
+
+define TI_SGX_UM_INSTALL_INIT_SYSV
+        $(INSTALL) -D -m 0755 package/ti-sgx/ti-sgx-um/S80ti-sgx \
+                $(TARGET_DIR)/etc/init.d/S80ti-sgx
+        $(INSTALL) -D -m 0755 package/ti-sgx/ti-sgx-um/powervr.ini \
+                $(TARGET_DIR)/etc/powervr.ini
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
