Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388CCC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 15:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7DF643943;
	Fri, 22 Dec 2023 15:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7DF643943
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLJjTvuQpNbF; Fri, 22 Dec 2023 15:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D71E4392F;
	Fri, 22 Dec 2023 15:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D71E4392F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9DE71BF3AA
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 15:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83E4783F1D
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 15:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E4783F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRJWrRS0XBvy for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 15:46:56 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D76AF83F19
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 15:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D76AF83F19
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-336897b6bd6so1697174f8f.2
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 07:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703260013; x=1703864813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhIjeJ0yXnvSBWgl/zbyvnF5NCHmP/e1Vsw/KFVC+VI=;
 b=MWa4tctyxInrTbI/6diT1a4rVxNARYnrnKhvENM8X/UirkC4iLNejyn6ovVWl5XIP1
 Wqi7TmYT3mdIIVX6G57u+jVA9itYDk4EYKYtMUxGrY1LVnSwCb34LnPh9ViLjKtwaSgR
 RkZjd2xn3NJyiOkMKn8dw7mBEZczoMKsS4stG7OUEJyGtvNR6045Hh7pqa3iudHKQ5Mr
 u9KsjSapzb6YNfOohHPHZlCNHlrMMYF3aWmU9cbt2HIciY7Womwkm9uSJYCYPUhjONAS
 3WVvmP6pxkIp7gQIGYuVcR2BaA3Nwk4cMFLMgSXFogEITRQT8SwlIucyCKqlLpzVZlxi
 x4vw==
X-Gm-Message-State: AOJu0YxoZPCe4M5zug5NYdnObPjnKg0CgEZ3Sdz1fwyIoefkh2v89lNW
 ALL38TBMu5aCpPm+hkcpjrDbc1f3SQiX6ewZl+Z7vd9KHhU=
X-Google-Smtp-Source: AGHT+IFG2T8BirTaREXvX2gESsZ4McHR837C2hIn1+cllC1LBEHWDu5h/sZ/gncrQw+qjVtGxt5BTg==
X-Received: by 2002:a05:600c:3d0f:b0:40d:43ea:ed19 with SMTP id
 bh15-20020a05600c3d0f00b0040d43eaed19mr745416wmb.124.1703260012932; 
 Fri, 22 Dec 2023 07:46:52 -0800 (PST)
Received: from wintermute.. ([77.109.126.177])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a05600c310300b0040c6b2c8fa9sm15147637wmo.41.2023.12.22.07.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:46:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 16:46:47 +0100
Message-Id: <20231222154647.367956-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1703260013; x=1703864813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RhIjeJ0yXnvSBWgl/zbyvnF5NCHmP/e1Vsw/KFVC+VI=;
 b=VmnCK/sPHJ5V2r5/ufShQLZF3OyJBtQgPOvqIpoOoX0DGWHNY1iXMbC/AMF8rdRqEg
 oILw2/VNfhCQCyVDR81aM03E8oXb/d2aOqN6nYkDLegkFQ70wMq2sH71x9KQcQ5CoEh5
 s85nWu+SNhJxlxBl5gpTwH2uQDYzLKYwLeF9GOtJ2GfGCgPE0efOPxtzrtioMebkEu7Z
 qIurjy8ltJnqa9hDwxssmBN9+7DAVKpGuiBZDk1BTORz8sr7qWWh1ZMbFbk/0836PDFQ
 oLgxImwmLpxUvkr8QrJckj/TV8tcddnAsl1/5E6wJLSh5oxm5CAiT5Ml4Q5YbY6Q+DGT
 i87A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VmnCK/sP
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.11
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
From: Frank Vanbever via buildroot <buildroot@buildroot.org>
Reply-To: Frank Vanbever <frank.vanbever@mind.be>
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 package/libmodsecurity/libmodsecurity.hash | 4 ++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 7bcf99e167..b0a1bf33f3 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.10/modsecurity-v3.0.10.tar.gz.sha256
-sha256  d5d459f7c2e57a69a405f3222d8e285de419a594b0ea8829058709962227ead0  modsecurity-v3.0.10.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.11/modsecurity-v3.0.11.tar.gz.sha256
+sha256  070f46c779d30785b95eb1316b46e2e4e6f90fd94a96aaca4bd54cd94738b692  modsecurity-v3.0.11.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 257f0a56df..548eeb8602 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.10
+LIBMODSECURITY_VERSION = 3.0.11
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
