Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F4EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 23:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E2874049D;
	Thu, 20 Jul 2023 23:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E2874049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPS7vz5QoJRr; Thu, 20 Jul 2023 23:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E408740A71;
	Thu, 20 Jul 2023 23:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E408740A71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 596F71BF39A
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33906405C2
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33906405C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfKFaLXwGxkt for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 23:36:53 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A657D40519
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 23:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A657D40519
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b852785a65so9898385ad.0
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 16:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689896213; x=1690501013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfPNeUKJkdT9PSFp0+FVX36hlaRuIEN5qvdnmurZDsg=;
 b=dgQ0TZZWtqAl2PB0a5BHaRZEv2O7Vbpkt3fDBljfWgwdb+9nVPm8n1r4noRWb0GIKK
 Nfhcl0rOKUUTH2vDAw2u/w5uZtP5Z9JfcdWug1g6FsZCccnTgeQVMvp7iDv18AG2ZqP9
 SNBj3MAVZJp905N6zx2McgSKV+h5dgXLrc2rysopgir6s3OhzRSSDP+OXGFfT1JDyJkM
 RQmL50/gf/TG/A4ctoi8o6fwO/puDfLGgV9zsohtYrAJryQ4mjKAdr8FEJZO3o7U0Llp
 KED0l8X2VkoR5ZYK6Lu0IEMlob4T8UEgma/oQiUMmnpwmJy37l8gh68cA0VRUf1f6TDo
 EgLw==
X-Gm-Message-State: ABy/qLbTeqingF35McPUYp6e6w8TkoCk/TujHAF9AqXzgpF/Lr7VNP/8
 AiEIGWPX5SjB4dzUeA2SnlAq6VyxfV5UGkULiF15fA==
X-Google-Smtp-Source: APBJJlEgkNTLqHWzJ3WmQuVTWpeab1v8xGu4d1jYaSyRy/34dKj1Zq4umksUceEcZXu9WhmsweB2VQ==
X-Received: by 2002:a17:902:db11:b0:1b8:ad90:7af8 with SMTP id
 m17-20020a170902db1100b001b8ad907af8mr1125016plx.17.1689896212772; 
 Thu, 20 Jul 2023 16:36:52 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([2601:603:217f:25e0::99d])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170902cec300b001b89b7e208fsm1981790plg.88.2023.07.20.16.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 16:36:52 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 16:36:27 -0700
Message-ID: <20230720233629.1642220-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689896213; x=1690501013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfPNeUKJkdT9PSFp0+FVX36hlaRuIEN5qvdnmurZDsg=;
 b=WRBDYmVFk1wJa5/WV44AmsDOa6GhW82JS/hvVdpnIOXPtIzGSq+o5YXoz6ytY1iWaI
 WWEu742O2HXeVfoJqagz3WPxWOQYFfLZ5VLQoZ+npmwtIklM52rTuWt4nqs3Mkw3EPK4
 +Epo0gsC5X2sZIOyDZlLi5HlYhHyafOdN5CiQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WRBDYmVF
Subject: [Buildroot] [PATCH vRFC 1/3] package/python-httplib2: add host
 variant
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for host-depot-tools

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
