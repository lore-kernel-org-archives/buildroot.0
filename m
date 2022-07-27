Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2138C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C6E94049A;
	Wed, 27 Jul 2022 09:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C6E94049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tncamk9MOdyu; Wed, 27 Jul 2022 09:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B671C40492;
	Wed, 27 Jul 2022 09:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B671C40492
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F269F1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC10681A5F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC10681A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYClwMtXjHyD for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD69480D7E
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD69480D7E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 076F2864E5; Wed, 27 Jul 2022 09:13:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:11:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1702ddd20cf1b7900151ab322ac26cf71368f010
X-Git-Newrev: 90932b407c00ce31e8fd7e1627907d0caf6fa901
X-Patchwork-Hint: ignore
Message-Id: <20220727091332.076F2864E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: invert glibc <-> !static
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90932b407c00ce31e8fd7e1627907d0caf6fa901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, glibc depends on !BR2_STATIC_LIBS in all the toolchain
variants.

However, for some architectures, glibc is the only supported libc. In
commit 3b3105328e4aa54f3cfecbf8454a9db63875d76e ("Config.in: only
allow BR2_STATIC_LIBS on supported libc/arch"), we implemented a fix
to avoid configurations were BR2_STATIC_LIBS=y with an architecture
already supported by glibc, because these configurations are
impossible. This commit 3b3105328e4aa54f3cfecbf8454a9db63875d76e
prevents from selecting BR2_STATIC_LIBS=y when the C library used for
the internal toolchain backend is glibc.

However, it introduces a discrepency between how this topic is handled
for internal and external toolchains:

 - For internal toolchains, we prevent BR2_STATIC_LIBS=y if glibc is
   chosen.

 - For external toolchains, we allow BR2_STATIC_LIBS=y in all cases,
   and it's each glibc toolchain that has !BR2_STATIC_LIBS

This commit addresses this discrepency by preventing BR2_STATIC_LIBS=y
if glibc is chosen in all cases.

Thanks to this, we can remove the !BR2_STATIC_LIBS dependency on both
the glibc package, and all glibc external toolchains.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=14256

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: update to master, fix the gen-bootlin-toolchains script, add
a comment in the static/shared choice to indicate that static is
supported only with uclibc or musl]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                                          |  6 +-
 package/glibc/Config.in                            |  1 -
 support/scripts/gen-bootlin-toolchains             |  4 --
 toolchain/toolchain-buildroot/Config.in            |  9 +--
 toolchain/toolchain-external/Config.in             |  3 -
 .../toolchain-external-arm-aarch64-be/Config.in    |  1 -
 .../toolchain-external-arm-aarch64/Config.in       |  1 -
 .../toolchain-external-arm-arm/Config.in           |  2 -
 .../toolchain-external-bootlin/Config.in.options   | 80 ++--------------------
 .../Config.in                                      |  1 -
 .../Config.in                                      |  1 -
 .../Config.in                                      |  1 -
 .../toolchain-external-codesourcery-arm/Config.in  |  2 -
 .../toolchain-external-codesourcery-mips/Config.in |  2 -
 .../Config.in                                      |  1 -
 .../toolchain-external-custom/Config.in.options    |  4 --
 .../toolchain-external-linaro-aarch64-be/Config.in |  1 -
 .../toolchain-external-linaro-aarch64/Config.in    |  1 -
 .../toolchain-external-linaro-arm/Config.in        |  2 -
 .../toolchain-external-linaro-armeb/Config.in      |  2 -
 20 files changed, 11 insertions(+), 114 deletions(-)

diff --git a/Config.in b/Config.in
index 4833379543..28406b08de 100644
--- a/Config.in
+++ b/Config.in
@@ -620,8 +620,7 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
-	depends on !BR2_TOOLCHAIN_BUILDROOT || \
-		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
@@ -630,6 +629,9 @@ config BR2_STATIC_LIBS
 	  option is enabled, due to their need for dynamic library
 	  support.
 
+comment "static only needs a toolchain w/ uclibc or musl"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_SHARED_LIBS
 	bool "shared only"
 	depends on BR2_BINFMT_SUPPORTS_SHARED
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 2c6dc40139..c0526cdd9e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 config BR2_PACKAGE_GLIBC_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
-	depends on !BR2_STATIC_LIBS
 	# Make sure to keep these dependencies in sync with the
 	# Config.in comments in
 	# toolchain/toolchain-buildroot/Config.in
diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 257afc69db..23ebfbdce9 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -326,8 +326,6 @@ class Toolchain:
                 # glibc needs mmu support
                 if "BR2_USE_MMU" not in depends:
                     depends.append("BR2_USE_MMU")
-                # glibc doesn't support static only configuration
-                depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
                 # musl needs mmu support
@@ -501,8 +499,6 @@ def gen_config_in_options(toolchains, fpath):
         f.write("\tbool\n")
         for arch, details in arches.items():
             conditions = details['conditions'].copy()
-            if set([t.libc for t in toolchains if t.arch == arch]) == set(['glibc']):
-                conditions.append("!BR2_STATIC_LIBS")
             f.write("\tdefault y if %s\n" % " && ".join(conditions))
         f.write("\n")
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c8f522a8da..836af3b22a 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -20,11 +20,6 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
-config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
-	bool
-	default y if BR2_PACKAGE_UCLIBC_SUPPORTS
-	default y if BR2_PACKAGE_MUSL_SUPPORTS
-
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
@@ -50,9 +45,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 	  http://www.gnu.org/software/libc/
 
-comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
+comment "glibc needs a toolchain w/ kernel headers >= 3.2"
 	depends on BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
 comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 97cdc26df9..c1c159cb8e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -5,9 +5,6 @@ comment "Toolchain External Options"
 choice
 	prompt "Toolchain"
 
