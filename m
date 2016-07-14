From: Lothar Felten <lothar.felten@gmail.com>
Date: Thu, 14 Jul 2016 14:04:46 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/ti-sgx-um: new package
In-Reply-To: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
References: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468497888-6464-2-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the userspace libraries for the SGX graphics accelerator of
the following Texas Instruments SoCs: AM335x, AM437x, AM4430, AM5430
It also adds a config file for the libraries and a System-V init script.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in                |  1 +
 package/ti-sgx-um/Config.in      | 29 +++++++++++++++++++++++++++++
 package/ti-sgx-um/S80ti-sgx      | 14 ++++++++++++++
 package/ti-sgx-um/powervr.ini    |  6 ++++++
 package/ti-sgx-um/ti-sgx-um.hash |  2 ++
 package/ti-sgx-um/ti-sgx-um.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/ti-sgx-um/Config.in
 create mode 100644 package/ti-sgx-um/S80ti-sgx
 create mode 100644 package/ti-sgx-um/powervr.ini
 create mode 100644 package/ti-sgx-um/ti-sgx-um.hash
 create mode 100644 package/ti-sgx-um/ti-sgx-um.mk

diff --git a/package/Config.in b/package/Config.in
index 592a880..91109f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,6 +452,7 @@ endmenu
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
 	source "package/ti-sgx-km/Config.in"
+	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
new file mode 100644
index 0000000..5bfb8b6
--- /dev/null
+++ b/package/ti-sgx-um/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_TI_SGX_UM
+	bool "ti-sgx-um"
+	depends on BR2_PACKAGE_TI_SGX_KM
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_OMAP
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_POWERVR
+	help
+	  Graphics libraries for TI CPUs with SGX5xx GPU.
+          This package supports AM335x, AM437x, AM4430 and AM5430.
+          It builds the kernel module and the user space binaries.
+          For older CPUs or kernels use the ti-gfx package.
+	 
+	  http://git.ti.com/graphics/omap5-sgx-ddk-um-linux
+
+if BR2_PACKAGE_TI_SGX_UM
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "ti-sgx-um"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "ti-sgx-um"
+
+config BR2_PACKAGE_PROVIDES_POWERVR
+	default "ti-sgx-um"
+
+endif
diff --git a/package/ti-sgx-um/S80ti-sgx b/package/ti-sgx-um/S80ti-sgx
new file mode 100644
index 0000000..8cae52f
--- /dev/null
+++ b/package/ti-sgx-um/S80ti-sgx
@@ -0,0 +1,14 @@
+#!/bin/sh
+case "$1" in
+  start)
+	printf "Initializing SGX graphics driver "
+	/usr/bin/pvrsrvinit
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+  ;;
+  stop)
+  ;;
+  *)
+    echo "Usage: $0 {start|stop}"
+    exit 1
+  ;;
+esac
diff --git a/package/ti-sgx-um/powervr.ini b/package/ti-sgx-um/powervr.ini
new file mode 100644
index 0000000..fc92d45
--- /dev/null
+++ b/package/ti-sgx-um/powervr.ini
@@ -0,0 +1,6 @@
+[default]
+#defaul library without double buffering:
+WindowSystem=libpvrDRMWSEGL_FRONT.so
+#alternative library, slower but with double buffering
+#WindowSystem=libpvrDRMWSEGL.so
+DisableHWTQTextureUpload=1
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
new file mode 100644
index 0000000..a6a0566
--- /dev/null
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 c17f23d255cff8fe72fc3f5cae3d7550e387af07d036954b4f08e573379406d0 ti-sgx-um-e15f1543bab4de9e8927a2c4934addf3fd16ffcb.tar.gz
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
new file mode 100644
index 0000000..f5d2327
--- /dev/null
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# ti-sgx-um
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_UM_VERSION = e15f1543bab4de9e8927a2c4934addf3fd16ffcb
+TI_SGX_UM_SITE = http://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git
+TI_SGX_UM_LICENSE = TI TSPA License
+TI_SGX_UM_LICENSE_FILES = OMAP5-Linux-Graphics-DDK-UM-Manifest.doc
+TI_SGX_UM_INSTALL_STAGING = YES
+
+# ti-sgx-um is a egl/gles provider only if libdrm is installed
+TI_SGX_UM_DEPENDENCIES = libdrm
+
+define TI_SGX_UM_INSTALL_STAGING_CMDS
+	$(MAKE) DISCIMAGE=$(STAGING_DIR) install -C $(@D)
+endef
+
+define TI_SGX_UM_INSTALL_TARGET_CMDS
+	$(MAKE) DISCIMAGE=$(TARGET_DIR) install -C $(@D)
+endef
+
+define TI_SGX_UM_INSTALL_CONF
+        # libs use the following file for configuration.
+        $(INSTALL) -D -m 0644 package/ti-sgx-um/powervr.ini \
+                $(TARGET_DIR)/etc/powervr.ini
+endef
+
+TI_SGX_UM_POST_INSTALL_TARGET_HOOKS += TI_SGX_UM_INSTALL_CONF
+
+define TI_SGX_UM_INSTALL_INIT_SYSV
+        $(INSTALL) -D -m 0755 package/ti-sgx-um/S80ti-sgx \
+                $(TARGET_DIR)/etc/init.d/S80ti-sgx
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
