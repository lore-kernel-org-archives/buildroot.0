Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AA5E68964
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 09:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDB14070A;
	Thu, 31 Oct 2024 09:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLWMb1A1hIat; Thu, 31 Oct 2024 09:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E1C40714
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E1C40714;
	Thu, 31 Oct 2024 09:33:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D505E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 09:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10EBA40B11
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 09:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvxAf8r0iTdf for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 09:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62354400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62354400E5
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62354400E5
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 09:33:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso90612066b.2
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 02:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730367199; x=1730971999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r/9xS2lDOoaSBhB27WbbrwYmapPWl5pqBFHxs5uAlHA=;
 b=BS68b1eAghQa+TrmDzxAK7S1/JRB4WXv3TaOukA/Mgl9+bh+QoOJk/zG7U1C9F5E6F
 udtz9yLnxJuFw1ONYYWkYOTpLEugmGgwOP2YK08LvNlPW30H6ZmoSaWu4gdeO/iILP9b
 dG6w2VCXs+VZh3dYuSi5k7PCwJuOU8LukYWByCHJTh+yqZl10tnhrScuxdVX67EM3z5X
 +ed+Coc1qa8otGpqJWVNHDH8Vvw4bKJYoLuitEtDPnLQYHcMtxDWEZkt32ZBZrBImKSi
 VnsVvOnNcVBG1tZQ6txCz82U83ebtmuEjJ/MWK45YTF6mtw2t2Ku7JFmZ4x84dOtVKF+
 UmcA==
X-Gm-Message-State: AOJu0YzC79FdU6w8xwQdLhwyn5nDsmaW3qCsNglTdarRyQOlgVztLCty
 adKWau7k74afwdgcNmKUudrEABHZTm8Ev8uU1uLJ3QLxTEIvwez+2NLIMzLp9cummdkZ97WyQcT
 B
X-Google-Smtp-Source: AGHT+IHWdQ7aps5a97Ej+EZ8Xokm57LGSYVs2rK7e8t+JPbJHYO/BtE0kcVlr1zNEm/RQIQVMuW9gg==
X-Received: by 2002:a17:907:6d11:b0:a99:5f16:3539 with SMTP id
 a640c23a62f3a-a9e505ceefcmr232913066b.0.1730367198962; 
 Thu, 31 Oct 2024 02:33:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.36])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c4e0asm45692466b.46.2024.10.31.02.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 02:33:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 10:33:10 +0100
Message-ID: <20241031093311.636608-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730367199; x=1730971999;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r/9xS2lDOoaSBhB27WbbrwYmapPWl5pqBFHxs5uAlHA=;
 b=p+JmKh5e1nTc1eaZ5Bt+/C+kxHI7/Gp8sJ8mT8QzRrLwc9PzM+wCsEOU+DzB8Lzp1l
 fThqB+e3fZIOqneK0xI9CG7c2M5x+dedHST48rloVuOHOfjkava8Ixe+cdKFQYvgzYzf
 O//ur4LxMmN7KkWBPMOd7IuQQbNGqSBC8Jnjk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=p+JmKh5e
Subject: [Buildroot] [PATCH v4 1/2] boot/arm-trusted-firmware: v2.11: fix
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
