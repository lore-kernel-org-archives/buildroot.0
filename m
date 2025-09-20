Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B431CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 11:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86696615D9;
	Sat, 20 Sep 2025 11:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMvUqXW3gyhF; Sat, 20 Sep 2025 11:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01564615E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01564615E4;
	Sat, 20 Sep 2025 11:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BDD4E7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E04D615E3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnazGClzm2EC for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 11:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA78C6133B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA78C6133B
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA78C6133B
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:13:12 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-62fce8b75a3so2263133a12.1
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 04:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758366790; x=1758971590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+/1nLccRNIPW8nHV6egzxmoBH/2H5f6VsS7kj98PRg=;
 b=OlOoT3oYLl+sLGXGp4teBDwDRKEjkAZ+G2MnZ4KJTs1kjAhyG4ugvlWnZYoilRurYx
 6PehshKj++mMUHVXLptIxV3qi2vJb2p2D756yxQFNYtkMYLR3EBR89fT/ejYkY5paoN2
 h/63uNTlMaGUAYIN3hKQh74iTeWXfDaCsNLwrX+UIGDtzWAnR7dHqhJQ35OUjvd2U5PG
 iszgk0n9pCAorimWbwpCxq/t64nYZuGp/qg8cAfIGJyYinYFjgcHTtqM8ZsDCj/xn8gm
 Rd6lnJf1AhCGloTLgXfv23BehW79a9gChmv0t2wATKcYAhc7F0qAJGu3Tpw1Zz9l7+z+
 ETDw==
X-Gm-Message-State: AOJu0YzcEDztrFd896fJgEA9Hs/KldSEo52pqv/J2tcfw/dtFcoIkX2F
 v93mND0rTZipzzyV3nNxvHMpwNHr33FaUtVNEV+0AUKSx95MN75uMN8QKdHEu1LMBjOeA9fW6tD
 espHT
X-Gm-Gg: ASbGncsPctrYcJk+CGR5w7e4d2cv4hP7s/wXnBDkl/1+/inbt5M6jvrPItdawKqeuy0
 CJj2158BXYvEZgOPAML/cjzEr/cYr2lWVA3RfFrU8c+OOB0yLDdRuGJP9EC+ccb99SW5YjskINb
 RIE3NZHD7r+ganGFCsXmcB7E6zW2lRH25uVEksyqGFPu2LThz+NpedYGd0ZfNsSNPdMECO0uoXh
 i5fq/9SOWPwf+pyNmnIti4EB/GZmyL11Sw9yb+RE3DLJUBK4p8NUV9ImlpW7feqHLXH7NtrEFra
 jH4pY1CktVD9GH+ymYWE0n5yoNiKnQ4yBB7jtwfBVIPq2j9xSjXXmxlfxmNMxZv+ABUYU0YSQwo
 xrmX08QuXiKhuFWBPYPuBa7bOxRtcSJIeLq7pY+lQOU67GR7CTYWKzEToC6PiUdNOvaOoYrsfoP
 dxLcPOwyxvdqEnIIHHsS0Y0oaTpl5mzGmNF6jig2Ifj0znlGrmvGAAeAuHHJSp7exV
X-Google-Smtp-Source: AGHT+IE4OQULXxytxefYoZ64QbNNONYID8AI3dcg84lOU7kplEnIUTpN3N17reogG006RfN6Mr2duw==
X-Received: by 2002:a05:6402:52cc:b0:62f:4be5:2286 with SMTP id
 4fb4d7f45d1cf-62fc0910558mr5528391a12.8.1758366790490; 
 Sat, 20 Sep 2025 04:13:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d17efdsm4884874a12.15.2025.09.20.04.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 04:13:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 13:12:44 +0200
Message-ID: <20250920111244.2575859-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250920111244.2575859-1-dario.binacchi@amarulasolutions.com>
References: <20250920111244.2575859-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758366790; x=1758971590;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+/1nLccRNIPW8nHV6egzxmoBH/2H5f6VsS7kj98PRg=;
 b=W2/Evl/EPtEUFTGAt+4wXsLGoKJKwGLvbYUF89WlamR11dnvYJszuHHE0AIjsdE6Da
 T509I4qxGZUT58wLkmbhkHXYrzdt2z93QaD803CrwagvmBSkdO4C6xb4TvDzdlcxCOI1
 u64A39uBnejIRXzlxvlb8htTiHlcFuZmfd2/o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W2/Evl/E
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for cmocka
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 16d9ee892bdb..121455035926 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -806,6 +806,7 @@ F:	configs/stm32f769_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/cmocka/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
