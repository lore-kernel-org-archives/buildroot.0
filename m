From: Lothar Felten <lothar.felten@gmail.com>
Date: Thu, 14 Jul 2016 14:04:45 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/ti-sgx-km: new package
Message-ID: <1468497888-6464-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the kernel module for the SGX graphics accelerator of the
following Texas Instuments SoCs: AM335x, AM437x, AM4430, AM5430

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in                |  1 +
 package/ti-sgx-km/Config.in      | 42 +++++++++++++++++++++++++++++++++++++++
 package/ti-sgx-km/ti-sgx-km.hash |  2 ++
 package/ti-sgx-km/ti-sgx-km.mk   | 43 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/ti-sgx-km/Config.in
 create mode 100644 package/ti-sgx-km/ti-sgx-km.hash
 create mode 100644 package/ti-sgx-km/ti-sgx-km.mk

diff --git a/package/Config.in b/package/Config.in
index 7d6924c..592a880 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-sgx-km/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
new file mode 100644
index 0000000..7e5d7f2
--- /dev/null
+++ b/package/ti-sgx-km/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_TI_SGX_KM
+	bool "ti-sgx-km"
+	depends on BR2_LINUX_KERNEL && BR2_arm
+	select BR2_LINUX_NEEDS_MODULES
+	help
+	  Kernel modules for TI CPUs with SGX GPU.
+	  This package supports AM335x, AM437x, AM4430 and AM5430.
+	  It builds the kernel module and the user space binaries.
+	  For older CPUs or kernels use the ti-gfx package.
+	  
+	  http://git.ti.com/graphics/omap5-sgx-ddk-linux
+
+if BR2_PACKAGE_TI_SGX_KM
+
+choice
+	prompt "Target"
+	default BR2_PACKAGE_TI_SGX_AM335X
+	help
+	  Select the SOC for which you would like to install drivers.
+
+config BR2_PACKAGE_TI_SGX_AM335X
+	bool "AM335x"
+	help
+	  AM335x CPU
+
+config BR2_PACKAGE_TI_SGX_AM437X
+	bool "AM437x"
+	help
+	  AM437x CPU
+
+config BR2_PACKAGE_TI_SGX_AM4430
+	bool "AM4430"
+	help
+	  AM4430 CPU
+
+config BR2_PACKAGE_TI_SGX_AM5430
+	bool "AM5430"
+	help
+	  AM5430 CPU
+
+endchoice
+endif 
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
new file mode 100644
index 0000000..7f7e0ac
--- /dev/null
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 47728ff8fc48827116cc042efa777a22a83dd4bd17c494e2a53b8c204ca59624 ti-sgx-km-2b7523d07a13ab704a24a7664749551f4a13ed32.tar.gz
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
new file mode 100644
index 0000000..b0c4c95
--- /dev/null
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# ti-sgx-km
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
+TI_SGX_KM_SITE = http://git.ti.com/graphics/omap5-sgx-ddk-linux.git
+TI_SGX_KM_LICENSE = GPLv2
+TI_SGX_KM_LICENSE_FILES = GPL-COPYING
+
+TI_SGX_KM_DEPENDENCIES = linux
+
+TI_SGX_KM_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KERNELDIR=$(LINUX_DIR) \
+	PVR_NULLDRM=1
+
+ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
+TI_SGX_KM_PLATFORM_NAME = omap335x
+else ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
+TI_SGX_KM_PLATFORM_NAME = omap437x
+else ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
+TI_SGX_KM_PLATFORM_NAME = omap4430
+else ifeq ($(BR2_PACKAGE_TI_SGX_5430),y)
+TI_SGX_KM_PLATFORM_NAME = omap5430
+endif
+
+TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)_linux
+
+define TI_SGX_KM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
+		 -C $(@D)/$(TI_SGX_KM_SUBDIR)
+endef
+
+define TI_SGX_KM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_EVN) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
+		DISCIMAGE=$(TARGET_DIR) \
+		kbuild_install -C $(@D)/$(TI_SGX_KM_SUBDIR)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
