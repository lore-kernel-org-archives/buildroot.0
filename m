From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Mar 2016 09:52:07 +0000
Subject: [Buildroot] [PATCH v3] toolchain: improve SSP logic
Message-ID: <1457517127-4560-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't enable SSP support on external toolchains just because they use
glibc or musl. Instead of that, make the external toolchains explictily
declare if they support SSP or not. And also add a check to detect SSP
support when using custom external toolchains.

For internal toolchains we always enable SSP support for glibc and musl,
and for uClibc we provide a kconfig option so the user can choose if he
wants SSP support or not.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - uclibc.mk already had the logic for SSP. Patch v2 was duplicating
   that logic by mistake. (Highlighted by Ricardo Martincoski)

Changes v1 -> v2:
 - Patch was incomplete. It was lacking the handling for internal
   toolchain. (Highlighted by Thomas Petazzoni)



 package/glibc/Config.in                            |  1 +
 package/musl/Config.in                             |  1 +
 package/uclibc/Config.in                           |  8 ++++++++
 toolchain/Config.in                                |  2 --
 toolchain/helpers.mk                               | 17 ++++++++++++++++
 toolchain/toolchain-external/Config.in             | 23 ++++++++++++++++++++--
 toolchain/toolchain-external/toolchain-external.mk |  1 +
 7 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 0565162..a2d5c1a 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_GLIBC
 	bool
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
+	select BR2_TOOLCHAIN_HAS_SSP
 
 choice
 	prompt "glibc version"
diff --git a/package/musl/Config.in b/package/musl/Config.in
index f1a3150..c263006 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -4,3 +4,4 @@ config BR2_PACKAGE_MUSL
 	default y
 	select BR2_PACKAGE_LINUX_HEADERS
 	select BR2_PACKAGE_NETBSD_QUEUE
+	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 16bf89c..a8d9229 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -22,6 +22,14 @@ config BR2_UCLIBC_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main uClibc configuration file.
 
+config BR2_TOOLCHAIN_BUILDROOT_HAS_SSP
+	bool "Enable SSP support"
+	default y
+	select BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Enable this option if you want your toolchain to support
+	  SSP (stack smashing protector).
+
 config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	bool "Enable RPC support"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fc30c6e..e0044c1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -15,7 +15,6 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	select BR2_TOOLCHAIN_HAS_SSP
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
@@ -27,7 +26,6 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_SSP
 
 choice
 	prompt "Toolchain type"
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ee878e8..286b24c 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -421,6 +421,23 @@ check_unusable_toolchain = \
 	fi
 
 #
+# Check if the toolchain has SSP (stack smashing protector) support
+#
+# $1: cross-gcc path
+#
+check_toolchain_ssp = \
+	__CROSS_CC=$(strip $1) ; \
+	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -fstack-protector -x c - > /dev/null 2>&1 && echo y` ; \
+	if [ "$(BR2_TOOLCHAIN_HAS_SSP)" != "y" -a "$${__HAS_SSP}" = "y" ] ; then \
+		echo "SSP support available in this toolchain, please enable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
+		exit 1 ; \
+	fi ; \
+	if [ "$(BR2_TOOLCHAIN_HAS_SSP)" = "y" -a "$${__HAS_SSP}" != "y" ] ; then \
+		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
+		exit 1 ; \
+	fi
+
+#
 # Generate gdbinit file for use with Buildroot
 #
 gen_gdbinit_file = \
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0b0a1cb..7764a2b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -22,6 +22,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
@@ -44,6 +45,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
@@ -66,6 +68,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
@@ -88,6 +91,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
@@ -108,6 +112,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_ARM_EABI
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -143,6 +148,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	depends on BR2_ARM_CPU_HAS_VFPV3
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -166,6 +172,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	depends on BR2_ARM_EABI
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -185,6 +192,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -408,6 +416,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -425,6 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -443,6 +453,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -476,6 +487,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -502,6 +514,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_x86_jaguar || BR2_x86_steamroller
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -527,6 +540,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	depends on !BR2_x86_jaguar
 	depends on !BR2_x86_steamroller
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -572,6 +586,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	depends on BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
@@ -587,6 +602,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
@@ -601,6 +617,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -625,6 +642,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
@@ -1014,17 +1032,18 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
 
 endif # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 
+endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
+
 config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	bool "Toolchain has SSP support?"
 	select BR2_TOOLCHAIN_HAS_SSP
+	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_EXTERNAL_MUSL
 	help
 	  Selection this option if your external toolchain has Stack
 	  Smashing Protection support enabled. If you don't know,
 	  leave the default value, Buildroot will tell you if it's
 	  correct or not.
 
-endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
-
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e712998..d194354 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -502,6 +502,7 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	else \
 		$(call check_glibc,$${SYSROOT_DIR}) ; \
 	fi
+	$(Q)$(call check_toolchain_ssp,$(TOOLCHAIN_EXTERNAL_CC))
 endef
 
 # With the musl C library, the libc.so library directly plays the role
-- 
2.4.10
