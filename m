Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473E3C432BE
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 17:12:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F177161056
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 17:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F177161056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4BA760667;
	Tue, 24 Aug 2021 17:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tcv5xVKtbVw3; Tue, 24 Aug 2021 17:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3801760680;
	Tue, 24 Aug 2021 17:11:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E99B1BF983
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 17:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2436360680
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 17:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwpOBBFq292o for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 17:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 872DB60667
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 17:11:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n5so20013381wro.12
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZxXAghfrlqSmYYiGq5y7TZ7sZUAYYHij6+MHRQ+g3xc=;
 b=fFqm6sv5M6CLOSywK8hcDONjlv1Q1OkCZU2mMNNvaT+HBwv5kCwSL7jFz7sAkPrpk1
 H84+1Ew+I7DldSWGlDsugezjdSAYv1n0G+rX327W4zWfT5ln0RqSNLP8ufJKDfYVcs8/
 nEj204CGrguOgqaEqLYjfwaY4QMkWqcw7Yjg8DySBix3nmKEkROIm88k6m06whOZHFCn
 AoAKP9MzLPGnyWkD9EVfl2NwVadxQs2zwWn1274dAvwYaD7HYZUghKXxmepFCRJCnH5u
 4xsA++l45i4kf8fCtEBZJ8EE/l6muv0uib6KIGnikTZzvnh+9Y9yCrVnsC7wlgiSd586
 fxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZxXAghfrlqSmYYiGq5y7TZ7sZUAYYHij6+MHRQ+g3xc=;
 b=uShHW4IVXp5HiuCpxtKssjiiLvwFKDM4pgfOPozmgCzV2HAKj6FMQM5Nu/5XvMoA2H
 z/iAue5zVVx8PMx49NFB6bWoLUwRE9Pm4gXhSJ3XoW9ZjWvnnSiL1gfWQ7itlR4bmGdC
 SSJMPdFwTuN4zRj6kZKpmlvHpJPFmr/qU0tnpYfmaIHmonwIvGq48Cwnn+pgjhn74PAO
 5LAPoF2XDHAberLT+Ym+r0WPxhlqf+ZONrs3B5elgea3LO67OVOJpRnxa5hUs7Fc1vI5
 9csTDPpdA6NaxfbyqxV5Q3Y8mFlIX6hE7bg7lHZfMQckbJRcM/yPrcWFjU0ev+5VjYwb
 ZpRw==
X-Gm-Message-State: AOAM531bqHvLe8VynzhrZ91iREc3LOu9dNrIvGYgYynJCscPoxilaMZc
 NUqytkPLO/OFFDWKj6wvYOv4BKKwD7k=
X-Google-Smtp-Source: ABdhPJzv0BiPT2mP9O0qxlJ17DL6dibQkoTTtUK043OMRiaX0oM5G9FfYr5/30PfLnCHmOLVT3KHuA==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr8590209wrs.175.1629825109803; 
 Tue, 24 Aug 2021 10:11:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id u16sm3328430wmc.41.2021.08.24.10.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:11:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 19:11:44 +0200
Message-Id: <20210824171144.66813-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: revert the last change of
 check_network()
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

check_network() must check the error code of the command
used to check the network configuration with the value
passed as argument "exitCode".

But this argument is ignored since this commit [1].

Revert the last change of check_network().

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1522848308
https://gitlab.com/kubu93/buildroot/-/jobs/1522848306

[1] afc1ed4d5152e0f6e724e6986a1d12c8001b94fe

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/base.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 6a85b87783..7f12186b73 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -42,4 +42,5 @@ class InitSystemBase(infra.basetest.BRTest):
 
     def check_network(self, interface, exitCode=0):
         cmd = "ip addr show {} |grep inet".format(interface)
-        self.assertRunOk(cmd)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, exitCode)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
