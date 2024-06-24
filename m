Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48626C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F065781D4F;
	Mon, 24 Jun 2024 09:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKRKWlFl1rv2; Mon, 24 Jun 2024 09:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2A2081D46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2A2081D46;
	Mon, 24 Jun 2024 09:43:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC8B1BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF6C40722
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rMb93GR2bbr for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FCAC406D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCAC406D8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FCAC406D8
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:43:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-421b9068274so36163845e9.1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 02:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719222179; x=1719826979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QokwnwR1mnaUsm3WyuJKOYYFx5ufk52a1Oghv3lGId8=;
 b=ZhJm6Swv2B9mKXNFOgURODWGDU3A0rBUeloXYkKmFOHIPFPTaLjdl9AHdFeF/WV501
 YGf3DcIwt+smLNf3Qj/dTW1JBSDM8uKScCkT37w4YSg8jbrw+u+6ZweEcoN4vwYBxMrK
 yurw5hEasezg/8CNeEVanPInJfX0wfqSLBX2sWGUxxVnigDmJY9OyFlVpnnBKmeWeFxe
 Xawv11l9YkYFSl4PCz7p7rRNLMNwbjEAXpW/EN0AmopW7MRSzhfjzjU4qTx1ygUlXoFE
 Y3MR0TC/83H2M6K0au17wwrYt6m7aYqHiPDnGYxyEVoYpbN7AICt31QUy8AGvVOigtHr
 ce7w==
X-Gm-Message-State: AOJu0YweP/qjsBdIbf3i+5iBJlQD3lhzJiq6AzLaVdGYVLBLF4iPIwh0
 qTi1YTHOBvPzQ89p95Q7rHGpTJF3tKoCBHtk+9MsbuFW9q4z6CtSuzot9Z4NPZJn3tRLP23TelM
 n
X-Google-Smtp-Source: AGHT+IG5PUEy50C+D7Y15mZ1qt+4jqYhAhl/+rpK8Me0LgCHqx8KBExe/xrtD7LmP64M92vE52iuQA==
X-Received: by 2002:a05:600c:35c8:b0:424:8cc1:3ed9 with SMTP id
 5b1f17b1804b1-4248cc14016mr27471495e9.20.1719222178933; 
 Mon, 24 Jun 2024 02:42:58 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366e88c0c38sm5148383f8f.32.2024.06.24.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:42:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 11:42:46 +0200
Message-ID: <20240624094248.22807-3-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624094248.22807-1-arnout@mind.be>
References: <20240624094248.22807-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719222179; x=1719826979; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QokwnwR1mnaUsm3WyuJKOYYFx5ufk52a1Oghv3lGId8=;
 b=LFgjCrU9QaXXJWOphc+ync6+GkXAES5w1zSwF0x897yB9eA3kJyCGZA/eUyLb8mogd
 /QxBEVi7g6acQHGk5A1cSmOLVFxAuzsj0iqyqr1L2Q9A86m7pY/+V+3ffUkG5l9sWqRo
 MO86FP6bJHdMfbaulaZm+XQZzhJiSHGmEGlKn415keiKyUfP3+9rgMLGReo+zNbI48He
 BypkTyNl4t4QQIqPpH+a+2XxZ0gv1nN+HzuCkSFcA+ljlTsEsWBpDw77C5sX2OOOn6A4
 B2CvammCtHBCpmku6+B6q4dp1/JsCE3Y92L+8dCyfRHERbAMyKDYXr8ug096JUNxRvdm
 Z/Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LFgjCrU9
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
