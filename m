Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9810AC77B7F
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C0F84110;
	Tue, 16 May 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C0F84110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGvbtVTsCkdQ; Tue, 16 May 2023 20:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6101E84002;
	Tue, 16 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6101E84002
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE271BF21A
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23DC1415DD
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23DC1415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v1SrF6_ESbKp for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 20:59:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E90E415BA
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E90E415BA
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:59:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-24e5d5782edso136126a91.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684270747; x=1686862747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OiDVwlmtp1yLO6tMRl+MBozmS+GbDSHjgiQJcfDDI7c=;
 b=Ylbed16N3t7pY9JSMk30+6Pnc8C5FuK/7iDJdggXN5zJ+8+xsF/C0xNJp0SRjoKAPS
 qBQxLMj93IsYed3VUZElZTZJQErpyID4TKqWI0e8CHAiYgU2PapW2ufnO8Q544APwe64
 su/xnUDPZB3FzVSDRNjhao6OHe3FVJdbA5Kt0g1Ltl/8wnSPHAxNIdZKU+NOLJik+/1Y
 ffbTwxnmv2d0/I2yPnQWxiVBMQn0NphWxSxS/q0VPzTF/1wyvj0p7xEUtxco/O+82ADQ
 PAtqI/HhTuxUAYu6CkQsnVRzwrLAGl9SKzzZi0BZTG8KdTd59FfuIGjtt8PzOaUtUUbY
 /34A==
X-Gm-Message-State: AC+VfDx/L+z36L5sdSy3/sC57hF4VdB28QUFNCFx3tlK1JrQzpjlQbyC
 8ggdd0pY4/ZGEE/8oHCQXTfTiNXmB5YP+PFp0DdHBk57
X-Google-Smtp-Source: ACHHUZ6+VR2trKPbRZHPSVY4fAtvokbXe1O194Ih40fL7ss0FKTQ7OrfGtqe0s5bV6IaJpe5ERFaPQ==
X-Received: by 2002:a17:90a:b317:b0:250:78d0:f797 with SMTP id
 d23-20020a17090ab31700b0025078d0f797mr32130360pjr.41.1684270747268; 
 Tue, 16 May 2023 13:59:07 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o11-20020a170902d4cb00b001a076025715sm15944060plg.117.2023.05.16.13.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 13:59:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 13:59:04 -0700
Message-Id: <20230516205904.895186-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684270747; x=1686862747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiDVwlmtp1yLO6tMRl+MBozmS+GbDSHjgiQJcfDDI7c=;
 b=un6BL+YTgKIJyAB0jDHKnm5x7GjIFG12gGh/DAX62+5N+bQOQPxzcv0cfDm8t/p+2V
 1UJXJRQY2oYobdbZfVQDDfyda4+qesy9SJXWuksxrpWXOlG5AhoUswZZ8/PwVT0tgyfQ
 RGJX8mhjDvnXO4CCzYPrgczmeoDnzn1W4r3nmGSLeoXjQ04aKS1cjqB7MlrmewXNFxoh
 +O/JIWVL5dlZYpLhn9Hk9CrxBAyudQxOEJL14V3id/PxiHf59bDnCvE94ks8mkbufZP9
 SQnqd28Jns9CXptfRIo0O6INPQ3o3PXLwaYKWPFfgqB0Iiag2Q/MpHXxgbcSf2XQmXjQ
 uIfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=un6BL+YT
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 v2.18.0
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.18.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 4fe6d73139..28f4b4d1de 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a777f6442db77447919cc7006d8b9439c95cc61c04acad4039e0120a8e591ea  docker-compose-2.17.3.tar.gz
+sha256  85e9d97bcde8ebc0709f0d75cbc56124b49ffe1c8e24345fce8739e00ded6cb1  docker-compose-2.18.0.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 09f611e185..8c963d81d5 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.17.3
+DOCKER_COMPOSE_VERSION = 2.18.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
