Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1467CC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33286FB6D;
	Fri, 17 Jan 2025 10:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAufG3zxfR5m; Fri, 17 Jan 2025 10:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED95B6FB6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED95B6FB6E;
	Fri, 17 Jan 2025 10:54:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F266BB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC152837BC
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHixYpd8sw4Z for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F4028837A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4028837A1
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F4028837A1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso2014576e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111273; x=1737716073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ci/Qr+H742SdODpfSRYap3hhCEL2XZWl6EmLR17ZoPE=;
 b=GsCsxdFiRAlHns6GqADZrxCNkXTBJxonKBVc9B0VJ+evXIY7kKrfuOn1/qao/oYKGO
 3/gPOPYJYmTgLbRYebXhcqhoXmJ+YOK61A+ctSNpW87vr/yGigigAef7s7rEzonXWLP1
 PkoCUFQ11Uq3s3b6zT/ltnoOUfFhflgjcrWjioI2NAG0R3sf49yyuzNgntyUVO+iW67+
 suLPfqK1zot2ZC4ahKYLcB82OzyixJh4MXePHi+P7BzBCy3+tw05lePi6iHczQTg4Vnt
 WqymRckDXZKnVzgZ6Kl0npeokqBx1lDqDGogcrc3kPxsAQ2elqLildYFkcJH4kUPHtb1
 LGTA==
X-Gm-Message-State: AOJu0Yz/8nCqv8Lo+eZ3r4Cg4GwVIjMo/JMxYApl4azXOfBy1f/kZ5aF
 Y/mbPFKX7LI2F2F2tdAEeNNwOYJN/fd1YIJfscjGA8ikLq0n9GbU/4qd2w==
X-Gm-Gg: ASbGncvRFw7JuDop99fUpdcr8RLFfn7vd3588ckwcTsHUUfSdZV+YCGfqhLdjYRzwzf
 sa4hsNErUa2Jf1PF2auCNoAKb1By5Z/MQ/OK63og5rwc+Zb0usmYdTlcLLAlXFKGmGhifEGuyFx
 tnXK9mqQDWq8IW8YGgjz3ueBikAHd/nHDVItMJd1m0UektVEGZMRBdoFJVCg0MK977AZgK9LPPD
 T/3ADr52V2pxzKfQunk/tuy4JmMaoz0i9ubCNvaWJzfwyOzEqhP+gFD3Dq/MMRi2JWEH7R0oGy3
 aUWLVOOpxvE=
X-Google-Smtp-Source: AGHT+IFoU5ktNlBGjBZ96KIlEVE7CCXuRHFLD9bLZ1ng4hwxFut9qjpgMxFDMjGt56gGdT1h99Hu+A==
X-Received: by 2002:a05:6512:224a:b0:53e:395c:688d with SMTP id
 2adb3069b0e04-5439c285391mr780572e87.43.1737111272571; 
 Fri, 17 Jan 2025 02:54:32 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:31 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:35 +0100
Message-ID: <20250117105354.618220-12-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111273; x=1737716073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ci/Qr+H742SdODpfSRYap3hhCEL2XZWl6EmLR17ZoPE=;
 b=BdNOu9AkNGniyqeJgAlR84T8ylSyahF9AV3cCQxvckC3tPJkZg2zrFNp5pEQt9X1iX
 +NS7JvVi3Qstq18uh+rOQVcQg4rZDFD5etnzxwMxamSl6gpGMmm3UYHqcSKHYj64gw6b
 g2KXclyYtevmCCAn4kiOkvBzAwYz6riANM4GJ5QRH04ZnuzAntfnjnIKm6fvEBzjzvHY
 unJGcPOz6C7G1NTie61V6V0yJd4lLnXuWzZ9WknGGnE3S3Z9vY0RF9EijfnZnsocNj8c
 EfRoHYfZjCAXyuvk45AFH5yi5fBKL2qt2nmIwHY1OaEh9fe9ceKTbP/JDWpL/qB3nvC9
 y/Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BdNOu9Ak
Subject: [Buildroot] [PATCH 12/19] package/qt6/qt6multimedia: remove useless
 comment
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 1f02d0a5a5..fa30475ad4 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -109,7 +109,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
 
-# for spatialaudio quick3d module
 ifeq ($(BR2_PACKAGE_QT6QUICK3D),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio_quick3d=ON
 QT6MULTIMEDIA_DEPENDENCIES += qt6quick3d
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
