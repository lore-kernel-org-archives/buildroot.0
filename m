Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BCCF3092C
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 13:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98BA40BD6;
	Thu,  5 Mar 2026 13:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYw3eIWUqDzA; Thu,  5 Mar 2026 13:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF2540BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772716698;
	bh=sXx1kHtBjvJj70NmmzTZVrNv2FOnAOpxyj3i4NC1r1Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJy0cKIQ410Vd2h01sxBvd+yCo7miBd3Qk3APfOGdJrLR+9vve2mNnwhkgcNNAacG
	 5N8mYYne4ZqOHAmVnjwHVP7g/46y4D4l+zMJS525H/xulU+ENCVr3sgdUrhKcQmpER
	 HhADr2NoiichowVz+F9O3vhYn+L2TLG7E66iyl5kXtU5YYL8Z0zrLdEOJYS9YhNc7N
	 AbglsjF/RE+4vmtYhdZyvYdxqVM4iFCS062XigrsSfEfXDMuVAdaKnxqeQ3YD0OJ8y
	 TMPC0tsGmYvx/oDNiBnQoM1uhlQl3yX8caVqLRX+ObkPgDWpYsAH9jvmXDpBxXl2kl
	 PBmJSPu6Ahw3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF2540BD0;
	Thu,  5 Mar 2026 13:18:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E960223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F7AD40BD0
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4EPxT3N4Xzs for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 13:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B430D40BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B430D40BAA
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B430D40BAA
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439af00d33cso4828511f8f.1
 for <buildroot@buildroot.org>; Thu, 05 Mar 2026 05:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772716693; x=1773321493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ePKuREpxUFw/o/vmjsdnCjYnnqqIXL1M2EfAHilQeJM=;
 b=cARwVrKGH3wzqs5oTNsevuT4F3hlIxZ+EaLWSevuF0t6awMsta/ezFkh6SQFCx9Q2k
 WmAUQEpS4VezUN64PwfkjUGoi4jB9oLsOiyXGXaOlgJmjryYG3cLz+GZMBzL2KAPUy60
 ARRMbA8KuQAQPu10WCJ0+HRGb+et0S+MOYLWL0ZOG0op9HRFDykYibKsxMXB3BVuBFks
 SVDMethq7CE5og8axKJWqkPBhuxPnk4xEYiU6OQ4FteF1uTcOqBpu5hrkiwGUoxHoqJR
 O01kpK1OoW57Te82VsP1AR9o/l3md/D2CQ1n69esIob4SXdqU+BDPZRxDNR9T+CnA1yt
 R7+A==
X-Gm-Message-State: AOJu0Yxq4KqClcfT5Ar/xTMdMeOZwBhHnukfoztZFvlZgFCmD95fat56
 75oig4Ul4ij+gleB6XIWvH3nXmbguC9LmxhBNkTcXYaI2Bt7ylkHj+JZp5biVhg3C2dWBV+mZfS
 sjwpH
X-Gm-Gg: ATEYQzwpAEhDKzYMW0jflrU90gpdiV1F1bq+A/7KN6m4MfIT0WGiYDgeMxeuiBUAjPf
 Hetclrsav8nYxd05scVhT6lvkRrL+C9UUOSvE+6YCAlnSpdCIj/+jdCvDu7IZh2T12WTbANicaJ
 qxlgQzlZjk8W0cED6KAfNhbee09nPCG242ut0M/bid+YKPKpwGLfe1bIy6GELvfOBQOoSHHjMk0
 X+NxIfBEwlKpJ/jfJc4hgJiC/FPhewJkLlfYVf2qFt/ggTRXRCSQRODPiIVOO6qI2EazbPvTpcm
 jmXqnG22gbZaKlVErFM5I9mWpxeI0BOoMkpXHR0nQ+Yew4lNx9r3K3Bnc2gdljQ3rKg+n1bkrdJ
 uQp0sh5QaqjY8bbmPqIJFAIp65FT4mP9RllJiJv+Q+m1YsmCt928AgpUVG+alO0fLbcRX3+iZJm
 yvlGY6BPnIvNfj1DUGItSOxXtPJGlgXePSBIy510NcgRYlB/zIK1fmFZUgmQgOpfM/ZcxpmTin4
 qJbrNiDegsNr6eb20M/H4LtyC+IuKCwWiMM1tFGfJUPMZPeisC8EOWTV31qDDrz7Il6Wrm4GH14
 cg==
X-Received: by 2002:a5d:64c8:0:b0:439:b114:60c0 with SMTP id
 ffacd0b85a97d-439c8007166mr10825086f8f.35.1772716693285; 
 Thu, 05 Mar 2026 05:18:13 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm33025907f8f.38.2026.03.05.05.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 05:18:12 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu,  5 Mar 2026 14:16:57 +0100
Message-ID: <20260305131701.56962-2-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
References: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772716693; x=1773321493;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePKuREpxUFw/o/vmjsdnCjYnnqqIXL1M2EfAHilQeJM=;
 b=GaSRekIeS9ihnymxnYBrP1AqudQt8agxDCuVJuXLQ+/BUDjYsTktAYovrsQRbQ/mO5
 o5I0q2a1qj6zcFKR1WhcrJgJIgTHdgvUg5n9BNVoF5KfhZM7/ugepAdqA+TJqajy7aKb
 hQtfM3b0vjFp3qmnJkpPilT4/o2dzvk37TvSs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GaSRekIe
Subject: [Buildroot] [PATCH v1 2/2] DEVELOPERS: add Andrea Ricchi for
 libcppconnman
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

Add Andrea Ricchi as a developer for the libcppconnman package.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2673a59824..4184dc4df6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -186,6 +186,7 @@ F:	package/wine/
 
 N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
 F:	package/cutekeyboard/
+F:	package/libcppconnman/
 
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
