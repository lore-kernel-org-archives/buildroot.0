Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B76CA100C
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 20:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A19840A9;
	Fri, 30 Aug 2024 20:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9xxddHWEb3l; Fri, 30 Aug 2024 20:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15C5384517
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15C5384517;
	Fri, 30 Aug 2024 20:26:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5455C1BF990
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4133C4256D
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyMQP3Uz02Ef for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 20:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A45842564
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A45842564
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A45842564
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 20:26:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42c7856ed66so521515e9.3
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725049582; x=1725654382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e8ppTgniCL3d5Jjga5h7+oTFIauzF745dcfT0yRq9dE=;
 b=WKh2e8SiYzBBjkN7xIRC+e+FhOw1tunQRlWz9yBGKTDUeDzfQdSJNjDGAFy0oI5BXG
 iUf4N/NDGBpctG86u6FoAvUowlIcNc1Jv6TApR829oMK6lvm2WqOAVG9/awvLgXJjNzl
 LSNCPkNoj6LgXjcTc9e9EKHHt0r0Y0Pr3EFRWUzFkTmv2Rxo5L843yZIBZIZaO1R7gv0
 M8oLEfqAEVgJYD4k0/q+DNbE1aeABtWD47Xb9n3D/Z/cQK1F7fM3hDBwfE1lpTSsGAXx
 cdaG2Gi2Xh4nAbDH0W9SLT49LqC8T6QckgeUAqxADiu4/KTqBfUoF62K2JuOwaxEztef
 lplA==
X-Gm-Message-State: AOJu0YzghExqxVKUGVfx4/HBtuMx1U4FdaZghqh7ilUWsWa00OL6qO79
 xj7Ise8qkkMChKU1n9WMuKeuBYMdCoCrjBJK7LbbHsbpDGLLZDr1tKI0ZA==
X-Google-Smtp-Source: AGHT+IE7XznvUyGxQhLr+uzs9lZokGPhl2Jor2+JXB7xLAJQpbRaWiZEPR82wgAAqBgLQK1LLwT38g==
X-Received: by 2002:a05:600c:4f42:b0:427:d713:a5d3 with SMTP id
 5b1f17b1804b1-42bb02eb478mr57482765e9.11.1725049582192; 
 Fri, 30 Aug 2024 13:26:22 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425a77sm91381615e9.45.2024.08.30.13.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 13:26:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 22:26:20 +0200
Message-ID: <7fcc043e6719f18885f5a5d731520c76b170e73c.1725049576.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725049576.git.yann.morin.1998@free.fr>
References: <cover.1725049576.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725049582; x=1725654382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8ppTgniCL3d5Jjga5h7+oTFIauzF745dcfT0yRq9dE=;
 b=IVUrkBmj9/cDxTy8D+r3xLFHobo6Ul+5MbT6v+wg3/iX6iGun7hkDaHso/P9CygURM
 RVJ/kHXtZChk4bwDv6bsNIJh4zg9FthIB6cwAXVCZUjBFulXemBIiBgZIAxAhJ95KXby
 hemHUXBiwzGVBBc05ahWD9/aXfdjaF43woHvgX6QBivWwvmgGoEFPoUTinonKwnDEwMB
 zlywQOKJj2CBNT6ObjEzsqwcKgxuzZaNjg9sg1L3RVuuOXnlzITtkwb75GuwSJ3zlNyQ
 8rHqPdEO9oMJpOsVkvuWWQ0UYnRBIfiZL9HZEmFpRONtQUgL3QD8Hr/oeINmAyQcpGkU
 6OfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IVUrkBmj
Subject: [Buildroot] [PATCH 2/3] system: classify init systems
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're going to add more init systems, and some have a very special
purpose, so we do not want to mix them with the mundane platitude of
existing init systems.

Add comments to separate the two.

Note that the list would already contain comments, when a br2-external
tree provides an init system, so those new comments would not be totally
weird-looking.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 system/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index c710b38e74..18cc39ad94 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -87,6 +87,8 @@ choice
 	prompt "Init system"
 	default BR2_INIT_BUSYBOX
 
+comment "General purpose"
+
 config BR2_INIT_BUSYBOX
 	bool "BusyBox"
 	select BR2_PACKAGE_BUSYBOX
@@ -145,6 +147,8 @@ comment "systemd highly recommends Linux >= 4.15"
 	depends on BR2_INIT_SYSTEMD
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 
+comment "Special purpose (read help)"
+
 config BR2_INIT_NONE
 	bool "Custom (none)"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
