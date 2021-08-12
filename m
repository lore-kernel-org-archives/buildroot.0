Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36948C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 14:29:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 485816109D
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 14:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 485816109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26C480CBA;
	Thu, 12 Aug 2021 14:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ox02kn7bpND; Thu, 12 Aug 2021 14:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1409C80CA7;
	Thu, 12 Aug 2021 14:29:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57C041BF3A8
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 14:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47617605D8
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 14:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JXhBe_m5YC6 for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 14:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33BE76080D
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 14:29:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id z20so11995182ejf.5
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 07:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NO1lsHOhnoQmTHpGeVn+3B23FZQtKi0mi/1bx1HIa+Y=;
 b=pALOv9tfmcnljXvwe0w5v2P1ODyYf3yeCapiAXpNVUYU+4y4VfoDGKaFAHw2C32YG5
 ZaH8WpHX/qsISWI25U7TR0aL7MyErEV+0Ds7v1xJDg4kIggo0lfQ4Q+YoFrWSP2+hKBO
 XziRV0WUXNYNNe2KgMXWocRNo4p4V5dTWq7TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NO1lsHOhnoQmTHpGeVn+3B23FZQtKi0mi/1bx1HIa+Y=;
 b=MxP8GR7rYIewkqkO7BGYUS2iAfYJs2iFKoAiFOZgUwHKzAhCz6KF157NmUgbiSvMC3
 V62b9xnHGQYjKtrqtKgJn0iZLTd8NrlrCUMTBpglJSnMi5dEedkRnpWo85Q5uxDP2jRY
 vnfHcICrPY93G1YgOkBVit1DbS4Z4BrOd3RfP6sRru3+2Xol+5M9Xx8+yvhxyaDdya7v
 F2/KnbziHTkqFToindm9d6GK0vEvJ61niNs3yYzbxna346OA7/Qz6QhIybu2ZOPLUseK
 XPmApU5JuYxkju2tM+ahhxu8smcBPjGJMe5TrR6BMCTfxW+50sJi2mrpzuSrb9exvTI7
 15yA==
X-Gm-Message-State: AOAM531MbpmDCBRozbBvVJwmEhkldRlCsgSE0Bueq7hrhs62dTeWzOOP
 geU26q3qRUFEeIESumpAx1WGQ76Iw6pzeA==
X-Google-Smtp-Source: ABdhPJzuqyMZqnKZzAP9PaGYuRlLh7O8tmKcSNjbdMSSU08jPH7o1jjElhmA3nBoS2hTwuA7WetSFg==
X-Received: by 2002:a17:907:98b4:: with SMTP id
 ju20mr3934144ejc.366.1628778583384; 
 Thu, 12 Aug 2021 07:29:43 -0700 (PDT)
Received: from localhost.localdomain ([37.160.45.80])
 by smtp.gmail.com with ESMTPSA id la23sm885943ejc.63.2021.08.12.07.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:29:43 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 16:29:40 +0200
Message-Id: <20210812142940.1008312-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sshguard: bump to version 2.4.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index 9bbb41336f..b1752f1c68 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.1/sshguard-2.4.1.sha256
-sha256  875d02e6e67dced614790ed5e36aef1160edea940f353a79306cbb1852af3c67  sshguard-2.4.1.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.2/sshguard-2.4.2.sha256
+sha256  2770b776e5ea70a9bedfec4fd84d57400afa927f0f7522870d2dcbbe1ace37e8  sshguard-2.4.2.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 3616fba780..d27c76e63f 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.4.1
+SSHGUARD_VERSION = 2.4.2
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
