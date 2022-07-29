Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8056EC00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B3F82456;
	Fri, 29 Jul 2022 00:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B3F82456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQhhuXzA3qJf; Fri, 29 Jul 2022 00:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E9FF83404;
	Fri, 29 Jul 2022 00:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9FF83404
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3471BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2429F83DFC
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2429F83DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ad_owXuqswJZ for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7E7823C0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C7E7823C0
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:35 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id w205so3253274pfc.8
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aCl91KyhsGAdRhltv3RVpaBCGQ6KYj+s8tu/G4uoZ70=;
 b=if68SKyUe2SKlAnRwD3DOgi8B533KuvarR20/TzUm0HVdSjepmkqFdmt3CdREPC3sG
 JnsbYhUzPVIKx8btq92pQd1+ewPQ+OjEoJ7BIJOG4X0986USH+xDY7ORYLcRFet0/iyJ
 x+lIqecbK5CETUTg03k6ZHriV1MY9TMqgK5LOrYd9DjM89Z2YNWegdwUezyZlijJTMWZ
 wZpa8mvpf08kGLsEtvfk5E5nYLwYKbUxdG1xEikYdQR9HJveSrvUCJI2lS9DrAg2OZyV
 n+a14PZp3YxUCCSFpjHCNFndqcdzPI4zRSbD1x13xaf0jqekiltz1iv3Vr0haavewwxX
 FL/Q==
X-Gm-Message-State: AJIora+qkParUbiiV6ebUNmPWRb5ULc+P/OV8k/Pcs4lbV86AOsuo3KL
 21vOUnvgEXrDQ0FKKYcwAIC1y1OEAUo=
X-Google-Smtp-Source: AGRyM1sINzURhpuW/Vo9P1J0JQYQ8oR//frBhySZbyRiPD6uRzN7Bpvu6ShJVQZjdWshgjYF7ipznw==
X-Received: by 2002:a05:6a00:88f:b0:52c:6962:274f with SMTP id
 q15-20020a056a00088f00b0052c6962274fmr976184pfj.12.1659053374430; 
 Thu, 28 Jul 2022 17:09:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:38:59 +0930
Message-Id: <20220729000904.1295295-5-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCl91KyhsGAdRhltv3RVpaBCGQ6KYj+s8tu/G4uoZ70=;
 b=VvnJpFTRaQboq72N6vvAwceif/c64dMPUAP8oAdYl4zK9EmQFumCxXp1OCTBSkxRlh
 lECfHWSrNX7R7zVHINu9dSwX5Uhd2/p9oXEi2od9FBQi7iVQn8X81aBBvkrZqVoYxU2j
 oXNhwpOxFoe4PRB9tevS0iBVFmD/osz1WDIUDKtmlwuyqqDmlL1OwukBx5Irj+m1dbPN
 uMBSmD2lVoACnREGNYgDtTxMggo/SR8SuiSpMw5o+y5NCZdF/yhKQpjwFtcv33XX8DSt
 39ll9yUZOMMaUh3pNWtNgNmkdS/2nQGVlyT4FHYUoLNcDVq/vlu1nOP4/AyVQAeQPklW
 NxLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VvnJpFTR
Subject: [Buildroot] [PATCH 4/9] package/glibc: Use powerpc64le instead of
 power8
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
we can use this symbol to indicate the CPU is supported by glibc.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 23cbfcd9aa4f..e0ce46968278 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_or1k
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
-	default y if BR2_powerpc_power8
+	default y if BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_s390x
 	default y if BR2_sh
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
