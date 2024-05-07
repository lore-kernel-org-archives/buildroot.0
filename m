Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D65FC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 04:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF2764010F;
	Tue,  7 May 2024 04:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eeSTSWydCwm; Tue,  7 May 2024 04:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD7D40201
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD7D40201;
	Tue,  7 May 2024 04:16:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF78B1BF389
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 04:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A49A34078D
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 04:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Jk1iQfP1THD for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 04:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1600B40255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1600B40255
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1600B40255
 for <buildroot@buildroot.org>; Tue,  7 May 2024 04:16:29 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51fa8f5269eso562616e87.0
 for <buildroot@buildroot.org>; Mon, 06 May 2024 21:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715055387; x=1715660187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kYvN6b/El3j0CEVe2nxjWftHUTgZdcIOgShfKIQmoyI=;
 b=rA6yrHdVtr+py5Z9N1t1r7KG3Y2PQxLFMH+9k74qIVIQ0Rwrsa84JMScUujxkwoqI9
 MsFu+/9hEI0cUuy1gc+wk3yODnt0oz/UIEWTjjJ+R+HFEhDVPQ2TPS8lqytu1j1XhXNd
 ozGyYKJngdOv8H8sxdpmoyXjloEN5GM+TH2VH3dhyDxqc6wPOUbIzOgjhsb7DplR5x9k
 3rGvW4JcJUVx6nKUwFVjX0Bp4kP7/ghqYai6RdChRDxAvOSEPWilZHBKVzcndi8w6jPb
 K4RLiiWQqCO+t1noiygm7y4aUEjzf3KpNZLfwdjapMfe04Linh0CPI1f8r0S1CuiE17U
 6BWQ==
X-Gm-Message-State: AOJu0Yyw7YDpuzVlU0aQ1Meo8ZOM/UqkKaGkONJYeY7Ks60NVorbq+bv
 KGSAumGR2FxRKwG9MGPCH45ULkzoyOZfPOYXc5qwxqB/0iZIf32l7HAuTw==
X-Google-Smtp-Source: AGHT+IFrDaZKsIOFt1veykLtipB0GvnBraOcYxz1Ad0pwOU6EKQhI0lGKHgtiHO4/P4fjdgM9yHjCA==
X-Received: by 2002:a2e:3802:0:b0:2dd:c6c8:dff1 with SMTP id
 f2-20020a2e3802000000b002ddc6c8dff1mr6877358lja.4.1715055386620; 
 Mon, 06 May 2024 21:16:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 l13-20020a2ea30d000000b002dffca24d97sm1796273lje.119.2024.05.06.21.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 21:16:26 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 07:15:48 +0300
Message-ID: <20240507041548.382997-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715055387; x=1715660187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYvN6b/El3j0CEVe2nxjWftHUTgZdcIOgShfKIQmoyI=;
 b=Q5P7a7ZzTMSHDHpoGOQ5GwMQoY2DdG7Af3s8DF1ohf1Usa6Zrt0UghexnMpdTa6d3s
 w5iyTwzTVUMyKz8NDXAYKXbRkYW6H6khtjy/2W0dHxYYGeJbpGGXW0qH3qRz9zGHI0m+
 p92KPaogaQDaT1O/MeT3GUqOQKCGUA6Z4b5I33E7/UeroeBKAMzqoBk3qAyizlSmxvHS
 Sa4+b6fgpRVSxbDZFcHq71fdOEnQlRmL+H8RijJ525jhNtGQTx/wNzoEAHprBYhRmGRA
 5XE4vlq6hV431tFuJ6WsUflmwlTzz1Kxfh75Q4La8oJMLh6OZRknKQGsy56gm8g5TQCJ
 x2bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q5P7a7Zz
Subject: [Buildroot] [PATCH v3] configs/qemu_sparc_ss10_defconfig:
 Re-introduce.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- With uClibc-ng-1.0.48 we can restore this config
because uClibc-ng was provided the fix for SPARC.
- The instructions in board/qemu/sparc-ss10/readme.txt
are still valid without any corrections.
The system boots properly ang the login prompt appears.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
v2 -> v3:
- The first two patches are merged.
- It has been checked and it is written in commit message
that the instructions in board/qemu/sparc-ss10/readme.txt don't require changes.
- Add myself to DEVELOPERS for board/qemu/sparc-ss10/ and defconfig.
---
 DEVELOPERS                        |  4 ++++
 configs/qemu_sparc_ss10_defconfig | 28 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 configs/qemu_sparc_ss10_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c5ad1e42a..4bd6c58d4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3343,3 +3343,7 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
+F:	board/qemu/sparc-ss10/
+F:	configs/qemu_sparc_ss10_defconfig
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
new file mode 100644
index 0000000000..a8e3df9180
--- /dev/null
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_sparc=y
+BR2_sparc_v8=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_AS_KERNEL=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
