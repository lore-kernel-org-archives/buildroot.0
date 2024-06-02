Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25607C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E373984273;
	Sun,  2 Jun 2024 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MygvLA02l5kb; Sun,  2 Jun 2024 20:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29BF83410
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29BF83410;
	Sun,  2 Jun 2024 20:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 406C41BF853
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE3AA402F6
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gmk69q50xQXv for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58690400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58690400AC
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58690400AC
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:40:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35dc984b3d2so2598571f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360798; x=1717965598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UlKapMSqe7mJ+Zngi6GkI2CYhk2hK+lDpJJPdVpmdVI=;
 b=lkIT0z44AeyHgdIUdPSIrJZPuJwAJ1IoPMOk9gdld4+bfBH0dg6ffc0xVQMRyzRVY/
 s8OdpM7ExqRR2yhp5Wcy/D0bvsmmZTxiBZfb7wKkE58pVvtSWdURWj7Qf/Vy0FQKxEMV
 PPJ+5Kq8sLvGX+U6pa4wH5uDpPmi0sofgqrRUon1ny/Z6pAfnV7DD2G1TmjmGoUkDiUR
 qxPQekFxf4heM9yHjvMRqFgXKo05MRyasyAZsOn3fgbKhO+b42tTEOhGwy5oyiaemv2j
 f8rqp2GwXF7MC6HUTnHCGtot08Pk21GGWYNbwWk7w7QRyA3QDoFpXB5k5TX26a8vW+0a
 8jZw==
X-Gm-Message-State: AOJu0Yy0j7yM7s84JX8pTfurC4rFXFqy+qnnaIynTrWVeoSqPTjdQlVC
 8g/fkSjmKeLm9Bh8VDCzxy6hGB8ZT8LGNqpZ8n7Pb7o45UL2+cGksfNpjQ==
X-Google-Smtp-Source: AGHT+IGX7OSjFX8UBAdFVUFrP2xogN18xK7Y+Ca2qeS9jhBIPwgA5RYTIFRAlUF+5FwEYN/I4otZzQ==
X-Received: by 2002:a5d:66c6:0:b0:356:4cd8:8501 with SMTP id
 ffacd0b85a97d-35e0f2862a7mr6595463f8f.37.1717360798332; 
 Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:49 +0200
Message-ID: <d49616a6b00d5be638e4e00969d4d68d90665904.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360798; x=1717965598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlKapMSqe7mJ+Zngi6GkI2CYhk2hK+lDpJJPdVpmdVI=;
 b=mzeFKPIkVuJFFIzZv+jtZTahxo3mIUzdwvuHwvkc6gJno3gqUuTstrmtq4zw7yj8V7
 JsrSsKLzu5gOQ76SQZgUmcNk85bBRjr46tOVS/OHOj8Bb9uAJCqV/ogARmgLdlAiNVSc
 Ft55btY4UcIkWi6Cy+lTDBlgedIbR0itQXBZRMXGIULt7nFnXY3GXd+l6K2Wk028w3AS
 SS9/oR/TFMmV0fWdvqNOet3AzJiRItjHAPf+vd8/P68JpHCZS5fymZuGpdhTsRhyYfBo
 CcuTbgOVgwmwx8JTmhbpJZsy81250Rtur1o0PZgFLuMF0N2h62aWCrg5Oq+Dqg/EeY/P
 0NgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mzeFKPIk
Subject: [Buildroot] [PATCH 13/16] docs/manual: rephrase end of vendoring
 section
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current phrasing is dubious: the vendoring does not detect any
change in the dependencies; quite the opposite, in fact: once the
archive has been generated locally, no update to the vendored
dependencies is ever done.

Rephrase the end of the section to mention the term "vendoring", and
to drop the dubious claim; retain the off-line build reference, though,
as this is indeed correct.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-cargo.adoc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index e18fd9ce23..8a2292e7b6 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -93,8 +93,5 @@ repositories, listed in its +Cargo.toml+ file. Buildroot automatically
 takes care of downloading such dependencies as part of the download
 step of packages that use the +cargo-package+ infrastructure. Such
 dependencies are then kept together with the package source code in
-the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
-the package's tarball includes such dependencies.
-
-This mechanism ensures that any change in the dependencies will be
-detected, and allows the build to be performed completely offline.
+the tarball cached in Buildroot's +DL_DIR+. This is referred to as
+_vendoring_. Vendoring allows for a completely off-line build.
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
