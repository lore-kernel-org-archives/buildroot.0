Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8209C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 10:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920F360E4D;
	Tue, 25 Jul 2023 10:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 920F360E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmyTq3iVxq80; Tue, 25 Jul 2023 10:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D334D60E65;
	Tue, 25 Jul 2023 10:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D334D60E65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 681511BF59A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EEAF81CBA
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EEAF81CBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rF38iq_DEljP for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 10:32:14 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1668381CAF
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 10:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1668381CAF
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fd190065a8so53774035e9.3
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 03:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690281132; x=1690885932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tdNWXAcWeb2BvhnjHDi7WDhhWazrIoIwXubGrdtfuT4=;
 b=Rcp5Utdevu85b5ebd2MX/BfqyWicusrsL4JceX9rC02TMnq9DArG2UuKj/RD8TNjn5
 Q1BtnXfrmCMZ8EfN5CNpwbjZ0/mFnbRLv9wWjfVRX3Ah/hmruGxJ5Xb0whw3RzkuenGu
 UHEizEDMpW04OOfamZj7hd0y7ULJb18id5n1Ai3IpqBcgjtXzdNQ6i2XU2PyyLhI4BUg
 CWHQ7/2Re3cT9jCmoTo1sURPRQCRYpcyDsBNoSx2xY+03xvKrE6vtrH+xi7emoUXysIQ
 ysg2SyPdw8Deq1QYWDLxbOU1SOgMF0Jo/j7dyZrPCATGpwJAj/Lzwl45biEVR3eDAbrv
 QM9g==
X-Gm-Message-State: ABy/qLbtd1wB/Lkf9N8Djbt5Q+o2qRo3kv+bzok7PTb6CDrIL/bGTmBY
 Aybi0qDsIyJzArXr7v51alWAz8ST5wE=
X-Google-Smtp-Source: APBJJlEJCMu048gUL1WxKsEOTDxlycV1KueK+wuKnU8+gHmw6/fBVbKttnfhwkg8nU3UcnUneQ68jQ==
X-Received: by 2002:a7b:c3c8:0:b0:3fc:182:7eac with SMTP id
 t8-20020a7bc3c8000000b003fc01827eacmr9524712wmj.33.1690281132078; 
 Tue, 25 Jul 2023 03:32:12 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff94d000000b003143c9beeaesm16108454wrr.44.2023.07.25.03.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:32:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 25 Jul 2023 12:32:07 +0200
Message-Id: <20230725103207.941558-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690281132; x=1690885932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tdNWXAcWeb2BvhnjHDi7WDhhWazrIoIwXubGrdtfuT4=;
 b=eOlpb4Vn1gy/o3CKywVt5mMc+EZRT7eesJjlQygsdlYTAsLEO9LJjkjOTXdF6/LVXW
 ViZN4x0qZZvJnVQNVaxS6v1hkJiGey4UVQR8dFAqsHUhbabxy62J8eA0H7RNt4bcXHEM
 8vrAi2VFpqoIr9QohLmlaJuDIEYnjVggSDjyvR6TbNF5UWZRNEC0Tqv7g+Xm9PQ/Toem
 Zzz4+sycgyoleTvGb0/lFxMypGGuEFwR+EffODdVFeN4WI3KuIeD1rmP78adtVMIwr+4
 6aHKCFlX3MF0uHmhNB7FmAhv8iEN8I8JqxwV96pVKs9uJQZnlLtTsQUDH1DavltgvtoW
 53ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eOlpb4Vn
Subject: [Buildroot] [PATCH] package/parted: bump to version 3.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/parted/parted.hash | 2 +-
 package/parted/parted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 8a167d9bb..6643ba9fb 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2  parted-3.5.tar.xz
+sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 6d4626e2e..bfd9ef343 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.5
+PARTED_VERSION = 3.6
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
