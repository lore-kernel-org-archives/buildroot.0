Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6AC19776
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 20:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF9D41327;
	Wed, 26 Feb 2025 20:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0mCHmQ0lzGJ; Wed, 26 Feb 2025 20:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45C644132A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C644132A;
	Wed, 26 Feb 2025 20:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B51B94F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED3283022
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzyDTFqGhE8q for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 20:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0681882F98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0681882F98
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0681882F98
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:48:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30b83290b7bso3056881fa.1
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 12:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740602937; x=1741207737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zp+KcsMX3ynljwlIUu0krbFP9RRFfkX86DNhWGH9A+Q=;
 b=QX7ywr4nO74g6kYHBL64H+QaSoH9AdqVY4/mdEWHiOxWo0Kl+iR8y5xrty6f3QLKN/
 X/6RaEWtiXfWbuXJ0TcjMTHFO1/ToWIq7p9PtDaAbREqFUKaigTapH44zKCnW5Hy9dOT
 k7skFbpT0kRr6hazRDD9uB6lxzpCvZ7WgGLbrFPUT/WumsBpiBMvxtG8X4384OObkiec
 rSVLxbk+Do2MCIGYZxlQ8nsi2bnotkJ0cjh07l0qZLBXp6RVRS65jihSY0aSCbgqG2Sk
 1Tf9hCKmTpIymq9/FcJ6GM4HEEWEAChCql0R1FUjP4ijDuKMD+IUMpJVhceIQjgpbKl1
 4lTw==
X-Gm-Message-State: AOJu0Yw0I2UTowC6ywS+GBhjkm4m3Nco1csu/dinR72nuB46O6sd4km2
 P4YFGNFEPrl5EEAt2lRP/aS4RYo0TQIyBShFmGb/OwKyMbIOo/PASfQifA==
X-Gm-Gg: ASbGncs/LwIcMvKJkoDlYOwcmQVokC4LugkY+1UsWQNkjHd+ZH5FGhaK+i2CPEz6PXc
 xYYHD/LiLZMmAijAMzw989ds/2ewpcw/OYGmigkIGrSoIUnouclqvsV4tCdc1jpiMiZ6XTmLCe5
 EQNnIAZPi4H2pEmzZ22iY/ZjEbkn3GufI6RySffGOdM7yKX3eWQ2o2R5YPvayFft+pcIYs4/Uij
 mnd5KxlW2VdN6i6fC5G1PCOz1b8ggTd0o3fTOIzLL7wobed6tBfh/QQvns9KyLGym/rOV1HgXxJ
 V1gajFooDvZdJJ6IH7EuvmnbA1naGQLhjHrVz3pw5g==
X-Google-Smtp-Source: AGHT+IE/PothnjpKJeKdXWzD8a+DEn6ZsmwNxd0nMZwh7e0dZ17udg/qL6DbKNL42vztGjUDnQ6KSQ==
X-Received: by 2002:a05:651c:22e:b0:308:f75f:457 with SMTP id
 38308e7fff4ca-30a5b18ae70mr93874041fa.12.1740602936863; 
 Wed, 26 Feb 2025 12:48:56 -0800 (PST)
Received: from calculate.local ([188.191.244.248])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0edfsm6140081fa.14.2025.02.26.12.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 12:48:56 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Wed, 26 Feb 2025 23:48:54 +0300
Message-ID: <20250226204854.5821-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740602937; x=1741207737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zp+KcsMX3ynljwlIUu0krbFP9RRFfkX86DNhWGH9A+Q=;
 b=lMpNzMZdt1+puJ/150zRdB43e4S6B/4vP+5DujFRkEDtA+5/3ZRIh6MRVeUp/Se3uI
 3Y15808niiz5c0O+hWSWGOB/18k1StSb3ruC9OGfBK3ha6gLJgjaj3+5h6uEIcrtHRr8
 DMzLfqhwXDOvwnnWhrgGVhyzDMck65xCKfDcaKjNC/w15mOpwptg0xgjjTO+EwFrOmG0
 5KMAaFQaorMI8FxnBJZ+mBgcNGE9C+n3WX9vbzlyVDLhoRPozpQNlWvDneg5IiWrWREJ
 aO4CvVdB3i3X8jgy++33mS9miV6n9W8HE2IIJbGFUnzXDbCXhSLUri7wqv2lQxjklP4+
 5jYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lMpNzMZd
Subject: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s: add led control
 script
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

There are three LEDs on the board: POWER, LAN, WAN. By default, the POWER LED is
simply lit, and the LAN and WAN LEDs are off. This script configures the LEDs 
according to their purpose. For the POWER LED, the script has 3 different 
options, left to the user's discretion.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 .../rootfs_overlay/etc/init.d/S01Leds         | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100755 board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01Leds

diff --git a/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01Leds b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01Leds
new file mode 100755
index 0000000000..f4bf9954a9
--- /dev/null
+++ b/board/friendlyarm/nanopi-r3s/rootfs_overlay/etc/init.d/S01Leds
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+# LED Control Script
+
+POWER_LED="/sys/class/leds/red:power"
+LAN_LED="/sys/class/leds/green:lan"
+WAN_LED="/sys/class/leds/green:wan"
+
+case "$1" in
+	start)
+		# Power LED
+		echo heartbeat> "$POWER_LED/trigger"
+		# echo activity> "$POWER_LED/trigger"
+		# echo default-on> "$POWER_LED/trigger"
+
+		# LAN LED
+		echo netdev> "$LAN_LED/trigger"
+		echo eth0> "$LAN_LED/device_name"
+		echo 1 > "$LAN_LED/rx"
+		echo 1 > "$LAN_LED/tx"
+
+		# WAN LED
+		echo netdev> "$WAN_LED/trigger"
+		echo eth1> "$WAN_LED/device_name"
+		echo 1 > "$WAN_LED/rx"
+		echo 1 > "$WAN_LED/tx"
+		;;
+	stop)
+		# Turn off power LED
+		echo none> "$POWER_LED/trigger"
+		;;
+	*)
+		echo "Usage: $0 {start|stop}"
+		exit 1
+		;;
+esac
-- 
2.45.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
