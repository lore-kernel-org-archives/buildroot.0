From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon,  5 Nov 2018 17:33:24 +0530
Subject: [Buildroot] [PATCH v2 1/1] fwts: Enable optional efi_runtime kernel
 module build
Message-ID: <1541419404-28044-1-git-send-email-sumit.garg@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Firmware test suite does provides efi_runtime kernel module required
to run UEFI tests. So optionally enable this module build.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
1. Keep efi_runtime config option inside if block.
2. Remove linux dependency as $(kernel-module) takes care of this.
3. Correct placement of config and $(kernel-module) blocks.

 package/fwts/Config.in | 12 ++++++++++++
 package/fwts/fwts.mk   |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 959d871..930f078 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -21,6 +21,18 @@ config BR2_PACKAGE_FWTS
 
 	  https://wiki.ubuntu.com/FirmwareTestSuite
 
+if BR2_PACKAGE_FWTS
+config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+	bool "efi_runtime module"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Firmware Test Suite (FWTS) also provides EFI runtime kernel
+	  module required to run UEFI tests.
+
+comment "efi-runtime module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+endif
+
 comment "fwts needs a glibc toolchain w/ wchar, threads"
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 15f0afc..aa006f3 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -13,4 +13,9 @@ FWTS_AUTORECONF = YES
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
+ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+FWTS_MODULE_SUBDIRS = efi_runtime
+$(eval $(kernel-module))
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
