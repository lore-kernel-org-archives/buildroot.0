Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0462C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB46380EE5;
	Tue, 21 Jul 2026 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D09gOC2s5RFz; Tue, 21 Jul 2026 18:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A140D80F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659391;
	bh=kykLFqr0c6EXOhMOY3hPMixRhlCuT/zli1pFPAzu/EM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l8TKwTJbK80Q/YidTTYyxtgVEau0jJ1cjFgEdpaY+Htwa1OKuIEpJicajMmyMEYmg
	 7UBSd+AMbSo/UopRcErrIK9vxuwDjymbKoZGJwVOnFnDMoHuwGT4nWJ5gLZXjWBfJH
	 ewzWutQHhqrHXxkP7W0OSdoNhWDYEyc0+OXTVSXI+djynJPk3a6iqfX8XyKiqt+8j3
	 QvZxdGhLeKkencuyFboysB3T1CH2ZjkqknLAsHED8i8m5OfgVO40ddp8MJVc1PwFqu
	 1SirDBWYtzr8dwZP7enyNxzK6VEPMEdhT9KHUZ1u6nDmAD0xO5vEdDxytaMVxZ0Clb
	 wRk4/2ttcgzcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A140D80F0B;
	Tue, 21 Jul 2026 18:43:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B60EB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5EC060611
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szqbRRz9DaDx for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1130605DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1130605DC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1130605DC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso24618145e9.1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659384; x=1785264184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m1f0WN6s0JLfkZOtPxdAERtLqHq7cw5CZ8/oGq/MXRE=;
 b=RFaQyL2FLCJF0D4vO8Lz8bSdjXnxn9c9DlGo1Ozvg1A3gUN+ffyG2FDxSYUhEOKvpH
 SrJpNyUg/unzTEWfUBvMTBXgMzJZ4wG5FEpadsF4qOKlF8FcIK7pZ5F/6nweGLSm0Ih+
 auDdSbpUpi0NWF12C1UfH/NHtA2fnBArTjQLuXzamMxhwuAI0YlsPiXrny+a2Fc3d/QM
 jYC4qYK2IMYyl17hOooElR4rg28TN4DI6R1AMMFNK4PBhK2LW1xSYO+lNfFjd9ExRVeu
 ucCmu5v3STKD0dlr6ablAqbNp9Gu7dP9XVHtSTpvu91xcCvN8NHAPqfSY9OYV599THf8
 qEEQ==
X-Gm-Message-State: AOJu0YwyREuLEGr6svjknpIXRQGEokzHsZHJ0mhPxOOoaJ6dFf5+jkpW
 Ifj1cRzIQYge/5ipn6v1yTlvpkjU8/izgBZyeaAPucgtoT8+OVxHLTGHq7JrPZlrmWzmwlCsMNn
 caKcv
X-Gm-Gg: AfdE7cmsx8n7BbLCgPL1Re7BlnQh7uMmLZ+ivXg+2ujGXUN2KbK7xG8zNNnnUgPk7or
 fm7H3IT8fbUnNTPRGAnSkgePX5yE8e1KabtKqlZM+9x2+i7jkLy/+tEE4gJbK0+BJzCnPKso9D4
 XENPhev0m1LwBOcI4ggEify8F0nbvIdgRwxP1Q7QJzCJXPsonLydaWA9y3euJPZqphPDkEzLxgF
 3phiFL3wC646kDMwzEPg3yMqqMyHmoCx1UdpPjHcz2UQ1/iWNlTxqTO6SwZ5FKAsMfg2OX+1szu
 sr6C8Yso2NKgpF7Ugd5z2eQYkfzMePzOMMWwcyP7z8T05sbojU0M5gh5ueAWP0Qvy/FRU+I2g80
 HghDS8BGp8g/hn2LMQ5geS2SG52RzM2vES0uHNb/1HDAK+/BVx/nNXMr3c0vzViJqsap2QUc0zr
 8ucInoTxcYzZ21L4WIEAAbb9u/vZwi/Hs6jJtEx7RuZiNk3lvU7SvpzGHEZgABOjYaXkhvCKqgy
 eegzwDuciH7snVc/gkiFNi4tto/9x4uwYoSYd/f0WwIDJ1UEPVInWbkwNksnNh2wz0sb1Yc5gG8
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id
 5b1f17b1804b1-4954a3eec4bmr227562795e9.8.1784659383765; 
 Tue, 21 Jul 2026 11:43:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:43:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:46 +0200
Message-ID: <20260721184249.1579381-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659384; x=1785264184;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m1f0WN6s0JLfkZOtPxdAERtLqHq7cw5CZ8/oGq/MXRE=;
 b=RJ1wsWCHyIVNd/aQKdG0C0/YCzDo/st+pC/uLkyZf5UXLjS4fRrz+z7G5wUMBhiOjv
 a13AdyGkiGUXSa7hT3csVL2RhEJc7MEiHbpiEBgjW5aHKqHq9VEX4n6bLVzUhZlTMmQs
 weH0ghcjVKqpoEJpvFVAbIHTiNsYFon+Sjvjk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RJ1wsWCH
Subject: [Buildroot] [PATCH 3/6] configs/stm32f769_disco_sd: fix boot
 failure after uClibc bump
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
bump to 1.0.58"), the board hangs after starting init:

    [    1.231624] Run /sbin/init as init process
    [    1.235599]   with arguments:
    [    1.238549]     /sbin/init
    [    1.241331]     earlyprintk
    [    1.244018]   with environment:
    [    1.247143]     HOME=/
    [    1.249554]     TERM=linux
    [    1.252177]     consoleblank=0

No error message is printed and the boot simply stalls at this
point.

The STM32F769 has no MMU, and uClibc's standard malloc()
implementation returns NULL for allocations performed during early
init on this target, causing init to fail.

Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
meant for small/noMMU systems, via a uClibc config fragment. Unlike
the STM32F429/STM32F469 fix, the fragment is kept board-specific
since the STM32F769 is a Cortex-M7 board and does not belong to the
stm32f4xx family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config | 2 ++
 configs/stm32f769_disco_sd_defconfig                            | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config

diff --git a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
new file mode 100644
index 000000000000..fb8fa9ee01c3
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
@@ -0,0 +1,2 @@
+# MALLOC is not set
+MALLOC_SIMPLE=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 065d5b59bf6d..d09b81b19b3e 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
