Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4CECCD187
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27F880651;
	Mon, 13 Oct 2025 03:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhAMv1GttIlZ; Mon, 13 Oct 2025 03:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31BA8226D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31BA8226D;
	Mon, 13 Oct 2025 03:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8F72A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A39E61136
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yrV6C8rbkOr for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0324C61135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0324C61135
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0324C61135
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:15 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-28a5b8b12a1so34121925ad.0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325435; x=1760930235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSYMdQ4PNkCZFepJ9SCuGrO5ah5LMAp0dfeGbKA/WQU=;
 b=vvMm4udSAVla3IMMMkw6tg/ZkpdhzMSNok5uXHYYxCpFr+znxayyDHIF8ELiXOkjYD
 OVH+bnGGt+SGKsgbtIlbTcIbZaTlJw+OgMWIJgUOLxXjpEYzjYzoUH7hiSSwknqAdS3Z
 ZczVYjxHLFpFEip42dFIz/ckthMbzJmJ/zIijYqaQ4YAZqp37mOE4UrmQjQzhE1FcoJX
 W0QG4xexKpMKxMgXimYAt6hAG8rEL4w0vGbjO1lfb64hJlc8HYL9+LASs1Ser0tiRJzU
 X+xAPVtN1n6w+JFfH1Pot8LX7uHFVzUISiBFqWFWgbvzopb4mI9hnAVDPep8R2fHDZKC
 dVpA==
X-Gm-Message-State: AOJu0YySzjnJJD2GE9AkNkNAupzN7BjKGDa0EtswSVva9pr3LX6c66nl
 rsu16fLuYNUOGvSBrBqyHPjVv6Aw+c7EXiKweIWjYP8mmTXtj5Cyj3uzoJCR8xKR
X-Gm-Gg: ASbGncuAGGz9pbO/v2ntZe2qovc08wV42nX00LdD7jG3/K/ENpdZ6P7xaDiDfIKn80r
 OLbu3xqj8UeijmT836gIGt3Sr6zMN4iUL4I/y8NGi2+mtmKb/zxRlZ3WYfJl8YWGZMYMJwD1o5R
 jy6jqahau68fH1HkzhkOxm+EB4LL5TgG8YAWrNygELrEP6eaBUfS2YYQGK01oiETVY/halrVyHe
 QPFZ8U2I0enuAt+GmMr4ijz7yohE+sXMaF8Oj7pdkyzLmwVTjYtRq+ifUSzVHdZSJEZBZhQXe0P
 /EFcmoK+9QK/HsH5zvrqJ7NZjJ02IO38BuxI4KTcT2UGhdIvl68arEqupN6N5P72gVvn3hzy1Co
 7Idm/G/0b2U2V/uTqTFfnVNH6Yn/hCtaLPhWvOW/I3AG9kZgZi8c8lcAt4jrBNQBiqlbfNvguyq
 ughYCgZ+FHaNxjJRDj2s8JnqbAEwnyWbW6TGhaVgU2IV0wq4y8wdIWs5SP3QkL6LBQgXA=
X-Google-Smtp-Source: AGHT+IFTLvkRHFmi5RmRwxkXkyy/0oZegD98hrjxrrQ2Kav24r96U7XzPKr5PR4HUSWWv22BlUxydQ==
X-Received: by 2002:a17:903:11cf:b0:252:50ad:4e6f with SMTP id
 d9443c01a7336-2902741d0bdmr246341255ad.54.1760325434948; 
 Sun, 12 Oct 2025 20:17:14 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:14 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:52 -0700
Message-Id: <20251013031453.566526-8-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325435; x=1760930235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSYMdQ4PNkCZFepJ9SCuGrO5ah5LMAp0dfeGbKA/WQU=;
 b=R/U4AgXnytVKxgMg7RYHWKXNuGnfnW8RjPx+my3XWqtR8TLoXeHD4BHdxBwyZ02eh3
 1h8gEa+Yf7VgUzGQbV2vC7oXKKjA9ZwZNZQ/EPD40CmQfvYg6fSM+mJOuI0wIKEKm29O
 KVF52F1u2nmFepTecnN3EGn5diGvhNBsQAZTh5QzPPL4i1eW5+fkWCb3OwzWfmL3OWf3
 b33wtqcaBLHE4zzbR+27HoKnoOR95YBQsEKOkWnfRyM5NgCajg8U/S9XWeXr5aDTBZbF
 AQ2ou3ksnoYK4wVq2QolT319dWZ0M1xODTa2XuUrypPxGNpCqnE2Jq8+kL48OGCQXkIZ
 gZNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R/U4AgXn
Subject: [Buildroot] [PATCH 8/9] package/fmlib: bump version to
 lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/fmlib/fmlib.hash | 2 +-
 package/fmlib/fmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 7293ecbc07..4f2b3d4d46 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  491315e35fb8d411305f4e66413ee3fe0e265f9cc8b5f27ec7587d15bf79991f  fmlib-lf-6.12.20-2.0.0.tar.gz
+sha256  4e39b3a756d4b53ab58b9282ed55505e69c7a79d8e79d5c9eb953d931ce7cdf8  fmlib-lf-6.12.34-2.1.0.tar.gz
 sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  LICENSE
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 14bcca5e40..e5f4f3c820 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = lf-6.12.20-2.0.0
+FMLIB_VERSION = lf-6.12.34-2.1.0
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
 FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
