Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DFC4707B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1834288B;
	Fri, 12 Jan 2024 00:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1834288B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVZ6lQKE323z; Fri, 12 Jan 2024 00:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA9542D54;
	Fri, 12 Jan 2024 00:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AA9542D54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA4E1BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECC1484442
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC1484442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUG_KjRWBSEs for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:31 +0000 (UTC)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 232B68443F
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 232B68443F
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ddf1e88e51so1596932a34.0
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021049; x=1705625849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqSCuFXb+27Fg+hL7XgruC95s+iL/js+SM17YxJ2fj8=;
 b=PlXNSeOsT9UK6BVTn54vw2fucMzACmCqRPqK7cuwNNOj7Fhj5pOLlFodZtyScAeu79
 ny0hEIufcQdxUZ0nVptp2HnuySi1pxfK+stoCultNUM2L6jEXzWxP1gRR1k0T38C09uL
 a3I4pfZv5Q9kzKxGd3LYG1lblMke9VGeScdcJYv2iJvPBje2YyZb8cg/93u2L0FGphOp
 igeVv57CoHRCmmrHr2VJMRgEe/4qRg0VOs1PpsA2tKdrY2t92MaPda73Z/cq6Cn8wcRL
 loXUTGRuPiF9env972KHcYEifcZ+oQlcRw9BP8Ku1F3CnlIR+Lgnc7D1Xatz3fIWpau+
 VEPg==
X-Gm-Message-State: AOJu0Yx1kcc2b0Wxu4SFcVY098//tPFa/nCrEdog1MUCkVOdMpVta58k
 hjJByGM19iFUvoF0/nqecHZRGvXvAkgm2qZ2Wu/7nwVI/pg=
X-Google-Smtp-Source: AGHT+IEF5CNnUK7PcIiDrOSOJa2gbmFJN8C2QV02iEp/VjpqvIpsXyXqBdwyqQNjkQQXlL7cl613Qg==
X-Received: by 2002:a9d:7d95:0:b0:6db:c703:91e9 with SMTP id
 j21-20020a9d7d95000000b006dbc70391e9mr674976otn.48.1705021049241; 
 Thu, 11 Jan 2024 16:57:29 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:13 -0700
Message-ID: <20240112005719.1082305-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021049; x=1705625849;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqSCuFXb+27Fg+hL7XgruC95s+iL/js+SM17YxJ2fj8=;
 b=TudfpgleyaAym7aEIAxKT1ekTZntZDMBr98uzLUv/tB9hzD1o4yMN8xD2SbAou6SMn
 2QSzNph8HdEikqmAI+OSk3xdk7tI2KDpA+i/Ez8IiM/JVHfwO+a5CQPHQwqcliWEaPYV
 vqBaYbikoXuYIyS1/j1V3vl0qfXxt4BcCEjx8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Tudfpgle
Subject: [Buildroot] [PATCH 04/10] package/flutter-sdk-bin: bump version to
 3.16.6
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
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index f0a855f2c9..556ff38238 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29  flutter_linux_3.16.5-stable.tar.xz
+sha256  2af51a8f048567b4672e41a0312789f2c4180b9139daad80840859296a7643e2  flutter_linux_3.16.6-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index a28cf645f3..e739da2ccd 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.16.5
+FLUTTER_SDK_BIN_VERSION = 3.16.6
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
