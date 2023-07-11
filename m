Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B98EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB9541E33;
	Tue, 11 Jul 2023 22:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB9541E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACnbmzNgBQ1m; Tue, 11 Jul 2023 22:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F42041DEE;
	Tue, 11 Jul 2023 22:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F42041DEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6101BF420
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6558183A3A
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6558183A3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a037owCj_YnQ for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:44:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C0083A38
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92C0083A38
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:44:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b8b318c5cfso46125725ad.1
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689115493; x=1691707493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rruzXxwvMWL6M/cl5FSPIea4HfU/CvK2NT7FOjST9LY=;
 b=FBgF+aq+/zaNX6NFlQs+7uehCt6gToTYx/SAedAmGln0msVVBPSrMNT7tgcJrNAXLX
 r+yBzjal2a/q1bqMfeiOr/Zs5go0rFEH7ASWwrQ83LthRdSZRD5eShneCjr61HXdRmVK
 ufftX6AYra0CI04dK/1RN6xWbbNAITm5iClk9prdoADxUHv8ULsBqMe97Buc779zyHVg
 d3VxGzQ8TUxN6Xcyi9jZiBBnLln0n54t/myTZM+vIv8YO5r9hujEQq7566OlNABbMEQE
 rVsIUNkFtu8T3H99NVUpBhhcC1RvGh/22xYQ/mcP8/584DtthzYw62y5kS8F3B4LRLt7
 eQmQ==
X-Gm-Message-State: ABy/qLaf3pbLcz/X8tEtg09FW86j+MOfMN5Vy1LdDKf8+6qxw5+ri+rn
 O4QoY0LNrUH1SzS5TND1p+o7ODepR2n7q91D8dM7gbl6ARc=
X-Google-Smtp-Source: APBJJlE9gferU1P4qRuxNStQHPaf/VCNzFKu/MP4ebP2D1yc7qooRHRi+LlHZtfokCRacLFkWgjnSg==
X-Received: by 2002:a17:902:da8b:b0:1b8:6a47:705f with SMTP id
 j11-20020a170902da8b00b001b86a47705fmr19942490plx.69.1689115492799; 
 Tue, 11 Jul 2023 15:44:52 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c11100b001b9ecee9f81sm2427067pli.129.2023.07.11.15.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:44:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:44:49 -0700
Message-ID: <20230711224449.1799384-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689115493; x=1691707493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rruzXxwvMWL6M/cl5FSPIea4HfU/CvK2NT7FOjST9LY=;
 b=LTBV4dfBVl4cSjH225v1zyhu4s0sSJ6moeofgokil9AaQ1wh2CvDaFJEh/kjKtNQOM
 +rO3IeAAAp1FvDQaK+vzNMP1I3h8+mc+/h+wqeLeHJuu2CKup4rDsXt810m0MI9vONiS
 9hS83bLhs9C1sNmSpe97k/2jNrlBsAFkMqvGMMawUt87l/Q9KeXC/VT9Ae5FarCGe1Sp
 l1eGvn3yvzmNfHtg6Y2p+y+6LXZiJInJuCYGcV+/PAm3SHx+vxuLszKGqlPvlxZRRHKP
 Y/0lkHA7n0fWm6OAxpU7iUsyRCMfLUKViQK9xqTOVXUKyQ+VhrpqY4yztaAZM79r/AXl
 yglA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=LTBV4dfB
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to version
 v2.20.0
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

https://github.com/docker/compose/releases/tag/v2.20.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 4fe6d73139..fce3477257 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a777f6442db77447919cc7006d8b9439c95cc61c04acad4039e0120a8e591ea  docker-compose-2.17.3.tar.gz
+sha256  2051ea80097f3c9e74e3a8565609e704e76035fa9ba04183950d3431bd123ea5  docker-compose-2.20.0.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 09f611e185..b2d3e99988 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.17.3
+DOCKER_COMPOSE_VERSION = 2.20.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
