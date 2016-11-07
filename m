From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:14 +0100
Subject: [Buildroot] [PATCH v4 19/22] toolchain-external-musl-cross: new
	package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-20-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the pre-built Musl external
toolchains.

The legacy implementation is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 48 +++-------------------
 .../toolchain-external-musl-cross/Config.in        | 30 ++++++++++++++
 .../Config.in.options                              | 19 +++++++++
 .../toolchain-external-musl-cross.hash}            | 17 +-------
 .../toolchain-external-musl-cross.mk               | 12 ++++++
 .../toolchain-external/toolchain-external.hash     | 13 ------
 toolchain/toolchain-external/toolchain-external.mk | 26 ------------
 7 files changed, 68 insertions(+), 97 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
 copy toolchain/toolchain-external/{toolchain-external.hash => toolchain-external-musl-cross/toolchain-external-musl-cross.hash} (51%)
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index cddfca8..5188e1a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -40,6 +40,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.i
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"
 
+# Musl based toolchains (after all the others)
+source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
+
 config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
@@ -85,37 +88,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl 1.1.12 toolchain"
-	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
-		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4 && BR2_USE_MMU) || \
-		(BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A && BR2_USE_MMU) || \
-		BR2_i386 || (BR2_mips && !BR2_SOFT_FLOAT) || \
-		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
-		BR2_sh4 || BR2_sh4eb || \
-		BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	# Unsupported MIPS cores
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && !BR2_mips_m5101
-	# Unsupported for MIPS R6
-	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
-	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	help
-	  Toolchain based on the Musl C library, provided by the
-	  musl-cross project. It uses gcc 5.3, binutils 2.25.1 and
-	  musl 1.1.12. It does not have a cross debugger included.
-
-	  The ARM soft-float toolchain is built for ARMv4t, while the
-	  ARM hard-float toolchain is built for ARMv5t.
-	  The x86 toolchain is built for i486.
-
-	  http://musl.codu.org/
-
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2014.12 toolchain"
 	depends on BR2_arc
@@ -191,17 +163,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
-	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
-	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
-	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
-	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
-	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && !BR2_SOFT_FLOAT)
-	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && !BR2_SOFT_FLOAT)
-	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && BR2_SOFT_FLOAT)
-	default "powerpc-linux-musl"     if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_powerpc
-	default "sh4-linux-musl"         if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_sh4
-	default "sh4eb-linux-musl"       if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_sh4eb
-	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_x86_64
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
@@ -260,6 +221,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.i
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options"
 
+# Musl based toolchains
+source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options"
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
new file mode 100644
index 0000000..5cffa2d
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
@@ -0,0 +1,30 @@
+config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
+	bool "Musl 1.1.12 toolchain"
+	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
+		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4 && BR2_USE_MMU) || \
+		(BR2_armeb && BR2_ARM_EABI && !BR2_ARM_CPU_ARMV7A && BR2_USE_MMU) || \
+		BR2_i386 || (BR2_mips && !BR2_SOFT_FLOAT) || \
+		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
+		BR2_sh4 || BR2_sh4eb || \
+		BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Unsupported MIPS cores
+	depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && !BR2_mips_m5101
+	# Unsupported for MIPS R6
+	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 5.3, binutils 2.25.1 and
+	  musl 1.1.12. It does not have a cross debugger included.
+
+	  The ARM soft-float toolchain is built for ARMv4t, while the
+	  ARM hard-float toolchain is built for ARMv5t.
+	  The x86 toolchain is built for i486.
+
+	  http://musl.codu.org/
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
new file mode 100644
index 0000000..cd12355
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
@@ -0,0 +1,19 @@
+if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "arm-linux-musleabi"	 if BR2_arm && BR2_ARM_EABI
+	default "arm-linux-musleabihf"	 if BR2_arm && BR2_ARM_EABIHF
+	default "armeb-linux-musleabi"	 if BR2_armeb
+	default "i486-linux-musl"	 if BR2_i386
+	default "mips-linux-musl"	 if (BR2_mips && !BR2_SOFT_FLOAT)
+	default "mipsel-linux-musl"	 if (BR2_mipsel && !BR2_SOFT_FLOAT)
+	default "mipsel-sf-linux-musl"	 if (BR2_mipsel && BR2_SOFT_FLOAT)
+	default "powerpc-linux-musl"     if BR2_powerpc
+	default "sh4-linux-musl"         if BR2_sh4
+	default "sh4eb-linux-musl"       if BR2_sh4eb
+	default "x86_64-linux-musl"	 if BR2_x86_64
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-musl-cross"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
similarity index 51%
copy from toolchain/toolchain-external/toolchain-external.hash
copy to toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
index 8926bf8..beef8fd 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
@@ -1,19 +1,4 @@
-######################################
-# Next hashes are all locally computed
-
-# ARM toolchains from Texas Instrument's Arago project
-# There is one source file that covers both binary distributions.
-sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
-sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
-sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
-
-# Synopsys DesignWare ARC toolchains
-sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
-
-# Prebuilt musl toolchains from musl-cross
+# Locally calculated
 sha256 e32c23d0b83639fc10ad06666ec086b66453b9be44415fe1a818c3c3b526dfb1  crossx86-armeb-linux-musleabi-1.1.12.tar.xz
 sha256 eb81bd5d6ada454c6e854b18bfa8dc801333782152166f6cab9fb7cd11692987  crossx86-arm-linux-musleabi-1.1.12.tar.xz
 sha256 a050da284ff22d291ae71dfc249ebdedb18334b8d626804760ce7d5963e392e6  crossx86-arm-linux-musleabihf-1.1.12.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
