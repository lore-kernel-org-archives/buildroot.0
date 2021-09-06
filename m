Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBBAC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:26:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66FA760295
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66FA760295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF144047D;
	Mon,  6 Sep 2021 15:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OGfNz9B8NTe; Mon,  6 Sep 2021 15:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EE2D4015C;
	Mon,  6 Sep 2021 15:26:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2211BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E97C80EEB
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8inlO3R6uKYT for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:25:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3509680F37
 for <buildroot@busybox.net>; Mon,  6 Sep 2021 15:25:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id e26so4866276wmk.2
 for <buildroot@busybox.net>; Mon, 06 Sep 2021 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0nabn6OvrGFaoOYYVJz5vi0usQMcFBbgWsjmdsTBZLY=;
 b=JiZ5/Z12+hYsWd1+E2svmEUx/LQYC/fAR0uVbNUHlspfraYBFTeLSVJ5R+Bp8aLUGT
 e5rjtwHnLauz64fjGSL5EZLl3nL5IbszZsDwLqDtHEQg5MhvnHdf/KJe6GSrcRgoVp9t
 ltNkrgmeqXrTbVJhPwwOhY3uFa/V4biO6EseTjl5BgItAZKL5A2FFqmN/JOW09x951bh
 0vfXYR73QN2YwWG9CuUE/tNEDD8LK+772Vj0oi/xiQkiQmQVqk4a5daMW4nACrMRwpzs
 5iUwvA52vuP5ZdFHmz8btI7e4Et9eyd0XUk7YNhYIFerpoeqwi3Qb6YN191NXL6nTK/I
 hLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nabn6OvrGFaoOYYVJz5vi0usQMcFBbgWsjmdsTBZLY=;
 b=dbLYcEK5nun5vmmJs7ylM70J/wtdyXkuKLdzKbnhQYP/LZCQ/RPq3SjG1kxXx9Ukk/
 ZwbyOv/zBFSnL6WQB7D6Y/kaLnxBb+wJ7Is1L7/C8gWFKf4x9/NrGRjZNjT9PmYNP1DD
 2Q9fRmFLg53IkRusXbj5nkPahhzYvK/gcPdF3TnvryzvYcmp/rm7RzemLh3STgxREtYL
 xyi7+wk+LuJ7t41bhMqLwXlb6wI/C1VJhBxO+Tr/d/NgpYhlVTyxqtoD5+Skb1N+YMSI
 LzlH3NTnOcgQ23FUCmGh3d+lRI9btHaaypwamJViCw6QdLIMmYWLQyr/fYJa4eGPQCvx
 phQQ==
X-Gm-Message-State: AOAM530diD27Q2EjUAbpzWRNfmpY0fHqGjyH8+cy0of4l3tG1aqQr+jL
 ZDCYFlOLpxCAuLSemgGX3DC1co8IFKw=
X-Google-Smtp-Source: ABdhPJxR8dBNt57pOrqn0g9HwgSLs7vdUYPPazk46AtrMbeOzfXIVB0qXG7U2SYiQsZtuRMzAi2yMg==
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr12076758wmb.188.1630941936527; 
 Mon, 06 Sep 2021 08:25:36 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b1sm8422223wrh.85.2021.09.06.08.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:25:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Sep 2021 17:25:25 +0200
Message-Id: <20210906152525.1831463-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906152525.1831463-1-francois.perrad@gadz.org>
References: <20210906152525.1831463-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] perl-type-tiny: bump to version 1.012004
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 4 ++--
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index db0d2d43a..9e5924abb 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3fac9bc52b55ba3c3bb75151493424b2  Type-Tiny-1.012003.tar.gz
-sha256  d41be1d944899e47e0a56ae1c9ca0b64b8b53eccb554184d47da4b3927cd2168  Type-Tiny-1.012003.tar.gz
+md5  7a1688c4de07a0ed481a1811e5e82e63  Type-Tiny-1.012004.tar.gz
+sha256  75cd06b612d1830ae9f4b22298b506b3ff04518fa7453f487c248cd62a906a2b  Type-Tiny-1.012004.tar.gz
 
 # computed by scancpan
 sha256  34427749499bd6d6e5d206089bc03d76c647a1350f8b5f95ea628d2b6ff56e4c  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 170ea37df..5efa78f16 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.012003
+PERL_TYPE_TINY_VERSION = 1.012004
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
