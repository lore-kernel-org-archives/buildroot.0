Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEF8CAC597
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 09:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 409F840695;
	Sat, 20 Sep 2025 09:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPDrFaGY726o; Sat, 20 Sep 2025 09:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C00240670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C00240670;
	Sat, 20 Sep 2025 09:46:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BCCF7D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3EA783ECB
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNmW5-HQtzwb for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 09:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E58383EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E58383EC9
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E58383EC9
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:46:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-631787faf35so569483a12.3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 02:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361583; x=1758966383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=syJ7KQwNO4zEw5qSNTGwZg0HLN4Oq06/+O+/kJBPjKo=;
 b=COMNTB+Y2+JECLe1JSzpcI3/Hm1kJ58HtMjVDimiRqWG8+QpUSIaNWKq1vJS/faSGE
 q8cXfY+d9lEsh7gCy3+dB6Nplu8w2o2djswODG+tmcaNZz1Bg7H7PPViyBquaCfXN1Tm
 Ai2IK4zJOSWSsDXPL3DU8NQeBuqOJMcWeD5Fl7yMz1b97k+DmiwSBzNHLwdAKg7NmlIw
 /1J+mvGLOcCK51WLUhC6Dj7iJqW4Gb0a6iBxzXQYKIafFUjLfzJf1hgAGe11Kruumctw
 aUSBvgX5sQMbdli4oFf2hxAJVGk4e5s5PVz1iLd6HMgB08HxKHNmFMAzYQ5PMBjA4+Bg
 llXg==
X-Gm-Message-State: AOJu0YwFKNFnCgAl0emSdDqnkunvVS+kTF4Ea7hwgAsEzki8u7qAIRdy
 w5RVgyWMFlYg8fYe3edU1l8E+qbPwtKMzb08CuLONsPFhmGJVt1x80/O6U/IstPd8/1ouIVpma0
 QJsO9
X-Gm-Gg: ASbGncsiq8Jb0CSx/O+ashyTLrWIRtRh2p7+WWEKATlwtzsCMnd3/HqjIVDqKZGaKhx
 hEUuB1cRKiWCaLUUM8tkwjj2V7IwxkLTYxQGzYYESLFYuBp1iZ5hqPMVJABJ4PiyNEG9DafBXwW
 TsYDVI+Owf9XvsZsmM0uTCvMhX9uWEH+CAzDIp8DajdX7yU0USnSqUz1gVctPGyhSgI4CSZhjh0
 sc3RSA9rcY5Zfy+nuWkTI1V5dfzmJDzk7tdR3HJm5C5VdaFBEvqAyxa0x/fUv2u1LkB2nFE7P2L
 yTp7pUlxo7X+y6fG+RvswQTq1ZGTBeJ9yVYWsql0NbxWUdrvnQWSXA0Y2l4SzNjTWfNzQAaxFab
 rlacq/KU5EKFuRr2E2y6fwHusKonuSjKiJeCEyr6AziYZZvB/ZPXFjefqGnyHr9VEkefmfSdaGk
 8LZmd8Uhve1pjoOvVHMhPcMj43Z0ZdbPjYLRBOQXM5J/e7/vK5Dlbg9da8KZ9QXr8S
X-Google-Smtp-Source: AGHT+IF3Ez1zERXIL6WMNCkJopRicNPPeHG4Tz+bpRChq3aJL2IxwoDIT/N29pK/MsKQ++aGC8W6yA==
X-Received: by 2002:a05:6402:5c8:b0:628:6fc1:a3f with SMTP id
 4fb4d7f45d1cf-62fc09610e0mr4708617a12.17.1758361583244; 
 Sat, 20 Sep 2025 02:46:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d51e5asm4977621a12.21.2025.09.20.02.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 20 Sep 2025 11:46:16 +0200
Message-ID: <20250920094617.2571648-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758361583; x=1758966383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=syJ7KQwNO4zEw5qSNTGwZg0HLN4Oq06/+O+/kJBPjKo=;
 b=VsNt4WQMxcE2jNf90/Dc7+RimtU/cYrK+lYiWB6j9SHxJdrz40IjYwZE7V1UPaWsuC
 3z3HK1gX0/AfvyRWF6fCXUVdpeWrKDBAhZ//FGJhF3z/JMR9HkonAOMkJab/mUMEFzXI
 LzjMBu0dciBayhXNVk4ljMaQTjhlPHlT0dkMc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VsNt4WQM
Subject: [Buildroot] [PATCH 1/2] package/atf: bump to version 0.23
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

Release notes:
https://github.com/freebsd/atf/releases/tag/atf-0.23

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/atf/atf.hash | 2 +-
 package/atf/atf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index 5b4bbeb8e224..6cd2323ab078 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  92bc64180135eea8fe84c91c9f894e678767764f6dbc8482021d4dde09857505  atf-0.21.tar.gz
+sha256  a64e2427d021297f25b3f2e1798f8ec4dc3061ffb01a1cd3f66cc4cee486b10f  atf-0.23.tar.gz
 sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 9630cf1a3338..27c25c8b279a 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATF_VERSION = 0.21
+ATF_VERSION = 0.23
 ATF_SITE = https://github.com/jmmv/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
