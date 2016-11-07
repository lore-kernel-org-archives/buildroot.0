From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:00 +0100
Subject: [Buildroot] [PATCH v4 05/22] toolchain-external-linaro-aarch64: new
	package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Linaro external toolchain for
the AArch64 architecture.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 30 ++++++++++------------
 .../toolchain-external-linaro-aarch64/Config.in    | 15 +++++++++++
 .../Config.in.options                              |  9 +++++++
 .../toolchain-external-linaro-aarch64.hash         |  3 +++
 .../toolchain-external-linaro-aarch64.mk           | 16 ++++++++++++
 .../toolchain-external/toolchain-external.hash     |  4 +--
 toolchain/toolchain-external/toolchain-external.mk |  9 ++-----
 7 files changed, 59 insertions(+), 27 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 65a4216..096f435 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -8,6 +8,12 @@ choice
 comment "glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
+# Kept toolchains sorted by architecture in order to use some toolchain
+# as default choice
+
+# Aarch64 (use Linaro toolchain by default)
+source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
+
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm || BR2_armeb
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
@@ -485,22 +491,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2016.05"
-	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	help
-	  Toolchain for the AArch64 architecture, from
-	  http://www.linaro.org/engineering/armv8/
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	bool "CodeSourcery AArch64 2014.11"
 	depends on BR2_aarch64
@@ -628,7 +618,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-amd-linux-gnu"  if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
@@ -675,6 +664,13 @@ config BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	string
 
+# Kept toolchains sorted as in the choice above
+# The toolchain Config.in.options must define
+# BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL and BR2_TOOLCHAIN_EXTERNAL_PREFIX
+
+# Aarch64
+source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
new file mode 100644
index 0000000..662f7d7
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -0,0 +1,15 @@
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	bool "Linaro AArch64 2016.05"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
new file mode 100644
index 0000000..099c6c0
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "aarch64-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-linaro-aarch64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
new file mode 100644
index 0000000..7a2c038
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d43227248f282a652da42322fcf4abfd3021f2a2f62e0cf6e242d82f55966ba9  gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
+sha256 1941dcf6229d6706bcb89b7976d5d43d170efdd17c27d5fe1738e7ecf22adc37  gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
new file mode 100644
index 0000000..a0543a7
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# toolchain-external-linaro-aarch64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2016.05
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 41c2ab3..fd1bc6d 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -34,13 +34,11 @@ sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2
 sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
 
-# ARM and Aarch64 toolchains from Linaro
+# ARM toolchains from Linaro
 sha256 f1421c580ce977226f4fefc9c409b3b423260cc65a6e9dc6da88bb3478a521a0  gcc-linaro-5.3.1-2016.05-i686_arm-linux-gnueabihf.tar.xz
 sha256 987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd  gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 f6e9c0d3320760fe8f89e9ec3acdd7b4da7eff889c094b4a2acc286fd46f334f  gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
 sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
-sha256 d43227248f282a652da42322fcf4abfd3021f2a2f62e0cf6e242d82f55966ba9  gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
-sha256 1941dcf6229d6706bcb89b7976d5d43d170efdd17c27d5fe1738e7ecf22adc37  gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
 
 # Codescape toolchains from Imagination Technologies
 # From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index bcbcb2e..8a3e4da 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -148,13 +148,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/aarch64-linux-gnu
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
-endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
@@ -302,3 +295,5 @@ ifeq ($(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX)),)
 $(error No prefix selected for external toolchain package $(BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL). Configuration error)
 endif
 endif
+
+include toolchain/toolchain-external/*/*.mk
-- 
2.10.2
