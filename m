Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E95E9411C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E9140405;
	Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhwEXoV6MJlp; Tue, 30 Dec 2025 08:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78434404EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082774;
	bh=c9jUEgZreVjMa7jGAP1H9dS29yqWQa4tDVQ0YgiVEks=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=GzOUinqsWoMCWq2Q3Xx0kvePTwRHRStgNsOpGD6UbeCyNQ042omO3lwRWaPQd+Xbu
	 C1GfETfN8nZi+qXuuibmtPiUppq2uhn84M2anZIQTHDX/v2m6gd3/c+zjKW7Hg8ui2
	 l/XA8tTHJYp+4uwyXRTJc4rD94uJ5TBcsB4YjwiooMM6qT0MQJTpHjptjX6WF1tEyP
	 x+1lRfT0GYkqIQcvAW9GQk/x5qWdfOvBFW9ygAppw6eeXphd2np8pbZXcTpaW17ZJm
	 hp+XffTXcU+ppE9FXM0jEZEdrZQa7/gerqjd2LFfXaZt/b4poHng/ZMmmpvHOsxI+S
	 zB+raVTXi81aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78434404EB;
	Tue, 30 Dec 2025 08:19:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEF4CD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3DA404EB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crATiOl1eKHy for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2759E40405
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2759E40405
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2759E40405
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477632b0621so60661935e9.2
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082768; x=1767687568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oBzSqNAtA+kCj8ISb6sJa2YGcmNQzKhCHkPphb/3O7M=;
 b=Fkez8IDKzqncIKCsFpuRjS9fiJTyp5Om48+23T/jvPMCoWBJXop+sxC4EYY9Sg/3Bx
 yDIdvMuNwSEZXi5EjlVykvJaLIBqAx3WSm4/oAQ79Oycp43bU32rs6slveHzYglf31Ak
 DR9rCO7BAIbxfBArCT4pYgt4omEE6h3U4jzaDjibxCTYU3iBt+/qAkTAJ6s7FMLezlzz
 kT3Zsvd8NFA4LTa253rlKvgXpBrtn8NgymRo3d8b+Y2BmAqL/ybd91NLZ1weW77HlwAB
 Xz8rJLmJt72FkDPAKta+767plP6vwVPn5PN1jrBuNmHJWnBWdXvdyWJypfdFJ/zp57Ql
 LQrA==
X-Gm-Message-State: AOJu0Yxp/2052O7PrqTaKozrYm3Q1aC9vbfK/5AFa1ngf6etUEzp6qG7
 ZoMGTkArgEPRyDFekEq8glQMS7/bWINhPWtTy3RnjMs7LNiFhHAh2zo/vUfW5Ppjbfi4v6aE5mp
 juCwYwBM=
X-Gm-Gg: AY/fxX7H0fKAsMjG5EWmjDj4Ml+x7sW3VR8SMz2vOrQUBBiBGYlJhloy3BDAJz77R83
 LgA98ue4mm60CrkgqzFUyWxoTRvFgfXyW4zjZ4FmKdVh+rmmpuzLmczIUMedLKKpIoXQDnVCRYS
 NPHr8pTK5ptZuv/GBIUzmombQB06ApFPSYumVaxvoOs2WXRy+H2lNW11T89D0yq52ldz377i5LK
 z08vNkhccGlaJVsSLfu6qcdAt316RZkyuW09IvVY0gKOg8IEKjzU9+dNdlCi63bsIx6JsJgpjAq
 Y4ZYDUAi0BlJFSaqBX2MGwSI4V4Mxg7ESg8Git1lgOf1SOuLJiCScIFMCJRQs6YfVFyOYB+O7Rw
 Q1q0/U6desJsuTJ074IkBmEDCdA+U94tzbBuANd7iLzGbtHyW8fAoDe4g0Meb3kC7VuIKk/1MY8
 1aVVI=
X-Google-Smtp-Source: AGHT+IF5lXKq8myZYqHYQlJzZruNs2g1PuG6PeY3K5KytZd5MiFGd/LNYEC13oPj242Sb99r3A1AKQ==
X-Received: by 2002:a05:600c:a46:b0:477:5ad9:6df1 with SMTP id
 5b1f17b1804b1-47d1956ec3bmr418575875e9.3.1767082767798; 
 Tue, 30 Dec 2025 00:19:27 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:08 +0100
Message-ID: <20251230081917.18676-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082768; x=1767687568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBzSqNAtA+kCj8ISb6sJa2YGcmNQzKhCHkPphb/3O7M=;
 b=RHxYrCbjrfxMVv3XPBJu25vXrzwHcpQhzh0jKw3cMreH+cNCyIqtVZOGXyES/1wjsK
 jCbqR5bgh0r7QVTZnbhR2OOzsFwi1p/glN1kEdmCTfgCJFKTrTs0HMTGg2S3ZaVHou/J
 kebpjEqClAW4kOKgVusawqyVdUs6gUgWA02+F0GgOeo4Xdf+jcMaLiFhByWg9Y4ESzez
 SePYeDF7bWNR7wTOLSPSTaACGfeMiLD/vglXeOLhXnC8IHHIuq9jjgMRKE57SyJS+fFx
 etX3iqFuWlCMmmOm5T43L7ue3PYAjxUzpM3iHmL+Oqs66TQxC4MqvVojT5glWVFeD0t5
 Tg7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RHxYrCbj
Subject: [Buildroot] [PATCH v2 06/15] package/postgresql: remove stale
 IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2017-8806 is then no longer matched to the postgresql package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 78d7cef4f6..38403b0f45 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -28,10 +28,6 @@ POSTGRESQL_DEPENDENCIES = \
 	host-bison \
 	host-flex
 
-# CVE-2017-8806 is related to postgresql-common package
-# It is false positive for postgresql
-POSTGRESQL_IGNORE_CVES += CVE-2017-8806
-
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
 POSTGRESQL_NINJA_OPTS += world
 POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
