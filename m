Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB977C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B7380ED6;
	Tue, 21 Jul 2026 18:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBCVJ5JdXxS6; Tue, 21 Jul 2026 18:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A010680EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659388;
	bh=y6Ulqb/Kj2l0bgjFEIQJW9gmeZbPdsN27LGFE9nq2Sg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGF20P2PBRUVFD5mRdGDElAV/L4z0JlW6q0IesfuunV7o89Oq3Wvv8sbnPn/XHDLz
	 /JO6xXssOphUr6/rv51RUN83+zY3qa3GhXff/cjhOcrciSh92II94ar8e2EbTfvzrQ
	 Ztd4M6IaTyh0EDdx/jG4sYFr82iRe/KzHizd6WaMEhEUevK2/Voi4oaRzSkeFtNBLi
	 VAF1/tcn5GWpFVrOgSF34914GRgaYQttClxIH4v8AoOwQOyDrxYhIeKecVapVCLPEU
	 aZeF0vkCCLI6YXKZtUGt3BwyBUwqmICwsuiTIH78vBzvaQQv39dhx5HThOrYY23FlU
	 Vn2xxreSNMljA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A010680EF2;
	Tue, 21 Jul 2026 18:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7397109C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD9660611
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bk7AdiEvkG9t for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D65AC605DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D65AC605DC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D65AC605DC
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so84451915e9.1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659383; x=1785264183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CMIlA6I2rGPIos0ZPa3jipUbg/uwnCCKnC1pMOd3rcE=;
 b=OwBGHOBWIWQ2O8w0FkcC5Y1LEdlBpmtdauNQFeyf9q7eWk7pu7CfYr19BynIadxUmV
 Y49ubO6NhQ802W+13hO+ynGNb1idfpEbT/KO0dUVNr9o5HVhWsgcYMdsVSO0ZUpAn3Nx
 BnljDitNhGv3wuAcX+avVwriCUzOW/+qjqQB6Hf3TDaSscSRi4V0XhaAT+JI4sNBJeLr
 C+LczWZ7AUdD03EqcUPeoHXn7hS0L6NEKYXJSgphjVefA+RpWtZLRC1sZT9cP+5Ildlw
 rsQgVoTkOSHDcqBmFC1SUHpb+NN+xzZh7irgzf1FKOXsalN6Fkl9kHw5qAd/HgoTpz+B
 HfUQ==
X-Gm-Message-State: AOJu0YwQEL6NCf1g471B3YidV8Ad9HAOzJz8D4WNFDO7PGrIZWbRY1IA
 MUSXsUZztiywC0Jhg36lboc/8qDedkmv4VdxaVdrtCyCqmnVLhe/jc0LdbYwAELBHbm++hd39AU
 renHd
X-Gm-Gg: AfdE7clw0etzEz41a90kwc5eHm/gunwFRv7m7J2QXA4oTj80JMqDOR8x6RBGKwPa9HU
 DI8AHVotQ+qSlP15yYAlKkyw5qF4VY4P0gsOSElnyb2Nv0znYNq4H3NIaBb74CRJ35oryxIlDBP
 QPCsNV0KapdACzYi6FZUORUXetMAn7fjGAuRq5EcW4B/uSY894ov/PI+cA982mJcekQO7kSNJJn
 MLY+tATdbp5CEUlFK/YcWs8bQqS7imL5zwb3+HRg90eZsktYHkhF16j2CkcP2TjaDeMIi0jrAy8
 El80046cWl1XSeQNL+lUQWjtHaP0xrxPto9ldQ767zeK4SMuVVyqOHZkOeT0OPLkVdifpvAQa+n
 Nsalg6rDZwaXxuOcA4yw6aqreyivmRrvN4wJI3XfI7gYATtHf3Bz8Igw2jEm8lhFllP1c78mSQM
 rYodxNhQbzMsrbW1wqiHmyVn8xYlqJIKhlBiU1+8vtoBF3epnPAIstHkwjz4yqH5kDCc9HBTI5g
 W9ppqOlXMRazfZmFZRw9lgtw3i1ey2+Y866Z4FBnByt8qrNNZ9HlhSzl055Ft8V95uh+I4Zy7ZF
 VkMkK2MxTjs=
X-Received: by 2002:a05:600c:190b:b0:493:c77c:108a with SMTP id
 5b1f17b1804b1-4954aa1a10amr213529505e9.36.1784659382654; 
 Tue, 21 Jul 2026 11:43:02 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:43:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:45 +0200
Message-ID: <20260721184249.1579381-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659383; x=1785264183;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CMIlA6I2rGPIos0ZPa3jipUbg/uwnCCKnC1pMOd3rcE=;
 b=VS83ToFnlj5c6A3vKaxynSaItfrHnkLRKzYOJ5Szx39aGhFOWk2GGo5QI1OpGIuMrl
 w0PzHFEekYYN6cuJU7aO2LIQ1krWlBprR7JW56Yhat1DoOCJMUNWKbny2X0FcSx0SmKC
 xCzNtLhhKftzMNHDXe203LcLIuLYi1F6Ly74E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VS83ToFn
Subject: [Buildroot] [PATCH 2/6] configs/stm32f469_disco_{sd,
 xip}: fix boot failure after uClibc bump
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
    ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100 ]---

The STM32F469 has no MMU, and uClibc's standard malloc() implementation
returns NULL for allocations performed during early init on this target,
causing init to abort immediately.

Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
meant for small/noMMU systems, via the uClibc config fragment already
introduced for the STM32F429 in board/stmicroelectronics/common/stm32f4xx/,
which addresses the same issue on this Cortex-M4/noMMU board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32f469_disco_sd_defconfig  | 1 +
 configs/stm32f469_disco_xip_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c58523217e22..c0dacd5b0c12 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 9124177193f4..e642d8d48908 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
