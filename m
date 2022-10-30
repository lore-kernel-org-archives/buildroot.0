Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45230ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CEB812AC;
	Sun, 30 Oct 2022 21:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2CEB812AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpel1Wk9e_-4; Sun, 30 Oct 2022 21:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32047812B6;
	Sun, 30 Oct 2022 21:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32047812B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43FF81BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BA6D402C5
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BA6D402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0UwTcMDGfoa for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:25:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA03A401DA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA03A401DA
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:25:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bs21so13550627wrb.4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zGZ/AEsyOrWt4vtsfrqzReguZGnf5A/xSlO1t5cqYWY=;
 b=h5HAtAQEVxGB+KlXFMQLb+fLfqNyjHVobWvT7X7IxkYIQ8wvanBZB6FC8BYyKuGM9I
 C6rnpsX2vvFRxwjcFHo3Xihc2dmMoQFSiHuvcCJXZdYz3cBWvIwvxGG/KNSL7PQLF4L9
 duTsLYNcBzBWDxlo2APUCHsK6TWe8lm6SYgwM8lWDndRkXas6ExHnrgRjfQgLsG92NeR
 Cym+l+BzFp5xnEugso3W54myL5vWadidQfDlT06uBlbS99esUTlrawvSvVxPqmgsoJMI
 LLs+E2gkofe61fUehPJehDjMJI+fwDNLxzXu30uKFlCGrzgra44IsjEVY68Mo7RofTss
 xTfw==
X-Gm-Message-State: ACrzQf2DkM+2zkHW7QtypLmFAhxdSFU2VGke2xc5idVSDDnpFTQE/EhL
 w1k4Ro1B4iNmbaurHiDA7cFNS3fp+KQ=
X-Google-Smtp-Source: AMsMyM6K+YAEZLsQDMagRpk6cP2c8jLehWRBLsI1oKrQyP3BW1l3r3eZhiwHexbIhlGGgfmQ0dKBAA==
X-Received: by 2002:a5d:63c4:0:b0:236:791e:cd3f with SMTP id
 c4-20020a5d63c4000000b00236791ecd3fmr5794084wrw.266.1667165122343; 
 Sun, 30 Oct 2022 14:25:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o23-20020a05600c511700b003cf54b77bfesm5453823wms.28.2022.10.30.14.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 14:25:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:25:19 +0100
Message-Id: <20221030212519.66340-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zGZ/AEsyOrWt4vtsfrqzReguZGnf5A/xSlO1t5cqYWY=;
 b=UtoameRvimRam57yvWWvG124M5MZ9eWIK9LbAKCUf+kqSuQx7pSS+a2JXzhFX187GP
 UY+baZ5Uwc1/P/iNPJMSsGlwRQMA7dazImDi2IdkJQivbzfGEnf28U3huiLJAsDcvI7J
 eo5/pNZTNQjqGW3/lT/lXqZHTtOnoUQolBMyLshy79d1gBDncypQ2MDNjpDHewEnLlbL
 JrxbWjVIjxHoPbvUaGcusHWh0KCBJZDTVqgAreMAnt+u3wNb/tidXETPoWbYeKNk0mKN
 9Nzi806m7Uxn2k8M/h9kmnPi2GhHV3Yqe16gW1sbdCZxs+58se+jIDmZuKnsODif6lZo
 SIew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UtoameRv
Subject: [Buildroot] [PATCH 1/1] package/motion: bump to version 4.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Motion-Project/motion/releases/tag/release-4.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/motion/motion.hash | 2 +-
 package/motion/motion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 085ac90449..9b99256864 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3fb0d14fff8a8a143716223b5d2d55c0f52b11badf13a2e485b98bae3cf1b572  motion-4.4.0.tar.gz
+sha256  42320a1c7b54a3f0b5a49cecf34a5d752760b28383bc573b3ca1240581786fe5  motion-4.5.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 5d54ecea01..18fe0eb630 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOTION_VERSION = 4.4.0
+MOTION_VERSION = 4.5.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
