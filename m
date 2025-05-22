Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6832BC54756
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 07:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C86D613AA;
	Thu, 22 May 2025 07:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdOboAiml0t8; Thu, 22 May 2025 07:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2884C613BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2884C613BF;
	Thu, 22 May 2025 07:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9B8B69
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA3E483CA7
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjDccMGNU2ez for <buildroot@buildroot.org>;
 Thu, 22 May 2025 07:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B76AE83CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76AE83CFB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B76AE83CFB
 for <buildroot@buildroot.org>; Thu, 22 May 2025 07:18:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so56315265e9.3
 for <buildroot@buildroot.org>; Thu, 22 May 2025 00:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898327; x=1748503127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mPA5RBzLLeLfu6F349TbUg4e4buGJ5ygA+jXWMcGCL8=;
 b=cxa3WRAV6CpXPvTrJjRoefT94iet/3g/bGgx8tMYb7wSW/j8+n6KKVD1gpTl8Mh6Ly
 WCJgSi+dh+G7zaYE5i1ic3+Nm8d04DDoQt7PcQi155IqSFGd8XjLBWUfyqvpJ1DeFNeQ
 /ZzmxrMOIVWg2DW7SubpiMOz/EPHFZxaluolI98wbERCrZdhTHdLXyAmqHj41l4WwjT9
 YSTjjun/lys9M0f8OtinKvEi8bF2oY5wASdTZkwZp1uqsRa0mgqP+zKgLon8KGK1ufCj
 U8jnIGmtslmTEPlrzD/5JwxDpBcPSJsgAAQBVo2Fk3x1OsRZ09jk9WJB4ilbSTQKaFGW
 rmkQ==
X-Gm-Message-State: AOJu0Yzp3CKRB9YvILHRC7fdaJjsDLCZvtogf3Hvvf5pRwnO7Q5YPlJe
 kitYt3cmdgcX5iEzlB0xFwVJk3/4Q1Q1I7a5tdYBpXAooBMokIUdBVseIiSqpjUREYSyyrI1FuQ
 BBcc8
X-Gm-Gg: ASbGnctbnfpZQ/BJJ57CTy8Yv4lJmk+KFptaSxVByYd1NaNZ9njSnLQUgKsPUpunhQa
 DJGCQ5Wtdgvu7Tpg7bQIctobYeTzJaG+R+vjda0GfpQMjx7A/Q+/6a+MS1i81o3EmSPS4wW8jrQ
 yGvzJlGGJM+jRhaoroiS9ZaURG1UzycFkLLGGBlL2UIzhd9+ZGGSEUa3GZxlS2OmGVOCqGL2OmZ
 bHZEQ8UwQ/xCT79Qe0tThGKgzBVf/MysG2JkuseAehxI/XH+/lGiD3V4t8rc5eEKK7Cfy/GLrL7
 znWjtgwJQDpgPNdJXIqMULQ3ybtinvDZq8QVRKYtFY5GN0VRpHyrFinRgXx3V5UfWIUmoF2oW8Q
 TTo0I9BNXTVCBcPhXDSbtWH73HuBAGR5mULnGiRAw7UIV7w==
X-Google-Smtp-Source: AGHT+IGW5Rm1boRAkGGFlkeGODFWXfCHoYBXeH8IaKYMizdTb355O9G3g90ayFFi6y4wXcpHsmvd2A==
X-Received: by 2002:a05:600c:698c:b0:43c:eeee:b70a with SMTP id
 5b1f17b1804b1-442ff029b68mr172781935e9.22.1747898327236; 
 Thu, 22 May 2025 00:18:47 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142f1sm93835655e9.31.2025.05.22.00.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:18:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 22 May 2025 09:18:15 +0200
Message-ID: <20250522071816.1948188-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
References: <20250522071816.1948188-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747898327; x=1748503127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPA5RBzLLeLfu6F349TbUg4e4buGJ5ygA+jXWMcGCL8=;
 b=VUZNwoduv/KtzEr+LNDqEkxYqn+RneA60JC/k4s6gmFmXUHcJJwCRHdyXlSmo/TMEo
 72vdm4iAKecH8PdcKxuiC32eo+OC8vO9VcBpZGClVHteFVIfgOxrJyk/5NerHZTNWczN
 eesCEbruUE1wJNBlTOq5GL1Xt7A/In8VKaDvQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=VUZNwodu
Subject: [Buildroot] [PATCH v3 3/4] package/spirv-{headers,
 tools}: bump to version 1.4.313.0
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

Update SPIR-V headers and SPIR-V tools to version 1.4.313.0 from the
Vulkan SDK.

This versions are required for compatibility with updated
spirv-llvm-translator (v20.1.2).
The source archive now follows the vulkan-sdk- prefix convention.

release:
https://github.com/KhronosGroup/SPIRV-Headers/releases/tag/vulkan-sdk-1.4.313.0
https://github.com/KhronosGroup/SPIRV-Tools/releases/tag/vulkan-sdk-1.4.313.0

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 bumped to 1.4.313.0
 Updated license hash of spirv-headers due to upstream commits:
 https://github.com/KhronosGroup/SPIRV-Headers/commit/1c9115b562bab79ee2160fbd845f41b815b9f21f
 https://github.com/KhronosGroup/SPIRV-Headers/commit/23d4a398c2ccca05fc623cca8785ce7741c5345d]
---
 package/spirv-headers/spirv-headers.hash | 4 ++--
 package/spirv-headers/spirv-headers.mk   | 4 ++--
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 136f3df733..6e3cc33d6b 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32b4c6ae6a2fa9b56c2c17233c8056da47e331f76e117729925825ea3e77a739  spirv-headers-1.3.261.1.tar.gz
-sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
+sha256  f68be549d74afb61600a1e3a7d1da1e6b7437758c8e77d664909f88f302c5ac1  spirv-headers-1.4.313.0.tar.gz
+sha256  ff04ae7e6a468587fe59434fee2e67c0e2a749b592c794b764ff80f30b94a084  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 9f84c42b2d..675cef9f16 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.3.261.1
-SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
+SPIRV_HEADERS_VERSION = 1.4.313.0
+SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
 
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 65cb9c619b..de118b378e 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ead95c626ad482882a141d1aa0ce47b9453871f72c42c0b28d39c82f60a52008  spirv-tools-1.3.261.1.tar.gz
+sha256  6b60f723345ceed5291cceebbcfacf7fea9361a69332261fa08ae57e2a562005  spirv-tools-1.4.313.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index 51b1c9f22a..1aa0cc6199 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.3.261.1
-SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_VERSION = 1.4.313.0
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
