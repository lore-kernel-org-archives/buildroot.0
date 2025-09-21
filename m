Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87330CAC5A8
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 10:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA66840B1;
	Sun, 21 Sep 2025 10:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erek-mYFbv14; Sun, 21 Sep 2025 10:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C6D829A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C6D829A9;
	Sun, 21 Sep 2025 10:04:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DC41D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 10:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01927608BB
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 10:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kuYp7IAdp3p for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 10:04:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2B4F608AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B4F608AE
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2B4F608AE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 10:04:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b07c2908f3eso518659266b.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 03:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758449039; x=1759053839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kTUV2EaKfo1m33kgzt0q9EhZdCMs6u30T1uFww7DJeM=;
 b=ggwxY8xrx8ouhePrajjjirnDudsEwTPqLRYpr8ZLr0J/w7SsnS57KOOHT6k9OUFEDV
 JAZZHKPbkXXmFnZrLSahH0nkVrpeK6uLhDycg4QMr1ZQ3gUIs61GMXD/RuZIWVPMXe3I
 j8CWPRGMr0vXBzggilotr5YqnRgfNQFsyrL0o6VstTKIjVww8vGtUUuffL79U4niXqSJ
 JtPpd1w+iJmoC/exf18P49Lr+Ev+NDX/Y3t2B+Bg4H7P85FjFtrXBT1zfwm+HDcIyNz5
 efo6hVUIpfch1YEUcfA3XqTPiCSRj+/fLq79bCHz+5ePJvO5yl/iGCvonIJwL8XB8mP3
 WKgQ==
X-Gm-Message-State: AOJu0YzhUjnksTXzA2BfevXFNJumDxiBVKJGnkzLfnMrooW+lMZxf1WB
 dhIgNTpPTGmsjHLbURnU8HcfQDPH5S8bUKUsM8+vFjUt+MzPnRIVgC4WJaCYONn7o1g/7dDGjn2
 /0nkI
X-Gm-Gg: ASbGncu4jaryE4eKJ+hZhwNN1AKwET2iaf4KWP+bCuV1VoPC162s6XWjLK/QbsCehhX
 XxfcmcwBw9bjySpL7qPIqnX5NBsUj7m0hAzvnOhVjK1hd1a6GPTNULTi5syTEicHIi2Xo435dEg
 E08XWGGrhtrfA0LtaURgzcnMwLp2lMUBndqk6G28Dfob4yqTuIPZkqSLIbULMGZ8EoFD3yw+xxc
 Lq68V5iqZGL54HHwZX0ZsuA1Z8U7V11yWAVEC24B72ZJplHdILZXZcidW3mIycIJTbRigqbqNBx
 dsNhZ7snvwAGeV5dguYhUTCu7/Z8TrzAJ5AWbRwORC5dyhX272CaDlBkSphqQzbPDDyDyDeTO7u
 IrJ4AQ9fbH80XsI/yLpA26p+RPOv9SF5+rzzp3bKJbxN4UxxD54lFlEWBLJCWeecFIBV/W+H9dQ
 K0yXdvS2tgg0vVzFqVkZFE42FczzNeHWcoO6eZ0G2KSPssFDCPvVV7C4W+Rg9X4HpK9ht/1lv7a
 Bg=
X-Google-Smtp-Source: AGHT+IG04HmF5le8qiC74yQB9MjBVMFqjuyCCeJqazZUAQsB0R/SkOTJrH1ypwuEbrZoQpujSOvCLQ==
X-Received: by 2002:a17:907:1c94:b0:b07:c905:21c with SMTP id
 a640c23a62f3a-b24f4ebfa65mr1184945366b.48.1758449039396; 
 Sun, 21 Sep 2025 03:03:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fcfe888bcsm853361266b.71.2025.09.21.03.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 03:03:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 21 Sep 2025 12:03:51 +0200
Message-ID: <20250921100352.2620720-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758449039; x=1759053839;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kTUV2EaKfo1m33kgzt0q9EhZdCMs6u30T1uFww7DJeM=;
 b=ks7POb2nD7YarZyqERqHiTtGBnWTAqDFAREmYT4nj8SotEYEu/08wBwQmoW3Xy4Znn
 gjpoIRGANL2781pgIggF9cRlaDbuYWGqUuEfoOnjyrWaPbUD+YmpCNwPy5asFbZ/YqFY
 wCefCdv39UZJsPBd6h6GrxCqwUdh7+hiIoT1o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ks7POb2n
Subject: [Buildroot] [PATCH v2 1/2] package/atop: bump to version 2.11.1
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

This bump includes the security fix for CVE-2025-31160.

Release notes:
https://www.atoptool.nl/downloadatop.php

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Added in v2

 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 8774fb577dea..8f0cb695814b 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20  atop-2.11.0.tar.gz
+sha256  77650f79f9e388b6f5666dc113849894575a29bb4de21b8cd58767bf8a905154  atop-2.11.1.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index f7dfed5e8df3..155dec617747 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.11.0
+ATOP_VERSION = 2.11.1
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
