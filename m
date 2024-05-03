Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B772CC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 09:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68804837A1;
	Fri,  3 May 2024 09:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0RFrIVJuKUQ; Fri,  3 May 2024 09:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EE20834BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EE20834BA;
	Fri,  3 May 2024 09:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1208F1BF995
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 09:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A410834BA
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 09:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEk1XCOl0QxR for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 09:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B31CE837A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B31CE837A1
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B31CE837A1
 for <buildroot@buildroot.org>; Fri,  3 May 2024 09:55:28 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1e4266673bbso81169325ad.2
 for <buildroot@buildroot.org>; Fri, 03 May 2024 02:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714730128; x=1715334928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3l+a+/OAjKUFoLRB3J7+cXbw0OADOsKR5mnM9z0jSlo=;
 b=qtxYR5Uvvs1gWrr2J2rno6MJFZ4BVV7kM8wbM1pS0ScpUu0Lsd36lhAqIJ95AIO0od
 YlK4aKFzA1cuYIuWgqNuC1gncPK4o2uMEKjIM3KvnWyQGmfaAFm0sDAQ4jEUScIRhVFB
 cp+QsL63yc1pSY1tDKniRSIpDaBEbKMtHKUGG68c0aydeG1I8vTAznfzHOJYS789UhXj
 P3TCua1lOKTHCaI7jMpI1093AoIHfJsAc/uzfkJlkvXf3/LTXkywwIsLgbB94AL+MRxX
 KJazk3hOO3WXJrPGDfU22p1YtSm+L9jxLtc6s/h+jr7ebMfbh9MwJV7bM0bX7MoK24t3
 ATCQ==
X-Gm-Message-State: AOJu0YxYcNrZxcejLsVzJ64PDxgi4bpxcLu5my6LNeWQwC35p/ltTx0w
 S8uQ0iJwEOiHaaH9BWXoJKTTWp0xVQ64kHa8c22mOBwY+LgY6/1BWzleQg==
X-Google-Smtp-Source: AGHT+IH/tj/0DtQ6AA2CdZQx4nGigQ3vkse8ZvYJEkpN0N51IQRQMJ5LB6cUM2Jcn73ZyvuaN4Cdcg==
X-Received: by 2002:a17:903:1247:b0:1e3:c9f6:c4b with SMTP id
 u7-20020a170903124700b001e3c9f60c4bmr2662119plh.10.1714730127798; 
 Fri, 03 May 2024 02:55:27 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 x6-20020a170902a38600b001ed3702f786sm1138415pla.169.2024.05.03.02.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 02:55:27 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 564B2184DA1CD; Fri, 03 May 2024 16:55:24 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Fri,  3 May 2024 16:55:13 +0700
Message-ID: <20240503095512.346271-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=bagasdotme@gmail.com;
 h=from:subject; bh=JuTGJnuf7bxW5FZ9ShNGiIt5IMietNusoKzCjERr+po=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhjSTLY1bnym/lvnRxnvV+kex6vxXKoesE2YdqplX57xjn
 /r0sq0XO0pZGMS4GGTFFFmi18ruMubde8ksJqEIZg4rE8gQBi5OAZjIyVcM/32NeHi8WFMZzCvv
 a3+/3hjH4K7A+0S0afqHawlmrZPFrjIyHEo+86D0c+r+3OjKcylnORX/drpWZRk67e1RnzNh9eI
 3LAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714730128; x=1715334928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3l+a+/OAjKUFoLRB3J7+cXbw0OADOsKR5mnM9z0jSlo=;
 b=OXVQqFdRcS2A2ezwJCQIgvx9fFoyY1lOW/WnyATKi0/PO6jtyA9hLmAsifNktiMCNa
 +mPNjfuEVyAHH81qZFocAucbMQKrG1RSP1EEvTpFEWEnwtVkFIGs75kVNyIKrF2L/W2n
 TVk9VjQFdXtls/a6GrOmNTQT5nymdYi8EnvK4dbS3eC95s/wMy0nwKhvYLFwk4Qa7BIx
 lEvzKxpQrGkigxlmFjZyWN6unbLv7iNBoeXxc8cz2GI8TCc+DBsL2mug6tyuwPY2e2Py
 ATId74D06zqF4C1i3xrRN0cQrm3qqxbA//rTwCq6rjh/qBy4HX3tfg0LZvkuBGroCEcC
 ijiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OXVQqFdR
Subject: [Buildroot] [PATCH] package/git: bump to version 2.45.0
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the package version to 2.45.0.

Release notes:
https://lore.kernel.org/git/xmqq8r0ww0sj.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index f609a4aaa4..2e54945a40 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  e358738dcb5b5ea340ce900a0015c03ae86e804e7ff64e47aa4631ddee681de3  git-2.44.0.tar.xz
+sha256  0aac200bd06476e7df1ff026eb123c6827bc10fe69d2823b4bf2ebebe5953429  git-2.45.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index a9cc3c30a7..b6a7ec0cbb 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.44.0
+GIT_VERSION = 2.45.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 929bffbf4bf8fcb91bda446777f907f32c782656
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
