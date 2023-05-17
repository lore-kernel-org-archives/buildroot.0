Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7168FC77B75
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 13:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC18242A11;
	Wed, 17 May 2023 13:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC18242A11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48gjZOsk6nOD; Wed, 17 May 2023 13:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBA5429F0;
	Wed, 17 May 2023 13:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEBA5429F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6049F1BF487
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 13:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 395AC409AC
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 13:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 395AC409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9v7hz7Lxq5A for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 13:04:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BEA9409B4
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BEA9409B4
 for <buildroot@buildroot.org>; Wed, 17 May 2023 13:04:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so1364956a12.1
 for <buildroot@buildroot.org>; Wed, 17 May 2023 06:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684328678; x=1686920678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iGT/qXFcfb1QyR4X2FQD6b405cx4yoBSntCevdFFc/4=;
 b=FgpQOtoi4CcCjz89M3mhHPrJq0egfZfqOQ5LjB7s3Wdyx4n+jBhgzSaS8/24baseiX
 DV5vRwpOposcSPgtEobENQ+w7fzNJxlVQCwUhYNgHg7RYwdb6KbYVRyGp5yICulfsNyt
 aOp8bj341Al/a7Ukz9FvPzOFuDasb5MStL8rSmynOm2SduXZGPNdk6/lmla9RlfEFp76
 Kykq/Pue0n++OscipCqGZO/9HSgjY2lfqhMbX5YM2cgqjgyNEk+eJXMKDNHG+YjK6KRz
 17nou2C3Dtu05qWBtZqb0ucQN/4YYZC+7q1vLKdA6XuTBEApVLBXP5r61OmoXLIMGKHY
 HdGQ==
X-Gm-Message-State: AC+VfDya3dn4WQCq2EtTJ4pLIRlDqrpP3QENJXTC+/vALJI/jhVDYcvm
 UQF0IKFFEk3/K4OK0l8iTOJLvhOt2ry+CA==
X-Google-Smtp-Source: ACHHUZ7GncXJLyC63OsDCY6h6mPukzM6jwVY/N71C47gqG65Q19kRnp4eeAbolgP0tmHnH7x5JX/Qw==
X-Received: by 2002:a17:907:6d22:b0:953:57a1:55e1 with SMTP id
 sa34-20020a1709076d2200b0095357a155e1mr42096059ejc.62.1684328677687; 
 Wed, 17 May 2023 06:04:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:d0d:f903:7c5:c782])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b009661f07db93sm12206929ejk.223.2023.05.17.06.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:04:37 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 17 May 2023 15:04:29 +0200
Message-Id: <20230517130430.2868648-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517130430.2868648-1-thomas@devoogdt.com>
References: <20230517130430.2868648-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/fluent-bit: rework wasm handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
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
index d470e26b5e..2a7097968d 100644
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
