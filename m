Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A44F364A6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 17:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109E640C28;
	Thu,  9 Apr 2026 17:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixKMvVlMJDpi; Thu,  9 Apr 2026 17:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03BDF40C04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775756328;
	bh=u8Yq59qKjIkNN5vGjb8/PIfG2Q+lK0PLOBdYAYu4IEc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZniwJep+4Wcki1lzN7bjsyz1/vh5K1FkoxBRB3/80HwGSBLWYywidBNJ0wkerZ9iY
	 FHac99tAUqzcjqnOUzWRme7nDogv71sb3fghFg8En0MTkq4ihAIAz25QzxAxxsPEMy
	 Yco1UIzvwoxnefMYLHmKiwDF3Nl+al6hLR575QO2QqMRipP3r9S/lybGdL6TFPFL3Q
	 Et/KVZF+rgTJUwvJBu07gbKHWkG8cFR5TBofIk7At6P0gpDwKQucn+KvoNEsczSq9r
	 rZ+XsTbMO3FsT/UQjZR8t4+AdlgBdvxyJzpNI4LkVx9cH693UhDptibPtPeb/OMVbA
	 rvv5ACLZiG5qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03BDF40C04;
	Thu,  9 Apr 2026 17:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F16671D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E230660AA2
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGcNqCiQ1NBF for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 17:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E48A760AA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E48A760AA1
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E48A760AA1
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:38:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so734210f8f.3
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 10:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775756323; x=1776361123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMyPXqR83fq5/P8qHb3o2YSOikkYLowKTK5LaH7vFEI=;
 b=B/IAkIF/DPQVoaNtgoIS5+IzzCUqLT+207OCMLHJNcmiewRPNAZ9J5pBiMomUtFJYT
 nrEeexzYIVULogtNv9o9scTCO+eV3NfdlHquIw82jXzsQNrosRTipfWqisBp8KYbMqhO
 gzbXn7EdtcNHFda4hIjG0x4OFs8Yc7K+0QGRM32HqwSV6VQHPiYxD2mxmY0GBYuS5w3W
 yygRBSLocTrNbHsS6JX4hQYT3kr9EMhTTZn2FZAUbK8gLzk/nCbADAk/JLbRKKb5kv2O
 FKXPsmsrFwqVSbX2uUUHfuWbK+Af6wh2aDSI0BY85WotxOl9qAcMg8dKe0C/IBw62EnA
 gA6Q==
X-Gm-Message-State: AOJu0YwR4N2xpQGkmLONznnvEqUEbb4PvdbVXqSyqMIsslhQl5Vv4lmy
 XQr3b4jtaHUhSEFOnFKMtfKJcj65c4WQiqy+b1EpMYVNbWeqZHtWlC2I2K9Z0ffbofLerAlEYSa
 /yP7H
X-Gm-Gg: AeBDies7z+PwJ1fPAvBTJifS5w2r2xi72TRdCtYfNjxPy7Jqd7zD0yZhqyAT/FWxEDp
 OMNyHWhTesYZQiy0Ep6JX4uCSmFOOeZdYAqdpMKYcDcSuXtwnLfrbHWMJwzn8F3nkYeS+h4kmPm
 0aohwLDCuDhUUq86G3bxeeUjLj069PlWUbAfcLX/94lN8PkPwLZAMZu1tfh4kpz7Rr0dTbyU/3e
 o7jb0Zp2Ys1P3lK9t5NgkPY95tragGm5vhY3KU4PinK5thyjTRQLpMbYsksTY9gIjoMXmm+W/ie
 Ijb6sdrtzv7jbMcSGiT70OasEhq++KP5O4MYyI5UpIa3W0FqmacGzb2y+Vksvtn8O1n5SOav0uP
 MMVEKzJqER6p0HP2XxRwYlXT0I4YiWczGLtXiDgbG3VU6wfY5OI1wa/60zIwKq1tUhzHk12MNrQ
 8GKiTa1GMhESFXDbnQkgbKwzI30Tgh7BQbz4nIk9jRKtByyouxMvRDrQbs2pTq2eROaCOc/2yBs
 berxGoyP2I7OOblBbfNlndPWWQ1qffZ6OaYXeQERBFY+MyJiLjwmGmonQ==
X-Received: by 2002:a05:6000:2909:b0:43c:ffee:ee9b with SMTP id
 ffacd0b85a97d-43d64270e3fmr13896f8f.15.1775756322498; 
 Thu, 09 Apr 2026 10:38:42 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e468c5sm407076f8f.20.2026.04.09.10.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 10:38:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  9 Apr 2026 19:38:35 +0200
Message-ID: <20260409173835.3947256-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775756323; x=1776361123;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NMyPXqR83fq5/P8qHb3o2YSOikkYLowKTK5LaH7vFEI=;
 b=RXcagkLeBDxmvx4QYpyIyWOGROC8v+bcP3lXQa8ZLV+vzMxKhBtCfIuQk7sfBdr7lK
 050JrcS8e/mgrXdYAy7S1qpgt3NgHR8ejc64WGe9CHuJUA6pDNkiztiIhQQ2eJ/EhtC4
 RRikikH558Bj5UenqHTUTF6FbVEDHBudrKqaA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RXcagkLe
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux to
 6.1.167
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

The patch bumps the Linux kernel to version 6.1.167. The size of
xipImage has increased by only 10 bytes (1673635 bytes compared to
1673625 in version 6.1.159).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index 82b6e47e73b6..c34797e4f5ce 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
+sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 7bce025261db..489303b93e0d 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -8,7 +8,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.159"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.167"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
