Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9079EC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 13:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21F6B402E8;
	Sun, 30 Oct 2022 13:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F6B402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9F_A8hVT6sH; Sun, 30 Oct 2022 13:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4274A40399;
	Sun, 30 Oct 2022 13:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4274A40399
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3479E1BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19CA160806
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19CA160806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWXbKT5HwtWh for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 13:17:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A28B6058D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A28B6058D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:17:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so9267586wme.5
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 06:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CzGGcm5R8CPaQrggT/xGamvxN2QssWTIipVugi5LyZ8=;
 b=Oy1y8foqQmw53k8ewZNMjMP120Y1hHy9sPClemidg7LWpKW5b3MdrL9kgf9SvVKVxQ
 J/q7An6iCsU5GoHC2qhM/0SEeakVzItEwdBfbVsY4X3e1PYdBGTUU5UE1vrxrpDuwFUd
 CMS0SnUKCJAfzMoUDrF7rie5DnjqLedLG7Pb4JS4JEaKHo2ZJhBUuZ9moxpguBER9CBV
 88MLQ08yaODn60YuVwq/+0EF/wIdzyws7FnznQKM9/rW3YqHxs1VKHiMTxW8DdH1EDfb
 Yhr3ZZCsJpNsK5yijmN8rZHc40BZEHE3VsH2PJ8jZ0G+Ar+l7Ripbw3SxCt34tNICvwE
 RJXg==
X-Gm-Message-State: ACrzQf0mLykdipF5EoWSjaKURezCRGp3OrkpzXjiMonGyI21YEunnvly
 dJUPh+ix0tl4GOx9bFS5E3kXz/9LSGA=
X-Google-Smtp-Source: AMsMyM5EPFHAm4k/nDb2JkG+jMJR3DI8E+GZ2FEDWG/zij/skGhTJg3ewxBTD+xRbMzGWAo/Z7tYqg==
X-Received: by 2002:a05:600c:198a:b0:3c6:f6b4:68d5 with SMTP id
 t10-20020a05600c198a00b003c6f6b468d5mr4837858wmq.14.1667135875506; 
 Sun, 30 Oct 2022 06:17:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i7-20020adffdc7000000b002366c3eefccsm4174557wrs.109.2022.10.30.06.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 06:17:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 14:17:18 +0100
Message-Id: <20221030131718.422677-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CzGGcm5R8CPaQrggT/xGamvxN2QssWTIipVugi5LyZ8=;
 b=kaE783eNN66BntiXsVDkVsoODZlzjW59Nnwve0NHtxyhJTJ2Wjn/0JWLAF70dKcJEE
 8Aq5zmzxXzlR5Av53nUx8SIPGCRWGpIuSbEs1bUlv686xNrwaUvIUfLOXzKxWraiw5hq
 xSnFUqQTGWMlp2pfglMRow6P9/8gLfzVu33gKg88oDsDjuyhkLewjYC5YvyMWY78ZCcZ
 k6Z8Nxl96XWvGukyrdvRBFoDq0IEJ7HgPG+9od6ZwMF530RnAbJpVyBQu3korg18DomQ
 DDmgbin5whOeK4kDkgDUviQfqZzXq5zLGgF7h7tUzbMMltxHYIfOvYr5DSzZ9Dq6y1ja
 IDIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kaE783eN
Subject: [Buildroot] [PATCH 1/1] package/mongoose: bump to version 7.8
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license file (date and URL updated with
https://github.com/cesanta/mongoose/commit/aaf55b6da0d4687cf6aae40011d38d0485bf8b34
https://github.com/cesanta/mongoose/commit/f8c84ca6722dbc47027af309ba64eaac34c7cfe9)

https://github.com/cesanta/mongoose/releases/tag/7.8
https://github.com/cesanta/mongoose/releases/tag/7.7
https://github.com/cesanta/mongoose/releases/tag/7.6
https://github.com/cesanta/mongoose/releases/tag/7.5
https://github.com/cesanta/mongoose/releases/tag/7.4
https://github.com/cesanta/mongoose/releases/tag/7.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 809f160cf0..ffef9f446c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8c5024a4e5b5a0c7fdae3c24ebc68e2b3ccfaba08cf25c2e76fc7f14f92fd4a5  mongoose-7.2.tar.gz
-sha256  9553d057f2ba980642f2c18d87ed38896cff1c9612d77d684a73a11fe1443b05  LICENSE
+sha256  55073dcd427ab9475731ad855e417884f4fbfb24b7d5694f6cabadbee1329f16  mongoose-7.8.tar.gz
+sha256  b41c293820074278291813af9f181918154875c94d744a90bf4eec331be28ac5  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 2c5df1d0cc..8d06ed4689 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.2
+MONGOOSE_VERSION = 7.8
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
