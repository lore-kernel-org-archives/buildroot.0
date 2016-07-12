From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:27 +0200
Subject: [Buildroot] [PATCH 6/7] new package: ti-sgx top level package for
	SGX graphics accelerator
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-7-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a virtual package that selects the packages required for SGX support:
ti-sgx-km, ti-sgx-um, ti-sgx-libgbm and optionally ti-sgx-demos.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-sgx/Config.in | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/ti-sgx/ti-sgx.mk |  8 ++++++
 2 files changed, 79 insertions(+)
 create mode 100644 package/ti-sgx/Config.in
 create mode 100644 package/ti-sgx/ti-sgx.mk

diff --git a/package/ti-sgx/Config.in b/package/ti-sgx/Config.in
new file mode 100644
index 0000000..199618a
--- /dev/null
+++ b/package/ti-sgx/Config.in
@@ -0,0 +1,71 @@
+config BR2_PACKAGE_TI_SGX
+	bool "ti-sgx"
+	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm && \
+		BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_TI_SGX_KM
+	select BR2_PACKAGE_TI_SGX_UM
+	select BR2_PACKAGE_TI_SGX_LIBGBM
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_OMAP
+	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	help
+	  Graphics libraries for TI CPUs with SGX5xx GPU.
+	  This package supports AM335x, AM437x, AM4430 and AM5430.
+	  It builds the kernel module and the user space binaries.
+	  For older CPUs or kernels use the ti-gfx package.
+
+if BR2_PACKAGE_TI_SGX
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
+
+source "package/ti-sgx/ti-sgx-um/Config.in"
+source "package/ti-sgx/ti-sgx-km/Config.in"
+source "package/ti-sgx/ti-sgx-libgbm/Config.in"
+source "package/ti-sgx/ti-sgx-demos/Config.in"
+
+endif
+
+comment "ti-sgx needs an (e)glibc toolchain, udev and a Linux kernel to be built"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/ti-sgx/ti-sgx.mk b/package/ti-sgx/ti-sgx.mk
new file mode 100644
index 0000000..9cec178
--- /dev/null
+++ b/package/ti-sgx/ti-sgx.mk
@@ -0,0 +1,8 @@
+################################################################################
+#
+# ti-sgx (virtual)
+#
+################################################################################
+include $(sort $(wildcard package/ti-sgx/*/*.mk))
+#$(eval $(virtual-package))
+#$(eval $(generic-package))
-- 
1.9.1
