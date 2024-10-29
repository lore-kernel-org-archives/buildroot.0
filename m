Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D2D2AB1D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 10:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319B940400;
	Tue, 29 Oct 2024 10:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuZx9cbopfyf; Tue, 29 Oct 2024 10:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AEC4057F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04AEC4057F;
	Tue, 29 Oct 2024 10:36:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52770112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0523F80AA7
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-xGYdFh2Iwt for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 10:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2530280A9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2530280A9E
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2530280A9E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5ca15e1f893so915883a12.3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 03:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730198207; x=1730803007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UijKNkVeQbeKkOC8qKca6DpriMUp9B2bL84oi9/hht4=;
 b=Nw30UwT4O2er2JX9GnaWuyIu42AXhOewCZRvBV/9G3PTrYt1wDmVPTJgC5X4GBWTvJ
 1nZudUr87cTGLU3h6eHpZ0K9QfPZUfjnyzoFdpoIOB8XTS5ctXaJ+Mfb9RMWu7102EUL
 yCgN1uV+/27+ELOqHsBCHIFcHYnfmLn4wu0i5ZMlNRxezrnqUCaVzriYBlhCDPiD3v7/
 xpc0InYrFHVBDPx4vrQLsaaQivCo7WR4V4IcsBukJNX32bqr3Kp2SRG45n+th6C4ZCfi
 3eXvD7spmK3lNifzJbn6NnzmqSOdZEt6CYcUvjyZQ0GwBX2dvsi6gWFbBhpmpJFNydhS
 KU9Q==
X-Gm-Message-State: AOJu0YwV9T2XPcY+UcC4FD+pSCz7x0rQL1sXO88ctZdPoV1MpoIP8Z6k
 PgBpIxAF5jYXUFFzJT3jwrOudmgRgqBylCz4E38ybBYP+BloN7g3PzTN2YP1rGy6sL02iJ1UEzF
 t9CE=
X-Google-Smtp-Source: AGHT+IF3+M78uJ08W7TSmbirb0j4FBUJGlsv8Ol0Nm+kIoG+QppDrTw7CWNb4UWEJ4OnfyUZNBSY0g==
X-Received: by 2002:a05:6402:13d6:b0:5c3:eb29:5401 with SMTP id
 4fb4d7f45d1cf-5cbbfa7e7bbmr3973656a12.9.1730198206534; 
 Tue, 29 Oct 2024 03:36:46 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a211-a140-6480-f59d-d8b2-eb04-8d6f.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:f59d:d8b2:eb04:8d6f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6348330sm3865320a12.89.2024.10.29.03.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 03:36:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 29 Oct 2024 11:36:41 +0100
Message-ID: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730198207; x=1730803007;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UijKNkVeQbeKkOC8qKca6DpriMUp9B2bL84oi9/hht4=;
 b=UEfw25wXWH3603co38CQ7rYE4Gn/NBp1f1FFUrv5H6Zi6boVTx9O+gJpYJbOPQelEe
 Jk+OBXjYrMe+C+GOHQp8d2a8eIPCjHMuAPNfFptx0kw35sSi74UWMKp+tS1P6mmFkk4R
 bAK38BbFY6F8MR37bQfYBsUjkFOl/KLvZet0g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UEfw25wX
Subject: [Buildroot] [PATCH 1/4] package/depot-tools: bump version to
 1b58dc68659445b1d97d8341f8158be25eab4957
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
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 01df83058a..d20c3ea336 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5921debde49a63df8ad958e0434521c4dd62a9edd7031ddb1e5ea2ec89ba80e1  depot-tools-22df6f8e622dc3e8df8dc8b5d3e3503b169af78e-git4.tar.gz
+sha256  57c82ce07695d439ed9ea6e4dd8a7321203eea45eb3e1ea1c3f461c630dd1460  depot-tools-1b58dc68659445b1d97d8341f8158be25eab4957-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 27e8896b23..4bc9d7a470 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 22df6f8e622dc3e8df8dc8b5d3e3503b169af78e
+DEPOT_TOOLS_VERSION = 1b58dc68659445b1d97d8341f8158be25eab4957
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
