Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04127CA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C049D414CC;
	Mon, 11 Aug 2025 15:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JoVbMq5d1nb; Mon, 11 Aug 2025 15:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E317B414EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E317B414EC;
	Mon, 11 Aug 2025 15:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1F7F1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8912414EC
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzQKnetkxo6o for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:45:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5CD2414CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CD2414CC
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5CD2414CC
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:45:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so8294707a12.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927125; x=1755531925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huLuQ6zHZwAiE+qBVWnUz87T0efU+4Tnsdphej4ZBpA=;
 b=pTcZVRH/xRohC+HCNi51jjgrw5nrPuy96dGZnb2fEGddO2PagW8QU8RQqvqEE45Ne7
 ezriIKobJZe2zGm1iZcFRflMo9Uv1AfeUy7pJh0O73d5hqFyuhrbR2eISjs9MtloxqDn
 xwBpDFs2MLwanu8CqheiVw68gWJjbClxTbRbOIFSIaGHVeaa2fGvRC/5wOjMF2ZuZDjG
 frOrCD3qPYIX4puSCwNrqtFiyx5tg5uh5WZygRReg3HwFbN8JhkEI0xQX8peGqxtzhbx
 3xDAawz77wFoaNX4erqM4i21K5UM2k+8b1kzZQJoBsJ3DsVz97HYfcli0Xvw2wos5l0r
 qqeA==
X-Gm-Message-State: AOJu0Yz44pPAVg+MDlyABxII23SRPTxRm7jYrfECBbYy3D+7gEOG1IaP
 r+kXOaUcrPNpm1niKNF5kB6vsGdKK8zH3Ig3wFxdQyfAdscZz+ehT19sL1pvqsQBca2GT6FdwLz
 /QgOWHMU=
X-Gm-Gg: ASbGncs5RTODagVEasJ0eXwabGEj6BA16bIZ1VdSVrDCn3EtxTvMbCbdpiHyepTKdhL
 mcALEzo24pbxTJIh4bPm41CvcEF9yRJ0hGg+tiskfUN9VuVx1IGAGwjx4jw+VZdIXU56OkfHiqA
 TGS3GhpTsejRF0fx2IL0FsA4fOoj1lDAqAz1v/oYyYFPIimWN5OPfdUBqflCQikFydgwJ+6Ush3
 BESPmxJ2aqfK6gkCdsKzYbypP0Bbk5IT4u/3PEySoG4YEyD0EAd38ztpeUlyuAGn2wrULpsdOCe
 4xO2WELdNvqvLp1F5vArCsErb6z/csHpm5i1X7wwf7+OccHWeahHwQW/IA1cS8w7io/TXCp+92W
 HQTGo5hTlm/+bygA+RhHhCgZn2xFhxRz3kNZZ6WSUwDNkc7UMB33iPM8zTARZy+/Z5BmW3DWOHd
 0u0A==
X-Google-Smtp-Source: AGHT+IGJacRJpADNRJFE4rrBwBzbFeH+1l9Dy1dCeKB24F6knfpWYTDfiMe8JEqSESt7Nu3vbC081A==
X-Received: by 2002:a17:907:7e86:b0:ad4:d00f:b4ca with SMTP id
 a640c23a62f3a-af9c651238dmr1105574466b.50.1754927125291; 
 Mon, 11 Aug 2025 08:45:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:2b31:46fd:61f4:e6d1:817a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766d1sm2049042966b.18.2025.08.11.08.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:45:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 11 Aug 2025 17:45:21 +0200
Message-ID: <20250811154521.96473-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754927125; x=1755531925;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=huLuQ6zHZwAiE+qBVWnUz87T0efU+4Tnsdphej4ZBpA=;
 b=IngM4S8W1649+BF7aLxZtj7wVwHhnFSwiFXGkKRgW0w28wA3osE/r6SwnUkCgkP6W8
 OlNzQ0UT5Rdw68X6OKPMB2Kftk/A4FsMHox++LzKqoZd2TRdYD7nJilNIJZRjPeXTkwQ
 zZpzhPSTmV1SOFA1v95XJnJJpn+1zz0s04jNM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IngM4S8W
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.6.2
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
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index ace08a496177..a58525bb4bf9 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  bec67f368fc61673c4c9e9429d20135a42ba80a2c7f8592b912e5f97e289bfc0  armadillo-14.6.1.tar.xz
+sha256  49ddb76670b1d1a142f760637e653ec5b20ba730e7630a2f3c2b13d324c37e08  armadillo-14.6.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index c64c07239a0b..7283f90ba4ba 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.6.1
+ARMADILLO_VERSION = 14.6.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
