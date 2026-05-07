Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1ADCD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C4761110;
	Thu,  7 May 2026 20:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0mFpJDzkwqY; Thu,  7 May 2026 20:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9FE60F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778185273;
	bh=PnuNt3CSMaesO8dvK3DF9kJgCKNnVe7r1zvathk4uqg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kvC9ZOdpFCs75kttTrDw7/j3wuqaHQXbBoMKfn95Is1v4rgEtEFx7PpyQiE7O4CsG
	 NffrcINYxeGiXC9OklJrKWRx2/kxWUn3FV0Z9KfoIsoqhrz+yjxUqHwEJnRnCT/fQZ
	 KSNJRVowwY12JTDzUsww7Lw17osr7i4w1f1f01r3vHm1nQUPTRYTHHw1CGz9rL8Bah
	 8Cvy4Cj/KWJujK8ArPKGKBE5iAycjVPUq5TrmLsU95A6uLzrA8qeBcn2v4a4gokma3
	 CWbIXtbEHoiYQ5M9JZogK771vuQxLpcNB8MXAsMJUj8+x1NifBcph86lbpz4vzO/Ki
	 4arVUA2nCbPtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E9FE60F4E;
	Thu,  7 May 2026 20:21:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45EB5317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A7AC83D35
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeJWetNYLkbC for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=sofiane.hamam@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4645C83D0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4645C83D0C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4645C83D0C
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:21:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso9768175e9.1
 for <buildroot@buildroot.org>; Thu, 07 May 2026 13:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778185269; x=1778790069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43XOrv7kqQmWbfFGb2/7Nv+6ecbNNYV4mALgI5Gux6Q=;
 b=lCxAOruOsf9ede7QbCuIhpg6QpSosSFFy02aKR7U8LN283XDiq2Z7EvVG+rqQIppLo
 61cH3DhTQKLAO/3UVwGqbefrsECKHKLyulGWyPJeHllqeil2AMDzKjmCGtzhqtlznaOD
 n77cJI4XnoZmkyIoD9FvnwKxMwKLPV6MRKYm0spGJyo9ifo/sg+QfghhS5wXZr1J2Ifv
 8NrY9Wrfd73N1ptmGXNOrmh4YDXggLueC05JxeBqKJh2uM5k0MmlxDqFF7UYzFZR1oIE
 H2nbouQJ93IcnIpHsokTia8QpEjZOaDs0IBzWQwfQ6C81dPN/BoD3JNQ/9HxVGiYm0RB
 yXzg==
X-Gm-Message-State: AOJu0Yx10qI2TwGT7Qxb+vIdn/74MLwtjxuak2j3QmoLG9S5lKgXCqTH
 Vzp9dabSfJT1kC9F2G1Oj4YPnDAgD/EZV5MW7n1lG9y4HZD0WiPkc+cWXFY2APi0rrWln6fmkbq
 UcE2+
X-Gm-Gg: AeBDiesWBudP6gBqCikHeZUc36TohuVPJAbWEneQWnn1NTDv8u/RjR6TMjeMa5Ufj3R
 qFSKeW9ObXjZwI8SvZYloSHlRMFRE5mejtMaWHZmfRivXYKvowBjxu0KF7rydUfJqi8L4hT5+Ny
 u6mYEpCiId6vEErQ6IhCzyL/mU0SNzWN2XZao3fpCP7pbRO4/NCbTWgUE5nGP7jQ7sBMniv58H2
 1mfi7aoYnaWwpxCAQM08VAN0KUfv4/imzo2vzERv9QL/XxM+S54No/KTOq/1qLuv4beKgmIj2vd
 lijf+PDxqkoopiNKUF1aKjQbNHElqybEY6Xggi4GPrVVLHllPMo/C42obJfi8s+Q4YRfAwzUQgJ
 Sok/pvIcUvgQ8ow83eZ94hspW6xpPRSd/fFTS8iHGPSyZkJdlWZX2Z/f3EiT0X7ECDHpfXcMcxn
 C3uJTcZdNMX8gupZI9LlLk6aBwkTQOsXRl33M=
X-Received: by 2002:a05:600c:c107:b0:48a:52d4:888c with SMTP id
 5b1f17b1804b1-48e51e0bb23mr116010755e9.3.1778185269063; 
 Thu, 07 May 2026 13:21:09 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. ([2a01:e0a:e88:c5f0:8582:cc72:effe:b4c2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538fb1a7sm255415695e9.9.2026.05.07.13.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 13:21:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bryan Brattlof <bb@ti.com>,
	Sofiane HAMAM <sofiane.hamam@smile.fr>
Date: Thu,  7 May 2026 22:20:47 +0200
Message-ID: <20260507202047.3809574-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778185269; x=1778790069; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=43XOrv7kqQmWbfFGb2/7Nv+6ecbNNYV4mALgI5Gux6Q=;
 b=tnpKcHiNiD0NikzDNuyCj9bcowpTKmcGH4kTLWBvlMBA7wPznyZQdTE/Vkg0e/FSZn
 iIZF4/Uan53aO2DnaZpftHdPazUqsOpOhrcO6j0jab3fos56C/Z0Xtwq+ZWtdYkB2xNy
 wTI4YFB3SQ+xrA7eBfpqCKMVpz+4pjTyYHwT0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=tnpKcHiN
Subject: [Buildroot] [PATCH 1/1] configs/ti_tda4vm_sk_defconfig: pick
 starter kit r5 and uboot defconfig files
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
From: Sofiane HAMAM via buildroot <buildroot@buildroot.org>
Reply-To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix TDA4VM Starter-Kit defconfig pointing to TD4VM EVM instead of SK R5 and uboot
defconfigs.
The starter kit board boots just fine with the evm defconfigs, but it is more accurate
to use the start kit defconfigs for the starter kit board.

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 configs/ti_tda4vm_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_tda4vm_sk_defconfig b/configs/ti_tda4vm_sk_defconfig
index 3da0fe77b2..be2529fb37 100644
--- a/configs/ti_tda4vm_sk_defconfig
+++ b/configs/ti_tda4vm_sk_defconfig
@@ -29,12 +29,12 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
-BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_sk_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_evm_a72"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_sk_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
