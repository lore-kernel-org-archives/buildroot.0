Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55272CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D225E60EAA;
	Wed, 10 Apr 2024 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NR5MK3gC20-Z; Wed, 10 Apr 2024 21:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A7260EAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A7260EAB;
	Wed, 10 Apr 2024 21:45:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14CBE1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 003214077E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzT7c9QijZq0 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91A1B405D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91A1B405D3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91A1B405D3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:45:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso2457362f8f.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 14:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712785498; x=1713390298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjwQRhfnnqkBwV/2xQo/yPSAAqnbc0h3VDB/yacBabs=;
 b=CMxzU1L6aUbKOA0Jh6aB07dNcaxvArvPNFIazs7hxk39pB8M5PqqSS7MjqkvuxaIxI
 MyYk9HeFl+PvDs3n9qBkEkow3Qk5QlzxBFvka1+wpHsLLMZoTw3qCvB9IEqRGo+ZHAwj
 HFMnOujiJ80GlWe/UMg26QkRIrFOXsEomJau42gbjEB25cHOdBcgi6z38guKOF3yMSKM
 CbDx3GeQofnzQFtE2XSrTHSGT2EvdBKmUQGmlJlJuyHX/YN6i9ejj+ZN7KLOnhBzUodM
 ZvstQdUhwuR2svSmZTPIBF4wNXFXBUmAjr9IGqGoLQpFYQWRg/D6chcpg5fmtxvi/Mgd
 UUMg==
X-Gm-Message-State: AOJu0YxBaCXpQpXUSoQj3ZDUbpdum2Ub2jC2KZFjiPH+CHltuWBJngPv
 nrGMYy/2A6AHBv52upAvF70KOty7HQkMEzg7sbVC99ml2AzuAHSHqsykh8nzfM4lHbhP2vbjt+G
 d
X-Google-Smtp-Source: AGHT+IGGAEYv9qlVwJbUicSP5afIAXZp+hydGnbWpksk7YVZIuLhdQ8ZgmpJzDBHAdm3KWM7/cfzow==
X-Received: by 2002:a5d:64ed:0:b0:343:9851:387d with SMTP id
 g13-20020a5d64ed000000b003439851387dmr3443102wri.9.1712785498386; 
 Wed, 10 Apr 2024 14:44:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a5d6852000000b00343e8968917sm177991wrw.1.2024.04.10.14.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 14:44:58 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:44:53 +0200
Message-ID: <20240410214454.86748-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410214454.86748-1-romain.naour@smile.fr>
References: <20240410214454.86748-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712785498; x=1713390298;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjwQRhfnnqkBwV/2xQo/yPSAAqnbc0h3VDB/yacBabs=;
 b=ZOKmT4/GjRanBu94wckw+iqeeKRzWJM9nN0VzWh8mET1UskYaS6TmiWZcHES4wCfN6
 KBVNBd9VM3u/gPP/1KgGFpmYKPoKgRD+W12nFHNr81RSv3oY9iZU836sSfaDi8hj2r6S
 ha10SPvym+1CgllFKXTDjM9RjzWLIktE1nMJPqUny9QDuZQ/RbPWHbr/Mx8W6eMuyVqx
 vSgkokNM2K4XAS++bWPTmo274+SQhUHRvHL/tOQffwK+lCMPD7p49DGj65t1AfNNdwjU
 FNDS+itEiJjD3ZrqDelsUutTtqHL9HXo1iUpnKH1dcaLCCod6rL4XoRnvDByAj6XmL8c
 7C6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZOKmT4/G
Subject: [Buildroot] [PATCH 2/3] boot/{uboot,
 ti-k3-r5-loader}: remove uneeded python-jsonschema dependency
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commits 8a4c3c91e7 ("boot/ti-k3-r5-loader: add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option")
and 1aec483412 ("boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option")
added the python-jsonschema (target variant) dependency to the binman
option while only host-python-jsonschema is required.

http://lists.busybox.net/pipermail/buildroot/2024-April/689291.html

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/Config.in | 1 -
 boot/uboot/Config.in           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 6d1adbeac3..9a47d2bfcd 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,7 +1,6 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	select BR2_TARGET_TI_K3_BOOT_FIRMWARE # binman
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8133b780bb..ba95964139 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -273,7 +273,6 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 
 config BR2_TARGET_UBOOT_USE_BINMAN
 	bool "U-Boot use binman"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
 	select BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
 	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
