Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58190D3E798
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 09:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FDF260008;
	Wed,  6 Nov 2024 09:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EosahlTR9pOD; Wed,  6 Nov 2024 09:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C79606C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C79606C8;
	Wed,  6 Nov 2024 09:44:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 741C2B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 09:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55A4B80F64
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 09:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBMMDa6q7OKJ for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 09:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12E1D80F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E1D80F5E
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12E1D80F5E
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 09:44:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso109244266b.1
 for <buildroot@buildroot.org>; Wed, 06 Nov 2024 01:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730886247; x=1731491047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/1Atcn8iuQaR9kDv8iTft5Ye/GlkkyCYD7QfnaONHp4=;
 b=vHlxCHCSAXXbKEsUcoi6MAPEgNDrbp1wEt0IKIc2qVU0R+KnmxDlU82mwLtW8yqK9z
 3eoBa9lBIFoEsSnBeyX7g/t8/CRPABw2q2dRr/mmkPaQ6SCiJayiSeqmyaegiW0jK1JY
 nd90s7quZrtbpNSZp+QIDDvJXRQKk3cwYgMLy0NxB6mwlQo8MMSdKqpVMk/LF3mYhuG4
 fxgnTy+WsKEKUdcj/Kxb1ody4d3CYhX/AQuA0EVR4n4D5zgfI2oG94e8PUfkpLEZLcsw
 yhsX+eM3YerJbfDBAVx4ZxGsqIAYkvoBfyjoAPIFonnZcaeaqGJGoio+O49yi4igLkqM
 nNyA==
X-Gm-Message-State: AOJu0YzqQL/fNK6aO5yViyYyRkKZlvdRLdki6pLsckDAfmNusVMD+acF
 9pV5dq1uVtcZdXxx2PFqgyaGp8uyk4Cq8uGcU/2BBQE59x5bAiY5mM+c+6UZYtAupFnma/YRch/
 g
X-Google-Smtp-Source: AGHT+IGDwe6Y9m/B6DsDFISvlPNJPZvKfgJy8BGt0TFV9zpWrhy0lOLzJX2UMank+2QbI3RE1cBzxQ==
X-Received: by 2002:a17:907:60d3:b0:a9a:b818:521d with SMTP id
 a640c23a62f3a-a9ec6632f32mr141631766b.18.1730886247102; 
 Wed, 06 Nov 2024 01:44:07 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6abfcbdsm2485618a12.37.2024.11.06.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 01:44:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 10:43:44 +0100
Message-ID: <20241106094346.3694622-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730886247; x=1731491047;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/1Atcn8iuQaR9kDv8iTft5Ye/GlkkyCYD7QfnaONHp4=;
 b=bTBg615UnS4gJJYwoeIb4lPngCUzmJSNjHg3Lh9WVVjSWArmGDzsUE1MFXneM15hDc
 rHSaWJfMp5YgOex5RBVsy0n9K6J2RMbwWiOjtId5KI76FuEaK5cLM/c2wBX1q4qKNmPD
 PjRpcaCf53N2zACYA4bvgxpxGZ89hcAB+4k7M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bTBg615U
Subject: [Buildroot] [PATCH v5 1/2] boot/arm-trusted-firmware: v2.11: fix
 building ST elf file
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
Cc: Marleen Vos <marleen.vos@mind.be>, Sergey Matyukevich <geomatsi@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit backports a pending, but likely correct, patch that fixes the
following build error:

'buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc' -o buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf -Wl,--hash-style=gnu -Wl,--as-needed -nostartfiles -Wl,-Map=buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.map -Wl,-dT buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/stm32mp1.ld buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/stm32mp1-stm32mp157c-dk2.o
buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf: error: PHDR segment not covered by LOAD segment
collect2: error: ld returned 1 exit status

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

No changes since v4

Changes v3 -> v4:
- Replace the fixing patch. The previous patch did not pass the
  tests because it caused regressions on platforms other than ST.
  The review process led to a new patch specifically for the ST
  platform.

No changes since v2

Added in v2

 ...pie-option-when-building-ST-elf-file.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 boot/arm-trusted-firmware/v2.11/0001-fix-st-set-no-pie-option-when-building-ST-elf-file.patch

diff --git a/boot/arm-trusted-firmware/v2.11/0001-fix-st-set-no-pie-option-when-building-ST-elf-file.patch b/boot/arm-trusted-firmware/v2.11/0001-fix-st-set-no-pie-option-when-building-ST-elf-file.patch
new file mode 100644
index 000000000000..d2b82e0921f4
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.11/0001-fix-st-set-no-pie-option-when-building-ST-elf-file.patch
@@ -0,0 +1,37 @@
+From fbd050b61652db732f7a7a1ca36450b1bb339298 Mon Sep 17 00:00:00 2001
+From: Yann Gautier <yann.gautier@st.com>
+Date: Tue, 29 Oct 2024 13:42:07 +0100
+Subject: [PATCH] fix(st): set no-pie option when building ST elf file
+
+This elf file is used to build a binary file that concatenates BL2 and
+its device tree blob. It then does not need PIE option, and this avoids
+the following compilation error with some compiler versions:
+  error: PHDR segment not covered by LOAD segment
+
+Change-Id: I7562e8c1890275fe0409f3a23cc66a8e14ea1ee0
+Signed-off-by: Yann Gautier <yann.gautier@st.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: backport from https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/32960
+---
+ plat/st/common/common_rules.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/st/common/common_rules.mk b/plat/st/common/common_rules.mk
+index 212a67d5168c..b9fe3d4d676f 100644
+--- a/plat/st/common/common_rules.mk
++++ b/plat/st/common/common_rules.mk
+@@ -58,9 +58,9 @@ $(eval $(call MAKE_LD,${STM32_TF_LINKERFILE},$(STM32_LD_FILE),bl2))
+ tf-a-%.elf: $(PLAT)-%.o ${STM32_TF_LINKERFILE}
+ 	@echo "  LDS     $<"
+ ifeq ($($(ARCH)-ld-id),gnu-gcc)
+-	${Q}$($(ARCH)-ld) -o $@ $(subst --,-Wl$(comma)--,${STM32_TF_ELF_LDFLAGS}) -nostartfiles -Wl,-Map=$(@:.elf=.map) -Wl,-dT ${STM32_TF_LINKERFILE} $<
++	${Q}$($(ARCH)-ld) -o $@ $(subst --,-Wl$(comma)--,${STM32_TF_ELF_LDFLAGS}) -nostartfiles -Wl,-no-pie -Wl,-Map=$(@:.elf=.map) -Wl,-dT ${STM32_TF_LINKERFILE} $<
+ else
+-	${Q}$($(ARCH)-ld) -o $@ ${STM32_TF_ELF_LDFLAGS} -Map=$(@:.elf=.map) --script ${STM32_TF_LINKERFILE} $<
++	${Q}$($(ARCH)-ld) -o $@ ${STM32_TF_ELF_LDFLAGS} -no-pie -Map=$(@:.elf=.map) --script ${STM32_TF_LINKERFILE} $<
+ endif
+ 
+ tf-a-%.bin: tf-a-%.elf
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
