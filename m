Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDF2D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE3984396;
	Mon, 12 Jan 2026 07:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id me4hy5hdfPFn; Mon, 12 Jan 2026 07:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFB484397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768204698;
	bh=MtbIaXIwfLWF3B882iA2ulK3EtAA5ozugdYUxsX+ZvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rlDUMvUw2sM+WlCc+UeuNtj685BntsI7FuB3pARXQSGiynDf7aoRr76r2oRGMPnCm
	 KkeKXqi3zj6MQXlpnkDocoKY8r7QXtoPFHEE6i+TuUDABUoWBcDHOjCR8LVImjOurz
	 e1sxldCbfUXIiWUfWnhPWjreoi3pbhXzdt3JAfXF9ZCVS/6e19Cbdt5GFarH1pkIB7
	 Sn1cylzQtyi2IU4ecatmsVvmjimVLTjIMbP/3Ml9g5msTICgf/O2GxnD2yRiedjStx
	 G3xnyV5YkYKV0UPljN3LFNJEDshNTPwxRF/wa03neiQfIxbAQKPdzGe+anVe41/4X7
	 C0ftQ3Q2SVXYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFB484397;
	Mon, 12 Jan 2026 07:58:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CF0112E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F43484397
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 07:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnUhGxQjxsJF for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 07:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F99284396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F99284396
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F99284396
 for <buildroot@busybox.net>; Mon, 12 Jan 2026 07:58:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso3377548f8f.1
 for <buildroot@busybox.net>; Sun, 11 Jan 2026 23:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768204693; x=1768809493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKUrnRHfOXI1xGlCluQkyMLyHyjvl4s8Wwy/TnX4Z3Q=;
 b=Esy3RdDFKs/5KuHZkqdDeD6yhZsnHscIeh6l7ZeQmsRd0rus2up2tYXgzxTMmQdc5f
 lOiIwclpsBMqyuU62wZhiZRYULMzemrQ7cUdYzx5gVqSXI2OrlWuqDNhqtg35gdCJ+1O
 OyYg6v3ARuZikPXP1awqb9tKk+Yfa8SOSGVmHYpZMdTNXCa8t9Zn0pH21tbk7mZ41yZp
 eNeGGQH0Sy4DG2LEQxmzI3erFapaWI853fMm8sAOaLyvY/cAMBAi0rpan7NAPCqZXX2c
 yf7DNr4MCza4RyI5xc/T4fRt6NKvnefwuetfW3d1TTuG0GwIvkVyu5TDG3nFP7i5Tbyh
 lGAA==
X-Gm-Message-State: AOJu0Yx22ELVQGXtairBoRSIVNUiMPuQl7jOAw/yjj6JtWPg63Zy6guT
 DYMKyuoYurg/KZ/K4Km4ug8sa6zcaDFyzdj7HqhHkffM7MakLgtAhym5iPJvcBk9lPAOEOuSloK
 eR6R9jw==
X-Gm-Gg: AY/fxX7u9HtC1d5eokes42jg2Zddu4oGA0V7avNu07U9zMeAudua4P/HOWW25/3MtsJ
 17f+Ncdo9o3rCRe0EL5cHsHcCJ0SvoHgKzFngBoh6uCOcce98drPtVi/DJ9xRtKSjH0hXGf4Vh7
 b+tkOOcY6gU2pKtvXuELJrDyfLOCVhOwaSM67olfEswPXOdYboWJIlXD8tEGZSl0GJiLr91vPP4
 xWaviJ4CkXb2WM2co2NrqWp20K33iY4ioiVUmRLvhw0usBFxWFLtOUU8JvyqoPqsP3uDAjPelIJ
 PNlZ8AuNpCiaR44Xix79gbehCe0sQZxDvO25T5yOT/aXyLfVV/nGglVq8Iku+YdD2tSGcEy1oZ0
 EbhLebQPGpQp7fYl3ODPP2NJwzu0irDXdrc0xuWwR0LlrfB8LhHJtL+oFumsGBtU8AZ7xebmq1C
 n9pk6x5tTFZxEv3k6VKTQdvLF4wlAgLQqCpH4=
X-Google-Smtp-Source: AGHT+IHi/NiMye+QbhzrkFkac6K/jbNdCT8RiHdshHlvd2/cSRIbOaRa12cs3QozG4WqU91DHpV3cw==
X-Received: by 2002:a05:6000:2dc1:b0:432:c17c:3076 with SMTP id
 ffacd0b85a97d-432c363269fmr18595785f8f.14.1768204693124; 
 Sun, 11 Jan 2026 23:58:13 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee893sm36707565f8f.37.2026.01.11.23.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 23:58:12 -0800 (PST)
To: buildroot@busybox.net
Date: Mon, 12 Jan 2026 08:58:08 +0100
Message-ID: <20260112075809.710873-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768204693; x=1768809493; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AKUrnRHfOXI1xGlCluQkyMLyHyjvl4s8Wwy/TnX4Z3Q=;
 b=N/ViPcBIB8YtSrD2GhTn01k2EJ6iEHqfq3eQiZStlSDrA1pKRCj8JRL2UAze9dVNWg
 RCiA7/OJrB3dQRKEw4vVvA+4ssB4pt+JGZqsKEwx9/Jl1nybcYNFFG2pxaqdILP2OmvD
 CqkZVu/W86bU4bUpeLmv06pM+pKPDpYA/8T6O2XJTl2GMZfb6+ls5GLGChI6H1JZXOLH
 5N5lrb315wIpyvRN4KUWrl/4QwzvhWv8vgu2Wqbpfa+ea4xh8Mx2bilKW2nkwLjemLiQ
 b04240Cs1a8tSI0GdlbK37lCVeK5f13lqvACe8D6flG5Q5WpLHnR0DS532zSSTgVA+jn
 x8JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=N/ViPcBI
Subject: [Buildroot] [PATCH] package/webp: bump to version 1.6.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/webp/webp.hash | 2 +-
 package/webp/webp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index 8d80c7271..17b05c848 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c  libwebp-1.5.0.tar.gz
+sha256  e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564  libwebp-1.6.0.tar.gz
 sha256  5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  COPYING
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 83d5506c0..4af3353f6 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 1.5.0
+WEBP_VERSION = 1.6.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = http://downloads.webmproject.org/releases/webp
 WEBP_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
