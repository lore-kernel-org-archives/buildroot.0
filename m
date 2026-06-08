Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7ECCD8C9D
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 15:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3341361BC3;
	Mon,  8 Jun 2026 15:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2KMGtEkASAk; Mon,  8 Jun 2026 15:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DC561BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780931102;
	bh=QJXgfCbMyHg2wqCMJl39iTVvsWjSglPLqTVRZOOaZak=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KR9Af5nCZRFOZCjb36trw39P/5DY3y9DRDQD+zTYHUJ8vQm4IqCo7L4ctS4P/U5HI
	 aKPG5Bt4Q5lqbVWzg20DifRH23EHn9XgT7ooOGycXCQ8O0tz62Lkr3DKLE/auOq4uT
	 QkT4fG6xnHOsnIcCyzyxHyCahqTR58bpDoQVOMxVJG/EyVvZA4z4qauMB07lfx3Ks2
	 X0BPtNCeHL0HLuWpH70xPlNXkjx7KBqCjVf3goj+ll7CwQYdQ8kdOW0dxEnRbASeof
	 6FlgyHFLXhp6/a1xKzrEH07sNIahC4itN9zHx1fprtvZff7xP3DNFZoDAOhD17FnrE
	 MYAAFnfiHgJxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DC561BAB;
	Mon,  8 Jun 2026 15:05:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1761187
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 15:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E215429DE
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 15:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNwX_GPQAqAz for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 15:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54669429E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54669429E0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54669429E0
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 15:04:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so2963837f8f.0
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 08:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780931097; x=1781535897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDHM+ihV4LlL7txhjNukrnWSIuNjaSB6D5D+Li+yIgA=;
 b=Q+baNQNi45cHY7uu094cmqpxt3Vva9zCQx3x501Yu30vWxb0aSm7y2+vruKgFRLIS6
 977xScuWoCJcvCzeorAXt7bbTmWPcYYXeaZ22A/LftVYOKqBpMBJG3TeVQmKswaDV4Ij
 K8QLLHsTuCHA/bzEFx8bTWOSz3JJnby7oJupuMdAzld0Y7lMx82Et4nn5UzBV0QeEgVj
 jWRDPDHMGtYzk90tHxNKrxknvFVFN5GUEcks0nF/Q+qMJA7MKBUqUl3vjL0rCJxp30BG
 MiDNjuaetLmo4VtZ3JMl6F1DKIgFEWYQAbMbtA1G/czD/06xz8wFUATi82QBQCD7jFpm
 NMFg==
X-Gm-Message-State: AOJu0YyVHcqDbxm67JlHzOQ2r39Cb2ufuRxiwgfG7Dnj3yb4W3cKuKr0
 r0GfjZxfIs/y4NjWHsH8XnN0Obs2r3fuG3xfeyX94YDBv1PIgc3QyyzgoDMB
X-Gm-Gg: Acq92OH75aIqDccAu7V+8Q2scdminiSmZg2LI1RMZ0MjiKXhchmOkaYfJPhwkqgHPkA
 v8V0xaUKAuEg+34NZJRHUpD/kaQIzJvDBGCbIiewInEFBweSTBWNdv9CLsnDqiHWJMLWwU0Z51r
 /DKsfXTgXYNWs/Jx0qHkyGo9XLujj7pnjWQoRoBrXZGogXxfT4sgb5yJijvtmf+yF3OlXwBpn0S
 r5Yvii6KU/3m1XIh8+2o2M8G2AeB4kF0b/uj90A0pqgrCggfHy73I32k7l5Iu2Fl1+DzwjywkJA
 cRwqUOLpyE/TV/+tpFw8FtEPVzXEvfIhvSl0pwzUaGi/PNiRqMtbtNFi8ahmws/USyJo6d1Kqbw
 H29dLSogaJPRGU8kX+clKfcKrfKEKdUlEA7J4Os5fYlI2cppr5FL4k6Qr9/B9Z36Va+xTd362Y4
 C/Wo3TNOKRHQPgagh1PFckLYv3AYHXMxX+Rs8x5Wn8kMukjBsm
X-Received: by 2002:a05:6000:1861:b0:460:3234:77d3 with SMTP id
 ffacd0b85a97d-4603234789emr23894118f8f.41.1780931096960; 
 Mon, 08 Jun 2026 08:04:56 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d69sm96313123f8f.29.2026.06.08.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 08:04:56 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon,  8 Jun 2026 17:04:43 +0200
Message-ID: <20260608150453.191574-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780931097; x=1781535897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DDHM+ihV4LlL7txhjNukrnWSIuNjaSB6D5D+Li+yIgA=;
 b=DMCTWTbxuAhyG8w8a6bgKUqNvoOgjwVuJtbe/XwzHNoN3aIn35T9dVzI3w42tYT9rB
 ZUYPoY92IzhC6UjwWZmAYFJmamcQPhK1RTGnOpNAoikrzR/6Ql+q6LcDqYv9BRzk55Oa
 ilaV4U+QWjFPaUFvDvYJi+2g64JZiqJtvGpbFUXQmdro23t3Ohzxu9tbxu/gGsGosn65
 Csf88VVKpegKDyWbWZgU6mriQatyJsMXNDl8W9K06a7xz8m01jrt5tjgArAPrh+I+cS4
 4b3tnQibE7jy4jBaGJTwWZbMubh/8wMqdBaIXquo/SObHsPrC+RgaYqd4WFZpwApC9oq
 XK8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DMCTWTbx
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.57.0
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

Changelog: https://github.com/Canop/broot/blob/v1.57.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 56168b5a38..629ce4bc66 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  dde0da41fe9ee0f03c7f2895134360a4d2e003ed1ebc726c7394009dd9ad0f07  broot-1.56.2-cargo5.tar.gz
+sha256  95f264433a7a6dee9ecbf95e62c7d62adc012149592314ebe4fb75d60fcef992  broot-1.57.0-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index dfd9629d12..50ab686e82 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.2
+BROOT_VERSION = 1.57.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
