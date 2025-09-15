Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C26CAC599
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 08:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4869341153;
	Mon, 15 Sep 2025 08:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ol_dtn5tWSOO; Mon, 15 Sep 2025 08:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA1F4115B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA1F4115B;
	Mon, 15 Sep 2025 08:23:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FA01F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 08:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F16BD84AF1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 08:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LygRPBtbALI0 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 08:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27AD084B45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27AD084B45
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27AD084B45
 for <buildroot@busybox.net>; Mon, 15 Sep 2025 08:23:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so659909366b.3
 for <buildroot@busybox.net>; Mon, 15 Sep 2025 01:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757924621; x=1758529421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaSqgz4HpQ8UXIUA5ASgPWWI/VWcfcJfAr5vjuRbeM0=;
 b=WpE+PH6dj8WhXlmWiwdX4AMmN0sm+giEbdOkjDlob5pMPssf8dI63nQtxn9vHQMRyJ
 0znNnI5DENAxQ2kmEVcdLBeuax4rikDUqDJNmjdtoMsNKrGH8D3SwlSdagquzyYjF7je
 0KIA8g6AJB/ZdqxeMiGDjq2CWkKLYElwN0f/AZjPqvz7FdKGEG+wJBTSM5YaitXSk6dv
 pi6+YIVJGXWNsyz5709damd3VJ+P4psOXQ5bbgk5v8Ou+AkxIdtCE57niMXbMW6MwIJ2
 p+ocDBSkBusEGvCxxGCjs+4rn6swL721xQP/SfpPKa+ppU24NhlYenDPIM49xRmA0/Di
 o9eA==
X-Gm-Message-State: AOJu0Ywk32/P6bfJ7UCzc7c6JtjHUEgGh1eSk+tLi6HJPOexPWPjJRkv
 UlLWrrXCyKQXNFJ6hGdDjaVSq4+WKLxmdOQMmGXTIfGOnrfmOJzuywt9qZFeEOxnSaqAOc+Q+r0
 qgkUaEQ==
X-Gm-Gg: ASbGncsha4Q7TO+UPgiKuVHJwKDn3x/7On3ixFhA2+Ge25LdOVacuB7qaxDL5Kap9XR
 zMz0l3u34NMX5wOzZda24xEKDEdi9YihdCy+4uuJ7ZCohoSjacd/2qdIx8SadVxQAwTnhitgmov
 VOkf6ASvMddQbizAdqc9VbqeEt8SD1pdesM+TTCFHlbJzKm2QO/j9D/VkHwajA+oBf66AbcXXKK
 U3Sav0u9jOCSvQU0yV3Yk0eeuZvgUu40TMog05m31x6Q+ctu3j2JfBey1mCuEP6IlgMYcG4ufRA
 bcAFx0L5qX4jFM5TGkZBpjMsvmNDw5SE3Scp8DhMK8rngI34gOQYrW8YV4JF3YSSgCnWD682523
 qYzMJU89JMbOGmZ+lVHl6mwsqDXSqi4tahlN0cr/FkZ41t9ooAulxRHli62GGOb1QQzc=
X-Google-Smtp-Source: AGHT+IFWXTJ26R2/wrqlQL87sa8LAUa10nDmefVHRV1uo3rXRP8WkJHZjnTI23pnCF9I0/Srdly8+A==
X-Received: by 2002:a17:906:66d5:b0:b07:e3d7:6ab1 with SMTP id
 a640c23a62f3a-b07e3d77159mr583688466b.37.1757924620613; 
 Mon, 15 Sep 2025 01:23:40 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd3efsm890804266b.55.2025.09.15.01.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:23:40 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon, 15 Sep 2025 10:23:34 +0200
Message-ID: <20250915082335.757689-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915082335.757689-1-francois.perrad@gadz.org>
References: <20250915082335.757689-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1757924621; x=1758529421; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaSqgz4HpQ8UXIUA5ASgPWWI/VWcfcJfAr5vjuRbeM0=;
 b=WpAPf+wG+QRCTPYo+poyEyOPnPU/1VkivcObC7lMFbFuA86UWh4LQzb9noL829lQnZ
 JHVgEuJT8nPuVuSrP8rA8z2AqNlQ8FEAk8ZWqbvn2vqBhihlrd6gGEG/bRzBFt0CBTrn
 YC/KuTBwsNmoiYo+wGi4nbLsbF6o0HIIb/K3u9b/FbBo+ycdvKcv8p8OSjo+T7O4kKps
 99WvMUVK52ZAhajjAcQXE2M2v9vIHACWlFWwhJ7Niq07UTwgf7Fd0di2VENA7VeAfHR7
 fQkVVOt2nBlzrx9yZmEYErqymLvq4skbMEfJREoV6i2WlAq2M2iJcFGn0Uvhz/O0f+tz
 VNyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=WpAPf+wG
Subject: [Buildroot] [PATCH 2/2] package/collectl: bump to version 4.3.20.1
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/collectl/collectl.hash | 2 +-
 package/collectl/collectl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index 6714e2afc..dbeee28af 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  552bdbe9e97071767bf0871789e19ede7d2827b68824e75da9cd7664218ea440  collectl-4.3.2.tar.gz
+sha256  f28eb87c21518801cd6cb3cd95cd2948a7dff80f9cb2216a1122cfc535f03639  collectl-4.3.20.1.tar.gz
 sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
 sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index 358f8e3cb..429bb694a 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTL_VERSION = 4.3.2
+COLLECTL_VERSION = 4.3.20.1
 COLLECTL_SITE = $(call github,sharkcz,collectl,$(COLLECTL_VERSION))
 COLLECTL_LICENSE = Artistic or GPL-2.0
 COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
