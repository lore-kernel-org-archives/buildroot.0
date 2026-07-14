Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6753C4450A
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 19:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A1360AD0;
	Tue, 14 Jul 2026 19:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOjhWRYgQNJS; Tue, 14 Jul 2026 19:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F7560AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784059043;
	bh=GF/wT6NG4ashL0b9cljCbl4DxNe2uCArMhgrxUyIoN4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sq/2102XRrOTyVznmMBTcg3oML2JhKLNdJm/eXMqL7nY2+MJQ8EvGY5fSi2Y7SSi5
	 XXhWxP8Vuyg6w9Tbz7Mtpogh9t2f7MUsodT9MCpNjESkQ3TI/uchOL/mUsfn+RZ431
	 E+AHPlCNalT4pS1hMscPpaEjKmwI+TMj2wL6VhHgDZFeyMYGd1BjDGZJNAyvvnR7jH
	 b1wDwS2RAFX1+TOTLGevFjpShrh2986HLFmy6KezAOmOpBQgfEYQ9rvLO4Gc6pouFO
	 cA2So1Nv3i3esNWvHppuBor9gFyoJMG8J4NkEH9fSA96d4/v3PJxBFzOJBBfBeWER/
	 5mZS+Kg4owwmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F7560AB0;
	Tue, 14 Jul 2026 19:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD3C49D
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 19:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E98D88115E
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxQP7GJatPnI for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 19:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C61B181143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61B181143
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C61B181143
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 19:57:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso32309525e9.2
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784059038; x=1784663838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9nPrmkIIYOxOe6ShEjZ8NWQQxLgtFPFs9KU16qfWuSY=;
 b=Bznv9kgjWsXCgyrvsP3+K2z4M3BKtsWuSOAlpX8gaZEgtgGmbCmOd2QaKmHrqZwmR0
 fWFA9PMwfpZWEwKznxqnBwmd7cXwoK2Jlm+5xyN3hauXhrIMQT92JnkCaIEz8NkaRVc5
 09TP+tWcCruDo7jJQK0ndBx3OKl6mfOj6w4+zFSZPUcxYwCityNQSYMd92lHT9FCOymg
 +exnKnUCdqfeabihwYwy+3t72yCx5LLzNKkK6F4AYGOw+9JOT5LwskqVLyFSJhCOoa+j
 YRl/GLu4moEVFV+aohm87Ys0i+na/XkHHbUfGp0P4JM0a2ylSOmAEqk/MxmbPR2iJH2C
 PdUg==
X-Gm-Message-State: AOJu0Yz8Z0OFPJxHL/zBVr0bceNuMBr/MlUsdTBIgopsDF273pnzi4zq
 +Uq6lf7F6mD8K8HzWk8F9uCdWWMWv9EQz1PIJm72X3Kwhd0U2KljsGqathK/bLCYxnRW1l6op4B
 PFIY6h2g=
X-Gm-Gg: AfdE7cmju5Xm+l0O2C/fBGPLNPlIj6ch5QvCAXTYPctJylGcGr+aZBSz5XHa0qH85mo
 bJTCUIid5HMT+EJG1KYd2Oxdd8gljweU5hJ+Cz/bpWZzCZ/WEUwmgfzEDdoa4NgAh2QT4XMoUh2
 a5iQLXCeZOvmw8LTsVwGnvBtsyK0SWlzHQhKipAbElN/25WkoLqmB8yyUJBv4msVGRU4a5jmHaI
 EDaXZspsIk/BTN4tYihsySTjmkRaAWa0S7f6Zyt0aciNXApX3rwLFfKX73k9bUWAta775y1YkOR
 611b50SC6E8E2qBlzgKPKCM49CntraPX0Xzgj/U9s/QtyYkjDiFOUdIk29Wm1AwPqlcZLYu7R6+
 FVmaZmPnG6vafBcV8A15TFs3cEufgEzL58MAzsktXOPw2ZPHAJ3RIIZRi6biXHqiQX8MjZpRurV
 ViibRH6bpO0Dwpes6xQKD1nEzzMimRv0zR7Gd2kv2l1gJpQaOdoIKLhi54J62OEwR2oTw6Auzfk
 FrfERVXjXaSmhg5Ud+zgVFtfVRh+c4O+3SxtIlr2Prg
X-Received: by 2002:a05:600c:a20a:b0:493:f528:58ac with SMTP id
 5b1f17b1804b1-4953c27b34emr1457825e9.21.1784059038116; 
 Tue, 14 Jul 2026 12:57:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635c86csm10141812f8f.16.2026.07.14.12.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 12:57:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 14 Jul 2026 21:57:10 +0200
Message-ID: <20260714195710.3293499-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784059038; x=1784663838;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9nPrmkIIYOxOe6ShEjZ8NWQQxLgtFPFs9KU16qfWuSY=;
 b=cXXR5pEyo7nrz2syX5XAHn+Vmn/LNVYvCWGJtscpUd6peAmM3zwr6Tj4EezPk3iiUo
 szqzZjjVNdelSb4MOGN4DoRcCqIloRUdliHB+j0o5A0y6DXPbg4zX22NcfeYmyWrN9mB
 MW23MoqThkbvR6WZxB/eT6KEzRChdlyWtjwkY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cXXR5pEy
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.4.1
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 70456a4fb278..c4425ed26201 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  f781e9d935db7e8b9a64c58b6a817354d38a1769e179b477364f5e6414953f6c  armadillo-15.4.0.tar.xz
+sha256  12781baf33c71b622c2f040fd27143479d120ec89d40f889621f0b1bb6232e27  armadillo-15.4.1.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index b806b0f1d1b7..15dd721680e7 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.4.0
+ARMADILLO_VERSION = 15.4.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
