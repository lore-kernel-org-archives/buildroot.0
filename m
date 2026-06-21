Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D738FCD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 16:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E144C40B25;
	Sun, 21 Jun 2026 16:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oikY07zgX0hM; Sun, 21 Jun 2026 16:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A69AA40A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782060677;
	bh=D2W5/24hLMKY4GWWny/gI7ydU5+fEGXyYlljbsiONGM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=iXkJ2SPt9HQk1bRtstsPdxDWLsyXv02sPSR1gaC/Ym9x0GRswq6If6REudbU23k1g
	 cfV0J3IxY27WJamDgl0EX3LxZGA/7Xb/bl3EhxObH/L7qol0uThfeukepNg8bRXBL8
	 41USYcpC/xxWuA/d/sdgdqYKxEZ6OdF47sYeB23r/FB24GnaYERbcclJWTCaR8oans
	 zL3651EWmnjdF4EQR2CRwTrQHaXb7QiTcehc2oqNz8rM4PVjBLsgSGJRMxz6dYqtoB
	 QrZd1/EM+GKg5ir1BYG8lhBp/6FwBXwmGXiQv0/w5nihI7Ysma0C6RaR7p/9yHDQpr
	 S2TtiPJDtiAgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69AA40A1E;
	Sun, 21 Jun 2026 16:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B657724D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C3E586623
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbT0VX_UGqF8 for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 16:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F943865FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F943865FB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F943865FB
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:51:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4922244f7c7so30880195e9.0
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 09:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782060672; x=1782665472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hdDMK294jR62wKRgiQXA9uCkVlPMaVZDoaogmqwB3w=;
 b=KAZWZqlkPcEPQUudW5sHPPbqUWusSL4jMgTXWm5EuL1LPPbRDscUz3eJaK5J9Xfltr
 V/nN5WH+8T2yL8C8vXVnwu1FHhlOs/EXnXCczzwEfeGvgbLAFKkgzRPJoKFqtb/B23qa
 xmgiBzGZN046xImaMUIDuX9L9jJNMzHpPzh3StWzcmw5ypsAr7+HVdtdo+PnXKWpBLEA
 IAMFosAPECIR8saUl1Hk1gpW9/kSDVfngUUlJ57XR0oIk8DG38+PJHXMWId5AfqfpNIN
 QK3QFYaZX2Ste65TsB57/TB2uVAPJfNFCiUNq+crdq1FyohpcBhlIo0A0X8CUWT2z4kL
 b5zg==
X-Gm-Message-State: AOJu0YzGHDTdcgkt1tM4Vy9+Cm7rli3kHuXtnqRUEhOmzt6Nw5nUTLb5
 EVGNMPMtptMoMx1w07C6c1kQKguQrd0dtIDPkp9VXoc2zczk5XjoZHHctOIDoATLuVLTSxNeOby
 bh9ju
X-Gm-Gg: AfdE7cmVmuSwIFLC9awxyRvhNw746rMK8fi2PWKgc0d2a/E3LUd7aE19MlqDHLG56wI
 aqo4/S3v7op/VDXxACYCsejY1QHf5DxM/CUpoHHqoHq67ydNA13xRG44K43ikT+6s6itOotNPqR
 Xp+25NluC7OgiFgK/Y5Xm9uX53T5KsOFN1yHJLU6RhZ21FvkHH47rmuHD/WumIEZv5GGPMNQOJ1
 BvTxeFj/cBLWsdOj/4Y2JSwiqTnCn2Sv1/RquM9Dsc64+J0VHun0D5O19as2xzS+wh3h0/+OpHG
 J02On/lN2rUolwuceMLtEfQib3vp6QGmtTW51zrAsPhfPNxJB2M7SPXn0FXCgcZXM2Y2miOFyo/
 U8nV1MDA/RAkncjynQvT9f6y84LSyK8LSVWKJllwQpGJ3zB08mLBZDykbz/cnOQISPtda2ygAfT
 oWlOtyCtbZiQuMQt/FAlbUFkChFnn5xho5/vatGfWQWOO8CkFee4kLv89CNwOPxfQm2rPsihdnA
 CtsvZ9EJNyB4UI=
X-Received: by 2002:a5d:56cb:0:b0:461:e27d:5690 with SMTP id
 ffacd0b85a97d-46501b5ad7emr15012112f8f.26.1782060672473; 
 Sun, 21 Jun 2026 09:51:12 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5413sm19181319f8f.11.2026.06.21.09.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 09:51:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Sun, 21 Jun 2026 18:51:09 +0200
Message-ID: <20260621165109.2425496-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782060672; x=1782665472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8hdDMK294jR62wKRgiQXA9uCkVlPMaVZDoaogmqwB3w=;
 b=u9zF6r/kyWuZIvcsBpksrdWgIXgfh6zGEI+9jzgLAvqbiYG1Qa8eUYmKFRxkKx/qtY
 +7dOaplPNlFN+d+77+jyx/DqVjHYTKYa6VDELYFNZbA1raTBsKNusVuPWOabb9rHIFOC
 gZNKRQgYUsNgAqauxibLNGFk8hL3nEaPmS4Dk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=u9zF6r/k
Subject: [Buildroot] [PATCH] package/passt: needs headers >= 5.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream passt only documents runtime dependencies; and they advertise
being able to run on kernel 3.8 or later. However, they do not document
the build dependencies.

Since 2025_06_11.0293c6f, upstream requires kernel headers >= 5.9, as
they make use of linux/close_range.h, only introduced in 5.9.

Add a dependency to kernel headers, and propagate it to podman's passt
backend.

Fixes: 6a192b0d282cb85ff4272e26df082f5eacd8e3a6

Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Commit log from ed99b77e5d276d62c2f4c9959b5c558a4f3c9e36
---
 package/passt/Config.in  | 6 +++---
 package/podman/Config.in | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index a93a088670..fca1dff7c5 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 	help
 	  passt: Plug A Simple Socket Transport
 	  pasta: Pack A Subtle Tap Abstraction
@@ -19,5 +19,5 @@ config BR2_PACKAGE_PASST
 
 	  https://passt.top/passt/about/
 
-comment "passt needs a toolchain w/ headers >= 5.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "passt needs a toolchain w/ headers >= 5.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
diff --git a/package/podman/Config.in b/package/podman/Config.in
index a6554a3ddc..7884171380 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,11 +72,11 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
-comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+comment "passt/pasta backend needs a toolchain w/ headers >= 5.9"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
