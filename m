From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 May 2016 13:25:55 +0100
Subject: [Buildroot] [PATCH next 2/4] toolchain-external: add support for
	binutils version dependency
In-Reply-To: <1464351957-50031-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464351957-50031-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1464351957-50031-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit wires up the binutils version dependency mechanism in the
external toolchain backend. To do so, it:

* Changes the definition of all pre-defined external toolchain profiles
  to select the appropriate BR2_TOOLCHAIN_BINUTILS_AT_LEAST_* option.

* For custom external toolchains, provides a visible Config.in "choice"
  to select the binutils version used in the external toolchain.

* Adds a new check_binutils_version function, that verifies that the
  real binutils version found in the external toolchain matches the one
  declared in the Buildroot configuration.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/helpers.mk                               | 30 ++++++++++++
 toolchain/toolchain-external/Config.in             | 57 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  2 +
 3 files changed, 89 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d28a2ca..1221ada 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -149,6 +149,36 @@ check_kernel_headers_version = \
 	fi
 
 #
+# Check the specific binutils version actually matches the version in
+# the toolchain. We use readelf for that purpose.
+#
+# $1: path to readelf
+# $2: expected readelf version
+#
+# Some details about the sed expression:
+# - 1!d
+#   - delete if not line 1
+#
+# - s/^[^)]+\) ([^[:space:]]+).*/\1/
+#   - eat all until the first ')' character followed by a space
+#   - match as many non-space chars as possible
+#   - eat all the remaining chars on the line
+#   - replace by the matched expression
+#
+check_binutils_version = \
+	expected_version="$(strip $2)" ; \
+	if [ -z "$${expected_version}" ]; then \
+		printf "Internal error, binutils version unknown (no BINUTILS_AT_LEAST_X_Y selected)\n"; \
+		exit 1 ; \
+	fi; \
+	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
+	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
+		printf "Incorrect selection of binutils version: expected %s.x, got %s\n" \
+			"$${expected_version}" "$${real_version}" ; \
+		exit 1 ; \
+	fi
+
+#
 # Check the specific gcc version actually matches the version in the
 # toolchain
 #
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ce2d91e..316a6af 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -26,6 +26,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
@@ -48,6 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2016.02 (based on gcc 5.3), Linaro GDB 2016.02 (based on
@@ -70,6 +72,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
 	  uses Linaro GCC 2014.09 (based on gcc 4.9), Linaro GDB
@@ -92,6 +95,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
 	  uses Linaro GCC 2016.02 (based on gcc 5.3), Linaro GDB
@@ -113,6 +117,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
@@ -147,6 +152,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_20
 	# kernel headers: 2.6.31
 	help
 	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
@@ -170,6 +176,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_20
 	# kernel headers: 2.6.31
 	help
 	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
@@ -190,6 +197,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 5.3, binutils 2.25.51, glibc
@@ -278,6 +286,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Codescape IMG GNU Linux Toolchain 2015.10 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
@@ -340,6 +349,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Codescape MTI GNU Linux Toolchain 2015.10 for the MIPS
 	  architecture, from Imagination Technologies. It uses gcc
@@ -413,6 +423,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
@@ -430,6 +441,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
@@ -456,6 +468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	help
 	  Sourcery CodeBench toolchain for the amd64 (x86_64)
 	  architectures, from Mentor Graphics. It uses gcc 5.2,
@@ -481,6 +494,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
@@ -510,6 +524,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_21
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -525,6 +540,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -540,6 +556,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -555,6 +572,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
 	help
 	  Sourcery CodeBench toolchain for the AArch64 architecture,
 	  from Mentor Graphics. It uses gcc 4.9.1, binutils
@@ -578,6 +596,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
 	help
 	  Toolchain based on the Musl C library, provided by the
 	  musl-cross project. It uses gcc 5.3, binutils 2.25.1 and
@@ -606,6 +625,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
 	help
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
@@ -708,6 +728,43 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
+	bool "External toolchain binutils version"
+	default BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_20
+	help
+	  Set to the binutils version that is used by your external
+	  toolchain.
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_26
+	bool "2.26.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_26
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_25
+	bool "2.25.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_25
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_24
+	bool "2.24.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_24
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_23
+	bool "2.23.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_23
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_22
+	bool "2.22.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_22
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_21
+	bool "2.21.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_21
+
+config BR2_TOOLCHAIN_EXTERNAL_BINUTILS_2_20
+	bool "2.20.x"
+	select BR2_TOOLCHAIN_BINUTILS_AT_LEAST_2_20
+
+endchoice
+
+choice
 	bool "External toolchain gcc version"
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	help
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3d71ef4..952667d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -505,6 +505,8 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(call check_kernel_headers_version,\
 		$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC)),\
 		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	$(call check_binutils_version,$(TOOLCHAIN_EXTERNAL_READELF),\
+		$(call qstrip,$(BR2_TOOLCHAIN_BINUTILS_AT_LEAST))); \
 	$(call check_gcc_version,$(TOOLCHAIN_EXTERNAL_CC),\
 		$(call qstrip,$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
 	if test "$(BR2_arm)" = "y" ; then \
-- 
2.7.3
