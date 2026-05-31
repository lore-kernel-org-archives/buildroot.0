Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FB4CD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D17984D5F;
	Sun, 31 May 2026 15:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8h8jH8JJklcJ; Sun, 31 May 2026 15:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FEBB844E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241781;
	bh=weQVpJvjQfY3KNFpXFfTkgi9KapDuk+AjomBY9hw3NM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DkeoSFRseKuG2JrL78fb6ND1hmO5vLRdDjxcKs7O3wN2sS2q1PReDBsytTTCBWQa0
	 0y2yQHJMGcbJBbBtkflV+k7LNk7KWLVN4nkXKCgysexYAn1/WbJ8/JrdVmvbJMgLSl
	 5M0WX1EgDRIMRJWFGitzsAx9Y8ol96HP/A2JFg+3FBvw3/T9PnMnY98miFNHRZh1ne
	 fhTRc2ApplaLU/U+qW562czPQfVSJkiOwXLXq2bMWu9Tf1gaXIKfPTsboJBcvLpjCj
	 mgU32wn1wyZN5uq5/iTsyrMiTsSuCX8urKCPhNU7xKIHzzRvSi8wwM5VW7FW9ltWqo
	 cTwQfwIU3730g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FEBB844E8;
	Sun, 31 May 2026 15:36:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43B3F389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311F260EF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NLQnbDQb438 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D40F60EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D40F60EBE
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D40F60EBE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso2140941f8f.1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241776; x=1780846576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z5XG/oeW9gyyijQTvTuIFMR65SAPmtMQMugyyvi/NiQ=;
 b=D3vnMkE6aVjRyl9B0+0srBks4MhXcTMrHArar//XUxiALF+A2StPNHJSjsHz8FHYw0
 iY4KVA50vjSq3aEP+oojBVM9cXLZuj8WqURtzr99uLpL5iceptpF1qq9NaONKX+PWYB0
 y3Eo6QSodnHzJs616RhhFG4VLjJiDCT2oY1a/6+W3Ft1QZ/vt05NsiyXuMDqyT9bzT3M
 TYjhsFJAtW8wB9Wsfbr4TylHA2PYYIgWmLiLuWLTQE5odJwAogW3YLhN1HHlzK7KO7Az
 917u+zUITlk3D6/RIf21YW7ojVRnh+Ng9l2KNZhdzSL5Djm7gY3Nq1K8MrdxP8qwTlFC
 2P0w==
X-Gm-Message-State: AOJu0Yyl0Y5uJ+X6voC7nQNR6kGa242o9t/zmGbtJDSnAKgQgHDvlT6M
 Wbx4Ifth6fKuJ1FeBngRmobuNaNo+JF9sJv1r0RizXRGpS6495MGmyrUIMuKOdfxywpZnFF+YrK
 amB8Fm5s=
X-Gm-Gg: Acq92OGZMz1W9JWPqCwEkh3ekFGhbGMYM7X0ETINObfRfBiBETvWEEnIIEQIvLULWAa
 Lyhs//wZrBsH7mCTbqphrh7zexQ8llHAzToKBVr2yWSSY7wP9+lP8Mf6KCrLLS4Gnt97aWa/oHA
 /ta4c6n6Xvnce4fFJ/9cysICT2NSy0f0sNJXZQMZ9/5jhByxdMmcMZ+c8U6CuA7GLpOg7jt5tAT
 nC6M/07itcBIkxwZ54qmsrQSH+ignpfuUYEEBgF+tvwnV5R+hUipN6D6T0QxDhHWsd2ez2oVaRQ
 FA6UG2mkTQcysnOy9O8OEcVETULtDn9AdWDPJulaY6EwDIw3WedKnK5j61P6AjkBa5y1QdyzbKl
 Z4ZWlXaOcmDtXQUZR1e5ng9Ms6tryr3xG9+zNMdBwgX7mwK5l5IhI1P0a10cu8vhDGnhmOMLsq4
 XB5dfqPEqGwIv2lUGGC7ObzuelbvOyyFUpQ2049P8wXTJBOPMjZj2IkhVjulkZNMCGZMhu5x8YC
 srM+qQsnz33eTuL8Q3y8E047FzasQzw
X-Received: by 2002:a05:600c:859c:b0:490:58f4:ba23 with SMTP id
 5b1f17b1804b1-490a2963c10mr113195305e9.30.1780241776380; 
 Sun, 31 May 2026 08:36:16 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:45 +0200
Message-ID: <20260531153557.2375580-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241776; x=1780846576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5XG/oeW9gyyijQTvTuIFMR65SAPmtMQMugyyvi/NiQ=;
 b=KD8Gi6mJbPdh3A4axtUWIjmAgd/WAKT1b+GjRx2JghTpSDjq2Rn6+c3G8ifCWuvzEk
 6Bl6kNafmDxENaN8D43uNCUpawiZ/X0qOIx2ZWUOnbIqzot0UsW8Y0YZhan7mmtfNehc
 57YYAZamVsYSskejktX7Rczxs856+YeydWu98nF2Hf0RsgBMzQWuXbP3N5B/ixGS01CE
 nrwQtZlzsIq1PGLG2jurTsJbymvU42cc2BfPansptNxS0cppv9FTumCgPRbcc4Yv2w7k
 B59Z2p04LKOscbFKMzf3/XSzljV/p1rN+1KAuEbMfyeDgSf3qQZx5osHp0NR4CpRrf06
 Bmzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KD8Gi6mJ
Subject: [Buildroot] [PATCH v4 1/9] Makefile: always use a base config file
 for defconfig
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, our bundled kconfig copy does not require that a base
configuration file, with some non-default set in there, be specified
for defconfig, and we only pass one if specified by the user.

Future kconfig versions will require a base config file be always
specified, so prepare for that: if the user did not specify a base
config file, use /dev/null, an empty file, to specify there is no
preset value.

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 14ea241dc4..0a245c937c 100644
--- a/Makefile
+++ b/Makefile
@@ -1044,7 +1044,7 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(or $(DEFCONFIG),/dev/null) $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
 	@defconfig=$(or \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
