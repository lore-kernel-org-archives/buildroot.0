Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E7ECDE002
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E6C60858;
	Wed, 24 Jun 2026 14:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bnm0ZlwBgSUi; Wed, 24 Jun 2026 14:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05B860B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310022;
	bh=HSy+WKqYzGF5OFsPZ6A5v7qD8gpuN8BjvpXEiU4bgYo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=F/k+jszodr8K+ldNlGDvfqcTDE7IXAkGWnToWKNaeI83QoIYER0NcIrO1iwrRkPz2
	 kixinaLQdkjxROTqRaunGXpZqGE3L8dlFhpVtxlAqBYqGjfyFz22cq08TEG9+sfHBo
	 M0wbBrFLjrTc3L+twCDmor6Df++8QMRE60mWdDVi1eRj1sFM4cJKY4dEOmzCxFTTbI
	 wu3Ai0UGCac3Cr23bgHnffaLlXfN9DGI8gEUWHhcFEE8UiAPUDFxNk/NwrTTQoJDBx
	 91q1frs8sK3rh7+brXl5J55gUEte1hnCFraaG+ey0H+AlzYTCB0XflT9GWw8A1PrZ9
	 +VlT49xn4zRjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05B860B08;
	Wed, 24 Jun 2026 14:07:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CB1F367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA8C401CC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byPO-CYjHavv for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D4BA40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4BA40120
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4BA40120
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490c0c92cffso8046315e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310011; x=1782914811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q1BXhBzKzRPy1lztCfv3hvZeQUi+mgzHQTYOieYnt+M=;
 b=Iwu5CT5UxZCsQJtYNVfgcCMMTMqPSMmeROJYwAigmxFcuz/3xrDA9R34W3WuwlA/ha
 5aQwHLZ/gRvpOBNuJmZV0yN1CDu+dFY2ctK5d6LKZpGnlqOEGQ/1MsdF4p2VjA+6GlJF
 igiIFaJWALs5x8RZXJOaioDoWimq2oEhmZQgDaGsiexaOEXfTX5nx4feGdNVOBo1VNL4
 ZY0hz9hXVfKnmrwWc2gkPoeO2t3h5Dk/jh74NiQLXuJWH1RSk0+nhQ1cNBWBT/F9NDTD
 HM9hAPT5rWhdRkR3pBPCGaDWBJYrsPbvkfhl2//fAlTa1EcvLSGYT+vVOtrZkVKTt2bV
 sd4A==
X-Gm-Message-State: AOJu0YzG2La0fgtdHfMnkfQnlNqljP1jwcjtYzktveCssnlTTlRE5fGg
 9tyQ4KDQ4AWUsYcp3Q4pwlgcKs6FhBhvKRGsmVieFEDzUvvhjXcZTXONy79Ft5MVOsB3ZX/ItyX
 Ikgne
X-Gm-Gg: AfdE7ck8m1FlEP+zmG4qkaFxFw9hsVhogF10kDSo4p5lpC4IBP1H2Gor0bxmzjt2djD
 DRHGd9lbHqbSNOry8g44CWi9ZrkrfnjP23WIL0xnLY7NGYOfI52IHG16GfqeWYYr1iRH7HzMg61
 RfWk05UKF/SGmJcajg9r6CBCsZNFQyJHK/Pw20hZ210VBWf96L7W5sF98p17BZdQXW6Y93mOHAg
 bof+B1+nXI3rhWp5jQi9A0xWOLsFkb3agmT0RMojhoBVXTl8Ehgu1dL7Mo3RusPRyZIxl34EpLx
 9hCnq96he50ziJLbRaGkiCFgjE9AMdqMvB18MRypbZ7sJdIM/LLsMAe1OC1aw+VpdU/4n4NShfL
 Zx74PYnahhXV5rgcCVChRCd4lJ9S17pqoM2kIXLp1yfOWIHxsrOh8KjVMZAdWDih5cus+B26tUl
 qZ9f0+
X-Received: by 2002:a05:600c:34c2:b0:490:cf76:dea4 with SMTP id
 5b1f17b1804b1-49260845390mr51411045e9.2.1782310011180; 
 Wed, 24 Jun 2026 07:06:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:37 +0200
Message-ID: <20260624140645.185318-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310011; x=1782914811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1BXhBzKzRPy1lztCfv3hvZeQUi+mgzHQTYOieYnt+M=;
 b=V9/aJXLmrzswxcNVrUKafYUT3Ag2cekB+Ac7gu9SClyuUoGFGXXAClZICF+MSW1BSY
 3T5r6VDDwDPgl8tdIolHW0RuKlDUccgGI6FEgldw2jnxHqhN3KrMTbaTMytg2TopfjyE
 d2Pi4bkUtodbfET+S6IchPH4buGCGfDRDawjR8VHvtvI6CSWAku7/bMAx+Zf3HO4Z5zU
 x7/WHSMy0T/vz4vceOzjzBcz7rD4smSmo5vsBonEyHFi3IW4mi69G8JyPuqQopGUgJ0F
 +kDVQ8c3WiAdtRpHa+mx/dZjNfNSmvKd8RynQVgpTfmDCBTSrv+jNY4DY2k3tlPOCgCQ
 gTPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V9/aJXLm
Subject: [Buildroot] [RFC PATCH 06/14] package/php: add vulnerability details
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mark the vulnerability as 'not-affected-vulnerable-code-not-present' as
the vulnerability only affect windows systems.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 0bfb12a8eb..6160248c51 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -15,8 +15,9 @@ PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CPE_ID_VENDOR = php
 
-# Only affects the Windows operating system
 PHP_IGNORE_CVES += CVE-2024-3566
+PHP_CVE-2024-3566_STATUS = not-affected-vulnerable-code-not-present
+PHP_CVE-2024-3566_DETAIL = Only affects the Windows operating system but cve.py doesn't support environment check
 
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
