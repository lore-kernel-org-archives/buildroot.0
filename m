Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7564DC54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 06:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C646A81A47;
	Sun,  1 Sep 2024 06:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRCRrn7xHAHQ; Sun,  1 Sep 2024 06:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DDD8134F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54DDD8134F;
	Sun,  1 Sep 2024 06:45:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBED71BF5A9
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8FA64022E
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TRGnalNqtEm for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 06:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD2BB400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD2BB400AC
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD2BB400AC
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 06:45:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53351642021so3393130e87.3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 23:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725173140; x=1725777940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l5Rl0Q0YDLp9M/wdvB5x3zejsdDba8hxbDJhvbrzjU=;
 b=O2zp8yvfIZ5a5D9u46OZW1ohMYU6LKctM0Dn9ueUdG8EcBDvjt1YY/BFcPn2VwmuR0
 3UMQMnPPaLpRlitlxQxcg9mLbLw3HV0Xm3esbVP/oz7qWz+vaz6IDAJFqa5nlr4q3wgH
 igwYZ6hrGi2CT4wJevjgyfM1zmfH46pMr1dyBap9aGQ/P4VUNKM28AdQtF+CJ2/gL0dH
 xh0C8S5+4HIiFlf8dYvR9BResME8C/MEc/aoqnf4ck6R6RNMpTvzmMTUozIOX1pCv+44
 wnuBe9oj+N6JmF4gyDJc/4TPuo1K9z2IiZKJeYE83chAjrWZv3wnvqJ6glmmgpxEkJcb
 nwJg==
X-Gm-Message-State: AOJu0Yw6YYx+CybntFW7ZPIFhwFO0gI7PamfMOka3putwLfau3nlsfz4
 qSF1jvfUPleh/Kn1wNJIzpvE58+GHlNP76MW9ARZ1BaAvfOw1+EpM+LQiAEg3E8Yycu7hSU6G/v
 cu3Q=
X-Google-Smtp-Source: AGHT+IGOPo+Sj7VJ3bGIR0UfS6qWgiVHeiRp8OfOInbQQ94vhq6ya5BxfkSJLpCetlNnSC1o6ybcSw==
X-Received: by 2002:a05:6512:1091:b0:52b:c1cc:51f1 with SMTP id
 2adb3069b0e04-53546b2597emr4553539e87.23.1725173140236; 
 Sat, 31 Aug 2024 23:45:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb32asm402254066b.23.2024.08.31.23.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 23:45:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 08:45:09 +0200
Message-ID: <20240901064509.3505801-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
References: <20240901064509.3505801-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725173140; x=1725777940;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l5Rl0Q0YDLp9M/wdvB5x3zejsdDba8hxbDJhvbrzjU=;
 b=nfuJGMMtUK+xLgXuOsr40M2/zHDDMY4brsJxhwLjEA1UEnb/laxtScJAaLB6R5wXe2
 YDWCgfpowOvrRtEhitvf5SQAzyGZnL6//zUqYxiqax8qJLSY/7UJkdggEBENxza0oJ6v
 UQBKNKvhIKbmE4zX6vbS/5pXN3nm4vdMXnSB8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nfuJGMMt
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: add Dario Binacchi for
 armadillo
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Added in v2

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b590f0ec20c..bd4df63de055 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -790,6 +790,7 @@ F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	package/armadillo/
 F:	package/sscep/
 F:	package/uuu/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
