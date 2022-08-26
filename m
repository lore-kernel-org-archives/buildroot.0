Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D4BECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA5583F39;
	Fri, 26 Aug 2022 13:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA5583F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PuTyJ3V83-k; Fri, 26 Aug 2022 13:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6DF83F29;
	Fri, 26 Aug 2022 13:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C6DF83F29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAF71BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5665183EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5665183EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYF4dNyf2nuw for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9124382FA9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9124382FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lx1so3275055ejb.12
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=T2NFDypWFV2wy1Gt3lyqjuwtTLWuJfHxjqhk7VdUZAM=;
 b=fIdgHBX467OGh7P4m1XYKss7GqF9xZFQUeXp2+gMpbpjm8d61lrA5h4ZJYzWuZ94Tv
 44SqyeGxNI530Qyx/bPVOCFzSKViqLV27dlzrtdyNR6AVfhR1YN2bxFawdwbI3lZvpcp
 rRKzyj3f4/QvjGwJRcFWxQ67LUlnJj/sF7RgmdH4PENF7ir3J41SEkX9sDth4Jx6GYLo
 yIlX1WSd8epDqXqWQ5wCb4jGyz9Dbp88nYOS+Wf7V75PGgDusoyCFJdrTwKCGXClCUO4
 euCAmsCJwcW8CWlzsb53m1JPlG+X+amaDz7TG328o/juUaIcrP/Bqw/Xe4d1GuoAH6ca
 WQ5A==
X-Gm-Message-State: ACgBeo1L253exZCNjV3Pe6LfP2X+A/e6ug1iQ7xVIVVt+0cn6rjslJA3
 tO0CxcTP+udpVwRtcLQPyo6nnj2ijgk2tZNi
X-Google-Smtp-Source: AA6agR4L4IQvHVwW7+pLk1+1GkUU8Wu3SH9WlqSchHlygwyJz3DXrk/TSgQdrzcOEdoRNbRSaBWJHg==
X-Received: by 2002:a17:906:30c8:b0:73c:81a9:f8e1 with SMTP id
 b8-20020a17090630c800b0073c81a9f8e1mr5521049ejb.649.1661522116403; 
 Fri, 26 Aug 2022 06:55:16 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:15 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:44 +0200
Message-Id: <20220826135503.20612-11-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=T2NFDypWFV2wy1Gt3lyqjuwtTLWuJfHxjqhk7VdUZAM=;
 b=TTgjCV/zGAbbfmkJ5EzXfig3Nox0FOe2/q3E5BU729NRDSNetxBfw4Hi/nMONDxrNA
 I6ShI5NywRRyCq8moKSt1Sw9tYZMdvDOJemLqhkL9M39T/goV+73k8JgdA4OkPPwfv/l
 Ma/9EWEMmAqRyWHqWSUinatxNicB3QvmB/92Wm5xEv7gQwkQPHSG/5zEOnPv2PjK4jm8
 XjD4sjx/SGFhzCUx+Lp4VCbu9ikqTLnhRD/CR3oNRO7yrBezzupBr1DRH9LnBuH6h1JH
 jWS/tw/z6KgBqsWg2bEtuM4SRtYf3sshFCohGoDspNQLF9aG1MzDxGqPfc2rdrAzVeYB
 lEGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TTgjCV/z
Subject: [Buildroot] [PATCH v4 10/29] package/qt6/qt6base: add qt support
 for zstd when using the package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 31912f9462..21c15607d6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -119,6 +119,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
+QT6BASE_DEPENDENCIES += zstd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
