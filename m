Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D521C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 08:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D99240592;
	Mon, 15 Apr 2024 08:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9IrTtt2lKqw; Mon, 15 Apr 2024 08:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6434C405B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6434C405B1;
	Mon, 15 Apr 2024 08:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 803AE1BF589
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 08:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A36B60613
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 08:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGcM2p7ps5k3 for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 08:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F328605FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F328605FD
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F328605FD
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 08:36:27 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2da888330b2so7977781fa.2
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 01:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713170185; x=1713774985;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kqv8ssZnAlZpH6w3Ue/1Ti+aXI+7nmkcBx8MW3CltYQ=;
 b=VIBsgZi5bMvJ1c5pKLNx7DJMCEV0HkyJlJb7RY8ysYzFusymYZ70RYJRSzfk+ucEjF
 +z3duubOhlf+UHKDcnWqcrQRePLi0jV4PEvTwdSDQLzKTIHvDwAJN8m65WNYGdag40YH
 En5LumlTx/IlKJ2QgJUwl5332Oihi8kMrjeVRfWDbi7HMfnligQG1Js7X50vKE+AKZUv
 dhumInWO/xJ3D+1GSBjwmALoFnenQRW2/m/RP13ubqdZbboKWFNtRaZoiZVNMd79V2d5
 l6cFbuhxRmc2Z0q5OWVDv5invyOKtFlwyzw4LTGTgtEeAoxndJBs2o+StRVxEHAb59Td
 WK5g==
X-Gm-Message-State: AOJu0YxYmWqAdkbukEW75FFXGicAuK3LevM5+VGZrG9fqMXhPISJ62Md
 lVxtFFnOl+CjB39I1WjOHaxJQEYdKt5QqvVzyKu38jy+vBZOLydDcszTGX6ka1DNiZJEQpfs1Kd
 uHbA=
X-Google-Smtp-Source: AGHT+IFfwiJRME5uWpXJrUNIu+//JoFByxAXbYG+wSFViivRcjykkvFMiza0r/4YRv/LimWdR3XjFQ==
X-Received: by 2002:a2e:7310:0:b0:2d3:8c1f:c0ff with SMTP id
 o16-20020a2e7310000000b002d38c1fc0ffmr7255784ljc.16.1713170185326; 
 Mon, 15 Apr 2024 01:36:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.201.31.28]) by smtp.gmail.com with ESMTPSA id
 x11-20020adfcc0b000000b0034658db39d7sm11457160wrh.8.2024.04.15.01.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 01:36:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 10:36:12 +0200
Message-ID: <20240415083612.3754176-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713170185; x=1713774985;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kqv8ssZnAlZpH6w3Ue/1Ti+aXI+7nmkcBx8MW3CltYQ=;
 b=E4t69baLf8JMAjY51cVsaDcgw+efQ4utkznEEnhaODa6h9Rxp7oApMPHUHWjUaP30H
 no23z4he3SZPC7Z5QvDiUja6b6FA9pv5xQ1N7n8QzcCFiPHM0ppfFPWufiKhMNMB9YBl
 GWVPNsGHifs7fj7qg7g6zAhGC3Y3gWxXusPu8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=E4t69baL
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.179
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Provide macos arm prebuild version.

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.179

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 0f746a763385..cc78f6785b83 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fac38e93714181fbfb0ff52b9cd29395c7eb342def5c3857da87e5429beb3927  uuu_source-uuu_1.5.177.tar.gz
+sha256  6742a0c3b1e5b3b892963473f65e2770462f3bf2871424b800ffa0ed159feb84  uuu_source-uuu_1.5.179.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index b6611dc3d406..b633bd70dbea 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.177
+UUU_VERSION = 1.5.179
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
