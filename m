From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 11:26:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: enable only on
 supported architectures
Message-ID: <20200421092647.2452590-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/12d2c27c38cc52248d3277995a9bb5eae4b8bb9e
 - http://autobuild.buildroot.org/results/34151bded9737f7c128b7a2d763c9e0af8018068
 - http://autobuild.buildroot.org/results/9abbbdd2735991277c0b821a47c579b053335caf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ibm-sw-tpm2/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
index dc5630490f..1f97b62405 100644
--- a/package/ibm-sw-tpm2/Config.in
+++ b/package/ibm-sw-tpm2/Config.in
@@ -1,5 +1,14 @@
+config BR2_PACKAGE_IBM_SW_TPM2_ARCH_SUPPORTS
+	bool
+	# see src/LibSupport.h
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc64 || BR2_powerpc64le
+
 config BR2_PACKAGE_IBM_SW_TPM2
 	bool "ibm-sw-tpm2"
+	depends on BR2_PACKAGE_IBM_SW_TPM2_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
 	select BR2_PACKAGE_OPENSSL
 	# libressl is not supported
@@ -13,4 +22,5 @@ config BR2_PACKAGE_IBM_SW_TPM2
 	  https://sourceforge.net/projects/ibmswtpm2/
 
 comment "ibm-sw-tpm2 needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_IBM_SW_TPM2_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
-- 
2.25.1
