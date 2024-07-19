Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E7C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E551A40196;
	Fri, 19 Jul 2024 03:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pc2Y9c1fTSut; Fri, 19 Jul 2024 03:34:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE8C0401BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE8C0401BB;
	Fri, 19 Jul 2024 03:34:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 673C51BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 534D081F65
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Fdb7XYuBRrx for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6395281F64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6395281F64
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6395281F64
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:34:42 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1fb3cf78ff3so13391025ad.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721360081; x=1721964881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAuGtlBiOGsVdkbx/Su6CL1NzeGpaf0RFPg146BglyY=;
 b=XzkyH/7BLfdlX10AN+OvnyFmoBmAvBYLyZRrS7O64pr9P44uEgX4OTCBPfp4RWAz3M
 XG6UWS+V7SlUQxLMML/jIAMr1JOXbO+0DSL9YhvLAoM4HUilGp5tPomYWPJdWZBXkyLZ
 cEmYkBc9gDoR4r9fOgw1iNyN8dUNe/6SkmU2lAJJs71jTzS5ZxjBcA3LPtoBg0pkcbTS
 ofPsVtXdWFUKThVryIaN94+UmhZ9Ned1D1Np73syZpqkwbhixVIKHS1IJq0GF/pxae8l
 0AbbPp2j0Hk56XzxUS8wSehNZnVXzz3QRoodTD5twnqYoxz3ce/h8OSpMaSLcF7g/8Y4
 Ug4A==
X-Gm-Message-State: AOJu0Yz4dU+tT4BVj7coRlpXwO+pdSI1RzX9pgNqGhY5zg3XEz4abXLX
 MZjPU6Itkr7tdSgxwnBW7jXHV7H5i2w3DgvI2w9oHqNtiGFWr+EsbtIpDablzdpcjpsVC25pTUj
 aTIjc2g==
X-Google-Smtp-Source: AGHT+IHKnRqIpMumkW0H3YWvJAcpSS8zyp1awc8MyQK+Sr4lYDzh7Cq72/ee2Kz+ZN6cuz6ZExE51w==
X-Received: by 2002:a17:902:ecd2:b0:1fb:d335:b0bf with SMTP id
 d9443c01a7336-1fc4e14a0aamr69327885ad.25.1721360081231; 
 Thu, 18 Jul 2024 20:34:41 -0700 (PDT)
Received: from localhost ([157.97.134.29]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-1fd64b49715sm3547625ad.4.2024.07.18.20.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:34:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 20:34:39 -0700
Message-ID: <20240719033439.14225-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721360081; x=1721964881; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JAuGtlBiOGsVdkbx/Su6CL1NzeGpaf0RFPg146BglyY=;
 b=K+guim5wWa5v2+sYSt9vgodQk8/yRHq8fhCuYBF/S5EXUbbV4VIvqCqurL/AAq/Ger
 lBrWD47npvtLilrT/SmpptxfpDq8FMV6A2jiU4cS07B/sNB+0RR4IRe5UK0swfk5z/e1
 Z0sdj8CW9fioN3KKC0ml6uW1CqAR5kKVIVu7cN9DgKvkqktYDDN1oHM9eYOD+dUVh0cQ
 jzmZlCOv7BBEh0aRnlFhMnMSYsehgaUjP07Wkv1ZN2myYdqmXTDsfjuqgBJldBMx8gXY
 QD9cVXPckyLgSvip1qXZwRG6TG9NIT7TPg9IRaC/X3fqJ5Bdy3TkhC89hqP/shGSMu7p
 nBBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=K+guim5w
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.7.20
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/containerd/releases/tag/v1.7.20

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 03964ace3f..02c19945b0 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  91685cebd50e3f353a402adadf61e2a6aeda3f63754fa0fcc978a043e00acac4  containerd-1.7.18-go2.tar.gz
+sha256  c4268561e514a2e8322bc8cdd39113d5e164fb31c2cef76f479d683395ea9bd6  containerd-1.7.20-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index b822516938..afd03d7d3f 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.7.18
+CONTAINERD_VERSION = 1.7.20
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
