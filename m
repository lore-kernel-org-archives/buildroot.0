Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D78DC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 16:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92B1C40949;
	Tue, 25 Jul 2023 16:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B1C40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mid8oolVuALw; Tue, 25 Jul 2023 16:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 985E0405DB;
	Tue, 25 Jul 2023 16:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 985E0405DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5FC1BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16FD860A4F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16FD860A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZEK9amN8_WE for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 16:38:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 301F4605A9
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 16:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301F4605A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B077828EF; Tue, 25 Jul 2023 16:38:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 18:38:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3597910cfa47790047fe75d569a0755b4cdb73f
X-Git-Newrev: 9b19030f3f7505af8c026cb63f0f4f509836d1e9
X-Patchwork-Hint: ignore
Message-Id: <20230725163842.1B077828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: rework wasm handling
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
Content-Type: multipart/mixed; boundary="===============7730600871500757042=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7730600871500757042==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9b19030f3f7505af8c026cb63f0f4f509836d1e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fluent-bit isn't very great at supporting the various architectures,
so help a little bit by defining the WAMR_BUILD_TARGET ourselves.

Two failures for MIPS while executing ./utils/test-pkg:

- sourcery-mips64:
core/iwasm/common/arch/invokeNative_mips.s: Assembler messages:
core/iwasm/common/arch/invokeNative_mips.s:58: Error: opcode not supported on this processor: mips64r2 (mips64r2) `ldc1 $f12,0($sp)'
core/iwasm/common/arch/invokeNative_mips.s:59: Error: opcode not supported on this processor: mips64r2 (mips64r2) `ldc1 $f14,8($sp)'
make[4]: *** [src/wasm/CMakeFiles/vmlib-static.dir/build.make:495: src/wasm/CMakeFiles/vmlib-static.dir/__/__/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/common/arch/invokeNative_mips.s.o] Error 1
make[4]: *** Waiting for unfinished jobs....

- sourcery-mips:
core/iwasm/common/arch/invokeNative_mips.s: Assembler messages:
core/iwasm/common/arch/invokeNative_mips.s:58: Error: opcode not supported on this processor: mips32r2 (mips32r2) `ldc1 $f12,0($sp)'
core/iwasm/common/arch/invokeNative_mips.s:59: Error: opcode not supported on this processor: mips32r2 (mips32r2) `ldc1 $f14,8($sp)'
make[4]: *** [src/wasm/CMakeFiles/vmlib-static.dir/build.make:495: src/wasm/CMakeFiles/vmlib-static.dir/__/__/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/common/arch/invokeNative_mips.s.o] Error 1
make[4]: *** Waiting for unfinished jobs....

Which are fixed by setting the obscure flag "WAMR_BUILD_INVOKE_NATIVE_GENERAL".

See https://github.com/bytecodealliance/wasm-micro-runtime/issues/625 for more info:
“Hi, building the invokeNative_general.c explicitly is supported now, please pull the latest code and use

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fluent-bit/Config.in     | 20 +++++++++++++-------
 package/fluent-bit/fluent-bit.mk | 12 +++++++++++-
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index bfdea895b0..9ffde5b315 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -13,15 +13,21 @@ config BR2_PACKAGE_FLUENT_BIT
 
 if BR2_PACKAGE_FLUENT_BIT
 
+config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH
+	string
+	default "AARCH64"    if BR2_aarch64 || BR2_aarch64be
+	default "ARC"        if BR2_arcle || BR2_arceb
+	default "ARM"        if BR2_arm || BR2_armeb
+	default "MIPS"       if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default "RISCV32"    if BR2_riscv && BR2_RISCV_32
+	default "RISCV64"    if BR2_riscv && BR2_RISCV_64
+	default "X86_32"     if BR2_i386
+	default "X86_64"     if BR2_x86_64
+	default "XTENSA"     if BR2_xtensa
+
 config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
 	bool
-	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
-	default y if BR2_arc
-	default y if BR2_arm || BR2_armeb
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_RISCV_64
-	default y if BR2_xtensa
+	default y if BR2_PACKAGE_FLUENT_BIT_WASM_ARCH != ""
 
 config BR2_PACKAGE_FLUENT_BIT_WASM
 	bool "wasm runtime support"
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index cd8f347768..1185860661 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -23,7 +23,17 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_BACKTRACE=No
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
-FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
+
+# https://github.com/bytecodealliance/wasm-micro-runtime/issues/625
+# Fix unknown opcode 'ldc1', seen on mips32r2 and mips64r2.
+ifeq ($(FLUENT_BIT_WAMR_ARCH),MIPS)
+FLUENT_BIT_CONF_OPTS += \
+	-DWAMR_BUILD_INVOKE_NATIVE_GENERAL=1
+endif
+
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes \
+	-DWAMR_BUILD_TARGET=$(FLUENT_BIT_WAMR_ARCH)
 else
 FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
 endif

--===============7730600871500757042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7730600871500757042==--
