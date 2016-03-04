From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Mar 2016 23:50:07 +0100
Subject: [Buildroot] [PATCH] toolchain-external: bump musl toolchain to
	1.1.12
Message-ID: <1457131807-15330-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While the prebuilt musl toolchains provided by http://musl.codu.org/
had not been updated in a while, a new release based on musl 1.1.12
has been put online in December 2015. This commit updates our external
toolchain package to use this new pre-built toolchain.

Compared to the previous 1.1.6 toolchain, there are some changes:

 - The MIPS big endian soft-float variant is no longer available.
 - The Microblaze variant is no longer available.
 - SuperH 4, both little and big endian, variants have been added.
 - The components have been updated: gcc 5.3 is used, binutils 2.25.1,
   and of course musl 1.1.12.

Besides the update itself, in this commit, we are:

 - Making the musl toolchain non-selectable on MIPS big endian
   soft-float.

 - Making the musl toolchain actually work on MIPS little endian
   soft-float, by downloading the right tarball and setting up the
   right symbolic link.

 - Removing support for the Microblaze variant, and adding support for
   the SH4 variants.

All variants except armeb have been boot tested under Qemu, up to a
Busybox shell prompt. armeb has not been tested due to the lack of a
Qemu configuration for this architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 19 ++++++++++--------
 .../toolchain-external/toolchain-external.hash     | 23 +++++++++++-----------
 toolchain/toolchain-external/toolchain-external.mk | 16 +++++++++++----
 3 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2ee4c0f..0f9f7b8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -573,12 +573,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	  glibc 2.18, gdb 7.7.50 and kernel headers 3.13.
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl 1.1.6 toolchain (experimental)"
+	bool "Musl 1.1.12 toolchain (experimental)"
 	depends on (BR2_arm && BR2_ARM_EABI) || \
 		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
 		(BR2_armeb && BR2_ARM_EABI) || \
-		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
-		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
+		(BR2_i386 && !BR2_x86_i386) || \
+		(BR2_mips && !BR2_SOFT_FLOAT) || \
+		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || \
+		BR2_sh4 || BR2_sh4eb || \
+		BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
@@ -586,11 +589,11 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  Toolchain based on the Musl C library, provided by the
-	  musl-cross project. It uses gcc 4.9.2, binutils 2.25 and
-	  musl 1.1.6. It does not have a cross debugger included.
+	  musl-cross project. It uses gcc 5.3, binutils 2.25.1 and
+	  musl 1.1.12. It does not have a cross debugger included.
 
 	  The ARM soft-float toolchain is built for ARMv4t, while the
 	  ARM hard-float toolchain is built for ARMv5t.
@@ -693,12 +696,12 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-mti-linux-gnu"     if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
-	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_microblazebe
 	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && !BR2_SOFT_FLOAT)
-	default "mips-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mips && BR2_SOFT_FLOAT)
 	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && !BR2_SOFT_FLOAT)
 	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && BR2_SOFT_FLOAT)
 	default "powerpc-linux-musl"     if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_powerpc
+	default "sh4-linux-musl"         if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_sh4
+	default "sh4eb-linux-musl"       if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_sh4eb
 	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_x86_64
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index df6d7e9..94c5616 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -50,15 +50,14 @@ sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu
 sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
 
 # Prebuilt musl toolchains from musl-cross
-sha256 26da90f5cf5e5220b1d6424420ab9f3877a1826a2a5268a62d390711c0e73cd0  crossx86-arm-linux-musleabi-1.1.6.tar.xz
-sha256 c3b1c79a48e999c8f655cd008d04ba53c4f76217fa3c289566dab174e8ef8711  crossx86-arm-linux-musleabihf-1.1.6.tar.xz
-sha256 b74ebf6e92b69bb7c7651cc8ff87a14c41fd9c043af9db7304b293c291c830b5  crossx86-armeb-linux-musleabi-1.1.6.tar.xz
-sha256 740716209e1aef0442fe8e200a1b2582d9d86e86ff6d113ab9678b592121e2f9  crossx86-i486-linux-musl-1.1.6.tar.xz
-sha256 7a0da8bd22c25ad11acc8309d8541b7b7966ccefcf136d860d38bf625c05b53e  crossx86-microblaze-linux-musl-1.1.6.tar.xz
-sha256 b89503aeb02a5201476ff4bb014879f1989868c9c25f2af84e2fc04bec7acf2e  crossx86-mips-linux-musl-1.1.6.tar.xz
-sha256 552996f7a8132f8be994513156a30f4c03fff4873b76726b98e4e0056257367f  crossx86-mipsel-linux-musl-1.1.6.tar.xz
-sha256 c49f7425ac9d0629cd9893d7bc247d5e6847c9eb5d11924dbc440b9d10f6c2bb  crossx86-powerpc-linux-musl-1.1.6.tar.xz
-sha256 79a1a4be93e2a63acb137170e98bdfbf744bd9ca7b15b76ab512d1e0dfec834e  crossx86-sh4-linux-musl-1.1.6.tar.xz
-sha256 aec4d560dc601e397fc86a9759166005afba22ad666d1a48019b5102c534ccc1  crossx86-sh4eb-linux-musl-1.1.6.tar.xz
-sha256 68eda0795aacd4371b45a6c58c5c75e86c0c2fdf7ebc2c0b7d3752462c848260  crossx86-x86_64-linux-musl-1.1.6.tar.xz
-sha256 6bef5ee2cdb9fa35e49ce0a270f6d7c48f3268c6f6345ad5ca0b8137982b4690  crossx86-x86_64-x32-linux-musl-1.1.6.tar.xz
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
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 6c3022a..38bc59b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -362,7 +362,7 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
-TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
+TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
 ifeq ($(BR2_arm)$(BR2_ARM_EABI),yy)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
@@ -372,14 +372,18 @@ else ifeq ($(BR2_armeb),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_i386),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_microblazebe),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_mips),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else ifeq ($(BR2_mipsel),y)
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_powerpc),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
+else ifeq ($(BR2_sh4),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
+else ifeq ($(BR2_sh4eb),y)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-sh4eb-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif
@@ -508,6 +512,10 @@ ifeq ($(BR2_i386),y)
 MUSL_ARCH = i386
 else ifeq ($(BR2_ARM_EABIHF),y)
 MUSL_ARCH = armhf
+else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
+MUSL_ARCH = mipsel-sf
+else ifeq ($(BR2_sh),y)
+MUSL_ARCH = sh
 else
 MUSL_ARCH = $(ARCH)
 endif
-- 
2.6.4
