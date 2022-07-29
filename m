Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C932C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7411417AA;
	Fri, 29 Jul 2022 00:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7411417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQPlDno2phiv; Fri, 29 Jul 2022 00:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99FE04179F;
	Fri, 29 Jul 2022 00:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99FE04179F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE3CB1BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C9240241
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4C9240241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkyoaBjeyhEL for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 528384049B
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 528384049B
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:54 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so6008925pjz.1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Od2r5TYwXDhtlK9fsjzmuBCF0RMegoQ9RMbSRqQ184g=;
 b=8LNVZO/H6UfkcCTzh2IfqDASheKagkOQwUfd7W464EiNb+NdkUXUx0ZYS6CNF+zMlr
 cnxIH8auVPvFAy9TASKDkUb8rx/Ep2YRF+akv5p+KPWWq6v7GEsXITmodURULbHDIaCZ
 lQChvXl3uh7N8LJM/oKUU5yD4/+x1r7lPpELqLb1dNTSIT7vrxgYbtOgDJzcmP927dqb
 /ILJNYk7aGlUdZy5Dwo5uSB47T9EEdWMdkJtGvTaUxLYi5cK0PkaEtATwU9+yHpp6pii
 bCLRIxlrMdepVf/6LwRvFEFKZv/bXjPFE7sqYhIhNLNSP6L8Z3FviceAvnsh1rCeSe4A
 liiA==
X-Gm-Message-State: ACgBeo1KIJRXnPSKQ5/YrN+qCuFIDB06HrLfEk8sCP5oKaYvcpCJo8mv
 Mdc86VyVRP4vP23txL7p/rCVI/Rv26w=
X-Google-Smtp-Source: AA6agR6ckzaO3g7e0plCYoEhtm8z5GFgJGr0pVWslVQsmNknR15Kl+uhHS3AGQkCSKm87R0PWTpUtA==
X-Received: by 2002:a17:903:32ce:b0:16d:4341:1b1b with SMTP id
 i14-20020a17090332ce00b0016d43411b1bmr1228778plr.126.1659053393141; 
 Thu, 28 Jul 2022 17:09:53 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:39:04 +0930
Message-Id: <20220729000904.1295295-10-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Od2r5TYwXDhtlK9fsjzmuBCF0RMegoQ9RMbSRqQ184g=;
 b=Pvhf3aKh8GNLDFMg/0gIIlLM5FzZj3vTaL/3TWD6QeomBKk5CX0+RbKHlvxD9a7KDc
 OipdWdWiMmSyUDp1tkEkIWE2rGhmDFMw1qUFsrhTKSlyrxh8ykMHd+/C3YxfW4zvbclM
 MN3nI+/cGaB3Bc/LlrS8gsfxT7DJzqPY76K+JF5wwZ44CGcUe36V595KXzoOST6USX2E
 KCkc2F/l5+ijsrQnU3QrmqHYjrYEK8R7cSp411Y0UlOYTr8ASNw5KR7Y7/I1eEsRyFR9
 e1SwWlUdbUnxFiVfwZ690l9Usjb/lgweN0G8xF3YFyye3eDF9vR02uI7CYan1e5T1uZn
 gPBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Pvhf3aKh
Subject: [Buildroot] [PATCH 9/9] package/openblas: Add Power9 and Power10
 targets
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

Now that buildroot supports these CPUs set the target type.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/openblas/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 0144e93a3faf..1d403c432e88 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -22,6 +22,8 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "POWER6"       if BR2_powerpc_power6
 	default "POWER7"       if BR2_powerpc_power7
 	default "POWER8"       if BR2_powerpc_power8
+	default "POWER9"       if BR2_powerpc_power9
+	default "POWER10"      if BR2_powerpc_power10
 	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
 	default "PPC970"       if BR2_powerpc_970
 	default "PPC440"       if BR2_powerpc_440
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
