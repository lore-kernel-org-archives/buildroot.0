Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D6C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144D380ED5;
	Tue, 21 Jul 2026 18:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Njd1CmVSBGcE; Tue, 21 Jul 2026 18:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319D180ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659386;
	bh=skmfCZBro8aF43GH9Aj1x90AdspL7jq17Pii63DHFM4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIXLkH+tztHIiDjt81TTEUnIOfjMcwI00tb3DpJZqsT0vOfHxgrEJew95Cnc+zuxk
	 mz3c4mTmh8pSr3nAaGIpVBy77mGk8apE6Z2joPn0RZ3dV8s5jyXnGGYDD/SjsnASUb
	 lYZkg1Zo2ptyUux1RfJB5hRO8gt+ttGFOQe4yIJsU0CKsV1OGDhCqo8jMxzXG2FMmF
	 4ZH+PK9Tycp6omrSx1u1NHH6t4OxMNr2jd1Nfky05pPOwyd62Mgy/lLtPGWN3peU6i
	 b/P1CxI8kpFdEi99y75iElVNErZDEoHQNFneMp+23+VdEj/SqmS1JEMgtdSG07JnHk
	 Y6Y4XXaWqmrVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 319D180ED6;
	Tue, 21 Jul 2026 18:43:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF7FEB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F16C540949
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x26FrJ6dSeas for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05E55406BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E55406BC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05E55406BC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so28884155e9.1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659382; x=1785264182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=whtj/phmAovG5HswARAqVzv2di/aDQ/2aFYgHWkcFuU=;
 b=hw3d6nmNeeA2uJRDGCb5hnSFgo+TXWrJcn6FoKWGQmbJ3yasmnSfARd7r2rJrgxcaO
 08VUuefmc639RyzIyhHbjULHgAhc3BjlEQphmVBZEqkkK14bWUeg3eA3tEgG7TahaH+P
 wQEDqHqkh6zPruYAWLkvOl9SCQTBu8yTGvEe5zvUYnIdCFTUrD6Ds4bs1G2PdlhFXsuV
 VlSNP4iIegKYTATQqlkDxf0Uf2n2gvlFsdwh4MV6NXEbwuKJ3sT9VNjw2bLpjQL74/7n
 Rpy61kvkQVMaaxvmfXDvH6xnEZB074ouJ+ii5Gi4hd7gGLzN0yBEjKTBTEfauNo+qITc
 m13g==
X-Gm-Message-State: AOJu0Yw6foJ+pOf5wHKb2CQ1A2w66YTdxHYJ6Z+xfXv+0YvLEntRTE+N
 P7Zxs1oWB8KZKFjjO4uB/MVkXF0SObo8EEq69IpvArIXMV94ak+iqqVEdOtejXG9Pw1OXuWbggL
 nQnRg
X-Gm-Gg: AfdE7cm0ImwNxIiqSWmXXPp7SatHEtaeTwI5tyQsCfjrAj8lzlaQ5QWXcKd/aPnQacK
 C9sPW3cw1ypUe6JT/x5Z3Lt2jPNzIN0w7//qMjmUqPcrf8NbX4t7ZA7RlY5hKeO4O2yQjNnvPFp
 sfZuXwA6LqK3rlZdxSnXRe5xxr+pqNvuzAPPCAic/hFvBgBeMN7LQxBoC/0QdbvPNhJ1lHR2Irp
 2vwX8OeQ6HX1Nl4B513nkXJQUyWm4lZNX1k80eaSS7WEMYi7QGbMxV4IXFvZi0MeHqsIKb8tLRi
 JtT6LlU/Q73yutoU4vVAp4GbrorQCoRREaC6GifY+98wsgECi2PZxUuv6o/BjEwyP2/bIUntphL
 BV1UsWIXOLkvmrzvMYValuUeel/pKk60qsOvr+9B93LlqvhYgaKtZC5qSpmAredjcE07HOEUgx1
 UBFqwAoB1NQVE+E9RIFViBLFt0mIJIavtpGY4SciaHoJqsagi8pNRSkhVD4L9+gAi+/VQ0THJwj
 lMUeURMGGIHfiR0VNwzGrwUKWnZp66Youk70Ayq6PZiFBxM2x7+/kot8LrTcT1e3DbcMDHKmCHX
X-Received: by 2002:a05:600c:4503:b0:493:c84c:2b57 with SMTP id
 5b1f17b1804b1-4954a513f99mr217566935e9.29.1784659381649; 
 Tue, 21 Jul 2026 11:43:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:43:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:44 +0200
Message-ID: <20260721184249.1579381-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659382; x=1785264182;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=whtj/phmAovG5HswARAqVzv2di/aDQ/2aFYgHWkcFuU=;
 b=FriwGgP5rkI9ECW68kNVhUherAyV3bCqH+idLO7Mne/nEAb3UVqd8dCgvzZ5ctFPNO
 6OjtvobRBYidscGFXbmPbzyIZpmvubq2t2QLjO8Lv7WTYQOxRbWtDSW68kZZPXIh6WDJ
 EHHedv2z1gqXX3NxrZTwE79cdwVHrpWqyChfU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FriwGgP5
Subject: [Buildroot] [PATCH 1/6] configs/stm32f429_disco_xip: fix boot
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
bump to 1.0.58"), the board fails to boot:

    sh: out of memory
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100
    CPU: 0 PID: 1 Comm: init Not tainted 6.1.167 #2
    Hardware name: STM32 (Device Tree Support)
    Function entered at [<0800ea1e>] from [<0800de7b>]
    Function entered at [<0800de7b>] from [<080e4991>]
    Function entered at [<080e4991>] from [<080e2d19>]
    Function entered at [<080e2d19>] from [<080125eb>]
    Function entered at [<080125eb>] from [<08012b09>]
    Function entered at [<08012b09>] from [<08012b69>]
    ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100 ]---

The STM32F429 has no MMU, and uClibc's standard malloc() implementation
returns NULL for allocations performed during early init on this target,
causing init to abort immediately.

Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
meant for small/noMMU systems, via a uClibc config fragment. The
fragment is placed under board/stmicroelectronics/common/stm32f4xx/,
rather than under the board-specific directory, so that it can be
shared with the STM32F469, another Cortex-M4/noMMU board affected by
the same issue, which will be fixed in a subsequent patch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/common/stm32f4xx/uclibc-fragment.config  | 2 ++
 configs/stm32f429_disco_xip_defconfig                           | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config

diff --git a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
new file mode 100644
index 000000000000..fb8fa9ee01c3
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
@@ -0,0 +1,2 @@
+# MALLOC is not set
+MALLOC_SIMPLE=y
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 489303b93e0d..e6edfa906177 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
