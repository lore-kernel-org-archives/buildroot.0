Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E09C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66C1E40339;
	Thu,  8 Dec 2022 21:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66C1E40339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CCAyWrYf_eL; Thu,  8 Dec 2022 21:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EAAF400FE;
	Thu,  8 Dec 2022 21:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAAF400FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ACE71BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5156680E7E
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5156680E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQV290ZatUQk for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F58480E48
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F58480E48
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:34:34 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id s7so2824656plk.5
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdlFWzqtVefv8UXQ8fy6dsIgGGurFLU0u6fpcYzOnnc=;
 b=JpXMfb4LgHFbMeJh8XH3ZR1vG+WQMIHuEx3vCNy8pE+Nq0maePrKuW35cT6+WDQ49k
 Uv33OCpvVyjfhDPQsiYlhHI54wOupvDE3R9nKFMj9X+N6tIbIjxtTw9hZkI28MsO3OMu
 YJifUfq4bK/L2EHuSIRWYK87WEMOCVTDx0HjONgEU36kJjJoRx0QuA0uMG/XWtj9mOvD
 P7snxDMiGnfPd8a//q6eZwHiljFOBlNciDLAzFUQNXQ1uX9m+Avjo1vZwXbFrKiLuoJO
 xEywtCup90Pw1nyuyrfi2YvUjQ59JLaFohTbTpBoLO2w094H5/v8GsBInO5du5SfBX+U
 zy+g==
X-Gm-Message-State: ANoB5pknMXEERD8GOUtTOkdFCXDhsI84PdgOQ2y/7B7zT7w4U8ASzy4W
 NFj0CjPdtXOnmlU5GXNsTKVhScbtHKc=
X-Google-Smtp-Source: AA0mqf6ZQjo+bFTtgebydLaRovIT8X++NMjs9JyepU38SdfHRBu6ANYIrdjfQqBbQFRVaS2WEtCf0Q==
X-Received: by 2002:a17:902:bc8b:b0:188:70ff:5d86 with SMTP id
 bb11-20020a170902bc8b00b0018870ff5d86mr3572875plb.24.1670535274014; 
 Thu, 08 Dec 2022 13:34:34 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f14-20020a170902684e00b0018971fba556sm16992938pln.139.2022.12.08.13.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:34:33 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:34:31 -0800
Message-Id: <20221208213431.4141288-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/docker-compose: bump to version
 2.14.0
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.14.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 39f98523b8..7a7ab5f110 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  69d7d0311ac34ed4543f9a694995fbc4e2b785976a5a710015c20f0d04c204cb  docker-compose-2.11.2.tar.gz
+sha256  5cbf6cd1dd8ce98c5e2d62ca7f622e96abce444979b8e8852b033213a98e2049  docker-compose-2.14.0.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index bc88d8df88..ef9ee97196 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.11.2
+DOCKER_COMPOSE_VERSION = 2.14.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
