Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E957C54FAD
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED39D40B8B;
	Wed, 28 Aug 2024 12:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VH829NW7N_NF; Wed, 28 Aug 2024 12:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F4640BBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F4640BBC;
	Wed, 28 Aug 2024 12:31:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE6711BF83A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB96460845
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C27VfE_IbMIY for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DADCF6066B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADCF6066B
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DADCF6066B
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:31:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-368633ca4ffso677339f8f.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 05:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724848282; x=1725453082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0qdYhhB/fRsq8jsY+R2seB6qsqD5aj8LrmKNNl5wXc=;
 b=hAKnB3JzE/lmd2OlfMO1dxOnatghHGiPgb6YZUgVLPTWz51tO9vLVqjHzGS/WCs5e5
 3acdPJgLQrHzsnC1bS0Zq9/NQsYL1mJOyI1aXNGbwNwNADUWRBkkRs586XiZKY6XZtvD
 r8Y/qMHsOBe3pdTvE+JO16j/ISZY0P8SzcVwMzA/guD91Odkk7f8sl30ejBEsX7GUvKU
 CGjFV1ZmgjChdCT6aYSqYqlM50uO5QHuxe7V3hmOvgWdPXge/c3lvVJlHT6TYbXg85+J
 mwy2wyKVUMnBsUQVfsYNvy7yPKMk41iECANKAUaz6rPN6uyF0ullqtrr6O47/LTfvfEk
 2ZGA==
X-Gm-Message-State: AOJu0YwXLWNP671YNEc626048tHY9QTFqB68AC5bptCY4URR7el+V3JB
 2u/zVFnsHobHOGFJbp7WDEuaT75yBUxUWQrPleQDuV65i4pnaPr6y+eaJdTj2bJYJRc4SRzH33u
 w2ffjRw==
X-Google-Smtp-Source: AGHT+IEO2wHnaJL78wZP1SrUwvmNBUTTW6sQptQkpxa3+YZCvDQpdQYOHugbvoMmsSX4WNRgyd03ww==
X-Received: by 2002:a5d:59a9:0:b0:371:8d07:f84b with SMTP id
 ffacd0b85a97d-3731191519cmr7490257f8f.7.1724848281005; 
 Wed, 28 Aug 2024 05:31:21 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-f0d0-88f0-0971-2ba5.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:f0d0:88f0:971:2ba5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54a014csm244011066b.90.2024.08.28.05.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:31:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 14:31:15 +0200
Message-ID: <20240828123118.62315-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724848282; x=1725453082;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0qdYhhB/fRsq8jsY+R2seB6qsqD5aj8LrmKNNl5wXc=;
 b=XtngCVcfpclBtsAgBl61BUMZFXjnIkZNDeP4DGoZ8abcF5BpTWGHkGip5V3Q8T+/+G
 Aba4rUYMIW11DjNQIcgrFSsFkJGsX9/omdZOGC+5hdJOoo1476aXrsATKS1LGxBnrqZ4
 3XFXIC5d9W1eYP2F0/fOK4Y4G7+0BaM4KmvFA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XtngCVcf
Subject: [Buildroot] [PATCH 1/4] package/depot-tools: bump version to
 c1457823a0f713e5a81dd899868e10d5af1a4c5b
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 5e172a9a9a..7debfc55d3 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c085a4bc561c90555555461d5810dd406e723618313f24eb2161421f9306b498  depot-tools-75932421da2cd8b5807a4ac52ed2a6f46d7c2120-git4.tar.gz
+sha256  f2d1791b0cbfc8656446252fcff7d94cd4df1bce769a4ad6e2085d4302cf13c1  depot-tools-c1457823a0f713e5a81dd899868e10d5af1a4c5b-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 0d7048b8eb..787c78d432 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 75932421da2cd8b5807a4ac52ed2a6f46d7c2120
+DEPOT_TOOLS_VERSION = c1457823a0f713e5a81dd899868e10d5af1a4c5b
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
