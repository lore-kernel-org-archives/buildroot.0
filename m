From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 24 Feb 2015 17:47:09 +0300
Subject: [Buildroot] [PATCH] toolchain-external: add Synopsys DesignWare
	tools for ARC cores
Message-ID: <1424789229-2613-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this change we add pre-built external toolachins for DesignWare ARC
cores. All currently existed flavours are supported:
 * ARC 700 and ARC HS cores
 * Little- and big-enadian configurations

These pre-built tools are built with build scripts available here
(https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/tree/arc-2014.12)
and correspond to arc-2014.12 release of sources.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in             | 76 ++++++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  6 ++
 toolchain/toolchain-external/toolchain-external.mk | 16 +++++
 3 files changed, 98 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 50daa66..ca5989e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -909,6 +909,78 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 
 	  http://musl.codu.org/
 
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700
+	bool "Synopsys ARC 2014.12 for ARC 700"
+	depends on BR2_arcle
+	depends on BR2_arc750d || BR2_arc770d
+	depends on BR2_HOSTARCH = "x86_64"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	help
+	  Toolchain for the ARC 700 architecture, from
+	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
+
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700_EB
+	bool "Synopsys ARC 2014.12 for ARC 700 (big endian)"
+	depends on BR2_arceb
+	depends on BR2_arc750d || BR2_arc770d
+	depends on BR2_HOSTARCH = "x86_64"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	help
+	  Toolchain for the ARC 700 architecture, from
+	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
+
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS
+	bool "Synopsys ARC 2014.12 for ARC HS"
+	depends on BR2_arcle
+	depends on BR2_archs38
+	depends on BR2_HOSTARCH = "x86_64"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	help
+	  Toolchain for the ARC HS architecture, from
+	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
+
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS_EB
+	bool "Synopsys ARC 2014.12 for ARC HS (big endian)"
+	depends on BR2_arceb
+	depends on BR2_archs38
+	depends on BR2_HOSTARCH = "x86_64"
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	help
+	  Toolchain for the ARC HS architecture, from
+	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	bool "Custom toolchain"
 	help
@@ -959,6 +1031,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700 && BR2_arcle
+	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700_EB && BR2_arceb
+	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS && BR2_arcle
+	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS_EB && BR2_arceb
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7f211db..7861f67 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -56,3 +56,9 @@ sha256 3e1c7c53fadfd3346ab60386c573f07f0617ab119546ec8cb93bc20c23cff2b3  lin32-m
 sha256 b72f7be654a75bb643372f3909de7b8739f0f56bdf8bea98fea41dcecefe6b6b  microblazeel-unknown-linux-gnu.tgz
 sha256 ed2fea022f2def257ca6db09911b73c7102aaa1792d2da2d81371a763e5c2eff  lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 sha256 53ee0b1ad50e651eb14d0b53044b90e7bf7e3cb341ee57fe575bc4c4e142ea37  microblaze-unknown-linux-gnu.tgz
+
+# Synopsys DesignWare ARC toolchains
+sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
\ No newline at end of file
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 5a69eb8..0d380e1 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -21,6 +21,7 @@
 #    default glibc-based variant is.
 #  * Analog Devices toolchains for the Blackfin architecture
 #  * Xilinx toolchains for the Microblaze architecture
+#  * Synopsys DesignWare tolchains for ARC cores
 #
 # The basic principle is the following
 #
@@ -216,6 +217,9 @@ ifeq ($(BR2_mips)$(BR2_mips64),y)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
+ifeq ($(BR2_arceb),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -EB
+endif
 ifneq ($(BR2_TARGET_OPTIMIZATION),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
@@ -386,6 +390,18 @@ TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VER
 else ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700),y)
+TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARC700_EB),y)
+TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12_ARCHS_EB),y)
+TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
2.1.0
