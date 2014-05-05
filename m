From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 May 2014 23:17:10 +0200
Subject: [Buildroot] [PATCHv2 10/10] toolchain-external: add publicly
	available musl toolchains
In-Reply-To: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1399324630-3830-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds ten toolchains based on the musl C library that are
publicly available from the musl-cross project.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 30 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 27 +++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0d8d9b9..0f78937 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -867,6 +867,26 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_12
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
+config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
+	bool "Musl toolchain"
+	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
+		(BR2_i386 && !BR2_x86_i386) || BR2_microblaze || BR2_mips || \
+		BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  Toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 1.0.0. It does not have a cross debugger included.
+
+	  The ARM toolchain is built for ARMv4t, soft-float.
+	  The x86 toolchain is built for i486.
+
+	  http://musl.codu.org/
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	bool "Custom toolchain"
 	help
@@ -953,6 +973,16 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
+	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm
+	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
+	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
+	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_microblaze
+	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && !BR2_SOFT_FLOAT)
+	default "mips-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && BR2_SOFT_FLOAT)
+	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && !BR2_SOFT_FLOAT)
+	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && BR2_SOFT_FLOAT)
+	default "powerpc-linux-musl-gcc" if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_powerpc
+	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_x86_64
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 05d8867..3f88188 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -369,6 +369,33 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_02),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2014.02_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-1.0.0/
+ifeq ($(BR2_arm),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-1.0.0.tar.xz
+else ifeq ($(BR2_armeb),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-1.0.0.tar.xz
+else ifeq ($(BR2_i386),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-1.0.0.tar.xz
+else ifeq ($(BR2_microblaze),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-1.0.0.tar.xz
+else ifeq ($(BR2_mips),y)
+ifeq ($(BR2_SOFT_FLOAT),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-1.0.0.tar.xz
+else
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-1.0.0.tar.xz
+endif # BR2_SOFT_FLOAT
+else ifeq ($(BR2_mipsel),y)
+ifeq ($(BR2_SOFT_FLOAT),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-1.0.0.tar.xz
+else
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-1.0.0.tar.xz
+endif # BR2_SOFT_FLOAT
+else ifeq ($(BR2_powerpc),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-1.0.0.tar.xz
+else ifeq ($(BR2_x86_64),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-1.0.0.tar.xz
+endif
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.9.2
