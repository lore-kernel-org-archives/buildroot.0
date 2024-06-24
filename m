Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD31C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A1881CDB;
	Mon, 24 Jun 2024 09:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-WV0GPQcET1; Mon, 24 Jun 2024 09:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6022581D47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6022581D47;
	Mon, 24 Jun 2024 09:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACCF21BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A50CA81BD6
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPBdddXrb6aj for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:43:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EE8681BC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE8681BC2
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EE8681BC2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:42:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4217990f997so30527105e9.2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 02:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719222178; x=1719826978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29j4XQghTtZcKwSHgrsKmjecI25/ZypbpqMD8AlM+DQ=;
 b=pxklulFUYfiSa7Y9IocyShxTkRrbl5Cuq/rm8eRDY3ma96uqzA0CeY0eu1Dqh3RON1
 cJfSX+eqBGXStGuGJ1VRJrCgpwhBnHEUL1CVhSOWs0aUua9dv4unE1tT3m2MxzrrGsmJ
 oaW0aQbPRmVmKsAINJQZXK2ZQroat9PE8y20JNW0PY2yzxJrIHRA7tGP7z9Iy9L9ue49
 K3Ppf5KqerfO9Zf6lpdbcHGpQuYbsf+6y/9vybm3QpT2/IoMSJYQSdTGiQ346Iv77sA6
 8wzQ+luz70yrh3pO2En9/cDHsGT3hosAwul17DZpthaDjLuoSZ173I4PTgE326O7lDIp
 D77A==
X-Gm-Message-State: AOJu0YwBfzkUACFSMWr2vy5Ub8V+FPSdw8PG1bvLcbmX/8nUVj9joe91
 jD+s41y537l3C2/2Gu1QPeA13JYktjoJlkOvM6AkZUTpIpLiJHEuYO11YjMeuTqvzyu/2jpUFWC
 P
X-Google-Smtp-Source: AGHT+IEz001DX5ZqmcP0cRVcQJjSbJG0+pUsOVCQH7yCz94n/yfJ6Gmxg2aXl16x6ljM7WJV6OcdVw==
X-Received: by 2002:adf:edcb:0:b0:361:bd3f:f89b with SMTP id
 ffacd0b85a97d-366e4f00a89mr3234984f8f.50.1719222177932; 
 Mon, 24 Jun 2024 02:42:57 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366e88c0c38sm5148383f8f.32.2024.06.24.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:42:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 11:42:45 +0200
Message-ID: <20240624094248.22807-2-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624094248.22807-1-arnout@mind.be>
References: <20240624094248.22807-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719222178; x=1719826978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29j4XQghTtZcKwSHgrsKmjecI25/ZypbpqMD8AlM+DQ=;
 b=TpmTgcuL0JCukBSxBWeEUT0vLyBt/u8aNV0QjegVWFUC9p8M5omA+wJHvpWIVr+B0F
 1BlybnRWe2it1aZ6wk5D8KtFVeKkLuAJeLpQ4HTz1TLek+tjxSTtif3S3oeJtV0K/R5c
 pGYVUlz0t0ngPVnuLJqnRvR9PYCMw/Dof3+IcBYhWp+/ahnuxFJmbzArLs7CkNlag3pl
 oBwrcJmQrDMRPOHcEwdeYs+hm8PKiGTOJJ5BAtKRvs9yfUFEonjlsR8RiTfz76EGI2zI
 6znV7Ohip8Exl8RuXlDMWpnNEo9QtgIYuk+wq9qbC9gXfiO7tfhu1UQOn8gFSspe7n2U
 QePA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TpmTgcuL
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
