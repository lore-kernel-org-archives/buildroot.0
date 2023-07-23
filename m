Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC7C04E69
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E04414E2;
	Sun, 23 Jul 2023 09:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64E04414E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTg0MjyNHCEp; Sun, 23 Jul 2023 09:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455CF415AE;
	Sun, 23 Jul 2023 09:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455CF415AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 184501BF589
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6076811F6
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6076811F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEFCke-k-qfD for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:23:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE0A68100D
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE0A68100D
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so2904289f8f.2
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 02:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690104208; x=1690709008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sG4n1lv23u2WIt36l0el8ByuD9LsiACQC6GGCh31He0=;
 b=Hz6DP0V6lDqBif6DIcvLK7A1S8sKWYB9I1wGkZZijcDcCDNquUXWfHX2fEexglrBsO
 PZxmAPivs7q61dW6mo2B3yp3F2y6C8YYxj9Mke6V6JJLelt2+4BG8YSeJ/qU1h95g+KB
 iBxRKxh+BnkQ1lHlALTdLy3VH+jWpa1pnlJfaUo7FJSOl/WDyhrunZZEBeE3zk+EkC8g
 ilgqO1E9szlq3w1rVjxA4IgjNGCrEaJ7HZd1OPxJBTSf7pbTo/hBPRcOF5zmKBO0NqBA
 Yvf1MQsHH1ocI5iEe3ILSIbTBFxhg/fZ7z70jXSSU2FcqCsytzd8L6fg67YXcF8WbrIv
 uPKA==
X-Gm-Message-State: ABy/qLaUVggyKA3p/a0jWh6vAV5qmaevzIbsSbkxk/pWftKaEq9XZ6py
 uGhNk/Wf7IoGMlY8B8L+JO6wNrgcZqWMZA==
X-Google-Smtp-Source: APBJJlHB1xa8vMwhozKOVr34w+C5ZikV64T+Ye9/Z5KIQxQk1Zlp3zg2aKdMa2Vcyo8cSGHPF2bMwA==
X-Received: by 2002:a5d:58e6:0:b0:2fb:1d3a:93ff with SMTP id
 f6-20020a5d58e6000000b002fb1d3a93ffmr5190060wrd.61.1690104207428; 
 Sun, 23 Jul 2023 02:23:27 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb68:2f00:f09c:126e:2c9c:1d2b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020adfeac8000000b003143b7449ffsm9124728wrn.25.2023.07.23.02.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 02:23:27 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 11:23:14 +0200
Message-Id: <20230723092314.129079-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723092314.129079-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
 <20230723092314.129079-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/4] package/fluent-bit: rework wasm handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent-bit isn't very great at supporting the various architectures,
so help a little bit by defining the WAMR_BUILD_TARGET ourselves.

./utils/test-pkg -c fluent-bit.config -p fluent-bit -a
                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: OK
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: OK
             bootlin-microblazeel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                   bootlin-mipsel-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: OK
                 bootlin-openrisc-uclibc [14/45]: OK
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: FAILED
                           sourcery-mips [44/45]: FAILED
                          sourcery-nios2 [45/45]: OK

Two failures:

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

Fix see: https://github.com/bytecodealliance/wasm-micro-runtime/issues/625

>> Hi, building the invokeNative_general.c explicitly is supported now, please pull the latest code and use
>> "cmake -DWAMR_BUILD_INVOKE_NATIVE_GENERAL=1 ..." to build it.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: No change.
v3: No change.
---
 package/fluent-bit/Config.in     | 25 -------------------------
 package/fluent-bit/fluent-bit.mk | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index bfdea895b0..dc477e9f39 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -11,31 +11,6 @@ config BR2_PACKAGE_FLUENT_BIT
 
 	  https://github.com/fluent/fluent-bit
 
-if BR2_PACKAGE_FLUENT_BIT
-
-config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
-	bool
-	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
-	default y if BR2_arc
-	default y if BR2_arm || BR2_armeb
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_RISCV_64
-	default y if BR2_xtensa
-
-config BR2_PACKAGE_FLUENT_BIT_WASM
-	bool "wasm runtime support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
-	help
-	  Support for WASM-based plugins.
-
-comment "wasm runtime support needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-endif
-
 comment "fluent-bit needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index cd8f347768..c863e62fdb 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -22,8 +22,36 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
-ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
-FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+# WASM runtime support needs a toolchain w/ C++
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = AARCH64
+else ifeq ($(BR2_arcle)$(BR2_arceb),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = ARC
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = ARM
+else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = MIPS
+# https://github.com/bytecodealliance/wasm-micro-runtime/issues/625
+# Fix unknown opcode 'ldc1', seen on mips32r2 and mips64r2.
+FLUENT_BIT_CONF_OPTS += \
+	-DWAMR_BUILD_INVOKE_NATIVE_GENERAL=1
+else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
+FLUENT_BIT_WAMR_BUILD_TARGET = RISCV32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
+FLUENT_BIT_WAMR_BUILD_TARGET = RISCV64
+else ifeq ($(BR2_i386),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = X86_32
+else ifeq ($(BR2_x86_64),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = X86_64
+else ifeq ($(BR2_xtensa),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = XTENSA
+endif
+endif
+
+ifneq ($(FLUENT_BIT_WAMR_BUILD_TARGET),)
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes \
+	-DWAMR_BUILD_TARGET=$(FLUENT_BIT_WAMR_BUILD_TARGET)
 else
 FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
