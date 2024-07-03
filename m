Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F31C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9227B60BE7;
	Wed,  3 Jul 2024 15:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlOg_yvQgHj9; Wed,  3 Jul 2024 15:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E5360E87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E5360E87;
	Wed,  3 Jul 2024 15:14:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA1A1BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B67D415C6
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXghciiJMome for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDF7E41589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF7E41589
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF7E41589
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:14:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-36742cc9c12so3622038f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019657; x=1720624457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNvmZHhZR4nT7dT4ZYAxqiXse/za2aShk0DVdD4xWaI=;
 b=ZY6nZHRCFGPcf3fIxm0JMlavYYSpiVhPbFvWCFR8OjmQGqmcgcdF98TKTzxpf/dtVq
 vJ2Hb2HaSa3yUXjA+suFbuAPcDNqN6LJ/8kYq79VwZ6RKSHVfQimqmAH35nS5OsxZfuB
 8PdQ0SjB+FDnpc5x/L9uKeuZO85NW7T+umNuqBLNGd6c5QTihEe22jXFQzw4TPGHLBed
 p6adUA/90dzwOLErDUCjkn/Ykg0yGag/ujvbCweZ6gDCVuhSqCAQ4UkAVwE+csdQaCS2
 xQ66tzeqEF6ylUGLSbJ2vZ5+eii1sqjqlGEVlk+Pwl3SCvzcZRRlgJ2g65BrJ5ZFDSWR
 KAeA==
X-Gm-Message-State: AOJu0Yy0u4gyBxFpkG4C5gnxfHYtRIuAt3UsWxsYn0ist6eyGBrbWBhd
 JpcOysNtTrLofabfAgcJntLfCtkpCsYCqadQ2BDBsFBubGXcgiqAywpJFiNvV7vjW8mYAj+CQfA
 o
X-Google-Smtp-Source: AGHT+IFwq/hWQq8K7+scWuUxe9Q8dolEk43dL/RU2hOabyGiDUSe5kv+m++SzuI9ZQmoaz42P0KV8w==
X-Received: by 2002:a5d:6205:0:b0:367:4dc9:efcb with SMTP id
 ffacd0b85a97d-367757305c6mr8314408f8f.70.1720019656752; 
 Wed, 03 Jul 2024 08:14:16 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba2dsm16176620f8f.73.2024.07.03.08.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:14:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:14:03 +0200
Message-ID: <20240703151407.1827264-1-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720019657; x=1720624457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNvmZHhZR4nT7dT4ZYAxqiXse/za2aShk0DVdD4xWaI=;
 b=YRL4G6/ZAxJcwmt2zuF9UmeTWkf0/8GWF8bvRkQMVmZJiQVKkHznRQjLNRedrpFw2P
 cPHL7cxccAv4lv6HjGPdST1bdKHgHLcX8nVUVAgA8rk/6U9tNOQ8aPB8jKu3vKdSyCl2
 NdNs1ATKvKqF93NxXnQtdvWue7Lvq/7CB6X31ggQPaXkGa65onkBC+hkH+TdiJ7RmdJo
 8c7E0z1bFOuQsGhH7syyUjd5jobecIwB7hrbnIuErJeR04Cg+izaszUVrqayr0ih3vim
 CbxnAwiKQQ8Yz7xqla3tC83BZFW43Jw1Rv2OA5iCf32e9tS/xKtmM4qU7Bwxnw2c3r1k
 U4rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YRL4G6/Z
Subject: [Buildroot] [PATCH 1/5] docs/website/news.html: announce LTS
 Sponsoring
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Although the next commits will also add more information about the LTS
sponsoring in other places on the website, link directly to the landing
page on the Mind website.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 9abdf8f720..7e66d02331 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-euro"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">LTS Sponsoring announced</h4>
+      </div>
+      <div class="timeline-body">
+	<p>We are excited to share that we have launched the Buildroot Long
+	  Term Support (LTS) Sponsoring Project!</p>
+	<p>This initiative comes from a place where we understand the critical
+	  need for extended support which is beyond volunteering. That's why
+	  we are calling all Buildroot users and enthusiasts to come together
+	  and join this initiative that's shaping the future of Buildroot.</p>
+	<p>
+	<p>Find more information on the
+	  <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+	  page</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li>
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
