Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D77C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDBB161561;
	Wed, 24 Jan 2024 10:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDBB161561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-K902kBShzF; Wed, 24 Jan 2024 10:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D700614C4;
	Wed, 24 Jan 2024 10:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D700614C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11EE21BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2D5283F18
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D5283F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrsDqGKrwa5Y for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:10 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD09783EB3
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD09783EB3
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40eb033c1b0so31693545e9.2
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092508; x=1706697308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzGDTc+qaQb5leRRxKclCGZ3T3M0Q8puSVJxdlOSkwI=;
 b=rjlzyOq+66CRFhGCCkhMDXEXGZmUtTJ49MxjyVyvEg/SCmoviAT5jH80ruJK0ALysJ
 ScnfP3mnjBnXhnKkbz6X27qB5nU0ry8eXkldU36hZ9cWGV1O4mFEkDRV43nQ6hSwd5VT
 HN3UPKdaQ9jb7oPRJ1pvYAyFNDHuHUlsqvc3uFK0tB4V/USLPJdoU8dd9fklIp2d/3lO
 gD65AilrQNATnu33thHzbJtX25hVHPCiS5phnoBgvnrFvXjyZSL5Sfq/77vhK/Pov8NR
 j8ms7CPnyoVHLavAN0pbh6hl6IULPJeNIkquZ+DsAKTcEQxOaDA5E76WR2O9B09IePIP
 56Dw==
X-Gm-Message-State: AOJu0YweFzUnddzt7Vi6BQWXcu1iIDWCLAZmAohAkFdTbBLMqyb8rLQz
 NSZOVHOuQUPbEAnkUY3MNRr86RCfe0pd4klXgJL+WNeWz3mTX7TeFYp8Hl5r
X-Google-Smtp-Source: AGHT+IERavs/O3UnN0F3chQGWmLSSm8oMR9j7YgAsAONiIErDB8MKhZcIZwVLRMCwlDqjXhbotCYNg==
X-Received: by 2002:a05:600c:3f87:b0:40e:4576:53f7 with SMTP id
 fs7-20020a05600c3f8700b0040e457653f7mr1021075wmb.49.1706092507547; 
 Wed, 24 Jan 2024 02:35:07 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:07 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:47 +0100
Message-Id: <20240124103453.623733-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092508; x=1706697308; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CzGDTc+qaQb5leRRxKclCGZ3T3M0Q8puSVJxdlOSkwI=;
 b=Y8d6NKAs6b9JIvStN0D/J8tAdu5IWkP6i3eIO0MxdokVWuCAoL5ChkA+kGbvR2L2f9
 eJyTX829nvQZNDynr7lVPlQiSHz67wdbaFagv7yh2P2YgJ+cNY3NhLsJVVSkL0UGY1za
 sMYChTVHxoB9DDlBnpmmrAkZ7r7Mtz5yLDiVBS39pmrklUh2Cq9EoXWjRB+gV0PnL7R2
 XXuekFrIdGme7NkE0HNm1SkU7YnxZ0M6JIhvv5Iwpr6P8QlbIRdix97TOkLWNxnYjWPm
 kIF7kerhmWxC23IU1HDYhbhafG9tmhCrGprEFqEsar+Vcv4Fztrdbc8eI035qZfTupwj
 Qlwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y8d6NKAs
Subject: [Buildroot] [PATCH 04/10] package/perl-lwp-protocol-https: bump to
 version 6.12
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
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash | 4 ++--
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index 7304a4cb3..aac0abe3a 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  6615a250c8963a2333ea6d0fbbec306b  LWP-Protocol-https-6.11.tar.gz
-sha256  0132ddbf03661565ca85050f2a5094fb9263cbbc3ccb1a4d9c41ac9bb083b917  LWP-Protocol-https-6.11.tar.gz
+md5  62650d02150a157f486375ca588b6c9d  LWP-Protocol-https-6.12.tar.gz
+sha256  7dd36d3a4eacfa143a47a2bbbc56ea9413887e2d7376c1d35bbbb2be912b616c  LWP-Protocol-https-6.12.tar.gz
 
 # computed by scancpan
 sha256  e4def55436b2bd99fe2cdbf546a72ad5958327e28831db9b5adb497c6bd580ba  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index ff9ee936d..a2048e25a 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.11
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.12
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
