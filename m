Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0344E7315C
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855A7407FC;
	Mon,  2 Feb 2026 11:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gJ6pH2mf-SH; Mon,  2 Feb 2026 11:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8656440AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770032590;
	bh=Eh0MCUqsRYwGpMfZ+FwAAwIPx+Ejg6dlAdGU7fnwgrQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igtmkQoUzQhd9ZbZxXmBTJTv6R8gT670O4FssL5Ay6IlxbCfh/+RGEOVwHC7T0tkA
	 3Lc3XuA71+G2DMnDwpMoM87obPxrEHOyadzcrbLyNeTEUBqZs7+P76aKyCkcAobgqV
	 ADvKsdmhvxQdfuMf6aw1hLS2awlIYvwZemPtEdIN3WjOWKZsGHtwt3VDNgJESQULG6
	 RZOm7jPi8U9RH0ybXbpVrIlYk+OrUPMFrCecDkTt6ez4NE2vZBWJKLsbfc59itKTDz
	 vJM1scuujklehVpKTAjDn/PxieIxnGBvjto3gZty+mN3Xr0YFDKbJiepWjfsDGaTyk
	 +n7uP200WFpMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8656440AB0;
	Mon,  2 Feb 2026 11:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4BAD23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C30B440AB0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEb4CadIJSDv for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDA77408A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA77408A1
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDA77408A1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:43:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so3887369f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770032586; x=1770637386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsg/Pz7eaYVT+5MGmr0E0xvEYRtV+wp83ORUpBW1ySs=;
 b=JzXueJpH3dCKrg6GzhlGV/alEGPC8v66ABEW1f0ipTp7xVT+IDLRe+m8M7XkZc1L4c
 +EsW4bHY4ZVOI6T3f5ynnPf1qkkvirbJctoGhZY7MrqJsjoJsrj+9Jxh5m1zXh7A2o1n
 8yATstSXUkZElrN+JVhzIo1/HSF5GKApmXAO9sg6GS+CScEwvLjCIkMVigJCuAVl3czj
 AtGdv/BZ+2OxxNn9bioro47sElQTPC929YO3M23RSyDfxKuSmtZiZ8AuOY8QZASBR0A9
 P2AQ8jEba5MYMYKkeW86suMidH6yEzXouXXa4IZEFsB1pUaIHxEwXuf7RxKbLAEfkjij
 AA5g==
X-Gm-Message-State: AOJu0YwPEDt41c5Iloqz6VY2qAvZ+KMFfKQLZE3Ww9/3a4RdvSZ0C4to
 tauf/4AqVxqU6Wb3dMmVSN0NaFTH6Vi2nQGTsbemW67XtTq45QeVeL9knoJbJA==
X-Gm-Gg: AZuq6aKDdSk9bL0F+jsNrYtPeaCng+Op3XzKcgaA+Ejco5gZ492KGL62wKoeM+BwwkP
 ZmFyuqUERHKJ8seXsa7LUmlCTTW7QBwErY2Ju7KV9YgM+TowImUefjC4P6013XJFFEOxpk96El+
 2v8S5sAJor0ygHaQ4hQQYsCvQxhU43ochsWrmZFnvcbBnrCHIq0fk8V2WIHTi7exkrO+NFYXcsP
 7KzD/4svdD9VNFqlAqtvs2O+sAQ8+auL6Xy1fN63h3Eh7pVcvZKtrp12vmGj3hUPWJA6r+oO2t9
 BqLDMRI5p4ouemkaO6vZVZnCJUCpYmfytu2ln0IhO00omdMYHyF5fQclwhhOmoE2+gAPGXoLBbV
 w+w+sBj5XrZlZtBlt+Cw3vafINtocbCO+w/5jRPdG8+4qE7xZL7WMaUgUC3i5suCN44O0epQWO2
 g3pQ5LbrU2tsq1jw==
X-Received: by 2002:a05:6000:2881:b0:430:fc0f:8fb3 with SMTP id
 ffacd0b85a97d-435f3ab26d5mr17181745f8f.38.1770032585489; 
 Mon, 02 Feb 2026 03:43:05 -0800 (PST)
Received: from freepad.iliad.local ([213.36.9.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf4asm44246777f8f.28.2026.02.02.03.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:43:05 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: olteanv@gmail.com, thomas.petazzoni@bootlin.com,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon,  2 Feb 2026 12:42:52 +0100
Message-ID: <20260202114253.283868-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830173313.164981-1-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770032586; x=1770637386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsg/Pz7eaYVT+5MGmr0E0xvEYRtV+wp83ORUpBW1ySs=;
 b=RUTV3wqzmva3VNjX0FDcAaSsA8kUtYtJCe1OySj0txuOIZ6FQKN+3lTj2aoQtNspcI
 HKLRxQBIL0NIbQAeOgGnsorQA9cnjNQLSZ3bYAPfskxlkvtqkwnfZ8HTTN3SQaDwNKXa
 HAql2lq+4SsqHNxKWdIIUcg6cf+4kqqXRdnZF1UiNN+DWdoiaXixAKzQh/TCUiFvoRt1
 VAGpV3CNQ3Rvse8eYBwI+EnbammyQp7y2Lmig9V01a+28VWOaH30S6o296SMIhYiE2sT
 +w/Qhl45UmUMrWExbSK12j2sAZTNioHiRREXPF7mkjf+1DQSYnF4tZKAaiKH78nA9Rx/
 Wwxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RUTV3wqz
Subject: [Buildroot] [PATCH v5 2/3] package/qoriq-restool: bump to
 lf-6.12.34-2.1.0
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

Align with other NXP Layerscape components using the same tag.
No code changes, just switching from commit hash to official release tag.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/qoriq-restool/qoriq-restool.hash | 2 +-
 package/qoriq-restool/qoriq-restool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
index 72a34473f2..77c6442269 100644
--- a/package/qoriq-restool/qoriq-restool.hash
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2879f14c9dd810e92d4c51c7f1a3e6705a5a585c2445e507f63e39872ac6237d  qoriq-restool-lf-6.12.20-2.0.0-3-gb44748e.tar.gz
+sha256  5a17fad0645d943efcae215b2d99f93406f605000cd4f0d5d9df627bc6f4e631  qoriq-restool-lf-6.12.34-2.1.0.tar.gz
 sha256  ddc794a75f11c3bd01015f16b9776064a894015e7a1603541283ccbc2e1c3a40  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
index 79e87ef1dd..3d16531def 100644
--- a/package/qoriq-restool/qoriq-restool.mk
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
+QORIQ_RESTOOL_VERSION = lf-6.12.34-2.1.0
 QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
 QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0+
 QORIQ_RESTOOL_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
