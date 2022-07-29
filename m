Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622F6C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE6B83DFC;
	Fri, 29 Jul 2022 00:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE6B83DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2U2LqOeryai; Fri, 29 Jul 2022 00:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A24E82B8C;
	Fri, 29 Jul 2022 00:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A24E82B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 005771BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEFD940B05
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEFD940B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evuHeQi2Wm6Y for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ED44400DB
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ED44400DB
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:50 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 72so2796614pge.0
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V1lh0WdFxH1aFzo+scrpuR2Ao9m2Fwc2wXTwET/NCzU=;
 b=T+3jNr5M5nlg8bi+WjemY/z84QVW/CtZycBk5Y+JRNjanySglKmY3+oMGp7ttcJi0e
 NRcTjPH6N+5xfQYQQ19PxbDRQbLC3nqTe5GbfGYncuYIuuXQFXIJM9jad7/LExKsASQo
 bN3JOK1qZM0IrPXy8tF/HFCkE+CVpjvxA99xxj6vTpRcZ9rf2neUosrO5HMoblveKNCe
 maTEGuuONlKl1or4/NO5Zr0VyxO58VIEgGQWYsDWyeN3qfHIftbCI511aRG7/nlhf/ZU
 a7MvYJQX9gt16+VbJ16SwsIdRyx0hYejO7/FjR3C+/Un6KIPIQnp5m7x31wRI1zBjLwy
 tHVg==
X-Gm-Message-State: AJIora+M49qXLZMwwpYXurHOOiQqlmEz6y8ICMw8JNpITuZE1wGjGkf/
 RFpBfkyULcIb/nsrFrDvCO2z1CjNX3s=
X-Google-Smtp-Source: AGRyM1usu71AIBfiLFPlZcRAz6ZQqBDyYPXI255+pXLbyX73QhXJTulQp1M/HDZeux5O5YwP1GFx6w==
X-Received: by 2002:a05:6a00:bcb:b0:52b:34e3:c043 with SMTP id
 x11-20020a056a000bcb00b0052b34e3c043mr935420pfu.64.1659053389138; 
 Thu, 28 Jul 2022 17:09:49 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:39:03 +0930
Message-Id: <20220729000904.1295295-9-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1lh0WdFxH1aFzo+scrpuR2Ao9m2Fwc2wXTwET/NCzU=;
 b=cNMsE2it7sg9aCIHVRga2tBQKc2A2ME7ibGNbWb5CZTVZndbHkzBq1WKl5ibKt+l23
 b3Zg/SkxY5G3wFiTZXPtghLbv/9bJtxXPRChueQub7g8iwraAD4OlcfBMOZ85VzTnidC
 KeDfRXbF4WgBKAPIlDA/76RXt1Hd5wrAm0M4UfrYaWJdMo1OX1NsCpB36vtXW32nR3HI
 6xteGwcCVU+TROIRzZMZR3Y3ufsfjzgHgQKF1za4xu2ovzecHb2o1amSjDVUOCbmpt/Z
 P0eqbNvasGZXUJaCQUYovD3PJSaNus+s9aYe+pStuvaVV5Kx5DLQLMHJe9x1ie5lEn+u
 gWbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cNMsE2it
Subject: [Buildroot] [PATCH 8/9] package/zlib-ng: Revert Power8 special
 casing
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With "arch/powerpc: Enable powerpc64le only on CPUs that support it"
buildroot will no longer build a toolchain that breaks feature
detection.

Remove the special casing so the build system can do feature detection.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/zlib-ng/zlib-ng.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 938acd4181a6..fb497b8c11d0 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -23,10 +23,4 @@ ifeq ($(BR2_arm),y)
 ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
 endif
 
-ifeq ($(BR2_powerpc_power8),y)
-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
-else
-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
-endif
-
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
