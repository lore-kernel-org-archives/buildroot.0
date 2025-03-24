Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425D2C3600C
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 09:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E51340EC1;
	Mon, 24 Mar 2025 09:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvL2tH4Leyta; Mon, 24 Mar 2025 09:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 457F7410F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457F7410F5;
	Mon, 24 Mar 2025 09:44:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CE98C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A7F81801
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8zGxAV28phd for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 09:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEE3880DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE3880DE6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEE3880DE6
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e78378051aso812137a12.3
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 02:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742809470; x=1743414270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1iP4phxABritOPcEJKue7VnI4/gEpnVghyiLPlB97k=;
 b=oYk7Bfbe1DQ7gbScD3aw2X0SKYu7LdjQtL/ZASQgqouQYgIg6csEAPUF7BxaKBGGDI
 3c89ClVGME+0UTHT+0uv2XrGMYWBTnE1zwW1YamnNPBK8WHTsiT/al5ElSiuYCPUJqbP
 qpLYHLmerwEyw9TCEbkFntH895SC/dLo3Xj4Tc07wGZ3a02VMYNasXjzLAsQxfGES2xw
 HUp8kg5CgMTlPCxn3gMVOQAZ/ScQGoMFjjkRMvEj0kHhncJakgg0ryqE6SIV44wlZhjL
 WcxHLeiyv/ct5dLVMFbwGeAtvsr5WbTFRdOPR0prdPdeZlbSE7wmbKOIYWAuTowzO8ju
 9JmA==
X-Gm-Message-State: AOJu0YzK/UhS6FCTRcLM6qiaFu9ifzrl/yQ8ICE9+R1zPn0UTCywZsu2
 Pk5f+ZhuPqDQd7/CWBNRRAC/sCVxFHAZ0uEif0ZYMXx608giWyDtuTOJlnIskAF2Lc4gKOSNfhf
 o
X-Gm-Gg: ASbGncvUXxCSaFQRqyb1GBjA1k8UbHqbPwDUL5fNrn6Ewr6Yvhl3qOWJlI4e3ey7kb3
 7h7IrNqvMokjcbKJitULHsg7uez4kZ43a6lbfDolka5gyM019ouFZN6uIDQT1TYYmhj6rqLEopS
 Bc/PMD5Eahq/yUS/goYCqfz0rZwGBpjG4iix/dv2KOY0z2NRZJNycSh3NDp0uPaNB6csZKcH3IU
 0qra1HhDtX1kRl3QWjnzVBE2CexJmipB6Jjy+roZrGbJOV8ppz9u6mgX2NwgZrP/14QeNGaKyfw
 um6p4ntMhyEiEEu4uOsyEAy+0AkvQJo839i/DVN4aK1UEeqwSjAzj3jrTh35nu8bb4dc0znw6nt
 /GfYPIHvoeh/UiwVEdxP170Pil09OyQ8TTjdA9bgSoa9BUepcbczgyEoUm5vlv3mXaqLZm78713
 AblKVPRZJtqA==
X-Google-Smtp-Source: AGHT+IEgNP+GlTkH7G/VCo229QEXzK2QpnV17WMobgO83LoJdTBkuw1ha07v2/cbI+nMEvzQSAQeIA==
X-Received: by 2002:a17:907:6e86:b0:abf:663b:22c5 with SMTP id
 a640c23a62f3a-ac3f252fc38mr417786466b.13.1742809470070; 
 Mon, 24 Mar 2025 02:44:30 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef869fd6sm653841666b.19.2025.03.24.02.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 02:44:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 24 Mar 2025 10:44:23 +0100
Message-ID: <20250324094424.428727-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
References: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742809470; x=1743414270;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1iP4phxABritOPcEJKue7VnI4/gEpnVghyiLPlB97k=;
 b=q0Q+RT329R1X+UgrZqA3jdl15+LXmEQmxAqkA7nd7H6gLz1bwKsSPWd1h5ih4EF7dV
 oO+LNYOTYbiR3b76vqOrAiNbULXMS0mlq8Eozg+su79Fu3xeqf3RlRG8cgXJg0BEfosz
 O/CRZmsfVFUORXM3/Hkq7MyWjFXAUisDOc+Zw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=q0Q+RT32
Subject: [Buildroot] [PATCH 4/5] package/flutter-sdk-bin: bump to version
 3.29.2
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 02fee767a3..3c4cdb69dc 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61497eb64cd7b3aa99ca9911ccd921c8dab79afd909ca1c9ff9546067ebcf6ca  flutter_linux_3.27.1-stable.tar.xz
+sha256  6096f21370773093ec19240e133664c1c12eb8b5a85605a92d16ce462a18eac4  flutter_linux_3.29.2-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 68cce21eac..e1d6a9fdaa 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.27.1
+FLUTTER_SDK_BIN_VERSION = 3.29.2
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
