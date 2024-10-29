Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF97D2AB1D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 10:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE8E40276;
	Tue, 29 Oct 2024 10:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZpzho1poIba; Tue, 29 Oct 2024 10:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC00403C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC00403C9;
	Tue, 29 Oct 2024 10:36:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3E0112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63DCB80A89
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sq9rXfDvGyLi for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 10:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 648BE80AA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648BE80AA2
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 648BE80AA2
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 10:36:49 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ca15e1f893so915884a12.3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 03:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730198207; x=1730803007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4ptoq2+KRlg3K3LCmKG+/1a+xgDOdgqbJi1bn0keJ4=;
 b=a9NCn3uSN7PnQkt3OtnYQm4jSJBdrbrofHsVVkSSsxnShfO5/OIzVKkdQUs86da8LY
 HV2KyGQ0ns+huEkYvzg1fzgd2mNvzzNkKB/B95Z0e//V7tg0SX8+yDF5IUgF2O2OjauG
 QdsTWDaQsZ90a4yeYSKqGxSv3/nKF/a7VpjkdgL/4FeEy4v+I2PGZLasAK/eGPL44yiL
 wwOgLpQztVoHkom6pn9yMziJashXfwYjJ4L74dlhtzJMs/n3NP0nlM6lodzlaVhJkB1Q
 I0Iq5qAgTUbwtdSzTIm0UpEG79452P6prgjaXTSVNlWDNw8pr6ZglcwnLpGlxqOoamvj
 NbKw==
X-Gm-Message-State: AOJu0YwLDG7LxJ2oyBPRSsytGuC5Ox1SRIlGlDNpvxWD+d+1Fenw/g9u
 OfUURURXCwAmjncTtzNTDyc2lkWC6aa7Z/12HC7XWpfLzaEXUEinjfwlO5OECg64EIdVJdmFdO6
 lMLM=
X-Google-Smtp-Source: AGHT+IGRABFsvIu6U0z+MhYpqmhGzLIfxGffiNZtXm5YzK1egpOUiOXoeMZ7kKa/5eDIg/BilRrkeQ==
X-Received: by 2002:a05:6402:3483:b0:5c3:eb29:5400 with SMTP id
 4fb4d7f45d1cf-5cbbfa77951mr4431278a12.8.1730198207110; 
 Tue, 29 Oct 2024 03:36:47 -0700 (PDT)
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
Date: Tue, 29 Oct 2024 11:36:42 +0100
Message-ID: <20241029103644.604199-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
References: <20241029103644.604199-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730198207; x=1730803007;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4ptoq2+KRlg3K3LCmKG+/1a+xgDOdgqbJi1bn0keJ4=;
 b=LskL0b0VEVWMkjwKbVFhO0LnEJxHdSkCcLlKFUkVdrpKBSFtDm1fGLqaT+I2ze9T97
 1EOIA6LMnGFeaUelrw2kuOKlmkVZDoyXcU/GqbGLZv0X4t0GXQhQUcDyyKwvinZF5Iem
 Rz/1IavjeQkV2zFs+x2+IF9KS6t3LLQPtALxQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LskL0b0V
Subject: [Buildroot] [PATCH 2/4] package/flutter-sdk-bin: bump version to
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
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 3c5cad423f..ea7bab28a5 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f4e2369afaf38a8e381c9243fad2ca04b8514194c40ec946825d1f4c5539a095  flutter_linux_3.24.3-stable.tar.xz
+sha256  2ce78d4a51f063efa7f04666ae010d026d119eea6bdea7e08b736840fe88ddb4  flutter_linux_3.24.4-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 48cbe5472e..5b69cde465 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.24.3
+FLUTTER_SDK_BIN_VERSION = 3.24.4
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
