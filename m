Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFD1C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2463160F02;
	Wed,  3 Jul 2024 15:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjmtXMyVMH56; Wed,  3 Jul 2024 15:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C34060F17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C34060F17;
	Wed,  3 Jul 2024 15:14:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55E531BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4278741591
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9A8l8nFasUq for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C30D41589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C30D41589
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C30D41589
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:14:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-424acf3226fso42779735e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019658; x=1720624458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QokwnwR1mnaUsm3WyuJKOYYFx5ufk52a1Oghv3lGId8=;
 b=d6X3sv3y9pnwTcQxe+jvKPANzGoC2PNhbueeFz1Obe92l4xPeFshTWY8E/waBzv9aq
 dth+QxiU1S2dr5rXWgjnzqM0fwO7GeL+5gNc4H1d5vWYDApVWDkYaHOCpIDrGVpjUGF6
 Oxf9ZQxSgGyJB/7PbD8SnQjrid2Alhvrmiphkfg2ezGr8Rdtsun1AQsXpjdQf2juGkVA
 J7AOdc5UmPe4a0yHXH37Uge/mrCy8/yG0cOu1b+scd8x89kXeYe+yYrDPdalRP+YHqUI
 Qvv1f+qkCO9/G5YjH4EQgueo9TmWBDUzK6ZC5WQkJDdsCHIkpv4tkB6WlH83kBf+XHp8
 SD5w==
X-Gm-Message-State: AOJu0Yy9NUWxnqgf3PHMSCpgK0BvGCMk5Fmj9Rej7Kxu+uS4gH7HhvXf
 ZYwseWgHfD1YyVFXuHR1XTRRz/SG+AX9lAbQ8mdNCmItcEpwWEn3aQ/r4XoNMC8FcydMHIv5BjX
 s
X-Google-Smtp-Source: AGHT+IEQYtkRICLaG7KYTy9SG/UhOvUt0lGztnczUU4PcgUQeX1zNEPsETG+7yfSUguVNYztUgp+tA==
X-Received: by 2002:a05:6000:2ce:b0:362:40cd:1bc with SMTP id
 ffacd0b85a97d-367756a9d4dmr8792114f8f.24.1720019658327; 
 Wed, 03 Jul 2024 08:14:18 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba2dsm16176620f8f.73.2024.07.03.08.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:14:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:14:05 +0200
Message-ID: <20240703151407.1827264-3-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703151407.1827264-1-arnout@mind.be>
References: <20240703151407.1827264-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720019658; x=1720624458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QokwnwR1mnaUsm3WyuJKOYYFx5ufk52a1Oghv3lGId8=;
 b=cbRrep26KkemFNmMWtz8mFr41058MIOx74Ct6Sm37u5oP1HehQkYAq44nbENkE4UCQ
 qlGag/1JRqWvEY1bfJw2IayX/uhDhJeVK5cDB4P8ePwe5usIjY/f2H6AssgZQm7Lbrvn
 O7QlLemN9GzBMR67HN1mIPvEXaSi1nk+7O0tGrhxlsBeBOdYahyCvCaTebZ5kJrwqOnF
 PGbmuYrCRG9FT5Trzs9ZX0b8LAvv8ha/vItPsgGrjIMl7M+speze7qlUIovQwTGkhaNX
 4n1sH3lqcIC0Ok3aXIr9XXgyUeIPhv2KgA332eOA9xC6qB2OL1HBz8MEh4MJ3S71u+ig
 +vCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cbRrep26
Subject: [Buildroot] [PATCH 3/5] docs/website/support.html: mention
 sponsoring opportunities
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

Add an entry for the sponsored LTS.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/support.html | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 0bcf365332..a94e5ef780 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -94,6 +94,29 @@
     </div>
   </div>
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Buildroot LTS</div>
+    <div class="panel-body">
+      <p>Buildroot's Long Term Support (LTS) branch is maintained thanks to the
+	<a href="https://mind.be/buildroot-lts">LTS Sponsoring program</a>. Its
+	goal is	to provide three or more years of stable support for your
+	Buildroot deployments. The success of this venture depends on the
+	generosity of sponsors like you, willing to make a change and ensuring
+	the longevity of Buildroot's reliability.</p>
+      <p>Prior to this initiative, LTS maintenance was handled by volunteers.
+        As a result, it was limited to just one year. In addition, it diverted
+        maintainer time away from mainline development, slowing  down the overall
+        progress of the project.</p>
+      <p>Thanks to LTS sponsoring, the entire community gets access to a better
+        and longer maintained LTS branch. The sponsors get access to some
+        additional perks, such as selecting which packages to focus on, reports
+        with information that is relevant for you, and direct contact with the
+        LTS maintainers.</p>
+      <p style="text-align: center;"><a href="https://mind.be/buildroot-lts">Ready
+        to sponsor?</a></p>
+    </div>
+  </div>
+
   <div class="panel panel-primary">
     <div class="panel-heading">Commercial support</div>
     <div class="panel-body">
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
