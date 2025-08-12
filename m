Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9250CC87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 10:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344A261469;
	Tue, 12 Aug 2025 10:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-YbuIYNeHPI; Tue, 12 Aug 2025 10:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 669C261443
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 669C261443;
	Tue, 12 Aug 2025 10:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55C8F158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47AFF84524
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGxsRvqTcz2R for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 10:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BC6B84538
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC6B84538
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BC6B84538
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:02:08 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a169bso9621356a12.1
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 03:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754992927; x=1755597727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Au+jTNnOrCpYtWjMTd3tcuy4qrvsP/8sRYJ02NcLVoM=;
 b=D626Ph+IHoxesPTpT0IA06h18EA3OTvag+g0plNpktuRytJ2w/g8SDb8Fmxvl3RcvH
 65p2QzA04d2LaL+q8NkREHmB+WpuEjo3HWj/oARR86gm67wxstWMc4xJu19lR9Zp7txt
 rHuDPS0imMDCj3zZFX3iaVs4NWQULAUcdj3zBeN+3BX/o/J7kGc5MjsUNO/7fhoyzXmm
 wgPmdxCFnjlMr/hhUghQsSUamaYox/X9YRb6OoDcnqsqlix2KwX52j2CQ/CImERsaLlk
 MXwSeSbZTW5nwcGHo9pb+QBu0iO7rCxsGbkKxJDt/rlBZ4Scg5uytLWRHfqjBEaqpR7M
 A1Ow==
X-Gm-Message-State: AOJu0Yxsuh3j/GbBgpQMSAKtswuQ8ajt55hb9+0yNbYXZetJunFVNlbe
 D4oW+xp2oDxDmZCRq2VmODPtKrmAxBC3ivEZ+oISwXf/waSUDn3AoWr/MBbvQg415kGDdNjOf57
 DEWN3l4g=
X-Gm-Gg: ASbGncu9vJQThTxHNkjffhPkresQai+PR0aQW3QHHhuOBo7I/YLIKQ2MKIQE+SdYkYU
 jFy9zy2yYxdHIuKbygxFIG48rIZbu00YJSObiEPraKmDB7Y9S3xx1X87K6cwJXuKONDrPLIfw1V
 CyDq9KckU6bbwleKExJC76RG68WYAN24z/rrISYVim0TnnL0xUj4pTwtHy9RjRAr/MjTpqGEUUt
 YE8idsB1Hj/TOTIxkboNMND0ZJKwN1Z/SSeve8mJodvaRCbGM0nJh11Tir/SuAvsXgpQGi3hStV
 11BbQ+7FYYHG4eCeaRejmQjV9268f5PX0u6u4wLyUhyEZen9vPBHLoP9DLnvCN24Zx5gfW3ofbj
 XHBlYsF7JjOUf91TMUHCJocQWLI71Evuo4t/VzJ9gFg9iyWXpmqg4KA==
X-Google-Smtp-Source: AGHT+IHOOCt8URx7T342QSscoxyUG/d3Byhf6PWFUmjwOV1bH0HNCE5I15LS9X8adSLiPGF0rJLItg==
X-Received: by 2002:a17:907:da17:b0:af9:5766:d1e2 with SMTP id
 a640c23a62f3a-af9c6506cc4mr1488258066b.47.1754992926933; 
 Tue, 12 Aug 2025 03:02:06 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a243619sm2181494966b.129.2025.08.12.03.02.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:02:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 12:01:48 +0200
Message-ID: <20250812100148.717381-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812100148.717381-1-titouan.christophe@mind.be>
References: <20250812100148.717381-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754992927; x=1755597727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Au+jTNnOrCpYtWjMTd3tcuy4qrvsP/8sRYJ02NcLVoM=;
 b=PXQbLDHEDyuVdJGGCbOhN5cWt+BZms8LIbT8FRdo8nXVHVbjSfSAMQFqEmb+zwhueb
 nx+T9vonDxk0kNAuVh0DMHenEQdL3T9HQh+UlC0wWSHA20FjHPXSwB9SRZQcyM+UOftU
 A+XZBluHjJuj9ljlHX7Oe+QsSvhoSo3Cbhbl6KFCfGBXZAE/1/grA+a7DfftaAKDSTkH
 LZG+j9ONajQ/5aXqYLZ+b7DXMVBiuooOwM7HdXLwv8TRNVBHBog6M7jmWbj+QDWWsxtp
 vRoIu+LJEyoPYzB4wNRllwImhXgtbANGWcAYUVjD6/8S/dd0UjuNMya4CoSqcJT6cb3N
 DRyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PXQbLDHE
Subject: [Buildroot] [PATCH 4/4] package/libcue: add CPE vendor
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lipnitsk is a valid CPE vendor ID for libcue, see
https://nvd.nist.gov/products/cpe/detail/79A927B3-A7E5-476D-94C9-0FA0AB71D182

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libcue/libcue.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 7ef27f5a17..8eac4725c9 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -10,5 +10,6 @@ LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
 LIBCUE_INSTALL_STAGING = YES
+LIBCUE_CPE_ID_VENDOR = lipnitsk
 
 $(eval $(cmake-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
