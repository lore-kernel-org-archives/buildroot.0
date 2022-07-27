Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E287BC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BFBD416C0;
	Wed, 27 Jul 2022 22:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFBD416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j92a1c2gScj3; Wed, 27 Jul 2022 22:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAE141690;
	Wed, 27 Jul 2022 22:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BAE141690
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F265A1BF47F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA65282A8F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA65282A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJJ0dMoU1W7t for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:37:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E431782A87
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E431782A87
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:37:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d8so36653wrp.6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hqjVhv3+KTAJ4W70wSA1FqkcbL6JldADBZf01TjwL4=;
 b=PbfVC3PUM7f9jOlvr223InvI7ek6RkhKLUku+nMgcpIJpRJXFpuqwlZK+4QhFvR72S
 vLfwnYcZcgExRvFkNCETkI3K/4OFl1fKOQlbL97plclqa0uKPWcKez5/WHJuMyDWTT8k
 CQlMMXof4gLKDVCSyIs9aZE2JCr2eD5rNewTwmV5lCKrxmfD1ir+nxXau02UkylPQi2M
 IIOFejzD5d43FSC21Zouh52KykIYtSvVtGs0PVnM0gCy3sECgMc6iSM9HGVdqaDjDLS2
 TsIonbhtIX7OkBHm5TwBu6AwZY4WEqSJf0iLX95YZzs1CxqiSb6cSEJMM144XeOytgiT
 2OxA==
X-Gm-Message-State: AJIora8LnHfhfMQFDZI2kXnVgxZTK8J54rymrGdnfwzmOMaa3aNtYiS2
 r1j1sZJFCYNpXq0aAx9ydugMpvHI290=
X-Google-Smtp-Source: AGRyM1uDNifK81wTUegyrnVitk7ZGf3pRhNqB8lcZNLXyXUjCL/NwZIcXY6oDRQFeJ2M1g2yO1+7FA==
X-Received: by 2002:a5d:5a12:0:b0:21e:8327:7e03 with SMTP id
 bq18-20020a5d5a12000000b0021e83277e03mr12347026wrb.567.1658961437901; 
 Wed, 27 Jul 2022 15:37:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c23cc00b003a2c67aa6c0sm4005721wmb.23.2022.07.27.15.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 15:37:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 00:37:14 +0200
Message-Id: <20220727223714.1452262-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hqjVhv3+KTAJ4W70wSA1FqkcbL6JldADBZf01TjwL4=;
 b=E0sXVejHMNxe3YUONaXjsmFrkqICp6b29JKdTqIn+CyV4Y5dOUQ53dMRK33J6GWwum
 wL9G67AEPi5uolks0rVBJLCq273wo44Ecv5Gf9V2safxkLnFPKBdJuw67hNbsfkLjA6U
 6fxZpL3o5R5v6odt04LWqFK/nf/LtUufHFGbuc6lX1qD+lHw78tUPsuCVilBTs43YeEx
 6bMR4aOJpgDqWimk9MNABD2/HitalGDyeEBbDcTJQFqcpkCSm/nCWH4BzuxhV+dHU3Xa
 QPwW81iaUyRA+v9JaVH0hpi6l4ycbPljAwViv+rYXrpl6/CTyjduMn7gQP62Lio2rJiA
 Rlog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E0sXVejH
Subject: [Buildroot] [PATCH 1/1] package/gdal: fix license hash
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

license hash is wrong since the addition of the package in commit
1e64fa2956171cdc9d6e6c8896b4b589ce573513:

ERROR: LICENSE.TXT has wrong sha256 hash:
ERROR: expected: b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c
ERROR: got     : fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Fixes:
 - http://autobuild.buildroot.org/results/e443db6d7ff3ae867035d169853b880b5e13d181

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index 52bb60de35..826a7f0b45 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -3,4 +3,4 @@ md5  4b7981efbeed69c06c79fb65d0a60d83  gdal-3.5.1.tar.xz
 sha256  d12c30a9eacdeaab493c0d1c9f88eb337c9cbb5bb40744c751bdd5a5af166ab6  gdal-3.5.1.tar.xz
 
 # Hashes of license files:
-sha256  b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
+sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
