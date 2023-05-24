Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89CBC7EE23
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 12:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FB861193;
	Wed, 24 May 2023 12:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FB861193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJMw97xuEql1; Wed, 24 May 2023 12:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C8761120;
	Wed, 24 May 2023 12:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C8761120
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1715A1BF354
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 12:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E14AE42129
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 12:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E14AE42129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id keGRz_sVCQOe for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 12:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B473B42065
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B473B42065
 for <buildroot@buildroot.org>; Wed, 24 May 2023 12:26:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f607059b4eso7998315e9.0
 for <buildroot@buildroot.org>; Wed, 24 May 2023 05:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684931181; x=1687523181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8C42v8LlKnZn8mu1gY+iUqdmTJfJjbUFXYSXbl5+dOA=;
 b=jtLCyGSMBh28GdxO5YQ5UE0lD/etSHUWFc3YEnKV6yzp+E3eVKQrCzvzzQUpT+Na/B
 HaOmpFlLMlO1/tdN8pZBbPgujNRkFw+JjE3Y3eZJdDSB+mwlIoSTB7NKKCFa94ne6PT1
 wgZkWaIBDeiOhWo8Utd0GzKDMXEhi1OXCTGh/cjqCDOLO2OEPUUalDYG1Fx746CqAdKX
 riWLy6EDCwCqbgfSwJ2yKygXVeAipTUU7olDgV1FMc7dIXKfm74M1Y9Dy+IX+ZTEJuac
 YrNtY0FwOwNreclBNhECcY4p1hGibJcfSNLx4lgi/1DJgWdO+FYimB1KeuWKK3MweZP9
 +NBw==
X-Gm-Message-State: AC+VfDzM2Ca8ff5MsYmT3T9o4biYp0lOaCHSr2Zzw6wKv5iOnkrxFcrx
 15XjOEvttDkSPcx4Oe63PF7SduynVsZGMkUe
X-Google-Smtp-Source: ACHHUZ7vtS6y1tp9FMCgFdFgQJqCW4p94i5q8mWNuOD76PrM5Bn9yIDwrlRUN8MlUkHJfUT0VevB2Q==
X-Received: by 2002:a7b:cb83:0:b0:3f6:5166:6da4 with SMTP id
 m3-20020a7bcb83000000b003f651666da4mr754251wmi.31.1684931181498; 
 Wed, 24 May 2023 05:26:21 -0700 (PDT)
Received: from localhost.localdomain ([78.40.121.76])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a7bc7ca000000b003f602e2b653sm2171409wmk.28.2023.05.24.05.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 05:26:21 -0700 (PDT)
From: itzwam <itz.wam@gmail.com>
X-Google-Original-From: itzwam <root@ig1-kittensrv-01.local>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 14:17:53 +0200
Message-Id: <20230524121752.4164330-1-root@ig1-kittensrv-01.local>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684931181; x=1687523181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8C42v8LlKnZn8mu1gY+iUqdmTJfJjbUFXYSXbl5+dOA=;
 b=PvoKSJqW5Y3+Oo4Y5G6wWrthtXwlR5L5p35tl4YpOp642LV9PhPb4onTSMMEJkM9lV
 aeM5o1J53PS+GZELypqJ4VuvEKNdgVbgmK3P8pbniHwNA802GQBrjco26PvoHuFDyGnT
 gzy/MhkNqrm+lgT3zAi6k5GBHF4gvB9ZywM6jkurvhLZXlivoysrtqioeJntC/Nf1STF
 J+IFR7weE/skG3xYRO2KVm3Z1FNN08fPq6XvJ3+tZFLsG8NFL0kADQzhG5TQH+psFwFM
 UKQZjCDmkgYZyAMSVakKq4rlpf2S7IK+7ulVpfNNWW3vNaMVN5dyqLyX5lKkFNwrzPGt
 8uuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PvoKSJqW
Subject: [Buildroot] [PATCH] package/bird: bump to version 2.0.12
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
Cc: itzwam <itz.wam@gmail.com>,
 =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: itzwam <itz.wam@gmail.com>

---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 3e00a1993d..a62fbba630 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  60a7b83b67b9d089d2a745a11fddd12461f631abc7b645b6c085adf90b3f55d6  bird-2.0.11.tar.gz
+sha256  3ec462a237d06d1f4455d6ec00a42f0b1686061fc988e5c89a841d01dd753b53  bird-2.0.12.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 1295358fb9..f1b2ee6c5e 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.11
+BIRD_VERSION = 2.0.12
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
