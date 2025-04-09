Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C26C369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9434661AE1;
	Wed,  9 Apr 2025 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uPWdB_bj4TE; Wed,  9 Apr 2025 20:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B496161298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B496161298;
	Wed,  9 Apr 2025 20:04:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B83F201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9F7783FA2
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtJxspkoJPJO for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A536683F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A536683F73
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A536683F73
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso4313743f8f.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229036; x=1744833836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gUj1gcoY2cMKuDX3x9c0+5BntFAv59RPeflU2qNTDGQ=;
 b=EEnFqBqBhtt2Q8Y1xY1c7L4wt9VizcqidNzKcXGcD2pTjxu++0MMIx2owMgM71Y6lr
 5Qkscq2giLcavIdEUlB517NRPtrrb3WoGFvxfSs1tj2WiJi/oEYgAt8a4gWxk/VhThEU
 eFK9BachYNiDeXQ0/WBJbQsMvZSQNGpDmXGPlymkU6o427HDdmvWzGheLb/iEqterr37
 b7Y0JsCtLYfp/Set0Igjfy5T4i+l81+/6tUXMsHvOIXSkKEwKREs0wnkEfaw3XeiOW5w
 SJNo6BXr0XuQX2urDp27ZWmJID3Xe8URY0XXRjW0pjPoeCECXYnjZqbIgqaS73UL86Lo
 xuSg==
X-Gm-Message-State: AOJu0YwUJbNtkrCtGTMK2ImKH0G2Y+7bhe/vHG21ofwLl5l+4pkx6oVO
 9u9zdqnIxp/IQNf70rtOb6+KClTJVTwkY4g2OE5uJ/7K3LfHS42rhObwbg==
X-Gm-Gg: ASbGncvXhqd9eRyDFpX+vWM5eGisjDtej1d2qdlpe61+TxdBa9aCnyj4rSyS8jkpPhx
 lenS+I9yxlf8oIkFtxOgV948C6eHcSgSXvL4Xl1XB3cfTuNmZ3ZMWFIeGb4qbl2nRDC+/ud/N+D
 dOVjiS/wBj143p4AJqqn9jKo0naoZ4QAUsHuuIgUX0Rkd99+3RBvwt7oalOdvxHtE7cG6vYTqHw
 1EFerOARZE7g/0HEX6YyC2qLot5m7gZ5S54lIaLym+ieDIStk2AkUhJukNS3o9Q3ZAjBybyukEv
 UJhijBFIcYgCa2mvJBE3Lyw5PAu27pM0F9otBUmMDNlrZCcYcBo=
X-Google-Smtp-Source: AGHT+IEC5KPFshQar8zAplBcq92F6BuGSmsxwMscvBPWGUy60kdCew3PVvkMEFVjRamuGC0F3Rpstw==
X-Received: by 2002:a05:6000:2a2:b0:39c:1efb:ec9a with SMTP id
 ffacd0b85a97d-39d8f463c65mr64287f8f.6.1744229036070; 
 Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:55 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:40 +0200
Message-ID: <1e4c7f75641e9757325f5d6d4621a4302499991b.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229036; x=1744833836; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUj1gcoY2cMKuDX3x9c0+5BntFAv59RPeflU2qNTDGQ=;
 b=WvNemIqWxfRtIp+AloV/Wj1T4PjMRTMdQk3N7aSBnKWHZv+/f7zAE+nM/7kmITdvDU
 XmCWW1vpkl6DS9FMsMHs/t1rpo9OFXEZcWpyg6rtS+5WRcHQevgAVooshiREAxZp6NH3
 QAaOF758tBn1Fv/QwvDRogIwoVoiX+UQ6qLXNH6JxTYZGykgh6490uJItZtjNwCgiAtO
 L7KzmJPVd5wPJJUHj8KukNomevhdkqu4qiUK1NVuzfUYsKTeHAuPO7NtYSqDmvQpAqx9
 m9FWg6apnuVwQzqAqsjp5nVGmIxsTo8jkyGL047J1o2jlg4LQVCZYCy1MSmTA/N/tUQ4
 tjaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WvNemIqW
Subject: [Buildroot] [PATCH 25/29 v2] package/sdcc: add option for the mcs51
 (aka 8051) port
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

Enabling a port enables the assembler for that port; the other utilities
(sdcpp, sdbinutils) are always built.

We make it so that at least one port is enabled, otherwise it does not
make much sense to enable sdcc [0]. Also, without any port enabled,
some parts of sdcc (e.g. sdld) get compiled at install time, which is
incorrect (but by luck just happens to use the proper tools and compile
flags).

The mcs51 port is the first one that will be needed (for fx2lafw in a
following commit). So we make that the default port to use if no other
is enabled (another port will be added soon, too, so we get ready for
that right now).

[0] there is one utility, packihx, that could be used without any port
enabled, but that was not deemed an interesting-enough use-case to
support.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdcc/Config.in.host | 16 ++++++++++++++++
 package/sdcc/sdcc.mk        |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/sdcc/Config.in.host b/package/sdcc/Config.in.host
index 52934aa150..1c851951b8 100644
--- a/package/sdcc/Config.in.host
+++ b/package/sdcc/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SDCC
 	bool "host sdcc"
 	select BR2_PACKAGE_HOST_BOOST
 	select BR2_PACKAGE_HOST_BOOST_GRAPH
+	select BR2_PACKAGE_HOST_SDCC_MCS51 if !BR2_PACKAGE_HOST_SDCC_HAS_PORT
 	help
 	  SDCC is a retargettable, optimizing Standard C (ANSI C89, ISO
 	  C99, ISO C11, ISO C23) compiler suite that targets the Intel
@@ -13,3 +14,18 @@ config BR2_PACKAGE_HOST_SDCC
 	  65C02.
 
 	  https://sdcc.sourceforge.net/
+
+if BR2_PACKAGE_HOST_SDCC
+
+comment "Ports"
+
+config BR2_PACKAGE_HOST_SDCC_HAS_PORT
+	bool
+
+config BR2_PACKAGE_HOST_SDCC_MCS51
+	bool "mcs51 (8051 et al.)"
+	help
+	  Add support for Intel MCS-51 based Microprocessors (8031,
+	  8032, 8051, 8052, etc.),
+
+endif
diff --git a/package/sdcc/sdcc.mk b/package/sdcc/sdcc.mk
index b2082c36bc..60ed688ce4 100644
--- a/package/sdcc/sdcc.mk
+++ b/package/sdcc/sdcc.mk
@@ -51,7 +51,7 @@ HOST_SDCC_CONF_OPTS += \
 	--disable-ez80_z80-port \
 	--disable-f8-port \
 	--disable-hc08-port \
-	--disable-mcs51-port \
+	$(if $(BR2_PACKAGE_HOST_SDCC_MCS51),--enable,--disable)-mcs51-port \
 	--disable-mos6502-port \
 	--disable-mos65c02-port \
 	--disable-pdk13-port \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
