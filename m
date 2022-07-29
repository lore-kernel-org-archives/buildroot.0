Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E69C00140
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D31E04035D;
	Fri, 29 Jul 2022 00:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D31E04035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VL7pJCf8G6XP; Fri, 29 Jul 2022 00:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E0D40117;
	Fri, 29 Jul 2022 00:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E0D40117
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B03471BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8976F4179F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8976F4179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfB0mwQDcHW6 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6695D4179E
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6695D4179E
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:24 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id bh13so2766009pgb.4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mvPdubuaZaEDfyjW6I7tkF6QN+bmid0+b7n2FugUy7g=;
 b=IFRAWuBg1ka3muK9ITu5P9Dr5ltiYssRx7Q3WbS8qcGx688hyLh1pxL6/sNdfavFov
 dRSX4LHOEYffHv0WbDj9eG1waaq5XtQTL/64dCfhDiHNgnUxJyvC6Bi66cQmCJydc5TA
 UiKtTpJ68aia9tLluLnw8r/FP3uFGCzAxVswCtO/OE3G1qwNBC7XwUbR5E7twr7nxlWB
 m58vBzJy9mJY3S8rJEdvcLopZPeP3rYRQ8HsI2HprzBGB5Y02EDjQyEQ+1J+i53O8pDu
 dizkJFg/gh1/6kj+adHFTRFqq6sgnjjBNG9Bvp0Hh6kyZdCiMJO1uzT0bL9I80N+1NBn
 3Dsg==
X-Gm-Message-State: AJIora87qOuglX3tO2chItjnjpnKLtkMZuHPqXM7TjcqEwKhPIMQ2Gsx
 FsE6jbWKH1NzGTd7XChcqNFVKn81i20=
X-Google-Smtp-Source: AGRyM1tPpLavtkKkwxLUvz5KR9TinYAK7iqHupOxbSDGPpPL/UKAq2zcfMDdbky6hbjHnl0sz3Cpcg==
X-Received: by 2002:a65:5b03:0:b0:415:933:d50b with SMTP id
 y3-20020a655b03000000b004150933d50bmr899862pgq.13.1659053363208; 
 Thu, 28 Jul 2022 17:09:23 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:38:56 +0930
Message-Id: <20220729000904.1295295-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mvPdubuaZaEDfyjW6I7tkF6QN+bmid0+b7n2FugUy7g=;
 b=FSYq3xaNF/cAsgkam+AJ/I4PZCFuvJOHpn4Eit/k8oxfMZpvMvZE8/1amBSeg3HHbj
 1tbb51QGXvt3d+f/6XCrVQJpjMunSf4ZxuT0L8654d7ZCgqYClsOJ+wQB1YDNqDzm++6
 yjD+AVPMJW93LA9pAGxQfj84kUo1PWite56Xu4CnFBOztnw3ugRm3kpokx4X7UpCSdbs
 IPtQChdMq6BbqPAWD4duBZsb8XVUcFZeOcMzzdjCvNaCKEWxm8SVtmeaNCsq4gqcn7Be
 6zQnSHS2xUQ04OUxIqN7s6l832SPWf8PDak2R+OWMfXBn8kTpGVkk3lWNcPXpI9NI86T
 R71g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FSYq3xaN
Subject: [Buildroot] [PATCH 1/9] arch/powerpc: Hide SPE ABI behind CPU type
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

The target ABI option for PowerPC is for selecting the SPE ABI, not the
ELF ABI that users may expect.

Hide it when there is no option available to make it clearer when
browsing menuconfig.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index c48edd3bb40c..ef0e85fec680 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -143,6 +143,7 @@ config BR2_powerpc_power8
 	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
 
+if BR2_POWERPC_CPU_HAS_SPE
 choice
 	prompt "Target ABI"
 	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
@@ -157,6 +158,7 @@ config BR2_powerpc_SPE
 	bool "SPE"
 	depends on BR2_POWERPC_CPU_HAS_SPE
 endchoice
+endif
 
 config BR2_POWERPC_SOFT_FLOAT
 	bool "Use soft-float"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
