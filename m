From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 18 May 2015 11:24:46 -0300
Subject: [Buildroot] [PATCH v2 4/6] toolchain: introduce
	BR2_TOOLCHAIN_HAS_RESOLVER
In-Reply-To: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1431959088-15257-5-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a Kconfig option specifying if the toolchain supports name resolving
(or at least has stubs for it) so we can disable packages that depend on
that (or they would fail to link). For now, only disable the 'nslookup'
tool from BusyBox if there's no resolver support.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/busybox/busybox.mk             |  3 +++
 toolchain/Config.in                    |  3 +++
 toolchain/toolchain-external/Config.in | 29 +++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1ce508a..44416a8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -155,6 +155,9 @@ endif
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
 	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
+	$(if $(BR2_TOOLCHAIN_HAS_RESOLVER),,
+		$(call KCONFIG_DISABLE_OPT,CONFIG_NSLOOKUP,$(@D)/.config)
+	)
 endef
 
 define BUSYBOX_KCONFIG_FIXUP_CMDS
diff --git a/toolchain/Config.in b/toolchain/Config.in
index a851ce4..7e66de0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -20,6 +20,9 @@ config BR2_TOOLCHAIN_USES_GLIBC
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
 
+config BR2_TOOLCHAIN_HAS_RESOLVER
+	bool
+
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
 	select BR2_USE_WCHAR
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6ea6838..3469fbc 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -18,6 +18,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2014.09 (based on gcc 4.9), Linaro GDB 2013.10 (based on
@@ -44,6 +45,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Linaro toolchain for the ARM big endian architecture. It
 	  uses Linaro GCC 2014.09 (based on gcc 4.9), Linaro GDB
@@ -69,6 +71,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
@@ -98,6 +101,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
@@ -126,6 +130,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
@@ -159,6 +164,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	# kernel headers: 2.6.31
 	help
 	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
@@ -181,6 +187,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	# kernel headers: 2.6.31
 	help
 	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
@@ -199,6 +206,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.9.1, binutils 2.24.51, glibc
@@ -284,6 +292,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51, glibc
@@ -369,6 +378,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
@@ -457,6 +467,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51,
@@ -472,6 +483,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
@@ -488,6 +500,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
 	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
@@ -504,6 +517,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	# kernel headers: 2.6.38
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
@@ -536,6 +550,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	# kernel headers: 2.6.35
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
@@ -569,6 +584,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
@@ -592,6 +608,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
@@ -616,6 +633,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	# kernel headers: 2.6.38
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
@@ -641,6 +659,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_201405
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the amd64 (x86_64)
 	  architectures, from Mentor Graphics. It uses gcc 4.8.3,
@@ -665,6 +684,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
@@ -692,6 +712,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.3,
@@ -720,6 +741,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
@@ -748,6 +770,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -764,6 +787,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -780,6 +804,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -794,6 +819,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -808,6 +834,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Sourcery CodeBench toolchain for the AArch64 architecture,
 	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24,
@@ -823,6 +850,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Toolchain based on the Musl C library, provided by the
 	  musl-cross project. It uses gcc 4.9.2, binutils 2.25 and
@@ -849,6 +877,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_HAS_RESOLVER
 	help
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
-- 
2.1.4
