From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:23 +0200
Subject: [Buildroot] [PATCH 2/7] new package: ti-sgx/ti-sgx-km kernel module
	SGX graphics accelerator
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-3-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the kernel module for the SGX graphics accelerator of the
following parts: AM335x, AM437x, AM4430, AM5430

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-sgx/ti-sgx-km/Config.in      |  4 +++
 package/ti-sgx/ti-sgx-km/ti-sgx-km.hash |  2 ++
 package/ti-sgx/ti-sgx-km/ti-sgx-km.mk   | 48 +++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/ti-sgx/ti-sgx-km/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-km/ti-sgx-km.hash
 create mode 100644 package/ti-sgx/ti-sgx-km/ti-sgx-km.mk

diff --git a/package/ti-sgx/ti-sgx-km/Config.in b/package/ti-sgx/ti-sgx-km/Config.in
new file mode 100644
index 0000000..3e3b991
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-km/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_TI_SGX_KM
+	bool "kernel module"
+	help
+	  TI SGX kernel module
diff --git a/package/ti-sgx/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx/ti-sgx-km/ti-sgx-km.hash
new file mode 100644
index 0000000..7f7e0ac
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-km/ti-sgx-km.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 47728ff8fc48827116cc042efa777a22a83dd4bd17c494e2a53b8c204ca59624 ti-sgx-km-2b7523d07a13ab704a24a7664749551f4a13ed32.tar.gz
diff --git a/package/ti-sgx/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx/ti-sgx-km/ti-sgx-km.mk
new file mode 100644
index 0000000..b738d40
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-km/ti-sgx-km.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# ti-sgx-km
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
+TI_SGX_KM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-linux.git
+TI_SGX_KM_LICENSE = MIT / GPL License
+TI_SGX_KM_LICENSE_FILES = GPL-COPYING MIT-COPYING
+TI_SGX_KM_INSTALL_STAGING = YES
+
+TI_SGX_KM_DEPENDENCIES = linux
+
+TI_SGX_KM_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	ARCH=arm \
+	KERNELDIR=$(LINUX_DIR) \
+	DISCIMAGE=$(TARGET_DIR) \
+	PVR_NULLDRM=1
+
+ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
+TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap335x_linux
+endif
+
+ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
+TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap437x_linux
+endif
+
+ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
+TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap4430_linux
+endif
+
+ifeq ($(BR2_PACKAGE_TI_SGX_AM5430),y)
+TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap5430_linux
+endif
+
+define TI_SGX_KM_BUILD_CMDS
+	$(MAKE) $(TI_SGX_KM_MAKE_OPTS) -C $(@D)/$(TI_SGX_KM_SUBDIRECTORY)
+endef
+
+define TI_SGX_KM_INSTALL_TARGET_CMDS
+	$(MAKE) $(TI_SGX_KM_MAKE_OPTS) kbuild_install \
+		-C $(@D)/$(TI_SGX_KM_SUBDIRECTORY)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
