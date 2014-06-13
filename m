From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 14:50:03 +0200
Subject: [Buildroot] [git commit] toolchain-external: bump musl external
	toolchains to 1.1.1
Message-ID: <20140613125028.BA6119CFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c8526691cb3667fe83992b94075c8c5fecc4f2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And while we're at it, factorize the definition of the musl version,
since it's common to the definition of the tarball names for the
various supported architectures.

[Peter: Adjust Config.in info to match new version]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in             |    8 +++---
 toolchain/toolchain-external/toolchain-external.mk |   23 ++++++++++---------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 23099aa..6f3c75e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -814,7 +814,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	  http://www.linaro.org/engineering/armv8/
 
 config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
-	bool "Musl toolchain"
+	bool "Musl 1.1.1 toolchain"
 	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
 		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
 		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
@@ -822,11 +822,11 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  Toolchain based on the Musl C library, provided by the
-	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
-	  musl 1.0.0. It does not have a cross debugger included.
+	  musl-cross project. It uses gcc 4.8.3, binutils 2.24 and
+	  musl 1.1.1. It does not have a cross debugger included.
 
 	  The ARM toolchain is built for ARMv4t, soft-float.
 	  The x86 toolchain is built for i486.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d331fbd..ae08a03 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -359,31 +359,32 @@ TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.05_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
-TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-1.0.0/
+TOOLCHAIN_EXTERNAL_VERSION = 1.1.1
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)/
 ifeq ($(BR2_arm),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_armeb),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-armeb-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_i386),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_microblazebe),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_mips),y)
 ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif # BR2_SOFT_FLOAT
 else ifeq ($(BR2_mipsel),y)
 ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif # BR2_SOFT_FLOAT
 else ifeq ($(BR2_powerpc),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_x86_64),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-1.0.0.tar.xz
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif
 else
 # Custom toolchain