-comment "glibc toolchains only available with shared lib support"
-	depends on BR2_STATIC_LIBS
-
 # Kept toolchains sorted by architecture in order to use some toolchain
 # as default choice
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 783ed35314..eeb88579fe 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 2021.07"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 4557debe5d..9eb5d64a9d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 2021.07"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index ca9831e05f..28c6541406 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -1,7 +1,6 @@
 comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on BR2_arm
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
-	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	bool "Arm ARM 2021.07"
@@ -10,7 +9,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 399843abc9..c9eec1915b 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -22,21 +22,21 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64 && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
-	default y if BR2_nios2 && !BR2_STATIC_LIBS
+	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc && BR2_powerpc_440fp
 	default y if BR2_powerpc && BR2_powerpc_e300c3
 	default y if BR2_powerpc && BR2_powerpc_e500mc
-	default y if BR2_powerpc64 && BR2_powerpc_e5500 && !BR2_STATIC_LIBS
+	default y if BR2_powerpc64 && BR2_powerpc_e5500
 	default y if BR2_powerpc64 && BR2_powerpc_e6500
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && !BR2_STATIC_LIBS
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
-	default y if BR2_s390x && BR2_s390x_z13 && !BR2_STATIC_LIBS
+	default y if BR2_s390x && BR2_s390x_z13
 	default y if BR2_sh && BR2_sh4
 	default y if BR2_sh && BR2_sh4aeb
-	default y if BR2_sparc64 && BR2_sparc_v9 && !BR2_STATIC_LIBS
+	default y if BR2_sparc64 && BR2_sparc_v9
 	default y if BR2_sparc && BR2_sparc_v8
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
@@ -61,7 +61,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	bool "aarch64 glibc bleeding-edge 2021.11-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -85,7 +84,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	bool "aarch64 glibc stable 2021.11-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -200,7 +198,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	bool "aarch64be glibc bleeding-edge 2021.11-1"
 	depends on BR2_aarch64_be
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -224,7 +221,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	bool "aarch64be glibc stable 2021.11-1"
 	depends on BR2_aarch64_be
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -343,7 +339,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -368,7 +363,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -442,7 +436,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -468,7 +461,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -594,7 +586,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -620,7 +611,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -746,7 +736,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -772,7 +761,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -898,7 +886,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -924,7 +911,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1180,7 +1166,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	bool "microblazebe glibc bleeding-edge 2021.11-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -1204,7 +1189,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	bool "microblazebe glibc stable 2021.11-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
@@ -1322,7 +1306,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	bool "microblazeel glibc bleeding-edge 2021.11-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -1346,7 +1329,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	bool "microblazeel glibc stable 2021.11-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
@@ -1466,7 +1448,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1492,7 +1473,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1617,7 +1597,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1643,7 +1622,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1768,7 +1746,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1794,7 +1771,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1920,7 +1896,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1946,7 +1921,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2073,7 +2047,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2100,7 +2073,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2231,7 +2203,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2258,7 +2229,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2389,7 +2359,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2416,7 +2385,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2544,7 +2512,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	bool "nios2 glibc bleeding-edge 2021.11-1"
 	depends on BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2568,7 +2535,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	bool "nios2 glibc stable 2021.11-1"
 	depends on BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2688,7 +2654,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2713,7 +2678,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2832,7 +2796,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2857,7 +2820,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2976,7 +2938,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3001,7 +2962,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3120,7 +3080,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3145,7 +3104,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3170,7 +3128,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3195,7 +3152,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3268,7 +3224,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3293,7 +3248,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3366,7 +3320,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3391,7 +3344,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3466,7 +3418,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3493,7 +3444,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3520,7 +3470,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3651,7 +3600,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3676,7 +3624,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3701,7 +3648,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3726,7 +3672,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3846,7 +3791,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3871,7 +3815,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3943,7 +3886,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3968,7 +3910,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -4043,7 +3984,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4070,7 +4010,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -4204,7 +4143,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4297,7 +4235,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4395,7 +4332,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4492,7 +4428,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4523,7 +4458,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -4672,7 +4606,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4701,7 +4634,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -4842,7 +4774,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4874,7 +4805,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index 8ea9508f9f..2341d08832 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -4,7 +4,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index 116d4a834d..c58c55119a 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -5,7 +5,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
 		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
index 24cbcffa29..8c0f985c5b 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
@@ -5,7 +5,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before
 	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index bdbe2acaea..aea2ba34f2 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -6,7 +6,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_ARM_EABI
 	# Unsupported ARM cores
 	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8A
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -34,4 +33,3 @@ comment "Sourcery CodeBench toolchains available for the EABI ABI"
 	depends on BR2_arm
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	depends on !BR2_ARM_EABI
-	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
index 1a3bdc9393..8e067c8ffb 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -7,7 +7,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_mips_interaptiv
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -93,4 +92,3 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	depends on BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 9d785a4b6b..cf3ce69a68 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -3,7 +3,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_nios2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0c8b83fc0e..efd475a182 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -386,7 +386,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	bool "glibc/eglibc"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain uses the GNU C
@@ -398,9 +397,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	  toolchain with eglibc configured to exclude key features may
 	  cause build failures to some packages.
 
-comment "(e)glibc only available with shared lib support"
-	depends on BR2_STATIC_LIBS
-
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
 	bool "musl (experimental)"
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index bac90374cf..53d5dfd8f2 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	bool "Linaro AArch64 BE 2018.05"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 824eb76c72..c9b84b1d30 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2018.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index beb38609c3..015e92f17c 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -1,7 +1,6 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2018.05"
@@ -9,7 +8,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index aa21e44860..b338a72bff 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -1,7 +1,6 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_armeb
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2018.05"
@@ -9,7 +8,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

