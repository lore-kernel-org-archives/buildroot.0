From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri,  2 Nov 2018 18:06:47 +0530
Subject: [Buildroot] [PATCH 1/1] fwts: Enable optional efi_runtime kernel
 module build
Message-ID: <1541162207-8770-1-git-send-email-sumit.garg@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Firmware test suite does provides efi_runtime kernel module required
to run UEFI tests. So optionally enable this module build.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 package/fwts/Config.in | 8 ++++++++
 package/fwts/fwts.mk   | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 959d871..3ddb989 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -28,3 +28,11 @@ comment "fwts needs a glibc toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+	bool "efi_runtime_module"
+	depends on BR2_PACKAGE_FWTS
+	depends on BR2_LINUX_KERNEL
+	help
+	  Firmware Test Suite (FWTS) also provides EFI runtime kernel
+	  module required to run UEFI tests.
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 15f0afc..840190e 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -14,3 +14,9 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
 $(eval $(autotools-package))
+
+ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+FWTS_DEPENDENCIES += linux
+FWTS_MODULE_SUBDIRS = efi_runtime
+$(eval $(kernel-module))
+endif
-- 
2.7.4
