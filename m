Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78A5C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 03:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D46860E7E;
	Sat, 29 Oct 2022 03:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D46860E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id st02mRkF09rG; Sat, 29 Oct 2022 03:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F021607D1;
	Sat, 29 Oct 2022 03:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F021607D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A047B1BF982
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8541F81763
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8541F81763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xm4LoW9TZcaT for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 03:35:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888AE81757
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 888AE81757
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 03:35:15 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id i10so4542116qkl.12
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 20:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d03fUAAxaZ4qipQ/7JF7GwSRCZy6nuEi6Xiwimv3axU=;
 b=BLREfdIG3296reiVkZ6cc6v/0tUgdBKavrnsLsuBJVWus400XYy8CS3LbnRZDbplls
 Z+Pm6B7CS6XEZ5UF98x/Uh3Vw1ZJSL+6BsHlmnar19rFmUAqjrsHLuvt3z0Zpi7Gx/Td
 qjrI9Jumj+BAqGeljLlIKyzOqCVEfGSHYaQqJ/Dseg3JKZepXOOOksHDFIwTK/wSAX3s
 Lw+sdZgkvumjmCu7O7mdjMi4KgCFGP8fWIIH4/W23VoQLZ47FLU1PqWngZ6pcCXUN1bW
 5WHYghCiB3/6PJ90hlHPj9Hz0aD9XcUU5mJ/Tf+jld+k1DzRH+v3alKVJ8b9xC693uRb
 v8VA==
X-Gm-Message-State: ACrzQf2QrNV9RjAiDtAgl8QHdi/7XOdp7Euu8aFbGxK7oO/3IUzTLe+U
 mv8C86N+jchhJ4PfEGzWzlsueGfhqSFzxg==
X-Google-Smtp-Source: AMsMyM6/EKASevHrf2F71RYSUCfzzCzyhixHX8VeL2a3hZtx4vZKf6B+A4mqKMvtvw+VsIYqnaZQ0w==
X-Received: by 2002:a05:6638:1b08:b0:375:4392:9cac with SMTP id
 cb8-20020a0566381b0800b0037543929cacmr382969jab.293.1667007439152; 
 Fri, 28 Oct 2022 18:37:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05660208c700b006bbddd49984sm122199ioz.9.2022.10.28.18.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:37:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:37:17 -0600
Message-Id: <20221029013717.1406350-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d03fUAAxaZ4qipQ/7JF7GwSRCZy6nuEi6Xiwimv3axU=;
 b=YqbM6REggM6NXR133IUQwklxTM5A1U6EjhdV6Kcxga20iR4BgeN0AJrjMNy/AIQjTq
 3Gpx3+2jQC7OY88aiAVj1DLTXSNQvCtlldS45TavgNXBS9GOEEn2iG2gPqgC8i+qaVyz
 B/7qSn4Lhw8OfNOe4j90fmK79DCzROYMdNhWigjEuOjgyscsfdqmE/mUbSkZHr3rRW1F
 MR5GqbUKQ3d0Y+rVsBSSA9qYgLuzkjr3x4jZEvvjJAVuAOvp455bu+kp8eZJ9FFU9UEl
 mGcSoplxyoQL9vD86djgRJg5st04/V1ontCOGJN0D50EWSxkGtnP3u4rODHWolM22JrA
 W+EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YqbM6REg
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.38.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 58603f79a4..4b4751dc82 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  6cad81799e0491751cda0a98642b00eb  fonttools-4.37.3.zip
-sha256  f32ef6ec966cf0e7d2aa88601fed2e3a8f2851c26b5db2c80ccc8f82bee4eedc  fonttools-4.37.3.zip
+md5  f4775967d29b0da2f29ba499eed34f88  fonttools-4.38.0.zip
+sha256  2bb244009f9bf3fa100fc3ead6aeb99febe5985fa20afbfbaa2f8946c2fbdaf1  fonttools-4.38.0.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index aad1765899..d31d3a2889 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.37.3
+PYTHON_FONTTOOLS_VERSION = 4.38.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/c1/0d/d41b9c2295e1896f4c89e6b213790eee8e8e641b3e9709518f2bddcdeffa
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/55/5c/a4a25cf6db42d113d8f626901bb156b2f7cf7c7564a6bbc7b5cd6f7cb484
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
