Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71344C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ADBE81BC2;
	Mon, 24 Jun 2024 09:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py7zAEdjeWDY; Mon, 24 Jun 2024 09:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2455281BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2455281BF4;
	Mon, 24 Jun 2024 09:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52E4E1BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4073C6089E
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATfJJclzeb6b for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1D616089B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D616089B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1D616089B
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:42:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3621ac606e1so2995586f8f.1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 02:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719222177; x=1719826977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNvmZHhZR4nT7dT4ZYAxqiXse/za2aShk0DVdD4xWaI=;
 b=qjjd2zkqAEqPo1Ex6D2A8ExjQkTN6arSd5ZaU9QKnLuyiLNpGcfdPrPoLFnOGdabWy
 afw15GbeuYIHlxpmFD7c2I4ZePK/jbvJB/hgMVSrlmf+26IZAIA7NCZ5gIUYsJMefFCW
 M08MADDF8WYcKz/0luHYqbqHSLeKmDWuUAjfNyO8i0iVIh43wkNMcZV6mDuc+MqNTcCw
 OkJro5dRadO9eNHY+A0gbDDzJB0tS4J5w+Lu1BgxN3zHPNE5CAEf8dIKwb65IgM7Px60
 +HzJK32f+e3keZLdgxLEFerWkE4hWkuIBO/ASHb3pDBuIPc/7kZjRe71JxW61muUI+sb
 ylbA==
X-Gm-Message-State: AOJu0YxnHfCcftL1sH1CaFXEMbyouSow6H29vTd2wOPkSa8gNNrq5cTR
 Tu7oZ3VYpfwe8b9YGXCtj/ouy20ETqmS3szjHuDQUlU9be8BUpuYHrFc+wcug4xcG8AXAoov8pa
 N
X-Google-Smtp-Source: AGHT+IHwKKvs+JxDoIVaEy/IM9nXxCmNLgQ6Eyzj89KgElBYW8i2Ny+Q/jopR6hVZ9K61vOgyJuqjA==
X-Received: by 2002:adf:e789:0:b0:360:8281:71ef with SMTP id
 ffacd0b85a97d-366e3649591mr4607028f8f.4.1719222177171; 
 Mon, 24 Jun 2024 02:42:57 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366e88c0c38sm5148383f8f.32.2024.06.24.02.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:42:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 11:42:44 +0200
Message-ID: <20240624094248.22807-1-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719222177; x=1719826977; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNvmZHhZR4nT7dT4ZYAxqiXse/za2aShk0DVdD4xWaI=;
 b=QbvTELOCB94sSXdvCjktrSyyajGofEduscFEfnkD3aC82bBApNWX8A28jQIMCk+ySh
 1LgGILiv5emZU3pPMus3EMdJtdG5Hg5NAKDa2IfBd3e6/KvChWtKEtNuwodxqBQdXzrF
 8AGSyJXAr02BHa2dZQuLpoG83cePDgUQQCySyh/w2uF/DPIyuYWuZ42lWpq5TwhH4tAg
 ANZxddJY9BT2A84oM+A85v1MlRo0l7yHg2sJhAzDnen4IJ1jwCdAWfmXTh9307q2p/XO
 gW4+G6EmpmUsh2o1aVuvlxNlcO5lrFkAaJdYlotumS+OhPW8HuN2JhcfrjWmW+XHPjE4
 k09w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QbvTELOC
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
