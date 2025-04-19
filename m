Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F181C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D967C83F69;
	Mon, 19 May 2025 10:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZSkV82ugu74; Mon, 19 May 2025 10:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E3982186
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E3982186;
	Mon, 19 May 2025 10:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12CF9D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A0B141A45
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlUsrmOhtxa5 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBCF411C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBBCF411C8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4DE781E90; Mon, 19 May 2025 10:39:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:01:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5621fe94afd766ca09f65789ced4ce4e8a6bdbe0
X-Git-Newrev: 8fd537ae0550c3f66e575cfd380cad5334821046
X-Patchwork-Hint: ignore
Message-Id: <20250519103951.D4DE781E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/scripts/gen-bootlin-toolchains: allows armv8-a CPU to use armv7-a
 toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============0608282909082695075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0608282909082695075==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8fd537ae0550c3f66e575cfd380cad5334821046
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The ARMV7-A toolchains are capable to compile binaries for ARMv8-A CPU
in AArch32 execution state.

This adds the BR2_ARM_CPU_ARMV8A option in the 'conditions' to allow
ARMV8-A CPU such as Cortex-A53 or Cortex-A72 to use ARMV7-A toolchains.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains             |  4 +--
 .../toolchain-external-bootlin/Config.in.options   | 40 ++++++++--------------
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 9ba5827cf6..502411d4cc 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -52,12 +52,12 @@ arches = {
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armebv7-eabihf': {
-        'conditions': ['BR2_armeb', 'BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
         'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'armeb',
     },
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 471dc55f44..ef3d23d026 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -8,8 +8,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arcle && BR2_archs38
 	default y if BR2_arm && BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
 	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
-	default y if BR2_arm && BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF
-	default y if BR2_armeb && BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF
+	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
 	default y if BR2_m68k_m68k
 	default y if BR2_m68k_cf
@@ -816,8 +816,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -843,8 +842,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	bool "armv7-eabihf glibc stable 2024.05-1"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -869,8 +867,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv7-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -896,8 +893,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	bool "armv7-eabihf musl stable 2024.05-1"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -922,8 +918,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -949,8 +944,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	bool "armv7-eabihf uclibc stable 2024.05-1"
 	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -975,8 +969,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -1002,8 +995,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	bool "armebv7-eabihf glibc stable 2024.05-1"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1028,8 +1020,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armebv7-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -1055,8 +1046,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	bool "armebv7-eabihf musl stable 2024.05-1"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1081,8 +1071,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1108,8 +1097,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	bool "armebv7-eabihf uclibc stable 2024.05-1"
 	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19

--===============0608282909082695075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0608282909082695075==--
