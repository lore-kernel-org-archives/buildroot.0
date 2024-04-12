Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12BCC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 05:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE981405D9;
	Fri, 12 Apr 2024 05:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIjtB33le-45; Fri, 12 Apr 2024 05:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85BB4064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85BB4064F;
	Fri, 12 Apr 2024 05:54:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45B381BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 334DF40540
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOMA34ackaVf for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 05:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27ED840446
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27ED840446
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27ED840446
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 05:54:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so494092a12.1
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712901255; x=1713506055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sRzjNRHPgAQ6wlr8QiRClIcfA0qsMLRON2Larwhe/f0=;
 b=k/3S2szaEb/GNSjlS3CnUARRO70gDkmOPfKMEMOd2q507JoCsPqQgp3VeO5fmE/ZtD
 hDZNNeqVIjHipvujYznatXF6bh62VqOxcOrX11bR+wtXSw4/Yk3myH4XLZVB1henwFMn
 SO6dwU3KHN2hCZPyi7d3zZBFVn1ek5AIEXrBvpWvFQyXxRESQ4L5vPPRMMgA/NFY4MOg
 f/nYh307v2dD1QF7xXZzp3RsINiGPGPOHJ86g1+NWeg+g1fMDxL5M32Iz6gVowiPwYF/
 F+j6Zk6DC4US/Ue3prMSt5fjbEpfVvU1vJG0KJDy011DONGf3p3XLIlsuxshIgXcNsz0
 PATQ==
X-Gm-Message-State: AOJu0YzyGa/wwSYMyRcvD7yHbuunoa9lxbe225ZGW4uoEN74xboWFvS1
 cR4OtIf5OWJICwJ9d0kkVarjF6Ie3bSLiopWnlgutWmXY1DQREnDjspDUg==
X-Google-Smtp-Source: AGHT+IFin3O8FNzIcXP3haAaKTNbJ/KLJBJwgAkJ/9lSp9m7/jmVAhS1U1urhkMk+CeZ59nYCWm0Bw==
X-Received: by 2002:a50:cd0b:0:b0:56b:a03c:4eb with SMTP id
 z11-20020a50cd0b000000b0056ba03c04ebmr1437898edi.31.1712901255522; 
 Thu, 11 Apr 2024 22:54:15 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 cb12-20020a0564020b6c00b0056e67aa7118sm1354199edb.52.2024.04.11.22.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 22:54:15 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 07:53:59 +0200
Message-Id: <20240412055358.1354293-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412055358.1354293-1-heiko.thiery@gmail.com>
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712901255; x=1713506055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRzjNRHPgAQ6wlr8QiRClIcfA0qsMLRON2Larwhe/f0=;
 b=aYqF2mDdn+KacBR5rHYqxPZx1q1bPH/sqefIcv0InXLloWMB/kqxWHcidkchTiikWZ
 6O6PJDzvEyrssk23yojaj+Pg51RP7ohnVm6LrInx0f2PosnaRBWSKYdc+Ymk3F/gDQDv
 YjQrzdKMpAulvuRxyN+9QU08Ziph0LZ4GlkMovbAfvm2p/SRvso0p1v14Nv0HZXJZs4A
 zLnzBYWxx6sgG6WDBKz4gGsl9wgPfnIfLycJ3GM1IJdn3Nbx4E/VTEZGDssAsfTTIBrA
 lTkrJ9xgY8GlImSo32J+b9509km7I5l4kUHaUUSNhBPhVAxQbjpiyJJWb8QYvnxVclyW
 eBPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aYqF2mDd
Subject: [Buildroot] [PATCH v3 2/3] boot/ti-k3-r5-loader: add dependency to
 yamllint
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2: accidentally resend this series as v2
    (it's too early in the morning and no coffee yet)

v3:
 - update URLs in the comment

 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0fb07f2d65..891783e40f 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -35,8 +35,8 @@ TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
 TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
 TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
 TI_K3_R5_LOADER_INSTALL_IMAGES = YES
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 # Make sure that all binman requirements are built before ti-k3-r5-loader.
 TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
@@ -49,6 +49,7 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-python-pylibfdt \
 	host-python-pyyaml \
 	host-python-setuptools \
+	host-python-yamllint \
 	ti-k3-boot-firmware

 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
