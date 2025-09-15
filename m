Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B476DCAC59A
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 14:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 487056174D;
	Mon, 15 Sep 2025 14:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20HuDV0TwCf4; Mon, 15 Sep 2025 14:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EA4960C07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EA4960C07;
	Mon, 15 Sep 2025 14:06:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B05322F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 621178489D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqG9fsz6aJJd for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 14:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AD668488F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD668488F
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AD668488F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 14:06:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b079c13240eso672738566b.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 07:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757945186; x=1758549986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gkzsnxyB1umfW1yIHr9z6/Aj1bOV2p2ZKRMej/FIVJU=;
 b=jWAYI+Hujy3lTCDM3LmkqrVIavJCFTdPgoTIVnC9BbL1G/uYZXHYMO//4LHmdCAcUF
 9eQIkKXgx2nMtMhErghbMqTjHcI72TbTmlTTbdtQIFO/vvk4Xhc/do8O0Qsq76YfE90k
 jPB+J0N00NOBfkR/7NLXqlb7eA86dT4W5c4+JQXSR2yVMg6KAjKcElBqmXkJBAy2fsk5
 1iLr69Kk5kbJcaP11cDNyxXp4DApCBGff2eKYMZ6flpwbDw3LWKRBproGM00iBWVfdBL
 GFVvyLPRiALF1rO7tj9TR/6oV3AIWMSCF2jJuj1VpJ0lCXsDw+qbE1BxfbrLrB9SGJRu
 DaoA==
X-Gm-Message-State: AOJu0Yy+U9EfLBbNltlCHHqTSLij5GbCUW9hq0trktSOn65DMWFD0Guc
 Uvy3rDv8mptZ+9rf/vkKixOKMLSk8/3C1/WFdyZc5z/rVeugBo9aFZH1jvpTkLIv
X-Gm-Gg: ASbGnct0fxRbf4UK1yJZLVJRTxnLDuS4c/ImaCJuMW2zGXtBSNZn3OX1YB51Zl2kOlu
 7Q8FlfJdM84yNFeyRgH7TSCgyK92V5NGC+BbTSBA8/LTny1sbu+V3cLr1wMq++FF35Cf7xQp4EL
 Z16p6jSq6KRaNFNfgLZPGZDjJxBzE7gphJgYBaW3XjkyfpVEj7JpyH3Ez4H1YwRhyk0v77p8kk6
 SapIFB0J51yZLoa0ttr+U7h10InFpU8OJ7mrtn306Ra4Ey2+jIgBW6jSB4XjN/1pZDVRXrnbWct
 ZOioNg+TMx1EGFS2otyu3vR6txtMdL2nv6Zewkg/sQhuBP1qnrIeC/OoGJZhiDNEC/l5kMtN7zP
 mqfdjLVejczk/rB9kOZF5y2vALpq1iY2oZmmDlqjFShSpOd1NQy3XXjmldmB5i8Mt5ogSdilznm
 hWgaJE6lnlYTkt0noYcQaFuDQmCDT9ybiIhsHgzsL/0fsoexMnhKuKj6ak7b9VJXuKcpFS8SwF2
 ani9JEcQCkZu2fe9kZniV8YUUP93CvWtqc=
X-Google-Smtp-Source: AGHT+IGA4FC+f6Wt+bfXIlUAfTG8yJibQ0bK0sFK+uqG+EDBAwaVU6endCG/C9U6Hzb2YFKDjHOiGA==
X-Received: by 2002:a17:906:dc90:b0:b04:a831:4b8a with SMTP id
 a640c23a62f3a-b07c3869f66mr1242788166b.53.1757945186009; 
 Mon, 15 Sep 2025 07:06:26 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.home
 (2a02-a450-7a0e-0-d307-416a-de81-9106.fixed6.kpn.net.
 [2a02:a450:7a0e:0:d307:416a:de81:9106])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b334e76dsm950499766b.102.2025.09.15.07.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 07:06:25 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Mon, 15 Sep 2025 16:06:23 +0200
Message-ID: <20250915140623.3308484-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757945186; x=1758549986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gkzsnxyB1umfW1yIHr9z6/Aj1bOV2p2ZKRMej/FIVJU=;
 b=AtUCiwzuLq00t1HVDLh05ZePZ1Kbt4RmcqUiV2eoXiYI1x4jhPhK2Unq64eIp+a1tp
 aXzCN3C0rj+oZUp+qhLJb8QIdmaKuxewMDZEurFXc9uhZpMVZ5XXHNPuLUn/uIqjatZX
 L/GdqGfG9zdt5ozjVJW4E+kyCMsT0RMJjH0OSlk/F5f8TbLEq4Lgt121Kc1FRusPuZs+
 AkyLwlxs0cfptcujtRKXUM+Ja6unaBaUwRWtFoIpzDa9W+tDY5vbvpEIx+wGXfSE90O+
 efKdFDfIoc6ZaVzActJ0QyHXIyOjJmQVJ6P9Wfft4ciYsF3CksU66nF//eDjvp8oI819
 FwcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AtUCiwzu
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.23.3
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

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.23.3

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 3b632f92d4..0bc5061ab1 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  12c47fc9c73450dca05b6e34f928ad13e2cbb59434a915be0d47fa5635df2cf5  eza-0.20.19-cargo4.tar.gz
+sha256  d31a17b4733589da761ad79bc9faf4271b358a0ef9fea19dabb5f38827ba7cf4  eza-0.23.3-cargo4.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index cd19c4b4d6..6a0c12cf9f 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.20.19
+EZA_VERSION = 0.23.3
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = EUPL-1.2
 EZA_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
