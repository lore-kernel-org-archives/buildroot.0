Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E10C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69EE78175E;
	Mon, 16 Sep 2024 08:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjpqYzvLXJ-R; Mon, 16 Sep 2024 08:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D9681755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D9681755;
	Mon, 16 Sep 2024 08:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B912B1BF311
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A78EE40ADF
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1PyQZtzb5_b for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 08:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98B3340159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B3340159
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98B3340159
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:35 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a866902708fso82333466b.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 01:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726474353; x=1727079153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPMr4wlFxK1Qn3WXZKIZkVoL/pGbuky3hYTyjTz+wPQ=;
 b=CK/WxaJmhSMPjoaJaQRLXvW00tipeJLTC29wfduvD9pJOA7dEJyHO+TUC6AzvGpzcU
 Mu/+K+ZPO/OfgEzQgmmBQzVn0GTiavYp1TcmmBwheVYryE9nL7tDDEeE1XrBU2oGqgly
 GGDoYo+/bEyiNrolFPA6BtevB8qNPwk5OMCXA9fmAEql+v91/g6cZHtxwoWEa2Jk5wMc
 u8l6oKmfLjvwTpbIdvYAjQ9LQxsNURxG+jWc5YI9+qSgPvafr3hze/HeKKoKjqN5UWee
 YB2g5PCcHi61va1CMmovR8SlTa6m49CAC4R8cY1o5PPqrK8YTIGKcNpKBohyeZcBVEL0
 YqaQ==
X-Gm-Message-State: AOJu0YxgPiNkV0BnnVn8PoqcptYC+CDPJThyztTo4tWjs5Yrxjb+WRYH
 +iVkkS11C+QT/6HiT+GE65usLA2GHIZgF2vWTQpLgiMbToI6skPpFmv6ccKTGjijU8DKv4gz9Sk
 St/PQQA==
X-Google-Smtp-Source: AGHT+IEW67OIb0WAraCLMuvVr1r1FnHsBrEtp6fawV7lXBLfcjDIZrdSpyo4/lVedUqjw/kLShlxWQ==
X-Received: by 2002:a17:907:6e8e:b0:a8d:2624:1a85 with SMTP id
 a640c23a62f3a-a9029641b35mr597802066b.12.1726474352279; 
 Mon, 16 Sep 2024 01:12:32 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3a25sm275449866b.111.2024.09.16.01.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:12:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 10:12:29 +0200
Message-ID: <20240916081229.14823-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
References: <20240916081229.14823-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726474353; x=1727079153;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPMr4wlFxK1Qn3WXZKIZkVoL/pGbuky3hYTyjTz+wPQ=;
 b=e8csQq/9RDAuFexif03agMtW4UxWiFgqNT8SBhAtsNkcnyh+N1on3uquDBfKZI8BRq
 AjAh5+mxEpQ7yWNiZj+8iURqIDHy/6ABjpbBPYQ81MVMxKDzaJqYlFHeV56wsQlxEDw8
 SdqInrOY66dmjth3UA0qiEzwrnghhgueDrkFc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=e8csQq/9
Subject: [Buildroot] [PATCH 4/4] package/flutter-packages: bump version to
 df88c814
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
 package/flutter-packages/flutter-packages.hash | 2 +-
 package/flutter-packages/flutter-packages.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-packages/flutter-packages.hash b/package/flutter-packages/flutter-packages.hash
index b51eefbe80..1a8613ecb3 100644
--- a/package/flutter-packages/flutter-packages.hash
+++ b/package/flutter-packages/flutter-packages.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9de635d61d9efc0fd42762c1814086ead28ea6a372a6f8a99ee97060a3323fb3  flutter-packages-71e827e7df6833e6942873361f189adcb041d7f1.tar.gz
+sha256  ddaa74f1d4a7d2c07dc620ccd5d33743b2c1ec6261d1cd00df74bdcf78aebb3a  flutter-packages-df88c814248ddc88fdc0ac0a75d94179f39d644b.tar.gz
 sha256  89519eca6f7b9529b35bdddd623a58c3af06a88c458dbd6531ddb4675acf75a9  LICENSE
diff --git a/package/flutter-packages/flutter-packages.mk b/package/flutter-packages/flutter-packages.mk
index 407dd31a0f..bf39bb4488 100644
--- a/package/flutter-packages/flutter-packages.mk
+++ b/package/flutter-packages/flutter-packages.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PACKAGES_VERSION = 71e827e7df6833e6942873361f189adcb041d7f1
+FLUTTER_PACKAGES_VERSION = df88c814248ddc88fdc0ac0a75d94179f39d644b
 FLUTTER_PACKAGES_SITE = $(call github,flutter,packages,$(FLUTTER_PACKAGES_VERSION))
 FLUTTER_PACKAGES_LICENSE = BSD-3-Clause
 FLUTTER_PACKAGES_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
