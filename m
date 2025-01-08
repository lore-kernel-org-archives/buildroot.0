Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C384E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89214059F;
	Wed,  8 Jan 2025 23:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUn1jmGE2YLo; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D6CF4059B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D6CF4059B;
	Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87ACF1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 674F54059F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4PnFgAx4aEj for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE35840595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE35840595
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE35840595
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so4440535e9.0
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377526; x=1736982326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6aq3hprTnKNvRq+PtZpVq91KyRmPmmleYbhdIkU0hq0=;
 b=IsNRHR7LAgkYUwCTdHGO/6+1oAlnnDDw09be1T0oeHx2wqt6hTqH12cH08t4FZdYMW
 Fp8O3fZKKc2wa9EAj4Tli8OxYpsrUsdMH80as3Fu9idtSlFUbJqIYrl3fUcLbYtNKwsi
 gRRMufGYQKxDgRqAyd9OdaTsXFTkVrSZNHekG+y+1Ca0T1HfrJYdOSvXquEqFOxUCtjj
 zBYulqh75TgI890ZF4SqEmM2WNgRoqcRT3CiFLrJYuNbgAE7D5q2+WOXbk5pAoedX9w0
 HMFZPXGTGf/5E/bqYC7Pf7fWImABu3CcO5CHQ4jPzMCmRpfFLfwuRCJkHHsiaqR/bIxc
 TiaA==
X-Gm-Message-State: AOJu0YwTfOpmkLXMudew8zAAajLuvZJtg2+ADVSIvwxi2OWsoKhPcvlZ
 pj2k11NdUEJXBN6KjEYsjrCG7a+tKBhRct0UlIJVsx4m5ewdUclKL4MTjgLcs2LFUK7PhoEkdKd
 O
X-Gm-Gg: ASbGnct4YuV60/oq9b2MZZE8osAud0lJmlDytI35M6XuK5bf1IS6edmH6qHsXD2qE+w
 T46D/P8JAH+cSruXDDsvw/PlBVyEKNpk0zvzjLgcX0FaSTmjm315dL9tW9gEKpoTkZXht7A8Y6P
 vivQ1Yx4l0iGHYb8TJnG1/xpsP5b6lCGJO/iqMZbaATpfoBakSdruuHgtnJqBcaV4SKb3xmxJ8j
 gQ68Lf3px93RxtuQ47pZcCnLgcvq8QfelY+h0gQTSWIpOlwVBA8rY4Fi+T+B4VIARV8bIymazOX
 FR9OiCSgBe+NM8VMqKCNGcHWUcm1KeOgv/drHBJdHYhjZOxH/jNq7g==
X-Google-Smtp-Source: AGHT+IFDQb3wChXskcGRuL4ufdSm8HltU+y1AgblRyemTcNZjS7U71CzU/sPRnvcQEp7W1eYLy/7OQ==
X-Received: by 2002:a05:600c:310c:b0:436:90d4:5f3e with SMTP id
 5b1f17b1804b1-436e268649dmr37899315e9.6.1736377526321; 
 Wed, 08 Jan 2025 15:05:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 00:05:10 +0100
Message-ID: <20250108230521.1345210-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377526; x=1736982326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6aq3hprTnKNvRq+PtZpVq91KyRmPmmleYbhdIkU0hq0=;
 b=i/yOrdZP43H4VYax6qXoHx7XuRbMvOxdwR+0+QucTgkPepZAXyBi7/nnhBGPrrURko
 10TLCKz1Gg7QAsUCAyjUFID0ha6gBrfy+3STk9pIq1K06xyOem2LtM0hWvdo0HtiYa+2
 oCeAWOYkzb0BN6lYJr/58Dog+n/eRw2tDMxvs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=i/yOrdZP
Subject: [Buildroot] [PATCH 01/12] support/config-fragments: remove nios2
 toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].

Remove nios2 testing from Buildroot autobuilders.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
[3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/config-fragments/autobuild/bootlin-nios2-glibc.config | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv      | 1 -
 2 files changed, 5 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/bootlin-nios2-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-nios2-glibc.config b/support/config-fragments/autobuild/bootlin-nios2-glibc.config
deleted file mode 100644
index 575a1b30ed..0000000000
--- a/support/config-fragments/autobuild/bootlin-nios2-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_nios2=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 654f11e28b..047b22a9fa 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -28,7 +28,6 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
-support/config-fragments/autobuild/bootlin-nios2-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
