Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6879FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 18:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C2DE81E9D;
	Sat, 13 Jul 2024 18:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFg7_OxilzC5; Sat, 13 Jul 2024 18:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E0581EE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E0581EE1;
	Sat, 13 Jul 2024 18:30:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADD131BF3F7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 18:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F2581EE1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 18:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXv01-4mshH6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 18:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 954BD81E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 954BD81E9D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 954BD81E9D
 for <buildroot@busybox.net>; Sat, 13 Jul 2024 18:30:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42793d4abbbso20589915e9.2
 for <buildroot@busybox.net>; Sat, 13 Jul 2024 11:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720895421; x=1721500221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q1nMKtIfMD7jQPhhglw2+dhvJKg+MkS57RVvW7W41wg=;
 b=d8HYZCRv6sRc5DZvSGXGl3pAoAEzls6wn+bV1ZcY4QnGCRDi/fvbEIk06TdJyZjCTW
 w10WSqUTQp4PsyaJhwSVY2fYMjiQNMaJloVbmaB3CWhR5/Ar4fanf8q5NkjXkcXU6Y3P
 DM8SbvhzYnXIb7rVoHWe0YY7bhlhhsWhVtXJEgfsTi8RTtp3KaWNf21qKnbSnMsKI8W5
 bKDZC779kE+ZjKVG0Rluj9bHcs3xLa2ULjKngKnT0jOdAzzC0rkT2yCRx5qFvhE3rsuZ
 Cg+gjG79XlxfjBiYQQU3Tk/QvXZCmmkI+b0fo1N1EpW8SvBGG3SgH+92pn7JrDNEaGDD
 iq7w==
X-Gm-Message-State: AOJu0YyJ9fnZ5TUv33DMm3HdpD9QvfebVeHJmD06oxMUgTIu2TdGacGI
 XAwdb5chCTnhSqsRuDHgusGeh8yewsUhGb18fThftfy1yW1Otq6MWsQTZqta9r5YWsBsl7yCL40
 =
X-Google-Smtp-Source: AGHT+IH4ct1FLcXt/tGO+UUR6FFowOLZliL7rYpsVBdQjbRiZRIIGxzr/FKAQvA7mZ6rdTmN0lcEVA==
X-Received: by 2002:a05:600c:49aa:b0:425:7ac6:970d with SMTP id
 5b1f17b1804b1-426707f7e06mr95798335e9.28.1720895421290; 
 Sat, 13 Jul 2024 11:30:21 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm29977945e9.7.2024.07.13.11.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 11:30:20 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 13 Jul 2024 20:30:15 +0200
Message-ID: <20240713183016.129606-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720895421; x=1721500221; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1nMKtIfMD7jQPhhglw2+dhvJKg+MkS57RVvW7W41wg=;
 b=nkMAJVFtSUQusAL4IivnIL1HZzX2ZF83XuYEP0jD5NLB4S8EezHFNIzlHpl1jTmBf7
 3FTC0f38iH5ZJWTy0fGpusnVzFL1FSXIsnTpZyfzOoGJYJyORQhEFccbI1w3Ii1qm323
 Ijq+wDqj7EttblF30fJFougEwMsDN6WG9E2Xs207XKhWDqN9qY48py+WERWMrU2cL1/t
 scZqALdn8B3xR0Xi6fxrZm0BZ4k3bJJEpRjju0JaEy07cJvgDA3Cqa+gxLGZA9x3chCi
 r7UcbiiHfncXLRDFeHB/NZCcu8AOUJrAviorSnp2kj/8pTeDHK9jehZ0ZkGZyvdOizbG
 pf+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=nkMAJVFt
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.35.2
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
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 33bbad585..a35835a54 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c9018fbd69b825cfc706d8c40e9464be37e924ce07089933e92f4f931ccf0d8d  janet-1.33.0.tar.gz
+sha256  947dfdab6c1417c7c43efef2ecb7a92a3c339ce2135233fe88323740e6e7fab1  janet-1.35.2.tar.gz
 
 # Locally calculated
 sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index ac34ba0a3..9bf5322d1 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.33.0
+JANET_VERSION = 1.35.2
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
