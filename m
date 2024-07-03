Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C379BC3271F
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A9460F0B;
	Wed,  3 Jul 2024 15:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtZ3_dPWt6sn; Wed,  3 Jul 2024 15:14:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F73160E87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F73160E87;
	Wed,  3 Jul 2024 15:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACCC1BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0640F415C6
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGpVd0it-PAS for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D06C441589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06C441589
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D06C441589
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:14:22 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so732196e87.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 08:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019660; x=1720624460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCmGskQcKgFh7kNREMMMNAZ9XusiEV/hdpHGE6Yqm7c=;
 b=U1R3nSWsJLlgfXJU068NMPY0YPLODB7rQV7y2NJGCssyGkkkOf/ZF9KfQb2WEAKnAm
 iNTDUv6cOqcz+LLTVLbpxvVgAizVMfuI9OkbJwNRI0B9ceg49xzMF31YV+XyO7tGUMIw
 lc5qJ1GLzLg+Jv/OSMyfdnhme+sNs2fNGo7DSVGQh3X+kre7P4iE6MQwvtqv0JQS/tFd
 3lPzxnj7ibwjEIgWiQoqg6SRuOS/iy+HEACL5mOfA1TsDGJyP/BRavsfwqzb7V07/t85
 /UmnQOlxZmEFZ24Zy1E+u2si3QE2i0+hS0BSHgW9hNNaAItsUb/wdaMbIC3RxmUT06GM
 fRQA==
X-Gm-Message-State: AOJu0YzP2W0nM+lXFB7/xbotXoRyiu+wXNxCANjxZ2hSfqJWQau8vSi9
 3hST9Y4XKh/CKIB4U1CNrdO0gCgyuQs3As4euozfIsMjqGsuNdHqvnYQzReD5ULMS1urYxCotl2
 W
X-Google-Smtp-Source: AGHT+IEfpv6JfH51qgog275zdWCP6bZpsD2nXdmcllS2M6X6YJ/+O0MV+HQYwI9NbyHVvkppXqhctA==
X-Received: by 2002:a05:6512:3a95:b0:52e:7f6b:5786 with SMTP id
 2adb3069b0e04-52e82731de7mr7177935e87.61.1720019660285; 
 Wed, 03 Jul 2024 08:14:20 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba2dsm16176620f8f.73.2024.07.03.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:14:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:14:06 +0200
Message-ID: <20240703151407.1827264-4-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703151407.1827264-1-arnout@mind.be>
References: <20240703151407.1827264-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720019660; x=1720624460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCmGskQcKgFh7kNREMMMNAZ9XusiEV/hdpHGE6Yqm7c=;
 b=hyFMJN2KTtgFesD4mpX7rRaGB04eItkYHAIThqWuEJVX0p9N9tkfxKnnwv/9lBGbQJ
 PFzTJ68hmcMl5x2hX5MUpN/wYcCoh+3PnaH8mJlHE6/a+X7poGD3g97R9jhZZNSI3VUs
 Br9P3HscCW8hP3F+5CJaTHGQFNPfM1jYDtiR++2XMxe/IVrcFhzp5xuyUzvCSLH58QkQ
 0Z2F108b6wtFEogoyWxJmEB+G5F43TlbVKbzZiWPGpDKL+PuwVII/F/W//ptyMlRg6eO
 eHifWywPPi1AZ4zJ8Cv3p+GiH2tRvKE3tO3y8qecvt6uc/aOOv6DA8k2PdJ5eRNU6Y2k
 Z/wQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hyFMJN2K
Subject: [Buildroot] [PATCH 4/5] docs/website/sponsors.html: mention LTS
 sponsors
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

Since the LTS sponsoring program hasn't started yet (it will hopefully
start in September), this is just placeholder text. The first paragraph
will stay however.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/sponsors.html | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index a90ca6c8df..2e9744884f 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -4,6 +4,17 @@
 <div class="row nh"><!-- current sponsor row -->
 <div class="col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
 
+    <div class="panel panel-primary">
+    <div class="panel-heading">LTS sponsors</div>
+    <div class="panel-body">
+      <p>The maitnenance of the Long Term Support branchof Buildroot is
+         possible thanks to the sponsors of the
+         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+         Program</a>.</p>
+      <p>When the Buildroot LTS Sponsoring program will be operational
+         later in 2024, those sponsors will be mentioned here.</p>
+    </div>
+
     <div class="panel panel-primary">
     <div class="panel-heading">Current sponsors</div>
     <div class="panel-body">
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
