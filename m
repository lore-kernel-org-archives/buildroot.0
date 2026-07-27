Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BFEC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 09:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F53680887;
	Mon, 27 Jul 2026 09:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijkahrwz9lrD; Mon, 27 Jul 2026 09:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD1580602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785145758;
	bh=s/2RBGx23JYITbtq197eK/q5mvIKGBsdkQplFyU7ND4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PihZbij5IUjynnvdx7SZijFaKjO2jf6tEHh2f3788haQUmr0mtT7nJqKVu+758xoZ
	 vbKEQWygAbaFLO0wx11//KiKvK/MIm9hLk9hg0+ED1N3CY4eKTjkiMZTl+ZGBxj52a
	 kEffLdZ7eR2l5vLgPbUqk8Dd3GUbJmhgZmPAgWbOfbBcB7yNGgvO4YGUiE3KweWWzL
	 TY1Sv1NMpZtesaqmySvFjSPZDjHtLMKLDFuvrnSluAhBqtc3b8Wgf2CdxNkGGh9QBP
	 lrZi57AcSiJFvm21qtUDx/Q4PTlIjVDM/WXQ/+6LoCCobgySefxDp2bu6jooVHZHvQ
	 8YPAX4inoYHFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD1580602;
	Mon, 27 Jul 2026 09:49:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65BD7350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5778D4010A
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpRYo4h3CiBF for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 09:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D29F40109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D29F40109
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D29F40109
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:15 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c166ec26696so37122966b.0
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 02:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785145753; x=1785750553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SKhuLTphGENuHcgDlPTW+V79FYk4Z+STXFfr4PadVWs=;
 b=YYv6F/capsKf9fN87c3bmwGItL6GMTugqbFtOYjVOic/PtPCjPV/o4ZchNh3nWRrKZ
 WDNVXeM48qfHqwdBcLaq5kDfe1v0pSZWvlC4yfzTQpQ21+fc/opwF1PriVh+zorOxSfn
 ouTVhDgSAQ1/hkz6I2duB7dwVNOjIdCTFrB5bkh+3HE0KlxHPB2YUPyMoRBsTAKzNNET
 AursaHw3SxxO6WW5bH4ZJGfj06dBe6RnEw5MJZRfsQo/aX6z+AeEPtyAfDUZVmgcIVuh
 RfR54K+Q4LOzfPZkS4YKK4sE4j65XfcBip4ZZr0b47UckLuzzIHMpCFMWXcxyBo3k2Ag
 KORg==
X-Gm-Message-State: AOJu0Yz2IRFVrCl5eWFtr4KyKj0MdjHWL+ERCSo6cuIvdgN0tL+AwTPK
 ttT/OXBEmQWtSOjJO6tZJfuZuXUWF6jfIIAtKIWepBS+0ayQ2vM2Wp7zdj80NM6hpmFvSVJF416
 7+gJl
X-Gm-Gg: AR+sD12ppNfyy3S2P7dIfKcW2GuOW4gR1LRA9QRkGCh/xoGeUOqZ8fu3wLV0qUE52Oe
 JJXMouK1N7X7Mg9UbBVLtg5gO8HA5GOoGIRGU6kLT0SZgSL5hl7PKYDVVGijWLl8NvF6RiDbUT6
 t4UqBnJ+nRuCLBmC8d6au4T9M7zIBciaejgRz1a9CFV3zNjGqSuZalt8IElJEejof/lB2m3JHDQ
 YSG5X0RNuVwusU6mpNieFO7yyTNyd9A9b1nJ7lwywAkn3FBEeCDKrAjZd6XDkTEQm4f6RlUr+tO
 RxNXFOljuMrZNI6Vv/12tIFVKaT1A5vkds6fRjF037f2dKyVOTPEEC90867cC5MuR8CfCjW9ogV
 g2dCSBgtOoFUkePRkwcK6Yhh74KtJ9t8PnHif2nHlt/oPVHs5aUo2xm/5fTbP//BkKfaqN1FndI
 p2nfL6go5LklqtB0sHo1yV9xI5TicJ6rLMfXM8pVimUTFRGJySCfWImbswPfPgOKWIKIJ3VesJT
 1muwl0F1iQRQBnsS8IiEBQRFmQ6ieF7LNM2KR9mQKt43p9U/kBVIYsoN2Q5AtAlcPrj0d4FHieo
 PHcbOjo4qIe2T+u1
X-Received: by 2002:a17:907:9629:b0:c15:ccda:26d5 with SMTP id
 a640c23a62f3a-c1f1eec54f8mr345030566b.4.1785145753201; 
 Mon, 27 Jul 2026 02:49:13 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32c90b42sm617448566b.38.2026.07.27.02.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 02:49:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 27 Jul 2026 11:49:07 +0200
Message-ID: <20260727094909.1701843-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
References: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785145753; x=1785750553;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SKhuLTphGENuHcgDlPTW+V79FYk4Z+STXFfr4PadVWs=;
 b=fTFBdq3zPbA5b6NCqnLIee+FvXWTylWapm9R2rxT4z+NK7a1yyiKcPkT9TrvmCe/xC
 XBlBM9IfvkTpJL1YaW8JCFVSWCOdXhPnSXh3M9MOPyVadr8H9SkkFeNtmFdQzL1s/9ld
 VA3vZqVM2CuRNEOTgrCOk9Dhlirnp4M9ErDSg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fTFBdq3z
Subject: [Buildroot] [PATCH 3/4] mender-grubenv: bump to version
 e4cdd9db213de15e79576b40fd3f07736ac85709
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

  - Update License hash due to year change.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index f3083e5d39..06456f6818 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bdb055332952f471d36d30cf8148d1d34eae16b8671cfd98200eaab5bc392a7f  mender-grubenv-e4cdd9db213de15e79576b40fd3f07736ac85709.tar.gz
-sha256  38791d93beae962b266e11ac888ea2af4f07578b272c2f9dcb05f54f32960a76  LICENSE
+sha256  9200dfc8ce8d9e5fae13947857fec44961df87c5bee92f90e37049279a94fb6f  mender-grubenv-ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4.tar.gz
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index cf2f7520c0..d93159802d 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = e4cdd9db213de15e79576b40fd3f07736ac85709
+MENDER_GRUBENV_VERSION = ddbc5cb054c7a8245c2d6c79eb4cb60ed0ec27e4
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
