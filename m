Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E72C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9546C410E1;
	Wed, 27 Jul 2022 13:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9546C410E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fk4Iw4xYwq9N; Wed, 27 Jul 2022 13:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E03B410B8;
	Wed, 27 Jul 2022 13:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E03B410B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9171BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 570E982416
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570E982416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQlZo_RM8NDH for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:26:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 662AB8198D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 662AB8198D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:26:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h8so24147091wrw.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TcxYODyFq10Uvn25/DRlpO2yfEIj4iUqNtmqTsIO5VY=;
 b=iuwJlsTKYDuhJGusWcRKxBIPGlFjaJmBqTVWfbULfmLi/yMhVzhQ4Udrsw22dBAT/H
 GrhI0escQaBYuO3vVgiOMUp4+ksmTziB2WgY0e7IzfDB5EYf2rjvS27M+aIIaTQqdcPa
 XjyfWgL23SClhCEaQDKa2cM9J2rSu8+txJI5p4t6PNHzlbfDxZihaZVhkXMBPejBbpEf
 LMyiudJntaykPPDlQH3hGh8cqU6p2XfJgo+dhkfhMcDW13jisY8XQOy8Hp9pONxP+Yeu
 FonqzC4AV0PwZHfLWZpWLAbWP7R00/V7BB69I7ueKTp1fb6CZBOSPgRjP356rsWwxIlB
 ojbw==
X-Gm-Message-State: AJIora/sUUI13WvPKsJ+Dbl/c32lLMcgIvSqwoH6hq753roch9KoQ9zR
 kbyNlYZxeM8qP+nxXzWZKK9vCzo4a7c=
X-Google-Smtp-Source: AGRyM1vXGEpmHls4S4Tv3T4EQdqOuJ8SMbGCyRzTO0OhYqiZBWGFL7cLzf3xS0fQHuuz7Oo+Foza+Q==
X-Received: by 2002:a05:600c:1d12:b0:3a3:297a:bb13 with SMTP id
 l18-20020a05600c1d1200b003a3297abb13mr3114610wms.136.1658928401430; 
 Wed, 27 Jul 2022 06:26:41 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b003a3080eacb9sm2662863wmq.24.2022.07.27.06.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:26:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:26:30 +0200
Message-Id: <20220727132630.1323856-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
References: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TcxYODyFq10Uvn25/DRlpO2yfEIj4iUqNtmqTsIO5VY=;
 b=Mq1j8mJdItT4/Xi7LzRj2pzebVWciLzFNy0c7k4h+NxOFhLY9cLbunQcespxg7o8j6
 yv28hOrzFC6GSJbFNk7unKfhqDTHprhsesuCTppibJRI2Nf0dxfv4FpRSemCsvsA4VNp
 R7/tydqE9CG+p1VZehXTrgFvA1yyVHPxCIgvRk/ZxVmLamxwOMIQ/zqZtWTmTS8epXlp
 bzXBcIrQo+1zSa50sLHop/YyGHu+dpIvk2g/rH6k6KsfChdGKbQyaqDvDJo7oVVeMI1j
 qiM2AWueP2GmeusTqdY1WmfGXf//fIbdmSk1ok5mRWO/mlyGy2emnKG3DU4K8LbuoMbU
 5Wvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Mq1j8mJd
Subject: [Buildroot] [PATCH 4/4] package/jack2: disable example tools
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable example tools (enabled by default since bump to version 1.9.20
in commit 26ca7fec041836c31f29c5566365fe40eb552bca and
https://github.com/jackaudio/jack2/commit/508d95a97e0cdfad2e8c7d6cdd478741fdba2c87)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 73f723aef0..9e56dcdfd8 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -12,7 +12,7 @@ JACK2_CPE_ID_VENDOR = jackaudio
 JACK2_DEPENDENCIES = alsa-lib
 JACK2_INSTALL_STAGING = YES
 
-JACK2_CONF_OPTS = --alsa
+JACK2_CONF_OPTS = --alsa --example-tools=no
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 JACK2_DEPENDENCIES += libexecinfo
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
