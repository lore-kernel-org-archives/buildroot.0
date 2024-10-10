Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D89CF11C6
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 10:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559E4818DC;
	Thu, 10 Oct 2024 10:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77CQqGR13xDg; Thu, 10 Oct 2024 10:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B83A81911
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B83A81911;
	Thu, 10 Oct 2024 10:42:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6151BF3F7
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 10:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD0A40B53
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 10:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsLjwwvnuKuR for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 10:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6997340B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6997340B4F
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6997340B4F
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 10:42:34 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c876ed9c93so895636a12.2
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 03:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728556952; x=1729161752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B0Rexgxv3Sp5KgMQIT3i03UjwBz1Zaka/SdXDBGYC/A=;
 b=Yu3vHEaXiXECFR04B9bFunZzZSbhfx+qoww0AtuyFNFgMU0nqtjnwD7kWBoZjp/Ut5
 jIPI9IVJb6h2hHH3zjRQzqWgEfhA5zFzUEzmv4T2l5O4HbYBZL90UAC8PCoIx8jvInXO
 sMFgBRPGBkE4aSPV7q5tNCdX6xZXysBAzq94XodL9hwphSqXNZMBynLGmx3HTyrICvr+
 y9rEOqhcv0sPabTatEO8NS9CeztUihfVtzxmSf3nR3f+as2cQMnvmuzerHBsfU8p1uXt
 c35xYec3RiJoCo3mNLj4u/Uem3LnkMV4bkHo6+pNHcEptv/XAcLHfhUPRNsdwuYiI0eU
 Is4Q==
X-Gm-Message-State: AOJu0YzjL1ONgETDF+Pub6Lfu0jF+y5NFr50rUdllAKQ+BHzZU7YZygm
 WjVzW+4a64RP9AMQWbK44+UyIGOGKVNG+sOAtUgl5Bvl6FDrTx97iSsjvwYbXIAB8Tt1nZ6aF28
 FVNo=
X-Google-Smtp-Source: AGHT+IEn/Li99XI7a6NtPLnmWwrLKxa4UJ5CuEEXVYuY1qgWy8oEELxrRGW4V6dwBwdCCrXKPh99jA==
X-Received: by 2002:a05:6402:5243:b0:5c9:3ff:2526 with SMTP id
 4fb4d7f45d1cf-5c91d6991b1mr4721139a12.31.1728556951996; 
 Thu, 10 Oct 2024 03:42:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a293:3a9f:6dc0:1d29])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9372940c1sm601652a12.82.2024.10.10.03.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 03:42:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 12:42:20 +0200
Message-ID: <20241010104221.2756789-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728556952; x=1729161752;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B0Rexgxv3Sp5KgMQIT3i03UjwBz1Zaka/SdXDBGYC/A=;
 b=f/6JVubo/4KbOfCKFDskWV2jEFSqM7EbT3y1dDUumgZFzB56ep4GJguaYDVd6WDR7t
 9oddqzbLmVv8OBr3mgxMek9SLO5b7mR6rsiGvM8fUI+1UlQ3Op3y9JGAFxOIWTYz+cx7
 FPRwsJKd9+4Hybzd/atHI7kbWItMclgWJyiBk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=f/6JVubo
Subject: [Buildroot] [PATCH v2 1/2] boot/arm-trusted-firmware: v2.11: fix
 the ld autodetection for gnu-gcc
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
Cc: Marleen Vos <marleen.vos@mind.be>, Sergey Matyukevich <geomatsi@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Before applying this patch, the compiler was used instead of the linker
as shown by the following error raised by the compilation of TF-A for
the STM32MP157C-DK2 discovery board:

'buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc' -o buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf -Wl,--hash-style=gnu -Wl,--as-needed -nostartfiles -Wl,-Map=buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.map -Wl,-dT buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/stm32mp1.ld buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/stm32mp1-stm32mp157c-dk2.o
buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf: error: PHDR segment not covered by LOAD segment
collect2: error: ld returned 1 exit status

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Added in v2

 ...-build-Set-guess-gnu-gcc-ld-properly.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 boot/arm-trusted-firmware/v2.11/0001-fix-build-Set-guess-gnu-gcc-ld-properly.patch

diff --git a/boot/arm-trusted-firmware/v2.11/0001-fix-build-Set-guess-gnu-gcc-ld-properly.patch b/boot/arm-trusted-firmware/v2.11/0001-fix-build-Set-guess-gnu-gcc-ld-properly.patch
new file mode 100644
index 000000000000..a6731aa08853
--- /dev/null
+++ b/boot/arm-trusted-firmware/v2.11/0001-fix-build-Set-guess-gnu-gcc-ld-properly.patch
@@ -0,0 +1,53 @@
+From 7988f1afe1324486e473874b22ed009c0d6d6806 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Wed, 9 Oct 2024 18:29:00 +0200
+Subject: [PATCH] fix(build): Set guess-gnu-gcc-ld properly
+
+With the commit 291e718229e7f ("build: skip toolchain detection for some
+targets"), the compiler was used instead of the linker:
+
++        guess-gnu-gcc-cpp = $(1)
++        guess-gnu-gcc-as = $(1)
++        guess-gnu-gcc-ld = $(1)
+
+This patch correctly references the linker for gnu-gcc.
+
+The patch was tested on the STM32MP157C-DK2 board.
+
+This is the error raised during the compilation of ARM Trusted Firmware
+v2.11 before applying the patch
+
+'buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc' -o buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf -Wl,--hash-style=gnu -Wl,--as-needed -nostartfiles -Wl,-Map=buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.map -Wl,-dT buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/stm32mp1.ld buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/stm32mp1-stm32mp157c-dk2.o
+buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: buildroot/output/build/arm-trusted-firmware-custom/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf: error: PHDR segment not covered by LOAD segment
+collect2: error: ld returned 1 exit status
+
+Below, after applying the patch:
+
+'buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld' -o buildroot/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf --hash-style=gnu --as-needed -Map=buildroot/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/tf-a-stm32mp157c-dk2.map --script buildroot/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/stm32mp1.ld buildroot/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/stm32mp1-stm32mp157c-dk2.o
+'buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/objcopy' -O binary buildroot/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/tf-a-stm32mp157c-dk2.elf buildroot/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/tf-a-stm32mp157c-dk2.bin
+
+Built /home/dario/projects/buildroot-10/output/build/arm-trusted-firmware-v2.11/build/stm32mp1/release/tf-a-stm32mp157c-dk2.bin successfully
+
+Fixes: 291e718229e7f ("build: skip toolchain detection for some targets")
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: backport from upstream https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/31746
+---
+ make_helpers/toolchain.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/make_helpers/toolchain.mk b/make_helpers/toolchain.mk
+index 96e43a8b94cb..a81be3751d86 100644
+--- a/make_helpers/toolchain.mk
++++ b/make_helpers/toolchain.mk
+@@ -286,7 +286,7 @@ ifndef toolchain-mk
+ 
+         guess-gnu-gcc-cpp = $(1)
+         guess-gnu-gcc-as = $(1)
+-        guess-gnu-gcc-ld = $(1)
++        guess-gnu-gcc-ld = $(shell $(1) --print-prog-name ld 2>$(nul))
+         guess-gnu-gcc-oc = $(shell $(1) --print-prog-name objcopy 2>$(nul))
+         guess-gnu-gcc-od = $(shell $(1) --print-prog-name objdump 2>$(nul))
+         guess-gnu-gcc-ar = $(call which,$(call decompat-path,$(patsubst %$(call file-name,$(1)),%$(subst gcc,gcc-ar,$(call file-name,$(1))),$(call compat-path,$(1)))))
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
