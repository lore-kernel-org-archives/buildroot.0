Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC97C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 22:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C37281354;
	Mon, 26 Dec 2022 22:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C37281354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6jAvED-xPBJ; Mon, 26 Dec 2022 22:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098C881347;
	Mon, 26 Dec 2022 22:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098C881347
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 638671BF28E
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 22:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394EA60BB8
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 22:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 394EA60BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHA-txfqBC08 for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 22:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 412CC60BA2
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 412CC60BA2
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 22:50:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id h12so7069639wmq.0
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 14:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mLCLPWe4lKYP0m81bpqamN+fNLKMtcz4xakEdhqWQPo=;
 b=pgsBe3mSlQPRySBHG67d2Bqye29inty5IWZdSSy5V/fOsODIeSinghomhkshMjeHlB
 QWxfueEyLkhHfUlPK7o34+rAXAqzdQeHSbcMgT5Cf2U55tlo5zLzPn+ynAYje/v9RnIU
 jRjmYjb3a16XMmm81fxQCmOI9+Kg2hAr3TyiflHjXHAsgmfDgAT3yOVr+XnGCyBR7wLL
 zdLT1ooMKq6KQe7Z3++0RfxVdUhsx3IwwAoxuz2ZNqbao8GR2uLEsPLncbln4E6XwjCJ
 P8HY2qu7x9FYkIF5aF4f6R7/eX1gzabhoYKh3oyF/Q9lVQiJvUzL7+FZhdWizokxm3/t
 WEXQ==
X-Gm-Message-State: AFqh2kqdOEB4GMYu3smWPT/w12NKVzBKtOENTLnuHymzhSJGuUFHg+tg
 /LbbpRhETl6vR8Tzs81tQv8irQnZt+Q=
X-Google-Smtp-Source: AMrXdXsHqtE+oaIn1gYLCJ0Hb5zqbwGGJyjmSzWh21pzHbzj4woFYZwDz9BGs7xre5Ya6nKWNmUCFQ==
X-Received: by 2002:a05:600c:3d12:b0:3d3:5027:89a4 with SMTP id
 bh18-20020a05600c3d1200b003d3502789a4mr16954942wmb.7.1672095039102; 
 Mon, 26 Dec 2022 14:50:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c350c00b003d355ad9bb7sm21942354wmq.20.2022.12.26.14.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:50:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 23:50:35 +0100
Message-Id: <20221226225035.825216-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mLCLPWe4lKYP0m81bpqamN+fNLKMtcz4xakEdhqWQPo=;
 b=qjhaikyKHUETkn5x0HLzkc0uSHB2gFFKcCOc4SJIJvNpf8sowttGF+45/U5tuF1K/c
 nx4GfirYJg9OoR0oYVVSmkSZnxmHFz10bIsd/sgSO32Xgrz7Pb0z8yRD5vfE2GppU4TW
 wHWDsG2bGJabyuVpJVO53v+oue/mCWEn6Ivr+0eqrvq7qsLVQ1S3NdzRu4X3zYzljPXq
 YkgVbvWa69wHIJvH5Go6yFYPb/m7qdwK5kFNbs2f8SIXJN2HEQ4coMDM7p3lxlwCVmWr
 qYTZ+XctrILomfxR6RcZVqqVqm7n+5OMUMZXdjvxb9m2zHHrBqS89wpLFLTG4zGXy+Ol
 YzFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qjhaikyK
Subject: [Buildroot] [PATCH 1/1] package/dump1090: bump to version 8.2
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

https://github.com/flightaware/dump1090/compare/v7.2...v8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dump1090/dump1090.hash | 2 +-
 package/dump1090/dump1090.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index 23178567ac..8a4c3a4818 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dfcf57b19f43e0262b1a03b0dc5069a9ddc48427d85378b7ef52fb4e74911eef  dump1090-7.2.tar.gz
+sha256  1ab8a5acd891bdbba586e2e9f2d9b056210940bd47b5c1a19d133eb091f31555  dump1090-8.2.tar.gz
 sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 82eaaf2cb8..60ef4a9bcb 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = 7.2
+DUMP1090_VERSION = 8.2
 DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
 DUMP1090_LICENSE = GPL-2.0+
 DUMP1090_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
