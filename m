Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC6CA1012
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 20:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4632584525;
	Fri, 30 Aug 2024 20:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNGTHN9KF6ej; Fri, 30 Aug 2024 20:26:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9450C846B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9450C846B3;
	Fri, 30 Aug 2024 20:26:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0840E1BF990
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C495481E51
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V78TIUZr_8eh for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 20:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C997781E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C997781E59
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C997781E59
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 20:26:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-371bb8322b2so1308519f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725049583; x=1725654383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xplM0rkQqDYFw0FwL6eZr2qhj25ibaNIC4Ju4xyHsxs=;
 b=J5Bo1HV65c9FJLT85cybIIN+dE6ZrXp158UtbEl+W+Nag0Y9JikP46BGwevIAx8KDo
 gFff+1/XawarU3sTZ3BCshQIpUW4tO7Zdr6rzibO5PAyZRLe8To+uASa5LGIckd3+ALu
 XlZcxK1FNU2NpfrqkbX8mS4oZ5gCruEe01rPghCWyFg3D3It/pMAJwJjFeCdfTdVg7Nt
 zR0Z+2Ct29Rk0AsRBE0rXHXIyesqU2RBM/+PEb2dZzBN4NEnIVZ2WDXDoR7x6G4ricTC
 wtYZUopqVqBtUavHZSr+K2tw9Y0/qA8P4GK7+RpGUxPXkBihqp/fCbeV3/6ztuzC1B5c
 2MkA==
X-Gm-Message-State: AOJu0YzdWPrX+/GaXr2VQLBHUZNWslpKUdR+b2G3K6+HtWx2QgfNNQpC
 UsE96vWUTu/bSgoFiwIg254UhbCbaxcNQq7rpUXSDGqW9J71FGUsbaoJjg==
X-Google-Smtp-Source: AGHT+IHaSRIMWgGCP0KQsg+lctXRTfwA4ptbtxsMSi+aSJT1pZQ3mfOgaPq8WiLJ381HTXNT4O9Cgg==
X-Received: by 2002:a5d:4a49:0:b0:368:4488:66f8 with SMTP id
 ffacd0b85a97d-3749c2230f8mr4092796f8f.23.1725049582664; 
 Fri, 30 Aug 2024 13:26:22 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba6425a77sm91381615e9.45.2024.08.30.13.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 13:26:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 22:26:21 +0200
Message-ID: <23841300f5a85914d9c0fc19b24df485ba861efa.1725049576.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725049576.git.yann.morin.1998@free.fr>
References: <cover.1725049576.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725049583; x=1725654383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xplM0rkQqDYFw0FwL6eZr2qhj25ibaNIC4Ju4xyHsxs=;
 b=OIYot8gdYtKrHnCN/2Bht99UQIV9s0Xy4iNIBH8nO4QwhF43LR6QFk44wEXY0p1FvD
 k0CHXBSqadwsnbH1Q/cuLV/Rmhc2CH4GZvK4Ec9EMkSFlxmRKA7wkFkSXlJfDb3+aBjs
 xREGP8nxK7CZU7CcXKSr75f5fnTqAVglOoziJcB+MNgC/aAB7o+/Wv/U8c/mVf2M9vH0
 +3LoYPYGtm+o0WSMTmBe7fY4z3aXFQ3IJ3TbuPTfjJvYtFLsLnb7ZIPEN+p/80TAZa/Z
 XZfTQQBvQJ0jOg68ot86ujpwZMNP3Ib+z3XiOOI3FJpw1ktw5Nr+6Z1mM/88IrSGV9hT
 GWqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OIYot8gd
Subject: [Buildroot] [PATCH 3/3] system: add tini as init system
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

Tini is a special-purpose init system, aimed at containers.

Add it to the choice of init systems.

tini does not require much, so we re-use the default "none" skeleton.

Note that tini is no longer selectable on its own, which it used to be.
This change will require that people using tini be careful when
upgrading, though, but that will be very easily caught, as the
containers would no longer start at all.

We could ad a comment stating why, but no other init system has such a
comment, so adding one for tini alone would be weird, so we don't add
one.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tini/Config.in |  1 +
 system/Config.in       | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/tini/Config.in b/package/tini/Config.in
index 719e1e1f22..bca8ad8e96 100644
--- a/package/tini/Config.in
+++ b/package/tini/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TINI
 	bool "tini"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INIT_TINI
 	help
 	  tini is a simple but valid init binary to
 	  act as PID 1 for containers.
diff --git a/system/Config.in b/system/Config.in
index 18cc39ad94..d7d59db47d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -149,6 +149,22 @@ comment "systemd highly recommends Linux >= 4.15"
 
 comment "Special purpose (read help)"
 
+config BR2_INIT_TINI
+	bool "tini"
+	depends on BR2_USE_MMU  # tini
+	select BR2_PACKAGE_TINI
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  Tini - A tiny but valid init for containers
+
+	  Tini is the simplest init you could think of.
+
+	  All Tini does is spawn a single child (Tini is meant to be run
+	  in a container), and wait for it to exit all the while reaping
+	  zombies and performing signal forwarding.
+
+	  https://github.com/krallin/tini
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
