From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Nov 2018 23:16:27 +0100
Subject: [Buildroot] [git commit] fwts: Enable optional efi_runtime kernel
 module build
Message-ID: <20181107223625.7C966815EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e6adf525876e8e3cb343e369b0363a24c3c7e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Firmware test suite does provides efi_runtime kernel module required
to run UEFI tests. So optionally enable this module build.

[Peter: fix -/_ in comment as suggested by Erico]
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/Config.in | 12 ++++++++++++
 package/fwts/fwts.mk   |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 959d871a72..269f065fd5 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -21,6 +21,18 @@ config BR2_PACKAGE_FWTS
 
 	  https://wiki.ubuntu.com/FirmwareTestSuite
 
+if BR2_PACKAGE_FWTS
+config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+	bool "efi_runtime module"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Firmware Test Suite (FWTS) provides a EFI runtime kernel
+	  module required to run UEFI tests.
+
+comment "efi_runtime module needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+endif
+
 comment "fwts needs a glibc toolchain w/ wchar, threads"
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 15f0afcce3..aa006f3b8b 100644
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
