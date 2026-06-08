Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6F2CD8C9F
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 18:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C1880E51;
	Mon,  8 Jun 2026 18:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d4c3MGswckJ; Mon,  8 Jun 2026 18:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9CCB80DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780943071;
	bh=7BxPdCOEb6/sCxz41h86qOAT2myuLC01D6j41LMthvg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HvhMguC2syn7A/neIECMr+FmDm7imo4hEAQLS67FERg4Mj9nVrakE8gOx+xMYe8VL
	 MpSYyhrIt9EV6qXM5slt6ELJTnKbzRKfLDIMxTrYhI3lUbB424s+nxnblValhjzRab
	 JCKr3UNEXShaCoPzO1GhusCAKLWKb35PH+m21Cjt+fatrYM3wwYEH+mdLelp9qz9ak
	 s+cN+MtnwCeAEKGLFU71XuZlLluZGOL3VBfbwrssi+834miJNO69ZDMf/FMMKeHdej
	 LdNRc2f0vbm+IrJzGHdgZiaQitKcItQCu/WdO4w5oz4uCuXcQUW+wH7ZnQiVU6Bcuw
	 091fl0WviJztg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9CCB80DF2;
	Mon,  8 Jun 2026 18:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3812EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8908280D47
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXa2oZhIbJlX for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 18:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8618B80D2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8618B80D2B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8618B80D2B
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 18:24:28 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so2018575a12.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 11:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780943066; x=1781547866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/TMgC0gKkceV56fcQ9yKbhc75/pJIFI+XBQ+8WB0qY=;
 b=K3hsnHr2oPPY/aquic9xSpHRS8gD/hHmXkn6d7JAQa3+Iq+XIAl/xDfflOyxB0tjVN
 yU2DHeE04fc0ZI12/o5n9lLtQFE/IsgfTeXZEg6xixptF158NEH4X9E/AxPndbYI1iRX
 HBWlBgWmjcI6pWDN24cEir7iE6n8sGJniePU74cgLSvgbl14gRM0sXqyHNOFRNMxAnaY
 YNBl7u7xlQuJLbuEqJhCJdpFBmk3adK+Vb6HgBcQ67bsdaa7df6y6DVcmqp9Tbh+GzcJ
 L33SX49S6rUGfb9ZDzfhZRRpdzPuHefchSkQNo7LNU7BU8/CgRnra9rRvR1nCm8vUkMC
 uRyQ==
X-Gm-Message-State: AOJu0Yzq0g1p7yJZ5X9Chf7/mI1Mge+1W1GJRiw9c5lWZi8ui6EWN3YJ
 cn+u24PgYKY3WVb6UBmhSgv+tcWgYrFFmCq79BjoYe83OOUgeGVikGih3L8dYjPkMU9mM8v9JK6
 I91We
X-Gm-Gg: Acq92OGf+SdYgK1Z8ZYUN5A0T3XE18o/fuqGOnZiqJc0q2fAYpkTDi33rlpLeDmyWUH
 0pngt92uwyjeXPYF5bz1DG1Cyk6MTIDYk0hKrZZpIUhR8hYUmBVe/lF5QIjBZ6ay85k1JRWZc2T
 FLiGeiWleIUl2Ugo3a5zmpEuqpehWXYN2cqTUqayH2TvPz+Lg64Q2nnNJ5yxD15n7SEQ9Qw05f2
 /1rODfNl1OresIVe4/hLm2VjnnqVdR2U8+AkEPrCWsfOHsXXhGjw285JWw6w+CajDz9tseV2h0r
 ibcF/q0v58TKe+TEuR2/JaTVVIe6npfUS8vGaKJMvGxAJAlnE/VQT5CWjrLc5u/2ssil608Y1rM
 X/yiVgHPuKp/fphQ2HsTPJWXshFY/84Bx86tj/sl/VnQ4jbV0D77/vaPXuPUTy6RV24PiEcMoCj
 d8gnOnLd99kxcT+xUQLsKx4C3+6KPtuWTEOl0G6OwFEVv90g5rhK8xdeQ6OKXCIoTh7NXVntYGw
 eyKIE3FBs/FqXTj+BBDoRbAllAt8EZtgV/asFodUXQBTMuymUcXsIhWh5+b/izAgJUi1g==
X-Received: by 2002:a17:907:d107:b0:beb:cc42:eaad with SMTP id
 a640c23a62f3a-bf3702814abmr781471866b.5.1780943066098; 
 Mon, 08 Jun 2026 11:24:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051c85e76sm930531266b.15.2026.06.08.11.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 11:24:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  8 Jun 2026 20:24:22 +0200
Message-ID: <20260608182422.1212850-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780943066; x=1781547866;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/TMgC0gKkceV56fcQ9yKbhc75/pJIFI+XBQ+8WB0qY=;
 b=Bqcg4MUsD6jldqnDuiPgnhQYP4Wk1xz8tx0uWtWTIyRRxU3wMe4fJ+QFHW57Ka4jKy
 PTQC3OZVzNRH3ZcDzavo3L+v3EXNZz8I3poDClyoQYjBHdKVRbywCacTY3iWAkEQE3PU
 ZdnczXnr7v+MkO/ggxnWm7LMjLUpk1fu7k0dw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Bqcg4MUs
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.7
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
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index b0bc621113d3..e78cf1f1886d 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  97cb8ef708541f632e861d005a462dd0367240f81ff96f8e63ebbdd75c8ce55f  armadillo-15.2.6.tar.xz
+sha256  029230b29c3745924ea850c7046efd1db74b863fdfead8b1aaba3bdd5b0cf895  armadillo-15.2.7.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 194af02e0038..756a3fa8ab65 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.6
+ARMADILLO_VERSION = 15.2.7
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
