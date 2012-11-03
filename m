From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:50 +0100
Subject: [Buildroot] [PATCH 05/18] toolchain-external: improve glibc support
	to test availability of RPC
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7d47e559b9e51b8d03614c61f47873302604c744.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Basically, the BR2_TOOLCHAIN_EXTERNAL_GLIBC option no longer
unconditionally selects BR2_TOOLCHAIN_HAS_NATIVE_RPC since there are
glibc toolchains that don't have RPC support. All the predefined
toolchain profiles are updated to take into account this change: for
the moment, all glibc toolchains that have pre-defined toolchains have
RPC support, but further patches in the series add pre-defined glibc
toolchains that don't have RPC support. In the case of custom glibc
toolchains, a question is asked to the user so that he can say whether
the external glibc toolchain has RPC support or not. The validity of
this configuration option is checked by the new
check_glibc_rpc_feature function in helpers.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                   |   27 ++++++++++++++++++-----
 toolchain/toolchain-external/Config.in |   37 ++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 34e9c17..1509ff8 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -172,9 +172,10 @@ create_lib64_symlinks = \
 	(cd $(STAGING_DIR)/usr ; ln -s lib lib64)
 
 #
-# Check the availability of a particular glibc feature. We assume that
-# all Buildroot toolchain options are supported by glibc, so we just
-# check that they are enabled.
+# Check the availability of a particular glibc feature. This function
+# is used to check toolchain options that are always supported by
+# glibc, so we simply check that the corresponding option is properly
+# enabled.
 #
 # $1: Buildroot option name
 # $2: feature description
@@ -186,6 +187,22 @@ check_glibc_feature = \
 	fi
 
 #
+# Check the availability of RPC support in a glibc toolchain
+#
+# $1: sysroot directory
+#
+check_glibc_rpc_feature = \
+	IS_IN_LIBC=`test -f $(1)/usr/include/rpc/rpc.h && echo y` ; \
+	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
+		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
+		exit 1 ; \
+	fi ; \
+	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
+		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
+		exit 1 ; \
+	fi
+
+#
 # Check the correctness of a glibc external toolchain configuration.
 #  1. Check that the C library selected in Buildroot matches the one
 #     of the external toolchain
@@ -202,10 +219,10 @@ check_glibc = \
 	fi; \
 	$(call check_glibc_feature,BR2_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
-	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_NATIVE_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
-	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support)
+	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
+	$(call check_glibc_rpc_feature,$${SYSROOT_DIR})
 
 #
 # Check the conformity of Buildroot configuration with regard to the
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8d3240a..96b689a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
@@ -24,6 +25,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_08
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
@@ -40,6 +42,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_07
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
@@ -56,6 +59,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_06
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
@@ -72,6 +76,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_05
 	depends on BR2_arm
 	depends on BR2_cortex_a8 || BR2_cortex_a9
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
@@ -108,6 +113,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	bool "Sourcery CodeBench ARM 2011.09"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
@@ -129,6 +135,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	bool "Sourcery CodeBench ARM 2011.03"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
@@ -150,6 +157,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	bool "Sourcery CodeBench ARM 2010.09"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
@@ -171,6 +179,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	bool "Sourcery CodeBench ARM 2010q1"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
@@ -192,6 +201,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	bool "Sourcery CodeBench MIPS 2011.09"
 	depends on BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
@@ -259,6 +269,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	bool "Sourcery CodeBench MIPS 2011.03"
 	depends on BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
@@ -308,6 +319,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	bool "Sourcery CodeBench MIPS 4.4"
 	depends on BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
@@ -357,6 +369,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
@@ -384,6 +397,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "Sourcery CodeBench PowerPC 2010.09"
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
@@ -411,6 +425,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
 	depends on BR2_sh4a || BR2_sh4aeb
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
@@ -430,6 +445,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "Sourcery CodeBench SH 2010.09"
 	depends on BR2_sh4a || BR2_sh4aeb
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
@@ -483,6 +499,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	bool "Sourcery CodeBench x86/x86_64 2011.09"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
@@ -504,6 +521,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	bool "Sourcery CodeBench x86/x86_64 2010.09"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
@@ -570,6 +588,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	bool "Xilinx Little Endian Microblaze GNU Tools"
 	depends on BR2_microblazeel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
@@ -578,6 +597,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblazebe
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
@@ -668,7 +688,6 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
 	select BR2_LARGEFILE
 	select BR2_INET_IPV6
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -720,14 +739,6 @@ config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
 	  IPv6. If you don't know, leave the default value, Buildroot
 	  will tell you if it's correct or not.
 
-config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
-	bool "Toolchain has RPC support?"
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	help
-	  Select this option if your external toolchain supports
-	  RPC. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
 config BR2_TOOLCHAIN_EXTERNAL_WCHAR
 	bool "Toolchain has WCHAR support?"
 	select BR2_USE_WCHAR
@@ -766,6 +777,14 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
+config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
+	bool "Toolchain has RPC support?"
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Select this option if your external toolchain supports
+	  RPC. If you don't know, leave the default value, Buildroot
+	  will tell you if it's correct or not.
+
 config BR2_TOOLCHAIN_EXTERNAL_CXX
 	bool "Toolchain has C++ support?"
 	select BR2_INSTALL_LIBSTDCPP
-- 
1.7.9.5
