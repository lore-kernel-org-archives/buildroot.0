Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1607CA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 06:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EDED819FC;
	Sun,  1 Sep 2024 06:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP8EaSH3POjp; Sun,  1 Sep 2024 06:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311EF81A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311EF81A47;
	Sun,  1 Sep 2024 06:36:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 912601BF5A9
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E1064022E
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipC1bKQCXsON for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 06:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63448400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63448400AC
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63448400AC
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 06:36:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so4023016e87.2
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 23:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725172599; x=1725777399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JR8kumruQYcM7mOy9qIuMUgfRi8SatHn5MXEL61Ruc=;
 b=OjEZtP6oX9g4M1bE+9SARMzL/AqM10zOJSLJH4B/L/D0yEr1kScrh6HgS7CmQoSjhP
 ATJoa74/u8lgFZzM1O/FnIFBf6l/zi0W9kHlZYRS02XS4XxOWLLk9j0yn77Dj2nt5ROd
 YLNgOk8EpAKYny4UmCMfOHMnl8/GE7xGXjbX1wCCb3GPdXN8vBItGl7IEhJ55R6Y89hr
 x+TzIobs9aqSvxkajcRKG5xlzGAz8KkzE2DM/+enN92+yVvkQ8f+9USGs64umymL8bkp
 uyZDGcl2c5QRzv8qLgeJXXkSGlkucv/wLIpXhe7f7Qrv8S0eAKK8X/Ds5vBtz7L+8gWC
 4FbQ==
X-Gm-Message-State: AOJu0Yw/6kN3yzYtOp+YnWLSIx4iZ56XRmWGvwhtm9275GVzU1ROsCbj
 62II356CzRGEhcodIMxq1ziQMSoOd6b9QmyWuufNh8EKV1r+AgzYVI5cORQrpjTrIn0oZts8HL0
 RLgQ=
X-Google-Smtp-Source: AGHT+IGTR4boBd3FtyLLgFP8euk3ik97caMnzAFqJJAGiOlP5gzfT9Sjcu8ScS5NB8FjBQL6g7q5Dw==
X-Received: by 2002:a05:6512:318d:b0:533:4652:9848 with SMTP id
 2adb3069b0e04-53546b4b20emr4231491e87.32.1725172598520; 
 Sat, 31 Aug 2024 23:36:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f055sm401702466b.67.2024.08.31.23.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 23:36:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 08:36:34 +0200
Message-ID: <20240901063634.3504315-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
References: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725172599; x=1725777399;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JR8kumruQYcM7mOy9qIuMUgfRi8SatHn5MXEL61Ruc=;
 b=CWgKIlOGGJ58d7cZjBinddI7utKDAgWfuL8Nk1m5KMkG+8ucseX+7RL9HQizTwDsL9
 uOzEKRZpJe7HSIUrK2R0ES5IZk2W8KJqRqwZVXaKj5pDpKSsbWx0YEfxUwktblizYVv9
 1xGYjkRwFSuIHx1c9h6uKJxdXqPBJQWh01btI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CWgKIlOG
Subject: [Buildroot] [PATCH v3 2/2] DEVELOPERS: add Dario Binacchi for babeld
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
no changes since v2

Added in v2

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b590f0ec20c..33d4c119531f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -790,6 +790,7 @@ F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	package/babeld/
 F:	package/sscep/
 F:	package/uuu/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
