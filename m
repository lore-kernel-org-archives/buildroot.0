Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167AC47088
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71144028A;
	Sun, 27 Nov 2022 13:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C71144028A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IQKGpxIDaZH; Sun, 27 Nov 2022 13:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E72684022E;
	Sun, 27 Nov 2022 13:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E72684022E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0B281BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F87400B8
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9F87400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCQYxN2phaZk for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8A2400D0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B8A2400D0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:09:09 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso10250708fac.0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:09:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hatOqevhADjMPoJFfBO82aoeqRqk4G7aj8w0TlB9M7g=;
 b=bg28uZA6A/2beluZnU6GKbXEcr1f+2/oppGJLM8HhwKPz8hCVLZQy0PnJ9nRDm7VeZ
 DKzfMe6MhfX0CYHODhTbvRDEt/Wt/Ia9aIMtEYlWqE9IaGzHelXbwxp6oen0VOS5bd8L
 bW2dpbxQ0GSrpZZR5upAl1zY0Ht0ALUS0EsQyxP8QFCcxG37N4JP1c0iXSzVZKoCU01R
 R7kO2zHbgcXVcvqyJkRJjijnFja3kIx+7E5I5gug2HySvjiJs/ZOd3nFQWcctZUk4H5G
 1DGdypOtMOXTBgVHhh2ZAOVgpmiUbojPvYMlEL/4QPrEl7Vmc3vdgbahttFGjnHkcXOg
 sdwQ==
X-Gm-Message-State: ANoB5pkGRhhGsDmiMgFn8aPOIu680BRm5MuistX8IQFun2Hre+xI58Fo
 GaufK148APA6a7U0OqSJcnOw04BYLrg=
X-Google-Smtp-Source: AA0mqf6RShA2jJq7Az3UCcTeE3OlfVx1xIYKDXAv5I0sXW5iZdEXJXvF0QtJJVwPTI4aX1W1IJbFDg==
X-Received: by 2002:a05:6870:23a4:b0:13b:fc40:604 with SMTP id
 e36-20020a05687023a400b0013bfc400604mr25848872oap.120.1669554549120; 
 Sun, 27 Nov 2022 05:09:09 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:09:07 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:38 -0300
Message-Id: <20221127130739.1862398-25-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hatOqevhADjMPoJFfBO82aoeqRqk4G7aj8w0TlB9M7g=;
 b=m1bRKpkSq+WtvLks3H9AL8d32/9OBD56KYEZ/sx0gxnrAhe/utFmnFTVkuNXoa/LaN
 toaDLW839HzwkWyMQccHflofUF0ZfRnZjt4G04rDhGLWwCiCeSBllYXVV5P2NMjdfiF1
 QSI95tyy92DbsMd0TEiFuUXdlCZr1M5AQH07+F68ABgcSWHHAaTlnjt+NnWPPoCN5bmJ
 UOsUS1o+UIMYcdTKYscW9sH46CsT7esAOv9M3tKY9GVD1sURfBw7GXwR2AE0AootUaSf
 AlLwgAA3RddHMD5047rIkbsKbrT3khfXQS2CJtWxxBtYzJuvtG2QYmODrYYWVADJI7ZI
 sezA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m1bRKpkS
Subject: [Buildroot] [next 24/25] package/rpi-userland: fix typo for
 BR2_aarch64
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "59adb53c4c package/rpi-userland: add support for aarch64"
introduced a typo in the condition that shows a comment in menuconfig.

Fix the typo: BR2_arch64 -> BR2_aarch64

Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Cc: Tim Gover <tim.gover@raspberrypi.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/rpi-userland/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index cfb472808b..4219bdb9c4 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm || BR2_arch64
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
