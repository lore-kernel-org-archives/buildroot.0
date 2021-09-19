Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303DDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 10:00:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDDA61242
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 10:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBDDA61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5197F402AC;
	Sun, 19 Sep 2021 10:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mU9iXcGEmeDS; Sun, 19 Sep 2021 10:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A4E940293;
	Sun, 19 Sep 2021 10:00:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0451BF5E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 10:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 491D440293
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 10:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SBUo8omwYFh for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 10:00:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9CEB40182
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 10:00:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t18so23222333wrb.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvYgSqwR+BVsk1ww7UhDXTwn+tJmpcF+wGr1aBmdN3A=;
 b=BxFVyAUk2cWkB6VwLixJxSLzgbBEazP3Yzt8e0vYCou1yGXg2BvruQLsCFQa1S8PEb
 kZVpdIjWMzqbnBpf4JIuTXa/7MEfG1DnomiJgDM7qwgMApWA1MH2jHQNbc3E+l8W8k9Q
 thCh4zIF1NTv+p8SyAL/cKd9eDAEFPI33mlWzeyLulUeEw5ZBx0zDqirnSD1c2NO+TlS
 kDY4eO7VTJvooRRwoYeWVWMtHO5cDOAqA4xbYmiD378nEQOCJ7LBTEV3qEwQ9nULyBq4
 m2WR7DRySZ8+LxRmatAh5qsDbOT1zSJn/j+Xgycldu7okzPZjgvGimbCD8oIGGj1Yudg
 COxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WvYgSqwR+BVsk1ww7UhDXTwn+tJmpcF+wGr1aBmdN3A=;
 b=Pxuxpm3RoiWbd85thkx9zJT93OrLejqapHPCxEwi13z9LlMRCKjp/D4IZNaWi38g7i
 6bofvPQqGG3XKlb1QXg0QNyyWqKrIvkOm4kMJOyjFlm6EejObbblnjF1ON0aCsc899kP
 RbSDeGMS3eXIxNINa9/XVkykdPNtEvX4IqX+HKLDB6a6KBd0gF6QB5gHLTn+A+X889uH
 tC91he0v2LCz0TWQ6BmF08sUmC1q6V5NV7Z//SY3SBjHgLXB9cOGeB70CaicADf1+due
 EkwaQoWIUyQzu5ItK4Zcmc+T06gIZnIa1Syut4GNdyeBA7t0Tr7mZpHRFL1zar4+eryp
 haeA==
X-Gm-Message-State: AOAM531N92J/uQbLqA4jMhndJzm1yML0ihKiWi6GbSK4plkoIar5qPNY
 qq85/e+uDd9kRoBnuO407Q6tsiaEwHM=
X-Google-Smtp-Source: ABdhPJyRyxsNVEMYxBH6bG32GPmuy/61BPVXnsUotnh3xp7uNFQzVUJLaFz1LNPBfRMWmzX4vAOaXg==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr22264470wrv.51.1632045642902; 
 Sun, 19 Sep 2021 03:00:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id w1sm15783260wmc.19.2021.09.19.03.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 03:00:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 12:00:29 +0200
Message-Id: <20210919100029.2063495-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tclap: bump to version 1.2.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update indentation in hash file (two spaces)

https://sourceforge.net/p/tclap/code/ci/v1.2.4/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tclap/tclap.hash | 4 ++--
 package/tclap/tclap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tclap/tclap.hash b/package/tclap/tclap.hash
index 2b2097be97..fdfd46a2e4 100644
--- a/package/tclap/tclap.hash
+++ b/package/tclap/tclap.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	f5013be7fcaafc69ba0ce2d1710f693f61e9c336b6292ae4f57554f59fde5837  tclap-1.2.2.tar.gz
-sha256	cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
+sha256  634c5b59dbb1ccbc9d6a5f6de494a257e29a3f59dcb6fc30445ff39b45188574  tclap-1.2.4.tar.gz
+sha256  cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
index e1856420f3..d7f96bd034 100644
--- a/package/tclap/tclap.mk
+++ b/package/tclap/tclap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCLAP_VERSION = 1.2.2
+TCLAP_VERSION = 1.2.4
 TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
 TCLAP_LICENSE = MIT
 TCLAP_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
