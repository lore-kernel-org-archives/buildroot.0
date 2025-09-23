Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C4CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 15:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129E740E5A;
	Tue, 23 Sep 2025 15:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTQsFrUIbRyn; Tue, 23 Sep 2025 15:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257F640E61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257F640E61;
	Tue, 23 Sep 2025 15:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44F3EE7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 15:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AE3B80F19
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 15:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkmUoiOoI33c for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 15:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C9F480F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C9F480F16
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C9F480F16
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 15:55:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b28e1b87aa7so448288066b.3
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758642910; x=1759247710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmtCr0EFhKwiWlHSeuZNjos3+JBGsLOOnLcLk+1A29Q=;
 b=t9yjb9dQvaSOcPq9DKttitWIyPu4qfB1eQGAJ7keJSYUHLQZ00xXJBqRMCGCuS8mVX
 kR6EXC9LrR54bRuYmwOSeHsyq6xHbemJNndvmCAFXlexFcpEDL1R9N50T/nYcwaD9F4r
 g2vEL2Tn58vmDtWAVi2ZDdpDefqskiCMfxLi5oa8vOlnelE+5c8KhSQSUdx4g1lR6Ttx
 PVdBGw+jbHWcYRt+Ja8EYHAHVqHXpu5/W5JivP9AJ1RMaRltTDwaR3YVOHJzV+j+INI4
 vX8FEXrTqIKeWxPdXwd89/Xw84dLGyMejARL11AvPNwyieE9kX4qU/lW+QfMQhvpitDz
 ZLZw==
X-Gm-Message-State: AOJu0Ywm0zXaeB4sj00aYg9+MkdpiEBgJXyZf1jtel0AxpFiYFfqjjhf
 zZZIK8UHnsy036AfiPX8D+PT6ROmVua59/XJTXwQVwEEJvgn9J5LHHmZ3b8Q52L/GBIYRHwlV8q
 +jPTWKOA=
X-Gm-Gg: ASbGnctYfNOLmTSRHk6bBqmJ6uvKKhvXr/YNUiyapOvf/7eJyXYxUK9xbqGZzILSV0j
 A7E0GLwtV8JJAnorIpbdnBvPJ2tPhcVFaLrfDn0O1pIGrlVsSrldGNKwwBqvznP2hCIAzC0HmX8
 fgFbWGCb+4AkLR3m9lN2rUXDbT9tcKmH3slwDRJcHDIk5l986DK73Ihvb/2dVnQshIDP3xO8VHH
 jZtlpo3CF4IWYyjk3FkEyndYOEPMqw/6mu39IBK8g3Cbbjl1PSbyiNHyoLWl4q5I+IUpDclhFht
 hLiGqMjfguTdnMoIIyhKAFi2j0baYuet8L4ylwcBaUByl4hRF1qCeJvg0JLhHfc+42dGPqK1L2L
 LChIm6iI2+gkyyU7Yo5gcyyTXccepsuPKzR813N5MtA8OoIVV5sE2y3JICxsbw7sJrCb6DxJkFZ
 6aHSLMf1JcZ91+PTZR3j3BmUYRDISBsf56k+Oo9oFuDKVf/xBwRRSUSWCKpkTFxKep
X-Google-Smtp-Source: AGHT+IHyMixY22P/21JipLXsKW5+tmi+rTUy+Ibr4Q49BXjwZW1HtST0CQv/Huv2Vh5i9rfFGCFBTA==
X-Received: by 2002:a17:907:1c84:b0:afe:c099:aeb3 with SMTP id
 a640c23a62f3a-b302765d71amr322524366b.25.1758642909750; 
 Tue, 23 Sep 2025 08:55:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2adc17af65sm628174766b.19.2025.09.23.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 08:55:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 linux-amarula@amarulasolutions.com
Date: Tue, 23 Sep 2025 17:55:03 +0200
Message-ID: <20250923155504.2870790-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758642910; x=1759247710;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zmtCr0EFhKwiWlHSeuZNjos3+JBGsLOOnLcLk+1A29Q=;
 b=rsF+V3md+BBMUNqoFzOZ5TV44pZcl64hXq7bLFuFy+K+qkBSbvxdiva7vviTysQ3UD
 gecBtX8Sdcjb5qqzlCX3L9/ejcjnd0oIDqQCexEYoHA8BxE9kCtT26SQS5XNhvBqDUSz
 My3gat6Lmy6quhY/RMGz26rsTch8VgDtv/bqw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rsF+V3md
Subject: [Buildroot] [PATCH 1/2] package/jsoncpp: add host variant
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/jsoncpp/jsoncpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 9915907ea8cf..319944abb7d6 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,5 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
+HOST_JSONCPP_CONF_OPTS = -Dtests=false
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
