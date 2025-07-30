Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4003C87FCC
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 07:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E94835E0;
	Wed, 30 Jul 2025 07:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhMM8B-t_hDt; Wed, 30 Jul 2025 07:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A8E83827
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A8E83827;
	Wed, 30 Jul 2025 07:46:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FA22186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 07:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE86835E0
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 07:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-_YBFRsQHeo for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 07:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13814835A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13814835A7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13814835A7
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 07:46:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso34615965e9.0
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 00:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753861582; x=1754466382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WgMvEj1cVkD8puBNLb6pOSG3AN9ElUfVw71Vh8wCWBg=;
 b=D8vvx8SNFJeD3j+NCOyW7pbAReRPUZtX4AyMqn0MbezX36lGHxksDd5oCUmy9FRUWs
 lYyFHAncB4JdK/ZlIy9kxebAqzf4n7amMxxH6SciPBbL3zrnvAudjLgebB/b7B6TGJ3j
 dVdYaiQh+YE5dH1BHnOoG5IZD0SuYcaccQcKBUiFbT5e111vTezB3aeYOfYMD24k1sWZ
 sUYczunFeDCWKs13Sw9tI7Fr19Uze6lG7SOZVK08uj6QzptLlabW0l7m5NP7nVO6wSiQ
 9AMDeEYgmenGtJcBN+ASwB07zoxTsD0T+upoeJl0VfOOOcHSii0/mZP9pl9H73H7uis1
 PREw==
X-Gm-Message-State: AOJu0Yw4jw9qsTSxnJ+dQFabFIlJiEAwYyh1fk+9/xI2HKpF0shH1jMt
 w+hIM9BzFiI+LlUPh7ENWgvmDEptg/76XBZwAGfg6R5ZAUsCCjm87xZ/RBdBKA/6q3bvXDDc9Vj
 t7p1S
X-Gm-Gg: ASbGncvjwdCjnYcyb7SfaO21TDPN/+DJitQZcTEoVbkR4pvW+PAZ/lbQLX8R99qvPVn
 57RPAZsRaMTy6TvFYskkF0tvY38wsAd67moNZr8Vc1T80YcWVola1qzv0iUiy3/FPRsrv/kEjpI
 jyohtLNOn63t/VT5VJs/Erup3fyQnB8mr7oEJHqW4kDcSvpUucQ5DJYZgQxXrMY7CRFwT6JraZ2
 LYo/j9mlb8j6LWpmhUQJLbQf8HjBO7OaQXUpf20A0adJVV6rsg0EGq+ZGkMoCoO5p47I/HF90KR
 GIEO6F77n7HLAddcONNSQYY7b437+Uo8Td2PsQSgI6JS4S+aGLEwmhtwyJ9qlu/hPjEQyChKW01
 DMRodQ4eVJSFYnUIcHJS09v2DAkBR+Y429QT4mrHqDUc+nYSEovrcMThAVpo/nXk7U/s4FhTxXa
 JBSCl1OkL74+YpNsec
X-Google-Smtp-Source: AGHT+IEMyyIqYTu8qlUa8L4qnp0QxoqwG1HLIvWmHNi13x/YLCjlnmFiCafyy/WUNl3IuQKTkslEkg==
X-Received: by 2002:a05:600c:5027:b0:456:1204:e7e2 with SMTP id
 5b1f17b1804b1-45892b9f1e1mr21522195e9.12.1753861582504; 
 Wed, 30 Jul 2025 00:46:22 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953b3471sm15522465e9.30.2025.07.30.00.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 00:46:22 -0700 (PDT)
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 30 Jul 2025 09:46:08 +0200
Message-ID: <20250730074608.2400345-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1753861582; x=1754466382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WgMvEj1cVkD8puBNLb6pOSG3AN9ElUfVw71Vh8wCWBg=;
 b=e/8h+tuENOq0PPNWORuuvzT6OHEQB9Fg1htZ2ZAyj6d0wl4vxAymHPrcdHQXZ/hnnD
 c2gs2YDyX7s8B/sqGA53KJidWV79jwbmkCFMulz7yhgU5zyZRdytZ09syiUb9TzbAfa1
 iza0bmuXqDHKPtQHXb54EoI08K7gwMzIjAaBc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=e/8h+tuE
