From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:57:02 +0100
Subject: [Buildroot] [PATCH v3 13/24] toolchain-external-musl-cross: new
	package
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-14-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the pre-built Musl external
toolchains. As of this commit, the code is currently not used, but it
will be used as soon as the external toolchain infrastructure gets
introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-musl-cross/Config.in        | 30 ++++++++++++++++++
 .../Config.in.options                              |  6 ++++
 .../toolchain-external-musl-cross.hash             | 12 ++++++++
 .../toolchain-external-musl-cross.mk               | 36 ++++++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk

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
index 0000000..899b4da
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-musl-cross"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
new file mode 100644
index 0000000..beef8fd
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
@@ -0,0 +1,12 @@
+# Locally calculated
+sha256 e32c23d0b83639fc10ad06666ec086b66453b9be44415fe1a818c3c3b526dfb1  crossx86-armeb-linux-musleabi-1.1.12.tar.xz
+sha256 eb81bd5d6ada454c6e854b18bfa8dc801333782152166f6cab9fb7cd11692987  crossx86-arm-linux-musleabi-1.1.12.tar.xz
+sha256 a050da284ff22d291ae71dfc249ebdedb18334b8d626804760ce7d5963e392e6  crossx86-arm-linux-musleabihf-1.1.12.tar.xz
+sha256 18d07f5c8f4cfe373461cf21cf7b1bfefa820a37e96a69b68e0f315d528b4286  crossx86-i486-linux-musl-1.1.12.tar.xz
+sha256 1c1480c2618097e402fe804c1431fbd49b0d43520af81d4c1a695a2fa13a3922  crossx86-mipsel-linux-musl-1.1.12.tar.xz
+sha256 f0a8b3eb0566138ab3cc77bc09648be15bc325da974ec98b9e67f2fb82be3295  crossx86-mipsel-sf-linux-musl-1.1.12.tar.xz
+sha256 6a99989c3dff56776981f6760b2c54dcb9e4032be1d649968bb06c04f2e64177  crossx86-mips-linux-musl-1.1.12.tar.xz
+sha256 c082adc3e8b0750bb22ca82628524fd525fd77f534517ac5a66e7ac5a297ee6e  crossx86-powerpc-linux-musl-1.1.12.tar.xz
+sha256 8c6c9ebb54040e47947b4d3af6823d01fef2bb6ee81b18903c801030c066092b  crossx86-sh4eb-linux-musl-1.1.12.tar.xz
+sha256 ae9a0a5a60226aa086a56628cfd5c1d283c9dffdca37891d7e6adc2bd21ac2e0  crossx86-sh4-linux-musl-1.1.12.tar.xz
+sha256 27e0ea1043a58aebeadf1dacd67e47fd0b5c19fc36f42c9374e5fa3308df09c6  crossx86-x86_64-linux-musl-1.1.12.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
new file mode 100644
index 0000000..0ff4099
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# toolchain-external-musl-cross
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION = 1.1.12
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION)
+
+ifeq ($(BR2_arm)$(BR2_ARM_EABI),yy)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = arm-linux-musleabi
+else ifeq ($(BR2_arm)$(BR2_ARM_EABIHF),yy)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = arm-linux-musleabihf
+else ifeq ($(BR2_armeb),y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = armeb-linux-musleabi
+else ifeq ($(BR2_i386),y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = i486-linux-musl
+else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = mips-linux-musl
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = mipsel-linux-musl
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = mipsel-sf-linux-musl
+else ifeq ($(BR2_powerpc),y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = powerpc-linux-musl
+else ifeq ($(BR2_sh4),y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = sh4-linux-musl
+else ifeq ($(BR2_sh4eb),y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = sh4eb-linux-musl
+else ifeq ($(BR2_x86_64),y)
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX = x86_64-linux-musl
+endif
+
+TOOLCHAIN_EXTERNAL_MUSL_CROSS_SOURCE = crossx86-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_PREFIX)-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION).tar.xz
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
