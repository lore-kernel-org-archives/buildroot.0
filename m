Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E3C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 17:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA043608FD;
	Tue, 25 Feb 2025 17:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt52ReBGQ5EY; Tue, 25 Feb 2025 17:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA6CD60AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6CD60AD9;
	Tue, 25 Feb 2025 17:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 896242DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 17:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D85D406C1
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 17:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDyUveKDpe_m for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 17:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3063340826
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3063340826
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3063340826
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 17:43:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so6757977e87.1
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 09:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740505387; x=1741110187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iwg1Ypf7Lonh6aunkZrDAVeHDFzDy3AtCDmTNwkv6/E=;
 b=LPcJnRiC90bDjlph3siVBigEj+uwSHC1Dp/A87nmQCdvWfzzo19N0LL2JGugc+ScOg
 2cg+J3E4gcAiMCfVgX/e6JVIgkxfdNKksjOnFgD2aIaGH4kFe0CsRC3Ezr1W7OVJFFv7
 FTOZFniGYSwuFb5ZfYsQrginnohkh32fp5x3S0AQPYXpJWFkpQF40AanucFQc2tCAbgX
 FVG48O3d9NikMIjlDKb83rWeIVI492Ta5qPamVz/TfwZa7GzNEg2czUdbMROf9H0GyI6
 rIk8XnkyTZedIvRM/vrQ8Ccakplgg8sJHN3YjDiiwUaBf7ymdw+xW3Xm34EltpGoCJDB
 3IYw==
X-Gm-Message-State: AOJu0Yzw6T54tX0ttv7GqJGzwogWmWAYAwhf8Qxutq95LrOveSqTEXc3
 GBKIR4W6NQGg+KG2AMqd4WE9YxOQvOQsjJ1bQMsG2J7jBDYxnX4FTou2vw==
X-Gm-Gg: ASbGncurAcxJLVwSHjr6sgOiYCRBrGc1JjyoV9gmU3893D4n7TDHF9T4fiaGIY7NSzP
 J0HhPj6hpwaKCNXs8jTzWWuJ3sbbsAeDYWvgdiHiaZrzo6S295RrXadOVVRWuNHOWqLQCiotkIM
 sKErpKNxJbW7gB/Duy2/7Pob0qmFVVb4D9LT5qXhtCDkNf4I/qJSd009OxwCJE/xWQJibfeXIrb
 pnYRlkO7Mp0ct18qzMQH7KwvpBB6r/th5R/Daq0OQKsi0OdwFj/Vh2TuOM8l8TR210wcWScwsXw
 uIgkUZhmE67DqAyfeQ0NDFz2xByPhnP+iEnZlKtPtQ==
X-Google-Smtp-Source: AGHT+IHP4md6OJSv9WK9sdSG5lmz+xt79jprHr4EMqdkv1wN7+ToLXyQlU+3bzQneNguIXjSHD4iCQ==
X-Received: by 2002:a05:6512:104d:b0:545:ebf:145f with SMTP id
 2adb3069b0e04-5493c5c8f21mr142540e87.53.1740505387307; 
 Tue, 25 Feb 2025 09:43:07 -0800 (PST)
Received: from calculate.local ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f4a02sm229490e87.164.2025.02.25.09.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:43:06 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Tue, 25 Feb 2025 20:43:04 +0300
Message-ID: <20250225174304.1810-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740505387; x=1741110187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iwg1Ypf7Lonh6aunkZrDAVeHDFzDy3AtCDmTNwkv6/E=;
 b=Q3bcKH7RSpWkktw9hJFWSspdJah5c/5hD/p1WO3ChL/w7aDZIBDzbNWvbkS9ehfb4j
 TGPDacXvf/xJzdNW6xpn9FIhxzqHhIK2ROyNx9qcaOhKXp25MIpS3CfbJXY2VLsZyQis
 +19j0uAxQy7kvq+mjwDCFYZBRjuROM1RQe/CEPDZcZM0ytxK7KmotqXtRnYmpj4nCr+H
 B2jYXoAPv2qpfPBPY3sQ/TjeBB+UUp3EPOkDEax6D3EoQRAWRl/ILXsdVcpNGVprO71n
 Tu23D7bEk6Usr6wFGdyjGCEOYrQ5NewoWRbzJy67ZLmnsViaHah/z+m2apr2p2UPFkjO
 kDog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q3bcKH7R
Subject: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s:
 rk3566-nanopi-r3s.dts: enable hw random
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

This patch enables the hardware random number generator in the device tree.
Without it, the entropy level in the Linux kernel increases very slowly.
To check the entropy level: cat /proc/sys/kernel/random/entropy_avail

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 ...001-rk3566-nanopi-r3s.dts-enable-rng.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch

diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch b/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
new file mode 100644
index 0000000000..b376004377
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
@@ -0,0 +1,30 @@
+From 284e6683b4a0ee6b1fd22ccd34785e1f2d58c115 Mon Sep 17 00:00:00 2001
+From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+Date: Tue, 25 Feb 2025 19:49:00 +0300
+Subject: [PATCH] rk3566-nanopi-r3s.dts: enable rng
+
+This patch enables the hardware random number generator in the device tree.
+Without it, the entropy level in the Linux kernel increases very slowly.
+To check the entropy level: cat /proc/sys/kernel/random/entropy_avail
+
+Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
+Upstream: Not applicable, Buildroot specific.
+---
+ arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
+index fb1f65c86883..a89bdbf71e12 100644
+--- a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
++++ b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
+@@ -552,3 +552,7 @@ &vop {
+ &vop_mmu {
+ 	status = "okay";
+ };
++
++&rng {
++	status = "okay";
++};
+-- 
+2.45.3
+
-- 
2.45.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