Subject: [Buildroot] [PATCH 1/1] package/{opencl-headers, opencl-clhpp,
 opencl-icd-loader}: bump version to v2025.07.22
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

Synchronizes with OpenCL v3.0.19 specification release.

Releases:
https://github.com/KhronosGroup/OpenCL-Headers/releases/tag/v2025.07.22
https://github.com/KhronosGroup/OpenCL-ICD-Loader/releases/tag/v2025.07.22
https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2025.07.22

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/opencl-clhpp/opencl-clhpp.hash           | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk             | 2 +-
 package/opencl-headers/opencl-headers.hash       | 2 +-
 package/opencl-headers/opencl-headers.mk         | 2 +-
 package/opencl-icd-loader/opencl-icd-loader.hash | 2 +-
 package/opencl-icd-loader/opencl-icd-loader.mk   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index add8563757..a8f56c5a43 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  51aebe848514b3bc74101036e111f8ee98703649eec7035944831dc6e05cec14  opencl-clhpp-2024.10.24.tar.gz
+sha256  c1031afde6e9eb042e6fcfbc17078f4b437a7e8d55482a1ca6e0fa762d262a89  opencl-clhpp-2025.07.22.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 4bff6ad73a..dbe90f6b41 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -9,7 +9,7 @@
 # Version desynchronization may result in build or runtime errors.
 # When updating one of them, make sure to check and update the others.
 
-OPENCL_CLHPP_VERSION = 2024.10.24
+OPENCL_CLHPP_VERSION = 2025.07.22
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
index bd8697e43d..535884f68e 100644
--- a/package/opencl-headers/opencl-headers.hash
+++ b/package/opencl-headers/opencl-headers.hash
@@ -1,3 +1,3 @@
 #Locally generated
-sha256  159f2a550592bae49859fee83d372acd152328fdf95c0dcd8b9409f8fad5db93  OpenCL-Headers-2024.10.24.tar.gz
+sha256  98f0a3ea26b4aec051e533cb1750db2998ab8e82eda97269ed6efe66ec94a240  OpenCL-Headers-2025.07.22.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
index 388a86e02e..92f6a7fb1a 100644
--- a/package/opencl-headers/opencl-headers.mk
+++ b/package/opencl-headers/opencl-headers.mk
@@ -9,7 +9,7 @@
 # Version desynchronization may result in build or runtime errors.
 # When updating one of them, make sure to check and update the others.
 
-OPENCL_HEADERS_VERSION = 2024.10.24
+OPENCL_HEADERS_VERSION = 2025.07.22
 OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
 OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
 OPENCL_HEADERS_LICENSE = Apache-2.0
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
index da9f75b63a..347cfe6e91 100644
--- a/package/opencl-icd-loader/opencl-icd-loader.hash
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -1,3 +1,3 @@
 # locally generated
-sha256  95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc  OpenCL-ICD-Loader-2024.10.24.tar.gz
+sha256  dff7a0b11ad5b63a669358e3476e3dc889a4a361674e5b69b267b944d0794142  OpenCL-ICD-Loader-2025.07.22.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
index cb3d7e462d..222f051a75 100644
--- a/package/opencl-icd-loader/opencl-icd-loader.mk
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -8,7 +8,7 @@
 # must always be updated together to compatible versions.
 # Version desynchronization may result in build or runtime errors.
 # When updating one of them, make sure to check and update the others.
-OPENCL_ICD_LOADER_VERSION = 2024.10.24
+OPENCL_ICD_LOADER_VERSION = 2025.07.22
 OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
 OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
 OPENCL_ICD_LOADER_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
