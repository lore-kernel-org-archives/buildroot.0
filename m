From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 22:59:03 +0100
Subject: [Buildroot] [git commit] toolchain-external: add support for musl
	toolchain on ARM EABIhf
Message-ID: <20151220220736.523FC822FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ec7830b6786812bba8fe3e01d41fc54f415c9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since a few releases, the pre-built musl external toolchain has added
an ARM EABIhf variant, built for ARMv5T. This commit allows this
additional external toolchain to be used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 10 +++++++---
 toolchain/toolchain-external/toolchain-external.mk |  4 +++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 727fc2b..8d4a835 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -446,7 +446,9 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	bool "Musl 1.1.6 toolchain (experimental)"
-	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
+	depends on (BR2_arm && BR2_ARM_EABI) || \
+		(BR2_arm && BR2_ARM_EABIHF && !BR2_ARM_CPU_ARMV4) || \
+		(BR2_armeb && BR2_ARM_EABI) || \
 		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -462,7 +464,8 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	  musl-cross project. It uses gcc 4.9.2, binutils 2.25 and
 	  musl 1.1.6. It does not have a cross debugger included.
 
-	  The ARM toolchain is built for ARMv4t, soft-float.
+	  The ARM soft-float toolchain is built for ARMv4t, while the
+	  ARM hard-float toolchain is built for ARMv5t.
 	  The x86 toolchain is built for i486.
 
 	  http://musl.codu.org/
@@ -555,7 +558,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "x86_64-amd-linux-gnu"   if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX && BR2_BINFMT_FDPIC
-	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm
+	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABI
+	default "arm-linux-musleabihf"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_arm && BR2_ARM_EABIHF
 	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_armeb
 	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_i386
 	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_microblazebe
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 969d826..8a9ea88 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -350,8 +350,10 @@ TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-g
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_arm)$(BR2_ARM_EABI),yy)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
+else ifeq ($(BR2_arm)$(BR2_ARM_EABIHF),yy)
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabihf-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_armeb),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_i386),y)
