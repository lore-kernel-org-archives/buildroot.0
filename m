Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF90C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 14:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 255124063A;
	Thu,  8 Aug 2024 14:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XkPHpkRqNYF; Thu,  8 Aug 2024 14:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2E3540B3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E3540B3D;
	Thu,  8 Aug 2024 14:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E8301BF294
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE6640B3D
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59_CBlkT7ZvQ for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 14:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D03C24063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D03C24063A
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D03C24063A
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 14:17:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5ba482282d3so1272769a12.2
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 07:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723126669; x=1723731469;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52vLZsMiU4N108Jp/4BzcgGNl+TwwRemmxMZqX/NL4k=;
 b=M6DF3G5Byg63usnEaXmV1okRiZyMVhK+6L+9/1hfrEng9U3zPTCzxr2y8R0Aua44XS
 FGZREiM5KNAj+nke5t5SPBVa9U5s1cPS5pw2ye/MDBV1KCqt45NWDpbaY7aJDBix1KRh
 O4aCTNKIljuks5JAidIpyUgWzzrD7Hs84TIH90vtw2x/cqcdR7mzaaklUe731rHqR2qO
 5gxVM0zCEKm582iqgCA/ngCP6M28ixYa5aBgSS+PL8UulNoUgQIc/EX2q9WRPfytSW5A
 VYoloeKwxfdFSnLez98dsMJSqWr0GqzBlyQgI3fzIrLrE/NDdSNmTLvCg96eg4cYbCy+
 3c9w==
X-Gm-Message-State: AOJu0YyKkAZ61NpqPaobhZsacwvDuK9gKBv9U1cZwuknYKwVkqBLSHWV
 k8FT7SR8UsUHQm7hjSmAOP80ZtUwFFGwFgu0upSZ6r5864xLCf9L+JNh1GG7U2FFZMMD6yC8/kD
 Lb8ZYzD18
X-Google-Smtp-Source: AGHT+IEkEWkgKnSxNiF2HoAxbArNiV62pugQgqkXeyWu0aRyjTriLSdSdBo8a67q7dEdoWfHlscg8g==
X-Received: by 2002:a05:6402:520e:b0:5b9:3846:8bba with SMTP id
 4fb4d7f45d1cf-5bbb2182b1bmr1481027a12.2.1723126669491; 
 Thu, 08 Aug 2024 07:17:49 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2a02:a477:a7d9:1:3678:e036:10d9:128d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d34a74sm701780a12.69.2024.08.08.07.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:17:49 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 16:17:43 +0200
Message-ID: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723126669; x=1723731469;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=52vLZsMiU4N108Jp/4BzcgGNl+TwwRemmxMZqX/NL4k=;
 b=d9sDPA4Cy0UHV9RKOBpKILfT97ip9wjc4RtMjBWuA7UAJNudyMUOhiFlc8Gwcpx9RM
 A5AcizFsKvcXLnYfIM1Yo+K2692unl5WPJX5Bh/rxy0zYmV3BF0Dmz6KtuKUvEB4eJCs
 MOQvuKOvDFCKH4Vg2CAFG+JaqDqr/234n5gIk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=d9sDPA4C
Subject: [Buildroot] [PATCH 1/5] package/depot-tools: bump version to
 75932421da2cd8b5807a4ac52ed2a6f46d7c2120
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
index e2dfe2f923..5e172a9a9a 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  75cc0f9c8bf711c1821b2b1ac873fe75c6fa256f5cdd6a5585a02214ed36d792  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-git4.tar.gz
+sha256  c085a4bc561c90555555461d5810dd406e723618313f24eb2161421f9306b498  depot-tools-75932421da2cd8b5807a4ac52ed2a6f46d7c2120-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index a53afa14d6..0d7048b8eb 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 8d14454ba4a35fd9d2483842b08815a2357ec86f
+DEPOT_TOOLS_VERSION = 75932421da2cd8b5807a4ac52ed2a6f46d7c2120
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
