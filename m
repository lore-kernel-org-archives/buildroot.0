Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7A3C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 17:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA0E60669;
	Wed, 24 Apr 2024 17:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxvqbEhaoaa6; Wed, 24 Apr 2024 17:54:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F93060A99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F93060A99;
	Wed, 24 Apr 2024 17:54:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3241BF86C
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 17:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55B9560A55
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 17:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vU-Ws09dqkT6 for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 17:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CF7660669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CF7660669
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CF7660669
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 17:54:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41b21ed1aaaso1097475e9.1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 10:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713981243; x=1714586043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q/Ut40V9tyqi0BxHLpqVqzut5rlCk9s67ZjDKMhkPPE=;
 b=bhG+bQI3MW1mUH0b9ah8hxpnqB7mMgoWq0OiNvHwELx0r3oENEnnHXVMeR1EEab5F4
 pGGPHdE1QtoMQZVyTipUFU4RACvSb2Hgl6274t94I91ZD7v2/D5bzZJ6Pe6tIqS/y6WB
 NObpJfRcDkLaCZDhZYIrcRTU08RclwYPlv6uiZMuEW7mbNruFYlAEu7DqNhM6QB1bKgC
 mlewkho8iEy6Fhr1hYWl2Ic2mhGUHe45920x3TnwtIAEkHuxsqIns1h4LkWY8E8XmJSg
 CiatB9qYyNFYFUU2VhckZAdQ5rUupXX/mrfyY0fT7CJ878obpvQDXmsyaohyi6Q8W0Ca
 qR6A==
X-Gm-Message-State: AOJu0Yx3YEKjobO6ktELnGTD45PrIjc/2g0yt2hrkVnONra6WNbfsTc5
 aTsn3mDZ5m0AVj3d4n975jED24kBg3UIsjSsSeSH7ZF4I8/HdLJMfojimjz0
X-Google-Smtp-Source: AGHT+IG7YzxV4rWYU5R7v7PfOAZahgDES3SaXdIFJRy45q4lKwSrzRlDM1IusZOS9lQaMLABg5NloA==
X-Received: by 2002:a05:600c:3b96:b0:418:d3f4:677b with SMTP id
 n22-20020a05600c3b9600b00418d3f4677bmr269630wms.17.1713981242228; 
 Wed, 24 Apr 2024 10:54:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ccc6:3e01:4360:2c30])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm28664186wmq.4.2024.04.24.10.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 10:54:01 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2024 19:53:59 +0200
Message-Id: <20240424175359.37025-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] .github: add a pull request warning that
 explains the mailing list workflow
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 .github/pull_request_template.md | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .github/pull_request_template.md

diff --git a/.github/pull_request_template.md b/.github/pull_request_template.md
new file mode 100644
index 0000000000..319e67d861
--- /dev/null
+++ b/.github/pull_request_template.md
@@ -0,0 +1,6 @@
+Please do not submit a Pull Request via GitHub. Buildroot makes use of a
+[mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
+See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
+
+Thanks for your help!
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
