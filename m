Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A11C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 08:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3AC56128A;
	Wed, 15 Jan 2025 08:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlGz3IVeccdU; Wed, 15 Jan 2025 08:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BAA6128B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BAA6128B;
	Wed, 15 Jan 2025 08:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D7CC94B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1016128B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWQONch4W72W for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 08:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A510661289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A510661289
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A510661289
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:05:28 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21619108a6bso112360315ad.3
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 00:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736928328; x=1737533128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Ly+19L2l6ad4eEHNJchizUSZZwNLPD9Al+Zskbpurs=;
 b=fhEuEo1qVHdPAKIut1wDWAxgKwPr8I/zGbeHJ9gqR77RH44Q6v1uTCE2D/AeLtOVfK
 2zu/hO5mlUEW9GzXjD17k36BpKoA6H65nrw2C2GTZarzV+1wfqeQkotCN7qY1n7olpeO
 OWR8fEFJSTq3i0ZLNYmE9DwndDeWG/vqhKBWF9xE8BIIZf1tNnkozrfo/aCCq3eJE33v
 GZfQ7FzFkIm3EvLF2A5hOSJbvbcJq9UxL5l+YKHWRdaaBekUaEGrlhFuKe/kOyjretZ6
 11Ayz9AMGPQgvdQZboOPw/ab18ih/4k0tpvplRyr/pacU2NzaQ/J4PEc9MUeaWwxw0Ul
 8LIw==
X-Gm-Message-State: AOJu0YxKSOa1jv96Zw1oWL+T337+yTi3waSJg90q/Nc1BnbfyGU4CUFH
 FR/T2IlixWD/sk+25PD59WLLpNx8Wws+Qx81bVZD42P7IfINnj/TlhhMWZoK
X-Gm-Gg: ASbGnctaoVAcxOMb5lZmLlfgh1hZymUBmJ6m1bUg3+FmKvdhUmiDmLwl/Q1czvAtdXN
 mTxy8nd5ep1lg0fcCVrrhs5el0HCND7TudzbMtO/oBw54ehdnqjcUYtMjPjOgDerE31A6RvuXXZ
 GL2tfFS3jc4YKXvkvyF86UAbOxrgGMUJR7GyjSD52Av5ybBv8AGxboKcKZ5gy7RHysbxL7yCZeW
 Ji5aI04WqhmEWHc06MQgDAC5645B4NQ/G0hgHDYIkSO0Gi3iW9KNX2KI0B3ZJ/7j3pVxmGgfvKN
 3G/cu5zZ6O094rgZhdXXv44V7DMp22vMY86IxFj2
X-Google-Smtp-Source: AGHT+IHW9dIJYg1DDQLz+6uljm4SUPmj2JyHs7CHl6LlBs+cgfLKrrGULCSNiSV4gfuLFPDFG+tsJg==
X-Received: by 2002:a17:902:e808:b0:215:44fe:163e with SMTP id
 d9443c01a7336-21a83f36f46mr467539135ad.1.1736928327582; 
 Wed, 15 Jan 2025 00:05:27 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c20f503sm774935a91.38.2025.01.15.00.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:05:27 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed, 15 Jan 2025 00:05:24 -0800
Message-Id: <20250115080524.795538-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736928328; x=1737533128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ly+19L2l6ad4eEHNJchizUSZZwNLPD9Al+Zskbpurs=;
 b=SOgREbqgxzfYECDPuwughcNWJPFKQVZOnGXrmbkuq+JFAC6gyp5Im78ZudZBu0XFqA
 6VF8OqlwfrgM1xjkWBs3MJJ6JeMl9KRSFK0jb28B/Jbl2Ez4StgltOWGHJmcqvYDZLyI
 KeNGxmMJvB8RQyTVlOyiK5nS7yWp3hgsdhlcDYHAKPFBZkvfiCgCpH4KqZtEL4chswSj
 Xh50yDBRFeAs5NdUMoYHtSwa0LON+f/FaD9/bfz2bQhzWlTa5L5w7YGwRFiJNfG0Vr8R
 oFTvAfdystzlIs96IftWT5xrfcjsnk2LtEvELylopaaGkjiNc4atA7a5fNvBhLxQsqBF
 GdbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SOgREbqg
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog - https://github.com/pikvm/ustreamer/compare/v6.21...v6.22

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index cafdeadc87..4b33d23e70 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  405c8bef000525153e6b0afc8a23fe03ca0efb444a87a6c6262e3da06bc0b5af  ustreamer-6.21.tar.gz
+sha256  7d3fcd34ee57faa4eae6505fba75ef35b36840083d50f581208f402a206032ad  ustreamer-6.22.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 9226f4a2be..813f219b89 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.21
+USTREAMER_VERSION = 6.22
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
