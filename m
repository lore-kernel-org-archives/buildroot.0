Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D0FD3B7DE
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08EAB60B9D;
	Mon,  8 Dec 2025 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EA7gqqTjZpDt; Mon,  8 Dec 2025 10:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF8F60BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765190508;
	bh=nmjzai1rqs1A32752k0Q0yL3q3zet83TYm5fS7sw5lU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYTNQKMep5+5LUNFgns7eSROIWBDLH2DclgCUJzEkTm1WqPm73BmA9X0Jh6I+o3wW
	 oXzVwdGf8Rae++/XHIVQi9H6n1Ktwym2EcbN2E70s8WpcLwSzxAF0MPL9UeC3ecPUI
	 Ob5ZQAMXhkwx2HxUdjDz1DcD4YuT6LAv3xlF0b/My9nowb5kleS4nbXKV1UcaW2+Aw
	 bVKFDKw1MBgRxZdtboxPLfXB6aGZadi1/PDulHxLpXRgfPSyfr8E0rUek8Hc+49ffF
	 eC9rT+g7KahyoaquDdsorfgwtoo0boeE8JVhhVDZVa/HbHggagzNjpLSavE8HgRI2e
	 qNjqNoWBez8eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF8F60BB5;
	Mon,  8 Dec 2025 10:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8967197
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 10:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E928403ED
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 10:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCdI5fOW6P3x for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 10:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95EA540405
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95EA540405
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95EA540405
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 10:41:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso23589566b.3
 for <buildroot@buildroot.org>; Mon, 08 Dec 2025 02:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765190502; x=1765795302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2Hn11FLz68MlTdcViM0oqK4cmdKAYr9ErGvq4Z2oaw=;
 b=R1kctBMHZliKlQ0+d6X56fmQebSXYtXBThCSRZJBkCTwKt9l5xMwWdTU8huwpSdeNf
 k43sVhsh03UtAMcr+Qke6pRmURcKthVAV3PtTJDzNlKMl008t52MlOLf1jSYk8d1S7dz
 zQH7Q55sfA1OlxZ1Ca1bmDSlZfS5JoKq0pdfzohl3gFfPvoYP6Z8lKv5uSWPNQ/SM2ng
 g/Gx0iCQOFcBfgvyvFlyl8iv7XeWoCWAzUOT4v5R0WWYEVUxTDWKQRYEvcxFUCXKMIcI
 3/EJCjom4eG5HrgNKhPB+p1vboMZRK2RC+Drlsy2u9h8YwlXsb/RtIPQPObKyHH731bZ
 HmSA==
X-Gm-Message-State: AOJu0YxUP7wyVdgZxkfyiZ0LxcwctR6qLj+Q3wrUzdYPnwYKiNLqVYUV
 lGs6pKNgcTdFgc358p9OwUUY82vnuuNAIl2bnoUWOIn9c2gP5YAH7FlBfZEBq0B5HHP6dZIHeEi
 PUrO+
X-Gm-Gg: ASbGncuK+O+k2/NPq5i2wL9M9bi2ZyFKYEmQaVly/kAVhnKWLb3TM5WEhrlGDfPqRpY
 OMQkcNOKRSw/+m6Ph63yw183i8RUbtJIxod33dx+XM346Zse8NWFGXHrOcR9KMF1gU2LLPOTpvh
 FEl81FGv4CL1kvDYzMfmItok/JuWx0Oy+R6ZkAqd79dN/yBlHeEzlj0WVHg7NA2PX1WxGimbSO7
 gNwY2jMnY/NJYUXz6zIqvWmRk3gXX1fluvUw7sg2JT9PK8NnU2gC/+yBsYkFqVDr4/U70efxib7
 /IByQzviDFYRKNCz0gIvu3b4+BdAZ/qgySesim6Mqay6coZMN+64wb5rig6/wXrl7rOHWn8j3Cn
 tMn+zR1nYyn49y/o0EQxQjN9AZGPgHaZFku0jeJXNEHR0w1XsvO2JjjqAALmJZMdcTM6pjelDvF
 Acw6Vafz0jrIH7yccPPv+I61O5bfs6XFiJ7OqJbg6UPwNm+zLdaVTULAFRLz1sZAEbHcLQJnMOA
 e6BbVKsh9T2g3b7bYDgWsq5LEwSpeUIszUQQns7dW6q6p9MhUNBnxOkX1WCS9k=
X-Google-Smtp-Source: AGHT+IGUVo7GzvAc+RUzeMr/MW/xGaRZG7WQojh5S39apC7nwNHPLsXEhBGPpDLKnBA9DZLJkcFgmw==
X-Received: by 2002:a17:907:72c9:b0:b79:cb08:30e with SMTP id
 a640c23a62f3a-b7a24824bafmr648172766b.58.1765190502161; 
 Mon, 08 Dec 2025 02:41:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-30-99-31.retail.telecomitalia.it. [79.30.99.31])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm10464018a12.15.2025.12.08.02.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 02:41:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  8 Dec 2025 11:41:39 +0100
Message-ID: <20251208104139.298567-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1765190502; x=1765795302;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g2Hn11FLz68MlTdcViM0oqK4cmdKAYr9ErGvq4Z2oaw=;
 b=ZMesNHAy0Eu7aP8oioFitoaF7i1elne2pQ+0ie+Z8dNZ+mIsNtV7/IDDSE/nLOh9yt
 Gf2wMiG1v6BjPuOismYD4Cr+JP2Hm+pSMLr/JXKQ7T8ATtgS6dsq5z7N4nOGwfiKvL8a
 cUYbg6v5WDJlsvrQPpky1rUBnmnc08KBmTWGA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZMesNHAy
Subject: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.5
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
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.5

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 51d7f9c0b8e9..2541e845a970 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3edf11645867fd41cf2e3cff24e3131a9ed9f6ccf8ada806dc2429f817e01f71  pocketpy-2.1.4.tar.gz
+sha256  eb7e8d9285d3848c2bc108b41fed4c49ea47df6b0018362319d2736a6f5821e1  pocketpy-2.1.5.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index c4a9aea8d2eb..b17184089032 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.4
+POCKETPY_VERSION = 2.1.5
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
