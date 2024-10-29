Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCD9D2AB1B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 10:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8846064F;
	Tue, 29 Oct 2024 10:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WbkSgIiFqIC; Tue, 29 Oct 2024 10:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D290960707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D290960707;
	Tue, 29 Oct 2024 10:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 783B0112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65547403C9
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gh6gGDg1eT2V for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 10:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49CE440276
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49CE440276
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49CE440276
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c99bcda599so685436a12.1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 03:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730198208; x=1730803008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tfruAHjnnVChZmN6/E2XYF1EGV2pi3Nb2Cp1QJoT8/k=;
 b=tSPGk9Ypnlxb7KtPQyoViJf9Zp8cUjBItpmg/OVt5iOcy42Trl9ReLqK5QoDGrIiap
 VH3tmZUWVlDcgV9Sq5z7wuVXvLEelAyJ+riOliUoP5Bt6P2E67IIMLoQfi9CQ9xz3XoX
 TSX4WuYMyCLkwSWsBhPhrUn0eF81MG+F6nMIG9cvZvM+LY4+NpbF7wT1A37hn537uQ2Y
 d15Uc/9yDgNJ9yRqO0nBFmMDZYSwW4W2boCGrLl2djluSiteBzL1vItOJ8v4Avzfu6uM
 E6Y0edY7yZttnLRYy/urURiq1xSthfFh5UQRT92QpOmtnOioMU35ZIdyg8/03dxkxZLB
 NOAQ==
X-Gm-Message-State: AOJu0YxRIemW92TsMcTJSXroAjviRhx/Mc+2kytwyL/p7bN9cLALxXxq
 yAixrhHgR7EOgyLCfcqZYr1Y696dWBQaMFB45v48/NrYoWfEnYR3NYMTAnes2gB5sJMT12XWT3o
 XNCE=
X-Google-Smtp-Source: AGHT+IHfthp2OaCyfNLPMXFGbqnEXDGl8NMgEJJC+klb21pha5gn7Nallrr9YXZCoJXev+pDNwV0vQ==
X-Received: by 2002:a05:6402:234f:b0:5c8:97b9:5863 with SMTP id
 4fb4d7f45d1cf-5cbbfac4c32mr4132610a12.6.1730198207530; 
 Tue, 29 Oct 2024 03:36:47 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a211-a140-6480-f59d-d8b2-eb04-8d6f.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:f59d:d8b2:eb04:8d6f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6348330sm3865320a12.89.2024.10.29.03.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:36:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 29 Oct 2024 11:36:43 +0100
Message-ID: <20241029103644.604199-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
References: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730198208; x=1730803008;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfruAHjnnVChZmN6/E2XYF1EGV2pi3Nb2Cp1QJoT8/k=;
 b=QPBAgPZ5eIbxy059zZYbJhJVGFB35uDSwPr24VLi83a90DrO75D5VlyCyn/eMGl3hR
 dUeqVcr3oQ1s6bIfeeiwJg8BAuchoZHdeTtRgR47jNyUs0Jn8VINJf1qFFmRC4s6D8H1
 aKn/XqIom/ByxDktOFdBqa1ByEA+5KBUWq6uI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QPBAgPZ5
Subject: [Buildroot] [PATCH 3/4] package/flutter-engine: bump version to
 3.24.4
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
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index f0c734146a..7f41defe68 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.24.3
+FLUTTER_ENGINE_VERSION = 3.24.4
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
