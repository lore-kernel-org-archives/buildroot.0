From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:21:00 +0100
Subject: [Buildroot] [git commit] toolchain-external: remove musl-cross
	prebuilt toolchain
Message-ID: <20161217132105.64DA87F9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63abbcce3708647c1efb1b17f6a1144ac0075009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream link to download musl-cross prebuilt toolchain is dead [1] and
there no new download location. Also the last prebuilt toolchain use musl
1.1.12 version which is not uptodate (currently 1.1.15).

Remove this support and recommend to use Buildroot toolchain instead.

[1] https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  9 +++++++
 toolchain/toolchain-external/Config.in             |  6 -----
 .../toolchain-external-musl-cross/Config.in        | 30 ----------------------
 .../Config.in.options                              | 19 --------------
 .../toolchain-external-musl-cross.hash             | 12 ---------
 .../toolchain-external-musl-cross.mk               | 12 ---------
 6 files changed, 9 insertions(+), 79 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3c672ee..71faa8d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
+	bool "musl-cross 1.1.12 toolchain removed"
+	select BR2_LEGACY
+	help
+	  The support for the prebuilt toolchain based on the Musl C
+	  library provided by the musl-cross project has been removed.
+	  Upstream doesn't provide any prebuilt toolchain anymore, use the
+	  Buildroot toolchain instead.
+
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "uClibc tests now in uclibc-ng-test"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c007e62..35db582 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -40,9 +40,6 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.i
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"
 
-# Musl based toolchains (after all the others)
-source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
-
 # Kept last, so it remains the non-default choice, unless there isn't
 # any available toolchain profile for the currently selected
 # architecture.
@@ -137,9 +134,6 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.i
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options"
 
-# Musl based toolchains
-source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options"
-
 # Custom toolchains
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
deleted file mode 100644
index c72f9d7..0000000
--- a/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
+++ /dev/null
@@ -1,30 +0,0 @@
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
-	depends on !BR2_mips_interaptiv && !BR2_mips_m5150
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
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options b/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
deleted file mode 100644
index cd12355..0000000
--- a/toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
+++ /dev/null
@@ -1,19 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arm-linux-musleabi"	 if BR2_arm && BR2_ARM_EABI
-	default "arm-linux-musleabihf"	 if BR2_arm && BR2_ARM_EABIHF
-	default "armeb-linux-musleabi"	 if BR2_armeb
-	default "i486-linux-musl"	 if BR2_i386
-	default "mips-linux-musl"	 if (BR2_mips && !BR2_SOFT_FLOAT)
-	default "mipsel-linux-musl"	 if (BR2_mipsel && !BR2_SOFT_FLOAT)
-	default "mipsel-sf-linux-musl"	 if (BR2_mipsel && BR2_SOFT_FLOAT)
-	default "powerpc-linux-musl"     if BR2_powerpc
-	default "sh4-linux-musl"         if BR2_sh4
-	default "sh4eb-linux-musl"       if BR2_sh4eb
-	default "x86_64-linux-musl"	 if BR2_x86_64
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-musl-cross"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
deleted file mode 100644
index beef8fd..0000000
--- a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
+++ /dev/null
@@ -1,12 +0,0 @@
-# Locally calculated
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
diff --git a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk b/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
deleted file mode 100644
index 966505b..0000000
--- a/toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# toolchain-external-musl-cross
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION = 1.1.12
-TOOLCHAIN_EXTERNAL_MUSL_CROSS_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION)
-
-TOOLCHAIN_EXTERNAL_MUSL_CROSS_SOURCE = crossx86-$(TOOLCHAIN_EXTERNAL_PREFIX)-$(TOOLCHAIN_EXTERNAL_MUSL_CROSS_VERSION).tar.xz
-
-$(eval $(toolchain-external-package))
