Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13E9C54756
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B05AF61330;
	Fri, 16 May 2025 17:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hb5t654CcDJF; Fri, 16 May 2025 17:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77CA61363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77CA61363;
	Fri, 16 May 2025 17:12:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B0D13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E295483A4A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrGTKWp7yVyE for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B420A83657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B420A83657
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B420A83657
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:12:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so17039615e9.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747415547; x=1748020347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uay6tcxOe485GXB3OzbXw7EEcL1nJhJon8luQwV3kMQ=;
 b=wyAqBI2Mz2uWGsgcGSfs/9IiCsRI1LQwtGF/6OHMQsDnlDwEf5TrXGHV6gvNcV6qRt
 okVQgsuUx1o9i4gxYlbQ8v06uM4ox1S2uphqJybQXsBFeWw2TgsEOxAS+kvumC0IABt7
 sx0FqgKyUjxDNokcl2OmFIaetYFhjk4lIpGVUi2IjROVm8l9kXOGaeXDbjipSyDuXhXg
 J1A6xQ3y+EvlDvVGYUKvaQX/oDdKBQg9qj4SIZhYwamldsB45+W8Dpcn7LITPh4QX8oz
 0PIowsD4+k9RH8loquOR5d383l5+OrODkvejMU4TV2v6YRkLKVrnjNH4GUeCX8qKWwJv
 iaNg==
X-Gm-Message-State: AOJu0YyiH+M98Bln9V88wZyiR+ObDJrrZpeW1Db2EcXlWcLlFTgZgBaR
 aaW1BNWt9TsBizmEMwLUEk+f377wS94OScOX7CZThIHgXgULAFPCXMUzWlH7/DFIGhmojUzuYDX
 d5jFG
X-Gm-Gg: ASbGnctqtt7V560hReuYKmQiVia3qL/fNLoAzfW8yrd8ZQX98MPE8zzyYvm1O7I3cAe
 VY7uhxLORSmRgGB4h7ymD1Qjqhnmfp12m6mZHJrjQPqYMPolcUtUSPMW+j2YO8N402ltVnId6To
 hPz9QzZSo1bs4Csrvp9fx+QAbb152JwvML9K5whK95PYP5FB1mW03EqisBFWqPWUKZQ3Do5FjT/
 4AkcboFnKvPGB52S4e4fLazZvc2oJqPP4UXOrEwWmyVDhF7OcvpyZRWI53iKYcz5f5oyFPhVJT9
 4VlRWGO+HJ+coKMRgMfWxh/NumIRg2d3lZlb57Wa2+d+5yP5AY5UTZj3GMNFKH0o3S5OGx2beON
 uHk/iT4Ob16dZ7yfty1Rt4dPseMwo6h1B/CxUw60/7E5NZy1neQ==
X-Google-Smtp-Source: AGHT+IGn3PA0DHbzm6pH7Nz5GUU8kknrSbnGqkTI7fqMDD0YMfonklyoB83TdyiVAdbOjq5JnLDalg==
X-Received: by 2002:a05:600c:1d28:b0:43d:ea:51d2 with SMTP id
 5b1f17b1804b1-442fefee236mr34331375e9.14.1747415547050; 
 Fri, 16 May 2025 10:12:27 -0700 (PDT)
Received: from P-NAN-ABRICOT.numericable.fr (185.137.153.77.rev.sfr.net.
 [77.153.137.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f482f1d6sm105479675e9.14.2025.05.16.10.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 10:12:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri, 16 May 2025 19:11:33 +0200
Message-ID: <20250516171134.1687054-5-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
References: <20250516171134.1687054-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747415547; x=1748020347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uay6tcxOe485GXB3OzbXw7EEcL1nJhJon8luQwV3kMQ=;
 b=Bm6Pon8uIzDYLseFSsI9YeR/Lvev9Jj4qenuG0xlRMXaRcaLNa/rSKbyqN1sMdhpk2
 ZU4vUGIGFDsOd4dQT6IkHN2OeD7m8BxJKsx457S52AkEKpsuHsYMujL6GCYFXGBRAqGg
 wwRrHkfMN5M5hwF1qAUDySrI84TjUkMeY+6Vw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Bm6Pon8u
Subject: [Buildroot] [PATCH 4/5] package/spirv-headers spirv-tools: bump to
 version 1.4.309.0
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

Update SPIR-V headers and SPIR-V toolsto version 1.4.309.0 from the Vulkan SDK.

This versions are required for compatibility with updated
spirv-llvm-translator (v20.1.2).
The source archive now follows the vulkan-sdk- prefix convention.

release:
https://github.com/KhronosGroup/SPIRV-Headers/releases/tag/vulkan-sdk-1.4.309.0
https://github.com/KhronosGroup/SPIRV-Tools/releases/tag/v2024.4

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 4 ++--
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 136f3df733..e6c176e9ee 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32b4c6ae6a2fa9b56c2c17233c8056da47e331f76e117729925825ea3e77a739  spirv-headers-1.3.261.1.tar.gz
+sha256  a96f8b4f2dfb18f7432e5c523e220ab0075372a9509e0c25fbff21c76af0de7c  spirv-headers-1.4.309.0.tar.gz
 sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 9f84c42b2d..67c3a21389 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.3.261.1
-SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_VERSION = 1.4.309.0
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
 
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 65cb9c619b..a09c8ca9c5 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ead95c626ad482882a141d1aa0ce47b9453871f72c42c0b28d39c82f60a52008  spirv-tools-1.3.261.1.tar.gz
+sha256  6b8577054c575573ead3ad71cb6a2c0b3397b64c746cc3c99e48cc5e324c1b55  spirv-tools-1.4.309.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index e863911b03..16652cb158 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.3.261.1
-SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_VERSION = 1.4.309.0
+SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
 SPIRV_TOOLS_DEPENDENCIES = spirv-headers
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
