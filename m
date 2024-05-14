Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF28C25B7A
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 16:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEDB441582;
	Tue, 14 May 2024 16:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zI6HxRXqAF7U; Tue, 14 May 2024 16:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6455D41550
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6455D41550;
	Tue, 14 May 2024 16:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 189031BF3CD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0514381F69
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 16:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjUBfMRHLX2O for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 16:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9562181F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9562181F4E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9562181F4E
 for <buildroot@buildroot.org>; Tue, 14 May 2024 16:15:14 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D1F893521163; Tue, 14 May 2024 18:15:11 +0200 (CEST)
Date: Tue, 14 May 2024 18:15:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkOOD/8NqH3cTjlP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715703312; bh=pxhdMZtqin08z2E+FunbbCg8J1AUjWhB3RnN5oTEmfE=;
 h=Date:From:To:Subject:From;
 b=Hi76cw1zw8D05IzIIYpwBrxTSa2xiPD+w5DBofRcdEA7gr89Q4MEKgYNlkAEMvQ4+
 D1P9btUVbQmn0IJ8eCKsbdcbo4aPv2PlRVfK2qz1YPX01TcGM6t9HXMxaAeDEZP/k4
 cWqdk1ZpJdzGqEyG6QtvzM1VRtFaNnZZn5efHJ4ostF8BegJv/qwgeN1akvHxZdXXw
 vHGrkKDG4NuiAMiMsyGHwsfprSfZsLE23125ZoT/zKg8+tB2LOTu/DRo1X2tWpyfb7
 4rvuOvrTOT4cowy/56KzelFSWxLE88vKFVF/JUX+YAaywR1XBJB3k5ByQrkqBOF6qH
 GFs4nw6SdJ2Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Hi76cw1z
Subject: [Buildroot] [PATCHv2 1/3] arch: add support for loongarch64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Loongarch is a RISC microprocessor from Loongarch Technologies.
- at the moment we only support lp64d ABI
- binutils 2.40 is too old so disable it for loongarch64
- gcc 12.x is too old to compile a Linux kernel, so disable it for
  loongarch64
- gdb versions work fine 

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - added me to DEVELOPERS file requested by Thomas P.
 - check older binutils/gcc/gdb for support requested by Thomas P.
---
 DEVELOPERS                      |  1 +
 arch/Config.in                  | 12 ++++++++++++
 arch/Config.in.loongarch64      | 14 ++++++++++++++
 package/binutils/Config.in.host |  1 +
 package/gcc/Config.in.host      |  2 ++
 package/glibc/Config.in         |  1 +
 package/musl/Config.in          |  1 +
 7 files changed, 32 insertions(+)
 create mode 100644 arch/Config.in.loongarch64

diff --git a/DEVELOPERS b/DEVELOPERS
index a9deddb343..9e299e7e66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3203,6 +3203,7 @@ N:	Wade Berrier <wberrier@gmail.com>
 F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
+F:	arch/Config.in.loongarch64
 F:	board/qemu/riscv32-virt/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	package/asterisk/
diff --git a/arch/Config.in b/arch/Config.in
index f39c33ef7f..070a4aca3a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,6 +77,14 @@ config BR2_i386
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
+config BR2_loongarch64
+	bool "loongarch64"
+	select BR2_ARCH_IS_64
+	select BR2_USE_MMU
+	help
+	  Loongarch is a RISC microprocessor from Loongarch Technologies.
+	  https://en.wikipedia.org/wiki/Loongson
+
 config BR2_m68k
 	bool "m68k"
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
@@ -374,6 +382,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch64"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.loongarch64 b/arch/Config.in.loongarch64
new file mode 100644
index 0000000000..2b5bac095d
--- /dev/null
+++ b/arch/Config.in.loongarch64
@@ -0,0 +1,14 @@
+config BR2_ARCH
+	default "loongarch64"
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index cb65f5f5e4..89e36d6047 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -14,6 +14,7 @@ choice
 
 config BR2_BINUTILS_VERSION_2_40_X
 	bool "binutils 2.40"
+	depends on !BR2_loongarch64
 
 config BR2_BINUTILS_VERSION_2_41_X
 	bool "binutils 2.41"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2324561a3e..a0377cc0a3 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -30,6 +30,8 @@ config BR2_GCC_VERSION_12_X
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
+	# too old to compile Linux Kernel
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 config BR2_GCC_VERSION_13_X
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 81c64083f4..5385e2a855 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
diff --git a/package/musl/Config.in b/package/musl/Config.in
index a6e2af054c..70475326f5 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
