From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 10 Mar 2015 14:01:19 +0300
Subject: [Buildroot] [PATCH v3] toolchain-external: add Synopsys DesignWare
	tools for ARC cores
Message-ID: <1425985279-6965-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this change we add pre-built external toolachins for DesignWare ARC
cores. All currently existing flavours are supported:
 * ARC 700 and ARC HS cores
 * Little- and big-endian configurations

These pre-built tools are built with build scripts available here
(https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/tree/arc-2014.12)
and correspond to arc-2014.12 release of sources.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---

In v3 as proposed by Thomas I combined selection of toolchain source in one
section called BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12.

---
 toolchain/toolchain-external/Config.in               | 19 +++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.hash |  6 ++++++
 toolchain/toolchain-external/toolchain-external.mk   | 17 +++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d29bf43..8b0f09b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -879,6 +879,23 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 
 	  http://musl.codu.org/
 
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
+	bool "Synopsys ARC 2014.12 toolchain"
+	depends on BR2_arc
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
+	  Toolchain for the ARC cores, from
+	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	bool "Custom toolchain"
 	help
@@ -929,6 +946,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
+	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
+	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 386f987..7362b81 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -54,3 +54,9 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
+
+# Synopsys DesignWare ARC toolchains
+sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 612c49d..305e1a2 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -22,6 +22,7 @@
 #    default glibc-based variant is.
 #  * Analog Devices toolchains for the Blackfin architecture
 #  * Xilinx toolchains for the Microblaze architecture
+#  * Synopsys DesignWare toolchains for ARC cores
 #
 # The basic principle is the following
 #
@@ -217,6 +218,9 @@ ifeq ($(BR2_mips)$(BR2_mips64),y)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
+ifeq ($(BR2_arceb),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -EB
+endif
 ifneq ($(BR2_TARGET_OPTIMIZATION),)
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each
@@ -378,6 +382,19 @@ TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VER
 else ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
+TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12/
+ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+ifeq ($(BR2_arceb),y)
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+else
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+endif # BR2_arceb
+else ifeq ($(BR2_arceb),y)
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
+else
+TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
+endif # BR2_arceb
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
2.1.0
