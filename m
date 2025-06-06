Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABACFC5B555
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 07:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42FC940C09;
	Fri,  6 Jun 2025 07:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYzMucxLWAhJ; Fri,  6 Jun 2025 07:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C81E40C17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C81E40C17;
	Fri,  6 Jun 2025 07:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85DBDD3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7830640143
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YCdJKq9wupk for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 07:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 663C740042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 663C740042
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 663C740042
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so10082165e9.0
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 00:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193327; x=1749798127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SHLa4AEgROJbAf/2lg51M2sFoEnH10zqygPROigRsy4=;
 b=B4awM3/tEeOF+KovVoOqo6gSLutR1vr9dEIoNaoyCfvYPGTPmb469/L2LZxMTGLnuG
 w3JjIFbA+JGZyQXZJaBta/CfNXafDVF5ylCMc9UlabZQ9Mf6VUEwZlJ6JB6aofxwIPDy
 oFCLFCH+/IVsJ4ZfNoFEf5SPklRjtOm7VkVAQSzeO/0LGfEnqRgs8OPZkRdRNIy+DtmV
 kIGpAhGMRRH5JWFT6lsiFJYdBbNmzjyfxgsV3u++UaI8+ECXr8FccTwAUHcj/DgQJ76g
 04s7yvQoqLRIzk+gWDwxOvHuatmIeG1qLv60IJmViStzGnbqDs5Gn9Gq/jUb207exu83
 SFQg==
X-Gm-Message-State: AOJu0Yz5BLUddvdy14gfg7gc5Sul3clxa4WLjcbTMHBlH0vLvb0d6bDE
 sGpWyRDhUmQ2f+GuDJkC3bd0a5nLAzjoanWQXwweTrekgAZYGCKfExb5ojVIALJ8NAA+t0v7xu5
 OTKNg
X-Gm-Gg: ASbGncuaq59y9R2WY7MeO/JefmRMyvVWYLfA54vVR7yauLKjs1yjGVZer1PuYorhqTI
 +p4B54ZPTjsZrz3hyYkh+H+QSnxiwWXr09I6eYqZLBSZm1I2QQexuCEab55NmwDHRl5cOJmEnRD
 lmXhvMWIC6BcnG4ig61pGWfmXWDOUNnnePOQpzM1xwNPoSMuAYkQ7dVZgx59nOH0YxjfbEuEttw
 skvxfp1jQS9lXz56iO04kvhuIjhw+H5no1xzbA0La42Rlc2wF2Nct7bCGwyURv+ozBIBR0vArJc
 3ntkJ+sBx5SBYj4u2+LtaMSbQcOuSmcWm58XSam16ErJXm9MF4crcm8n1TeZmaMncsbeR8vGKb2
 W7QCDFgHJsKBBPvxVN/ecc9K+Q2NaNSJNU6Kmsls1L/7A3W9QDD+TIXIddZIg0oOxF1g=
X-Google-Smtp-Source: AGHT+IG4S+YFvpMRe7JaXeKfWHSEkJziomMnSRESsJM8kkE4LR67wJjZ1x15BDy+gqr49PjP6eAAPg==
X-Received: by 2002:a05:600c:828f:b0:439:5f04:4f8d with SMTP id
 5b1f17b1804b1-452015833b8mr22228585e9.12.1749193327108; 
 Fri, 06 Jun 2025 00:02:07 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d96fsm1035353f8f.7.2025.06.06.00.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 00:02:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  6 Jun 2025 09:01:48 +0200
Message-ID: <20250606070152.396438-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606070152.396438-1-elmehdi.younes@smile.fr>
References: <20250606070152.396438-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749193327; x=1749798127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHLa4AEgROJbAf/2lg51M2sFoEnH10zqygPROigRsy4=;
 b=t48kLIN8JCaGN2diVmZ8wY/l4zQssWXa9wiu85Kc5HWKHZkPu1NpSfmxBMolI25P5k
 PjR/+s22ATY9NzT2j8abC15u/0yK3NhoS+L+rEwl/MreqlbopRj2nfmZGlcGbVaPbFrw
 Av0j+GLJoLQsupVQvHwIYpJuvgjOBRt2hHTMg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=t48kLIN8
Subject: [Buildroot] [PATCH 1/5] package/opencl-clhpp: bump version to latest
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump opencl-clhpp to the latest version "v2024.10.24".

https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2024.10.24

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/opencl-clhpp/opencl-clhpp.hash | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index 184444a53a..add8563757 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  22921fd23ca72a21ac5592861d64e7ea53cd8a705fccd73905911f8489519a0b  opencl-clhpp-2024.05.08.tar.gz
+sha256  51aebe848514b3bc74101036e111f8ee98703649eec7035944831dc6e05cec14  opencl-clhpp-2024.10.24.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 2b5d5afa4b..4bff6ad73a 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
-OPENCL_CLHPP_VERSION = 2024.05.08
+# The opencl-headers, opencl-icd-loader, and opencl-clhpp packages
+# must always be updated together to compatible versions.
+# Version desynchronization may result in build or runtime errors.
+# When updating one of them, make sure to check and update the others.
+
+OPENCL_CLHPP_VERSION = 2024.10.24
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