new file mode 100644
index 0000000..966505b
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# toolchain-external-musl-cross
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION = 1.1.12
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION)
+
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_SOURCE = crossx86-$(TOOLCHAIN_EXTERNAL_PREFIX)-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION).tar.xz
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 8926bf8..a286ef2 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -12,16 +12,3 @@ sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu
 sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
 sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
 sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
-
-# Prebuilt musl toolchains from musl-cross
-sha256 e32c23d0b83639fc10ad06666ec086b66453b9be44415fe1a818c3c3b526dfb1  crossx86-armeb-linux-musleabi-1.1.12.tar.xz
-sha256 eb81bd5d6ada454c6e854b18bfa8dc801333782152166f6cab9fb7cd11692987  crossx86-arm-linux-musleabi-1.1.12.tar.xz
-sha256 a050da284ff22d291ae71dfc249ebdedb18334b8d626804760ce7d5963e392e6  crossx86-arm-linux-musleabihf-1.1.12.tar.xz
-sha256 18d07f5c8f4cfe373461cf21cf7b1bfefa820a37e96a69b68e0f315d528b4286  crossx86-i486-linux-musl-1.1.12.tar.xz
-sha256 1c1480c2618097e402fe804c1431fbd49b0d43520af81d4c1a695a2fa13a3922  crossx86-mipsel-linux-musl-1.1.12.tar.xz
-sha256 f0a8b3eb0566138ab3cc77bc09648be15bc325da974ec98b9e67f2fb82be3295  crossx86-mipsel-sf-linux-musl-1.1.12.tar.xz
-sha256 6a99989c3dff56776981f6760b2c54dcb9e4032be1d649968bb06c04f2e64177  crossx86-mips-linux-musl-1.1.12.tar.xz
-sha256 c082adc3e8b0750bb22ca82628524fd525fd77f534517ac5a66e7ac5a297ee6e  crossx86-powerpc-linux-musl-1.1.12.tar.xz
-sha256 8c6c9ebb54040e47947b4d3af6823d01fef2bb6ee81b18903c801030c066092b  crossx86-sh4eb-linux-musl-1.1.12.tar.xz
-sha256 ae9a0a5a60226aa086a56628cfd5c1d283c9dffdca37891d7e6adc2bd21ac2e0  crossx86-sh4-linux-musl-1.1.12.tar.xz
-sha256 27e0ea1043a58aebeadf1dacd67e47fd0b5c19fc36f42c9374e5fa3308df09c6  crossx86-x86_64-linux-musl-1.1.12.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7e4539e..0680473 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -56,32 +56,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
-TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
-TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-ifeq ($(BR2_arm)$(BR2_ARM_EABI),yy)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_arm)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabihf-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_armeb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_i386),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mips),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_powerpc),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_sh4),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_sh4eb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4eb-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_x86_64),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC),y)
 TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
 ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
-- 
2.10.2
