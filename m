Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8672DC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E543160F03;
	Wed,  3 Jul 2024 15:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO4D3oKaDOZL; Wed,  3 Jul 2024 15:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 995DD60EFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995DD60EFB;
	Wed,  3 Jul 2024 15:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0C031BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB5F660E87
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI9XFokEaYvB for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A602D60BE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A602D60BE7
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A602D60BE7
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:14:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so57130f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019657; x=1720624457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29j4XQghTtZcKwSHgrsKmjecI25/ZypbpqMD8AlM+DQ=;
 b=vhLkWErTngLmXJW+6Wp5LL05LwEmZIqf+RrWlG9hrlVHfguvw2GvTQDOC5au2aUIY/
 bSA/ETF+TV72tG+OMEYrjNVJvfUfHmnEkGtojnJLLfADHMhVLO/7y1vLqbP6JWT/iIoJ
 3XUdehvvrdx/fA26z5p/CBuWLt6C30JKD1eiGb02btWvRAIRilFohzV+Bkx1hRkoCD8+
 TW2CiRjH+5cBtxdP9rcvbiWXGedswA6bilEUH+AKnHSRAYYZeUr46PpZGIjOtRjXNUCM
 Sq9LDU1dB3z74l8ozPV8cKpIt4iQa3N1YHLaVsW2IGPtPQ95FQ0DUNx13BcUT/THfV1e
 Cevw==
X-Gm-Message-State: AOJu0YwfXKJ7HqNO4AYianHXIc20/ARbrtt0jdGthRHxaeN2rOEMP896
 6pUfpVwftKuJxaq184OkTrqk3hYU2yjAkcb3HaHHySjYcVE76zvmmSDAai8CpRBH9yQNiqmkLCu
 h
X-Google-Smtp-Source: AGHT+IEOsamza1XbKB+fVv+8o1UeBcL6mE1KNVsuccZNkPaaNDoYDWwopxKQNGgtdK43vfPjOmbXhA==
X-Received: by 2002:a05:6000:1fa8:b0:366:e982:c1b1 with SMTP id
 ffacd0b85a97d-367757215e7mr7094299f8f.48.1720019657554; 
 Wed, 03 Jul 2024 08:14:17 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba2dsm16176620f8f.73.2024.07.03.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:14:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:14:04 +0200
Message-ID: <20240703151407.1827264-2-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703151407.1827264-1-arnout@mind.be>
References: <20240703151407.1827264-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720019657; x=1720624457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29j4XQghTtZcKwSHgrsKmjecI25/ZypbpqMD8AlM+DQ=;
 b=P6qD24Ia15liMt04rfe3yQ9ZzWtBbEHxGdVGYYilaxU0gT1hYc96FHBs+ZEaQ3PUNw
 A9FW6e0QzYyb5tJnl1/FhUY48KOTAI2/U60sBwIyCB6ivrTwV6o6ztqNGGEiv4I4lAfA
 wLQUQx/NvHbYFn9gmYP5Ezi1+5DGCRlKoRSsYwywYK7sXPPf/C0W1F8X/M6D6gI1NigR
 LMWbDUWMKUp+axPHxDF1UK2TBSRH1426FIB5/T4wNAK+TkjehXtyQDb69sA86DCu70mh
 JMZn3W7fWgmoAid/Q1hITRWWD5QjNFhyrJTuom/QNCu5XTFRElb7bhkY8fwUTSrDeCqW
 Gm5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P6qD24Ia
Subject: [Buildroot] [PATCH 2/5] docs/website/contribute.html: mention
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

Include sponsoring the Buildroot Association, sponsoring in kind, and
sponsoring Buildroot LTS (through Mind).

This may create a somewhat muddled image so we may need to revisit in
the future how this is formulated.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/contribute.html | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 95028ee788..52c30d60d3 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -7,9 +7,9 @@
   <div class="panel panel-primary">
     <div class="panel-heading">Contribute</div>
     <div class="panel-body">
-      <p>Buildroot is an open source project and you are very welcome to contribute to
-	it.<br />
-	There are many different ways to contribute:</p>
+      <p>Buildroot is an open source project and we warmly welcome your
+        contributions.<br />
+	There are different ways you can get involved:</p>
 
       <ul>
 	<li>Reproducing, analyzing and fixing bugs from our
@@ -37,6 +37,30 @@
     </div>
   </div>
 
+  <div class="panel panel-primary">
+    <div class="panel-heading">Sponsor</div>
+    <div class="panel-body">
+      <p>Besides technical contributions, you can also support the project
+        financially.<br />
+	There are various ways make a financial contribution:</p>
+
+      <ul>
+	<li>Sponsor the <a href="./association.html">Buildroot Association</a>.
+	  The association helps Buildroot with infrastructure (servers, domain
+	  name, ...) and organising meetings. It relies on money from sponsors
+	  to organise those.</li>
+	<li>Practical help: providing a meeting room for developer meetings,
+	  providing autobuilder instances, etc.</li>
+	<li><a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring</a>,
+	  a specific effort to finance the maintenance of the Long Term Support
+	  branch of Buildroot.</li>
+      </ul>
+
+      <p>All of these sponsors are thanked by listing them on the <a
+        href="./sponsors.html">sponsors page</a>.</p>
+    </div>
+  </div>
+
 </div><!--/.col-sm-10 -->
 </div><!--/.row -->
 </div>
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
