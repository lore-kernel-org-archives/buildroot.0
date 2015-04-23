From: will_wagner at carallon.com <will_wagner@carallon.com>
Date: Thu, 23 Apr 2015 12:53:09 +0100
Subject: [Buildroot] [RFC 1/1] add musl-cross 1.1.6 external toolchain
Message-ID: <1429789989-14539-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

The 1.1.6 version of musl-cross fixes the two issues preventing recent
toolchains being used by buildroot, namely:
- sysroot is enabled again
- kernel headers are included again

I have added it in addition to the 1.1.1 version, as I believe we
normally deprecate old version before removal. Also was not sure how to add
the second version. I could have renamed the existing
BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS to BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_1
which would have been more consistent with other toolchains where multiple
versions are supported, however to avoid any legacy issues I did not.

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 toolchain/toolchain-external/Config.in             | 30 ++++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  6 ++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2b99cc..df7e2a5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -833,6 +833,26 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 
 	  http://musl.codu.org/
 
+config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6
+	bool "Musl 1.1.6 toolchain"
+	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
+		(BR2_i386 && !BR2_x86_i386) || BR2_microblazebe || BR2_mips || \
+		BR2_mipsel || (BR2_powerpc && BR2_powerpc_CLASSIC) || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	help
+	  Toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 4.9.2, binutils 2.25 and
+	  musl 1.1.6. It does not have a cross debugger included.
+
+	  The ARM toolchain is built for ARMv4t, soft-float.
+	  The x86 toolchain is built for i486.
+
+	  http://musl.codu.org/
+
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
 	bool "Synopsys ARC 2014.12 toolchain"
 	depends on BR2_arc
@@ -943,6 +963,16 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && (BR2_mipsel && BR2_SOFT_FLOAT)
 	default "powerpc-linux-musl"     if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_powerpc
 	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_x86_64
+	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && BR2_arm
+	default "armeb-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && BR2_armeb
+	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && BR2_i386
+	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && BR2_microblazebe
+	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && (BR2_mips && !BR2_SOFT_FLOAT)
+	default "mips-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && (BR2_mips && BR2_SOFT_FLOAT)
+	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && (BR2_mipsel && !BR2_SOFT_FLOAT)
+	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && (BR2_mipsel && BR2_SOFT_FLOAT)
+	default "powerpc-linux-musl"     if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && BR2_powerpc
+	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6 && BR2_x86_64
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2427463..9885a64 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -355,8 +355,12 @@ TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = aarch64-2014.05-30-aarch64-linux-gnu-i686-pc-linux-gnu.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS)$(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS_1_1_6),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.1
+else
+TOOLCHAIN_EXTERNAL_VERSION = 1.1.6
+endif
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
 ifeq ($(BR2_arm),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-- 
2.1.4
