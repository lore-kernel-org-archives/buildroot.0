Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB11C00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 05:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 181F981B71;
	Thu,  4 Aug 2022 05:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181F981B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iPWw_HV5sjZ; Thu,  4 Aug 2022 05:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5B181971;
	Thu,  4 Aug 2022 05:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D5B181971
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 174FE1BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4FB340207
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FB340207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhaxVtA6wv1d for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 05:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31AD6401EA
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31AD6401EA
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 05:44:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id b4so8325617pji.4
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 22:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jHVLOWGN0OS9r9O6ckWM5nq++9/l5ojtdyB0NZqCWDs=;
 b=23iQK4FbPC891O/JbqGujFDR8dbF16W20jcaeQ/DUkG0xCRmK/UYmuAvJhnJp5/ZrN
 z0GftS1viuWrSFoRvGTDW9EPSrsnaONOWb1KWyhyDvpr6/xnsbJvt4ZO+sv7/J1aLZKT
 5wEQJQ69wNGSxKRhPDK3BewMuMZBdJwRfSYwD/vTvksYLkxPwFlU5qBzSibeW14VeNSg
 M/LlFha0hbSt0Umn+v+lo1I+5iGYu1fMiRtQocRE+OEtKDDWdCF2z1kJQZ9QdYWWGa/d
 ju6L4iy24Q0Zid7IJd+2/REcNL1FJUC4JJL1dkhsXJ//xU0k2P2c8N5Sp7bDsnk0/GMl
 0kvQ==
X-Gm-Message-State: ACgBeo36E/Ppg0I2UcHDgSv0NI1ZfWVjoG7F5yL39bX2e1wOFTlfbhfv
 3EUQtOxU4Zdg8Pv1oq9Zy2gn6PcqOiVxVg==
X-Google-Smtp-Source: AA6agR5HAKriEbPPf1lKe0nKuToQhN9QaXamXgmoBSd+wptFjUV4r8fzxfR7T8KNCRtv4HtFWMOsxQ==
X-Received: by 2002:a17:902:f688:b0:16f:4b4:fc18 with SMTP id
 l8-20020a170902f68800b0016f04b4fc18mr354919plg.49.1659591881015; 
 Wed, 03 Aug 2022 22:44:41 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d15-20020a17090ad98f00b001f200eabc65sm87849pjv.41.2022.08.03.22.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 22:44:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 22:43:40 -0700
Message-Id: <20220804054341.3107780-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/2] package/docker-cli: bump to version
 20.10.17
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

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 9a07acf89f..87c5d949c6 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bda289b27b18675d6a6ff07568453768fe68c16c27b5e52724e46896d5464a55  docker-cli-20.10.14.tar.gz
+sha256  ab2b59c2302017fea9ad2f70827e8a6f0204b557ce28e66bcb80fea262c9fbdc  docker-cli-20.10.17.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index c7458f85dd..75507ed48e 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.14
+DOCKER_CLI_VERSION = 20.10.17
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
