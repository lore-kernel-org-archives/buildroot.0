Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04212C4450A
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 13:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A3260873;
	Thu, 16 Jul 2026 13:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CE-54_FumD98; Thu, 16 Jul 2026 13:07:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A69B60872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784207249;
	bh=xm+5rNz/O7rSkdEF96++Rnem/3XXVCcInHk4Q52Fzb8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SDky/Oe6MwTmxiYFiAR0noDf2GJ51bEecBHJ+bVOcY+wFnABETENK0lNYimYT1HNK
	 HZgi4aZarjNgUD5a0VskcBXWEaQ2DtYMXMfkL/cGZfRwu8IwH78XtXQBFQxF+gprKo
	 NNKlshtViEuB2Gq+rkIZXVmv2vepiD8TtjFZB7e3wmAHQhxfdmwSImDu6/7qzcvgg1
	 Y8AmRVZz8+R3gEtwoQcc3xO+4ElNHaWdtWWUvefzVv/+Mxz0QJ4TCgRFXyprz8xw+O
	 ts2TVa8gLxgFl/zmGqA4ACPJ5p+/OznrsLq00xrY5dJKU7WDRSFjostNOdjmEwJYdX
	 ktmXZwqBaJvag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A69B60872;
	Thu, 16 Jul 2026 13:07:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B12D2320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A26B760872
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsHd-1XlgFri for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 13:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0988960871
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0988960871
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0988960871
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:07:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-475417f010dso3369163f8f.2
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 06:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784207243; x=1784812043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OA3G69uwvY4qAqPgOAbgTlgD1VH7L5sQ/Qf+Oo6F62E=;
 b=nVRsajk7ie0rJLfr4nJ/T/AO+HLnWyGcT9xeb6o6sIhZoAwDwHeRPpaFeroFR1drFZ
 jZucise/8Ud7PuIuezD0/OYD6SSaqNsRar2dwryI93Yf/he65az+Jx8LwJsqiR+gZxaF
 CXdfLdugmsdUnjM0q5dG+nBRGA1om394inL6zhF6RIXkzI44rLREDOPtc3/JkAQHjE/9
 2yecrTHDNwRnmt/5fSZkPuDOVZY5Ou8XIGal49PTKYVF6bQ/hIGfUPBlpTVARCPUO/j8
 4BIPc49WkCEmBBhCmgDGtXMYbZ3Ah92rcuI/oZs2RBxE/qp6qn0vJrjiJZwd0wAgqLlC
 2S1A==
X-Gm-Message-State: AOJu0YwS4AE4yFR0cZb++DZt1SfIhGPh0HYLlxuGVr2b5h4IDhPSDYuX
 0i8TMeRUA5FPXvxGwwstJc9MUWcUv6OGXUMPwZorjH0oHYh580pAi4/+c3mY+ZFnqtE=
X-Gm-Gg: AfdE7cnoMpRvBz5xclY2ClUT7zfOyIJkWYaNfKkDIselxKaH2UkzcW/3iUE/3kYp1Gr
 JWST0eQKDHboM5wcDf83099iSvkCoYSjV6KsdZy7HV2xRXSQ5Mqr8/boqYUQYXteiX45dhxtGq9
 puwEjpFLaG/ALaWtHzPlzKnEsT7dBkDPjCGrOz1VcqYwBsti/+xxj0bW9GkZhBAyYd7aTeYJ5h0
 WhUQBEewlVGzsRGTNQ7gNOJtZFm2E7VbW7p6gq0teUyO87yAy/94l3N1o0DyibHO55pHHjABbRN
 cVTrpAqkU81WWFnAJRTXEM1PlIyvlO99kMkGr0hVbmHnUcMCRQQNcHDqNwt3FUPcvbYkwP1dNFz
 /LHxYoFU4DyANJz1iBnRxsmsYJT0RO3nS4+QbtUrKRFokfXq3UCHHAi3t7xLsZFLJ2X8zPJk=
X-Received: by 2002:a05:6000:29d8:b0:47f:5b4e:a7c4 with SMTP id
 ffacd0b85a97d-47f5b4ead47mr1708471f8f.34.1784207243327; 
 Thu, 16 Jul 2026 06:07:23 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a746:3d60:eb91:79a0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464b7f84sm23494376f8f.27.2026.07.16.06.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 06:07:22 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Thu, 16 Jul 2026 15:07:15 +0200
Message-ID: <20260716130715.101592-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784207243; x=1784812043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OA3G69uwvY4qAqPgOAbgTlgD1VH7L5sQ/Qf+Oo6F62E=;
 b=SJgxwQvGERE9grb1q/yB636DRvJlQVMNxo3p3YCtRe6qLlFUE3Ej5jiDj/ms0ioHXz
 +HolPY6MtPbpCfSf/oGbjPjYSJZYyOuX2Sx3grOTigSs5TdpNPOjCHp9tiZ19FkZxDlh
 V9g6GVHmYdY/xB0lNq/5n7XDKFnP99tKaFFS0wrXZTfLcV/chcB1/QuAPKFHsAnwsIAr
 bqZZ4LW5ZkEGKZXXYJOxU1vdEI/lxhGDyWxGhrqFlaUpD2ZnDcYvgTSUy2de1t6Yvoa1
 SRzn2L1Vjzki778EKtMiEjbTpkXwQuKh5f6hVlMp5kw/9RVwm3Bb0KcAafdG1leHysUR
 LGyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SJgxwQvG
Subject: [Buildroot] [PATCH] package/dpdk: bump to 25.11.2 version
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

See the release note of the new versions:
- https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#release-notes
- https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id1

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
Tested in GitLab CI (all jobs passed):
  https://gitlab.com/maxime-leroy/buildroot/-/pipelines/2681272497

 package/dpdk/dpdk.hash | 2 +-
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index 7e8ef0674c..adafe2dac6 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  52e90d2a531ef3ded0283bd91abc94980698f1f6471fa09658a0217cf6609526  dpdk-25.11.tar.xz
+sha256  418bfe3212640ee95a1cb10af6ed360cad2387686fe2721f8a3a9cd02d5ef4f2  dpdk-25.11.2.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
 sha256  ec514554f1b9e90c4f55167267c22da9d511f884877c32a5b18bee6b7c8b18cd  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 080f924329..147bdb23d3 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 25.11
+DPDK_VERSION = 25.11.2
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
