Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D20C25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 19:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED4C60698;
	Thu, 23 May 2024 19:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRj_L_sWICJU; Thu, 23 May 2024 19:00:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76BF607DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C76BF607DB;
	Thu, 23 May 2024 19:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0921CE7FC
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 19:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A1924183D
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 19:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCpyQxoQKJE9 for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 19:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E500040142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E500040142
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E500040142
 for <buildroot@buildroot.org>; Thu, 23 May 2024 19:00:30 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-35507fc2600so23021f8f.0
 for <buildroot@buildroot.org>; Thu, 23 May 2024 12:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716490828; x=1717095628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hA2gq2xXv0oLjg8mjUSPsVALaTPr6yP/meG1I4BBZfE=;
 b=BktKdi9xEibwENnN6e/o5IxFyEPq8UajMsEQv8WPKvNlVv3+PKgcS1nJHZJOxEVU0b
 PnLMORcRdrroDL05vBo4qgaB7J65WgR3FbAoNhCNfapnblXygno6x7L+/qbpX9RWcisf
 oF+/SrLMoeCdjxJez6cjErLdt5rm3nJzQFyJG/z6USt78CvILGg3TYxtep/uNggcDJ5D
 EdH/1GWfxczyDM/Kqi2oHI9cp5dwvJ4Z8y6YmX8xq1WiWrVHDIQ6YkCknFRHpQcYrvnZ
 yyhy2i2CR+vy4XZSdEq2qaRCoLZoZaVIbHMTgw+AFjAoS8lU7MD226dA8M2mbYlNzRDA
 MMyw==
X-Gm-Message-State: AOJu0YxCuKJRPa2c68t6j0V+BnTUmTXxogIgnHOYajZVvFQRpJ++Osmv
 Vy/u4eAQx51u8Lf40nlWrKyIygX9qPuqTIpmIhYHjsqkfDMZ211HSvyaaA==
X-Google-Smtp-Source: AGHT+IGOSQOSWsmMkJhqQe+NNwdpEg3rV8Yy7mC+XR8+44m/VNotvYIKyZyPEHBIdkslefxWiiNx3g==
X-Received: by 2002:adf:f8c4:0:b0:34f:7b5a:e52 with SMTP id
 ffacd0b85a97d-354d8d9ec21mr4306610f8f.63.1716490828279; 
 Thu, 23 May 2024 12:00:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354f8e1522csm2158149f8f.42.2024.05.23.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 12:00:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 21:00:23 +0200
Message-ID: <20240523190023.1580129-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716490828; x=1717095628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hA2gq2xXv0oLjg8mjUSPsVALaTPr6yP/meG1I4BBZfE=;
 b=KIrk9xSn16oRR1Mg7TtE0ikNGoM3+xmS4I3TUDaDaCBATNIHlVsZfXHRtttLpX9Pw5
 Cgyv1f933oYX6Hf3XBTjygnvGMG58ehmtjRhjbIAJG5skBwmlZfaRyYtAJAnPRIsBV1w
 HBOJ5z/nQwrB+Dhsf8Nkyae6paQdwn3IKrCYCUniFyAWMKvfyy6s3hwB8gBOPfU8X+H1
 AoRaFiA0SpnDA7T67G9SjiWYkLLdMMqqJu3koSIVRrnYo2RxL9i9RTfJb1I9dvCC2exZ
 ODWYPuk15Y+f8JlKehX4q+ZOpfWeiuDG1gqJLAZ+WIk+aSGaNDvhI3r7ZNTC+wZBJGGM
 cOZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KIrk9xSn
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/nhorman/rng-tools/releases/tag/v6.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rng-tools/rng-tools.hash | 2 +-
 package/rng-tools/rng-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index 4c86791267..80d43edc46 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894  rng-tools-6.16.tar.gz
+sha256  4aa50994232da74499b60b3ebf79118e30a1943be375b7d931dcf18df5442fd3  rng-tools-6.17.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index f50005343b..d1f41fd4cd 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.16
+RNG_TOOLS_VERSION = 6.17
 RNG_TOOLS_SITE = $(call github,nhorman,rng-tools,v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
