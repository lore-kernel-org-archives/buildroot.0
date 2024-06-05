Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05829C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9902E81FBD;
	Wed,  5 Jun 2024 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fcNWbNBg_jZ; Wed,  5 Jun 2024 19:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A241C81FCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A241C81FCA;
	Wed,  5 Jun 2024 19:51:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21EF91BF3E1
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 19:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E15741638
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 19:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otmsfUaNc8jG for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 19:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDB41414D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB41414D2
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDB41414D2
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 19:51:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35e1fcd0c0fso194273f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 12:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717617071; x=1718221871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZeaBbAiawpIZyk5WbaBlCwpY1V7gUHv8EYLo4lA/sfw=;
 b=sdwnVVk3GYQqPmVpMp6x6mHZle+4eHSdJ0cSBsgHRxqylxTHxBKRSGrdPaeOhkOOpx
 xafilRVxZvtMIP6U52MUVoAzLQENM829O2FoKDB2/ntna6FI4d81XDaPpcm4jJVezRHN
 KgZ+Nx628lV1vFtqGbGFrRoALm7rpNAU2f2TrFlLNMTKjp0sqf1KEhsRirdOwDAGewhU
 n2b89lhnZPuv++EM/QzlP+SFXD6WcNv7EAl6lIO1rd6qC7Op3imScrLUhRsQb7fBzYK6
 2NH5wVZmcyHJcfMc7LdtkmIaE0VPGoql58qlzAF4x3y9gad8MXUSkcJb44JzadELgDqE
 aiAQ==
X-Gm-Message-State: AOJu0Yzj5GhsZhTD3CXfod+CRh/aMjoTERctFS375oEG5JqtB1y2u+PT
 t/2G6qnZ3wK5zDH0VaLQ1XAzxIpsN9QypguW56JplVQxo78MbsIkyhlaTg==
X-Google-Smtp-Source: AGHT+IHzoNOLz5m7tgQd7JbRqDAkqgB5IqZu1hB3l8gZL5i+7ZKnk4pvUBhplqQ+DwRgOuS13JAWMg==
X-Received: by 2002:a5d:6da2:0:b0:35e:f1b0:e16b with SMTP id
 ffacd0b85a97d-35ef1b0e2camr411491f8f.46.1717617070573; 
 Wed, 05 Jun 2024 12:51:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd062edbcsm15605122f8f.84.2024.06.05.12.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 12:51:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 21:51:09 +0200
Message-ID: <20240605195109.1741349-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717617071; x=1718221871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeaBbAiawpIZyk5WbaBlCwpY1V7gUHv8EYLo4lA/sfw=;
 b=COQJWnHOY1Kw/FarP0R6Tn511oyNvMabg069Lx03u0vhNN9D2+VsefWY3gYtn1avEb
 DC52S8lYzPsROQBf1BL+QFjSsPf5mHYmkuBowQDooMyM2uqJ2BOd2R6YmlRSs8/4nUOM
 auzp6Rl5UwZ4koKXNw+mmUyDgIu+cwMh92OirYguWVSyn9imVaVYGuB2FpSq7HHxyCr7
 DNntgegIkGqK3LupkRtpFeTiSdQntAzKUw6aQj80kSFOakdJkssnqKRLpraLjjltgPPF
 CluOlOFiJ9UusCBJv1/mnjXg84qb8RlhXSg50h897kvrf8eHuubwzifN8N0Cz9dJJxWg
 q2Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=COQJWnHO
Subject: [Buildroot] [PATCH] package/docker-compose: bump to 2.27.1 for bug
 fixes
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 12e839c71c..2896eee40c 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  42e9d2a33806656bd145ec742a3ba00b64acc3f88b500793d3b78319c39e25e0  docker-compose-2.27.0-go2.tar.gz
+sha256  7ca8746c86ba25491f5bbdc44c41d5cf7f64defa69f4015c601e1a562f7f64fb  docker-compose-2.27.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 32b2236a91..44e27787ab 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.27.0
+DOCKER_COMPOSE_VERSION = 2.27.1
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
