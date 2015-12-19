From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Dec 2015 19:14:46 +0100
Subject: [Buildroot] [PATCH 7/7] toolchain-external: Ti Arago ARM: support
	only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450548886-21937-7-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Just rename Kconfig symbols

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/toolchain-external/Config.in             | 8 ++++----
 toolchain/toolchain-external/toolchain-external.mk | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5a1dca0..727fc2b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -134,7 +134,7 @@ comment "Sourcery CodeBench toolchains available for the EABI ABI"
 	depends on !BR2_ARM_EABI
 	depends on !BR2_STATIC_LIBS
 
-config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -158,7 +158,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	  unit to work properly. This unit is available on most
 	  Cortex-A ARM processors, but not all.
 
-config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	bool "Arago ARMv5 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -543,8 +543,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
-	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
-	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
+	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3c46d2b..969d826 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -275,7 +275,7 @@ endef
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
@@ -284,7 +284,7 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE),y)
 TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports
 TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = arago-toolchain-2011.09-sources.tar.bz2
-- 
2.4.3
