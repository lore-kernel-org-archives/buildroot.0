Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F04EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 06:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F7940103;
	Fri, 28 Jul 2023 06:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F7940103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1wCVLn9XzXrv; Fri, 28 Jul 2023 06:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD924097C;
	Fri, 28 Jul 2023 06:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD924097C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E65461BF836
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC8254097C
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8254097C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vc93i8blFcy for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 06:35:59 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9368940103
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 06:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9368940103
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-55b1238a013so1282973a12.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 23:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526159; x=1691130959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmqfypdjnbnCLUtua2vkj/bm+MYJLU1Beh+D/ATFps0=;
 b=OyHSaEsgQdGu8J1BP6dn4vl0PMUCzbGxo1Aa1xTLedJwsH/7pRGbeDTbd66u1Oq+1q
 PruI2wZfe7JlzXwmcq3QuUOUGCGWs/xEJtE7zxJoEQXi3FMKSWm0ASeE3ZjHXWFft/XA
 HxycuJo9cCEBqEy01lufMO8F2nMgc3e5y+v8z9Gl17G+miuaq2FhJxM8dD7NO++MRSrJ
 BvVEpsy7YEDQQCui4iMSocBjVppMDJSuCfZJGZQIVDKnl3RLFsCqhfUVlprdbk5Tjbvs
 aCfivbyffRw/Z4PjUVytAv4uCpQR/+zK5nhasTy+6Gm4qEW+xDEi+QKZEaZ8dtPcCJf7
 uh3g==
X-Gm-Message-State: ABy/qLbs2By2kvG2sKmHW9dEPO/sdToZqyXKwrMlb+rp5pVzi2OGot3w
 b4DOPV/IwXGvHabXRvkNGFlQUggTk9Bmg7X90mwSCqAywfpGUA==
X-Google-Smtp-Source: APBJJlHNlsWoc3CXHCddO26nRcYW9coXdQ/nbIdkHJp61F7GGt2wmoFYXPo7++THrxtSg47PkbG6ig==
X-Received: by 2002:a17:90a:5d0c:b0:263:6e10:7cdd with SMTP id
 s12-20020a17090a5d0c00b002636e107cddmr939255pji.38.1690526158823; 
 Thu, 27 Jul 2023 23:35:58 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 12-20020a17090a198c00b002640b7073cfsm3932025pji.14.2023.07.27.23.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:35:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:35:54 -0700
Message-ID: <20230728063555.1217420-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690526159; x=1691130959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bmqfypdjnbnCLUtua2vkj/bm+MYJLU1Beh+D/ATFps0=;
 b=B+3T6LPUKIWdR7KgWGNKX390Orv2/c7lk7z4f4mxhM1QJUtPGoZYDKdBxJfA2/72Lz
 SZOQ6QShJ8YgNFSvw5aONr1vQmbSKJmyrjgCpzcaaR75AiB1pMcFHCfMVCQnNOl3TiXQ
 +0K1rugyRzNdedNxt3oKalNnuuLLoUE2vqdtMo5m19GlROdjz/stkB1BcnT67bCdhSSh
 3ydofqfUzlSHfKMWJQ6pmkv6OP6k0k4TUZrdsE1S2HgSxIzG8vMFXrZsZctRBTGpRY2G
 3kn2/7jmBsPA5RtasfdCSRCmLJhiv4SkAro6eYZRBlanCl8M16de2Sw/OqzaqqFwRcN7
 WmlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=B+3T6LPU
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
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
