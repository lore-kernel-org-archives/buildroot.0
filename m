Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B322C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:39:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB07060E78
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB07060E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5569440262;
	Sat, 24 Jul 2021 20:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A97JjALPsTZN; Sat, 24 Jul 2021 20:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E1E40284;
	Sat, 24 Jul 2021 20:39:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE1691BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC0E3400EA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=posteo.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRHLim9gCWhX for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6587F400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:39:24 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 48D6F240104
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 22:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1627159161; bh=VF802wibRS9k4ohfLYrbCjp2ae6AhQ4MgZqhrKggHEc=;
 h=From:To:Cc:Subject:Date:From;
 b=q2XPKLmFDNBHm1BoyJqnDI+CUiiKC4mIBq5ztx0yMMTUZbzRymN4TDOy+Snkhbocn
 Z+h48FbsyZNt1wkS0QSzvBoLiJs7cgkffhYxJssHqRyS/l1OiKnikkG7up7w6/FuEf
 qcYVieMpmEtXlzlOJv63MYTQc2j6aKBQlnnNU/tfvGHBGq/9I21Q4yEOzB8gRnnXqR
 wyEqbSvICkXK6JdVPgwVbB3tWMUGsxE1i3nJryuf4UFtiwJn4wC2JwrnjgGIg5sD60
 7xY8r+1uRFyRQWSryMPep5WINC9V5dz6CRP3X1yutUE63eikTEpSav6YpafshL84jh
 CwsH904IEy3ew==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4GXJ2J5qdrz9rxM;
 Sat, 24 Jul 2021 22:39:20 +0200 (CEST)
From: Daniil Stas <daniil.stas@posteo.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 20:48:01 +0000
Message-Id: <20210724204801.1073334-1-daniil.stas@posteo.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/htop: fix sources location
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
Cc: Daniil Stas <daniil.stas@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Change sources location from bintray to github since bintray doesn't
work anymore

Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
---
Backport to: 2021.02.x, 2021.05.x
---
 package/htop/htop.hash | 2 +-
 package/htop/htop.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 647feabb8e..e9eb5daf4d 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19535f8f01ac08be2df880c93c9cedfc50fa92320d48e3ef92a30b6edc4d1917  htop-3.0.5.tar.gz
+sha256  4c2629bd50895bd24082ba2f81f8c972348aa2298cc6edc6a21a7fa18b73990c  htop-3.0.5.tar.gz
 sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index aa2ff24750..dd801b0dc0 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 HTOP_VERSION = 3.0.5
-HTOP_SITE = https://dl.bintray.com/htop/source
+HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
+HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
