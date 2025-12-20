Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12C2E6689E
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 09:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78C3540CA9;
	Sat, 20 Dec 2025 09:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZEfqYIMzAk4; Sat, 20 Dec 2025 09:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C32409FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766223902;
	bh=jF/vpk6xOTAsfid8Ky/y9b51SmUW1QKOCjQODLv/HQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rSZh2EdDA9fV+iGzlqCXZ/gDP7APKYE5gX1O2H9VULaXzFZIXw9W0AYGddRSM+GdH
	 I3Dj6IXAEJTakNNxfJkHYUQQJtB0nMBydx0foYIKal4MigDUNNM4wvJ0LW/PS/6tNF
	 Pz8z9fnU9fiFeGJYih16vfXkE6OFV/ZAAP8sITJfb711MBYhOGk3aoWuEbucCWfVCk
	 DeZLUrRXylj4AICKjeieYz+rffNxC/R8TH+AKqr47yS+RJGuAfKK8jYffRJBPCN2CG
	 IE8eBR4Xe31mZ3CFF6sKm/rlbc7LmQQNhCaWHrhQhaEKvFuP9UoWc59+Pyjca4WDjt
	 567ypjpZwhz5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C32409FB;
	Sat, 20 Dec 2025 09:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DFA41A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 09:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74ACF821A1
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 09:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfKhuybWQBjv for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 09:44:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A19182143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A19182143
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A19182143
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 09:44:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477632d9326so15297395e9.1
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 01:44:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766223897; x=1766828697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xIa3349MHLrwE1nytnqzwtD8Y9dYUFp8zqi8oevAd8=;
 b=KODBge1u4K27M7JcZK3MxvrLKDAzAe51c/u20jCa15WEMrNoxayRCU8aIkFi05yp6o
 YTkm6jCmtXitlYJW8E2hJdwCj1cFVRFugMFnh8I7ssWK6gYtdhm8tfqvFR8FM/aSRQ8V
 uPE0TVgMHdv/8jHffqK1B6M/gymzPzEdjrcaQ0iTR8GYvyB4FsgzLjXm1KNA3HWVCcIm
 XdU0kURt24Pp+UCDZcXEXlAmMgEMIz6LRZ73MphuQCs1sVMoDTyb1umSoYyiL5CjbbcW
 v2XpexdLmAxGWJGv1D6ELr80n5O6qExbruSx4A3q3f4cw4h9rGZkswVah4twSH/YecMs
 vWLA==
X-Gm-Message-State: AOJu0YxfKERgiGF8Bm+z1BqVN4SdAABx2ca7e19rxkurVlG46bgJtq5B
 Bam5ob6g5xGFPqtkBuzYynQQWOiXVPyCgYgFIF0IE5ebfKTR8bpmIpzxgId8p+CJp1k9Z8djKSr
 kfmSI+w==
X-Gm-Gg: AY/fxX73dpCkhDnM5bppQjyiLNuPaMFh98NMCUQdUC7Ya53I6E4RLQZtyl4tbuakrdF
 RvOP6nFzf3RVXAl6+nZ0U+yeDDL5A2m2Plp735fEkmPg7b2jeSiuFvSrRMsJ4NZze5la/21lxT6
 rprA0y9TuJy6mBTKMCLEoJGjUCjmVhf0XmOYbo5oT1QPL3lB70Z556cxDFWvkgATK/Dj0vC7X9C
 C8A+N7wBqwMguaMuLns5W9piI8CZRQCExu9HYDlzdN3rf5FeIQWh1nJ4jNjMqEOpwhwf3+T5vxL
 rWCnR8XB8XMgwUU/yWxFWu/K8lCeYrtqPW6um8PJ30jLuTA/TWNPhyPt+Gwvxc8vt/RiSXO9fl1
 HCLZc9n6s6pEC8SpmosG1gGTj2yTbwxbxGhKIF3Az3gwQCq2P+nVUqxuzqi8Nui3iNbj8WzALFk
 XoEcTLpktzvqYzts9zCU9dbPtMSsSyXfhmU9A=
X-Google-Smtp-Source: AGHT+IFdnCUiKv8o2BHHc/TFu1vEJiD7HlYiBOL4nOIi/KtHzyUTZy6l2CdNasVmgFheELQeyiVq6g==
X-Received: by 2002:a05:600c:8107:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-47d19595f6dmr57612465e9.17.1766223896547; 
 Sat, 20 Dec 2025 01:44:56 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea82c5csm9559303f8f.21.2025.12.20.01.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 01:44:56 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 10:44:39 +0100
Message-ID: <20251220094440.369646-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766223897; x=1766828697; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5xIa3349MHLrwE1nytnqzwtD8Y9dYUFp8zqi8oevAd8=;
 b=cVqpbHuTqVl3Xv6C0mU1rSgx44B1pkzXcs8CkcTeay23hq1HfFrcwzYW0oVIbgGIHE
 E5e4W+0NbQ7lFVggjFJ+hAb/5m9IfgvmuhURstMsCsU7L5gPd/Kf1TCfoEgv+7GAA4TI
 I3qhpWE5TxY+2Wc3KWMaOrcZ9Pg4wXmdA0u4YmBBzQ0dDI3/4ER2k5cl1ezOdadRPr+r
 TZ2WGxgAW546uNyDV2Ryzyg/0wNSfSdjafM+I1eLEUKooR5VoTnWH3mUXrIyiezpNNeq
 RmwkYE1OpFjZTGvfXEu1pl9hZ5ocbkLMmsxK2PtBhGM1y3J7weqlhi2z4aQRhwm/NOHJ
 FGsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=cVqpbHuT
Subject: [Buildroot] [PATCH] package/lzlib: fix cmake4 compatibility
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://autobuild.buildroot.org/results/605be74b38566d89ae7a95ce0f144c3f05a9a769/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lzlib/0001-cmake4.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/lzlib/0001-cmake4.patch

diff --git a/package/lzlib/0001-cmake4.patch b/package/lzlib/0001-cmake4.patch
new file mode 100644
index 000000000..4741891f9
--- /dev/null
+++ b/package/lzlib/0001-cmake4.patch
@@ -0,0 +1,28 @@
+From f36beb673257940d0beb18b9abbaccf73396ca12 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 20 Dec 2025 09:49:54 +0100
+Subject: [PATCH] cmake4
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Upstream: upstream is dead
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 063f342..10f6468 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,8 +4,8 @@
+ # For details see the COPYRIGHT file distributed with LuaDist.
+ # Please note that the package source code is licensed under its own license.
+ 
++cmake_minimum_required ( VERSION 3.10 )
+ project ( lzlib C )
+-cmake_minimum_required ( VERSION 2.8 )
+ include ( cmake/dist.cmake )
+ include ( lua )
+ 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
