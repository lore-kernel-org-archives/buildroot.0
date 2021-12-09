Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD09C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 21:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D614C4EED5;
	Thu,  9 Dec 2021 21:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxxA5Rmm3IKl; Thu,  9 Dec 2021 21:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364FA4EED3;
	Thu,  9 Dec 2021 21:52:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 291BE1BF868
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 184484EED2
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tR_N_6ij1nuO for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 21:52:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6713B4EED0
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 21:52:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o20so24343674eds.10
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 13:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZNbTp+RvBiKcxWk03FrJewLNPnewGVDRl3nFY/jNSRU=;
 b=SF5cwRsJJpVksJOuiUFTAbnIzM+sPfW/mh6DtVY0Pxys0AsAb8bUZQnHCVu5B/py6N
 GckKmgezcDTPuNg27dYTLzIuPpwF1MJc6HeN97ngGNH3yFp8BSvVPLh5gaqjKqO0MSrf
 U/ovMG06ExfZVfzpmhGupKA5BqtjSYIAKWJ7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZNbTp+RvBiKcxWk03FrJewLNPnewGVDRl3nFY/jNSRU=;
 b=PiHVNN/RLVtn4u6/uIjs44J+iMu5sRow+WfzsRZx1GwECHcEgx/ChIzpSklgclix0e
 5ZKEKQ/RCxSm61NOgXf3paYT9SErUg1+gEaaqyVCDZKQzlTmj3P1rbXs9tqdNENnWWCw
 JJr2YPBBaxwlWpdzNLVZ69/Rbw9oFOI0OfXrfXV5C1Q7eUwRZ38F0/9i0HqGDsQsdmGB
 YJMUJj9nKSs4IVo33NpnYTPer7Z3dJ7BaCeEcDqP+tM4vFuHgYwy/hsIspZk2UF56Jji
 EM8C8Q+lcq/oGxulsaJmNUQabGxHQ5yE/tUe2ES2scQdBW4/RZr6Uf3LnDRhFkMIWr0o
 eYjw==
X-Gm-Message-State: AOAM532ai2uZFHFM/VLlF3qHinxujCy1GJ1QerC7lfYYq76VI7eQuL8s
 C+X9qPr7k6KhDLNraklfa160ajyyosMc3g==
X-Google-Smtp-Source: ABdhPJzKI+Uctxr1i+lExBBFcwobDS3rwrBCl7ig/4ibEEngpR6YId+cnNObDWKr6s1Y2x3h1Ib3mw==
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr32338921eds.344.1639086755086; 
 Thu, 09 Dec 2021 13:52:35 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id yd20sm487689ejb.47.2021.12.09.13.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 13:52:34 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 22:52:31 +0100
Message-Id: <20211209215231.471017-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/grep: bump to version 3.7
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/grep/grep.hash | 2 +-
 package/grep/grep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 9dfe2f2c23..4759e3a9b0 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
 # http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e  grep-3.6.tar.xz
+sha256  5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c  grep-3.7.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 27d204d4ce..233f5fe633 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.6
+GREP_VERSION = 3.7
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
