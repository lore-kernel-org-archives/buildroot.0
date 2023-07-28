Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D6BEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 06:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC97542C63;
	Fri, 28 Jul 2023 06:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC97542C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceHXr9HQTUre; Fri, 28 Jul 2023 06:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 090554097C;
	Fri, 28 Jul 2023 06:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090554097C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFE071BF836
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5F3960E19
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5F3960E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eorB4uXaGmbh for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 06:41:32 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB99560DC2
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 06:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB99560DC2
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b8b2b60731so10073705ad.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 23:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526492; x=1691131292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmqfypdjnbnCLUtua2vkj/bm+MYJLU1Beh+D/ATFps0=;
 b=Aj0rttHLkGe0yK2HJWEz10FaBEJ4l4gD6UgviHyIMyQua52KFF4+PZBqCHhc400Eia
 m9ise8IFJPaKxEAPidYVcBAvFLtj3EXWHit6IHDM0kr9e7J30yN4uXemPaJl/5cMTm8K
 Zanf4tWcP22A4+WzlVq2QONC0UG3FzhjNk5r346pLyoVGQrovO2H+yEvpQRih0YInSDO
 fq0MIfimlOlWOfRg+SsARAqYcfk19C5ZghPpcxza0JOl8k+4EEhB5S8ep+3dJ3rkZJx1
 9eXISYYDplOB2C9GaXbySexyNxX/Y2o58FMvLRpEd0P1EYG3/9DdFdx0sTrifnG78M+Q
 ZY+g==
X-Gm-Message-State: ABy/qLYVHllCbhVhgo1XvjYu6ATL/8EOvyBtCNwxC95cMo8USS0f22RL
 V0j493xacjT32aJqYJmV32dqY8O03T5CV3AW2fikcD3GH7SzSw==
X-Google-Smtp-Source: APBJJlHb/PFFjkFduNhUfkUo/yw615kDlplth7OfW/1EfCkaMwEn+o2VyoeDVMFxDa9kM8AA/9Chjg==
X-Received: by 2002:a17:903:1246:b0:1bb:a367:a70 with SMTP id
 u6-20020a170903124600b001bba3670a70mr702671plh.17.1690526491814; 
 Thu, 27 Jul 2023 23:41:31 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001b50cbc0b4fsm2767428plb.111.2023.07.27.23.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:41:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:41:22 -0700
Message-ID: <20230728064123.1220713-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690526492; x=1691131292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bmqfypdjnbnCLUtua2vkj/bm+MYJLU1Beh+D/ATFps0=;
 b=fQ0ssh1YDrPaae+vjYwCQSu073o38tzD9wkPwTwsZiQ1va2RVYcAoK+G7sq0LXX6SJ
 jEeoIHrG32Aq5fM/oc9rmnrDiR0+9xZbTJJRVTLZckUn0zKf3lZT94vmOIzKWeQWgLsL
 cp03wy6Mv+L98dtlziKe+h1zEU09316tdQA9/HwP/2P9Zp0As4xZkuHgxw/UhEIz7vTh
 ywZB2At6S2pdjqWK5Us7/h4kyGGr2sCixJnmE8utJQrhujCdbRpAzIFKRC/MF3zXLjz2
 6r/iRbOwny5X9cs02gQbRXhxpYwI7NVjREN2em+w1i0pU+7o8uhCil2CMapy6y4aOZg7
 aIGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=fQ0ssh1Y
Subject: [Buildroot] [PATCH v2 1/2] package/docker-engine: bump version to
 v24.0.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes & enhancements.

One major bug fix included in this release: The Go client now avoids using UNIX
socket paths in the HTTP Host: header, in order to be compatible with changes
introduced in go1.20.6.

Previously docker commands would fail with "invalid Host header."

This supersedes two other patches to back-port this fix to Buildroot:

https://patchwork.ozlabs.org/project/buildroot/patch/20230717041047.1510851-1-christian@aperture.us/
https://patchwork.ozlabs.org/project/buildroot/patch/20230717041047.1510851-2-christian@aperture.us/

https://github.com/moby/moby/releases/tag/v24.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 3f1b9bd459..061999464e 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84f6196fc58ae263376a4ce25b5136d567a93aa82e723504a29f0415bd1fa4f4  docker-engine-24.0.4.tar.gz
+sha256  837d7d667fb64508bf6e53cb5915b4b5ef356599294ffdd5ca8678168230cb38  docker-engine-24.0.5.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7c19e0dc52..22cd2c58ed 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 24.0.4
+DOCKER_ENGINE_VERSION = 24.0.5
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
