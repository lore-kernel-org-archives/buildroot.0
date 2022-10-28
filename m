Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20C3ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 18:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C8D94046B;
	Fri, 28 Oct 2022 18:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C8D94046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0gbGwiB-t9S; Fri, 28 Oct 2022 18:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 559A040327;
	Fri, 28 Oct 2022 18:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 559A040327
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B75C31BF85D
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 18:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C7AF81493
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 18:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C7AF81493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaJ-bh95PCr1 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 18:24:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408B08148F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 408B08148F
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 18:24:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j15so7683921wrq.3
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 11:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxUFEGn5WnxbsrGJS8IYQmugwIZxqs44bsC7qhIg58M=;
 b=SknvY6OKBY1fGnNwRmdePszIEtcK7PsJMGmCIhz7cfehy5Mz6bM2OoG3BeMSTyQ6lF
 rTFsx5dEyjBuJ3UJK1N3w2iT4MJ39zm/svjLOza9CCjvpyJ9RmjgvXlvjDuHNyajSlz5
 T1xjxKItrWjoadvrAaMYFMpm8k/U6KlmX5n9emHe6bGX7AR6k1jngLb1njaqCq7Ef+Ln
 LnP8+cgiXGxjdio/b6bJt7DElnzyDd33oiK/+SXmaJP3K4hF8CvlobqV37KTcwsT8q+B
 drzOO2hG+kMrt11B86WVPG7WrMKKIaOY8lGSrPJYJ7ZSb30LdSK3iljJwds/IzAE/VIN
 me9w==
X-Gm-Message-State: ACrzQf2iWuXOEdwl4udXDaVRWM2gUWpqpqPV3OKe2Z15RM9BbByajpxa
 XhEkzzzGYGhSzaCWPtpDIVZhMjw/N20=
X-Google-Smtp-Source: AMsMyM4FTF2ruNjfhj0c+PvV9rYGEQOzqUPJxW/LFBxdQc7ttau6DiTl3y6Pg2jbd44/JNjQFw6ohQ==
X-Received: by 2002:a5d:644d:0:b0:236:8330:a5bf with SMTP id
 d13-20020a5d644d000000b002368330a5bfmr387230wrw.125.1666981445000; 
 Fri, 28 Oct 2022 11:24:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003b476cabf1csm5237499wmq.26.2022.10.28.11.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 11:24:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 20:24:01 +0200
Message-Id: <20221028182401.137273-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wxUFEGn5WnxbsrGJS8IYQmugwIZxqs44bsC7qhIg58M=;
 b=dm5LHrWiQABh/0QI4qDwpg0Xhy71E/Ygc+D+A+/xCgOqco74pVWfCcFGheNm4HMYKC
 MI4zvfadQctiQswNlb7GYFByXganaC1toYDY41kseyRkRoZK6zc9EUuKlL+bsIx96L1z
 S/0Yy6zoiOEGXpRMGedVb4MSg4LE5vsgs5aXVgmgPH6TyAU9KOGQwQt9peIF88XUZSXA
 hmZwgX/JfYg4OuCjYrK8KUS4iCUq/bSBVbCgJzZIrfj48EuhKKpLBXnMZluQnh6omwxF
 3FHSySeXugMucm8kUnLp5zNbhz/u5qnfM/oF8sKZBHWbqEns8KoAlkyuDsWYm1CzWOfZ
 0k9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dm5LHrWi
Subject: [Buildroot] [PATCH 1/1] package/conntrack-tools: bump to version
 1.4.7
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

https://netfilter.org/pub/conntrack-tools/changes-conntrack-tools-1.4.7.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/conntrack-tools/conntrack-tools.hash | 2 +-
 package/conntrack-tools/conntrack-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index dd4fc168bc..371ede3432 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/conntrack-tools/downloads.html
-sha256  590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f  conntrack-tools-1.4.6.tar.bz2
+sha256  099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d  conntrack-tools-1.4.7.tar.bz2
 # Locally calculated
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 55ea407924..ec633f0d54 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.6
+CONNTRACK_TOOLS_VERSION = 1.4.7
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
