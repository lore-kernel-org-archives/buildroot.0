Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AAEE77170
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 03:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135B26089B;
	Fri,  6 Dec 2024 03:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eTJa-83S0bs; Fri,  6 Dec 2024 03:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B5760A64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B5760A64;
	Fri,  6 Dec 2024 03:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3438D1DDA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1422081B69
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBd9XQ4CRqe8 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 03:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 678FC8176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 678FC8176B
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 678FC8176B
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 03:06:24 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-215513ea198so22110175ad.1
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 19:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454383; x=1734059183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0k4H6HE5PpjgG1wmPfPCYD/zXcLUSCSlK4wOO7uAm6g=;
 b=Dy9t6fQIppoaxIzOKb8PaYVj3b5aGY9K+Sj/Ff1Zsl2orRhciqDhcTt7b++sxpAYkM
 +/qVRlqh/sh3593qCuZ0MKqefiA4bWetvSBgUgV1DMzK1APmDWRWLv7C3VsUx3sZAF8C
 q0BlcukJH5RUUYg8QEm4kFm/fhe2kLAKxN5GUZD0cVCotMjarCkfPplZxmwmzkGcBJYv
 YS+c/byrpOOmM2nQw8EYoKV4nY72+YRnPz+120R1AGqF5a5QyuVuOPhWxNVVHDw9lRrC
 P/OSO1ReVsh33/xbpmjRtx2eTqfqjVsFfm8b/cajL2AbOGSdoBM6FZNMR4pVf5urAdxa
 wotw==
X-Gm-Message-State: AOJu0YyOcCP8xse3rEsWrFFrQphOPsVjV55KbOU15ZS46zlS4tHF/aZI
 tBqOcID8MF1C4iisA5ubAT7Y9+iZWcD9B5F19SdSq0f0P0ScRwl6yF6TrA==
X-Gm-Gg: ASbGncuBe+Y0mPls+V6UvEb3EZ8e1B6UhALYe75YI+GB6CJi3pz4m8S3aH7TNVOPJim
 SVfiz1KcpQvKArBof0VW0t3f/xwmIQCUU95fcudEZYVA3gp8M2LvF/NzDgOaT/PzRB8lG/DBu6I
 sMPsbIrkckhssA5370W2LomOUx4K6ypQ+tS0JP7mmZ+e7BA2OkxI/nukkflTxIYG/yBK5ZBX6GL
 udpTcTXmy6lNdgF3g6ygOHpIirSi0sNO7Pnm/2eex6cN+w=
X-Google-Smtp-Source: AGHT+IH3f9M2nT1m8N3frdA0K9SeG61tqP/447HWAHH+XaDyNch0WsThldD1DutJhF1dydWjjV/g3g==
X-Received: by 2002:a17:902:dace:b0:215:65c2:f3f2 with SMTP id
 d9443c01a7336-215f3c56e3emr88116545ad.6.1733454383335; 
 Thu, 05 Dec 2024 19:06:23 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725bcee5f2esm222856b3a.54.2024.12.05.19.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:06:22 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  6 Dec 2024 11:06:15 +0800
Message-ID: <20241206030618.249638-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733454383; x=1734059183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0k4H6HE5PpjgG1wmPfPCYD/zXcLUSCSlK4wOO7uAm6g=;
 b=Hf2I7Y11QQ6bFKBhuAszYO5X1vmOuS0M6WdRERNLuow5UhaIImSkOyDy/2gELFq5m+
 6osXyu5pECwzTjcz3jkvFaD/A8iAT586laI2HZdzALc1h3fRS/x8N4SbT5nUEHUJRC62
 wh8eNOhrQCruSD78ch1jT2wrMBbTLANjQchM9/XDW51xTDxrx/b2rxgx8xc4mEjJws8m
 otLoO7AeQIIROBlFdJLLcpv7RHKQHOkaJYVWHUeN7VKG+NDkK8b4TYVB6AGAT4gxm7nr
 koJxXFEAZIrkwk2I83S45Alo7sX86q7SJWdwLCbbJKPsDk59GW+YkjoCdockeL1uMK0e
 2Y4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hf2I7Y11
Subject: [Buildroot] [PATCH v2 1/2] board/cubietech/cubieboard1: use
 lowercase keywords in extlinux.conf file
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

This commit also updates the label name, and the unnecessary "default"
entry is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .../rootfs_overlay/boot/extlinux/extlinux.conf           | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
index 2fde683f38..5b071dce84 100644
--- a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,5 +1,4 @@
-DEFAULT linux
-LABEL linux
-  KERNEL /boot/zImage
-  DEVICETREE /boot/sun4i-a10-cubieboard.dtb
-  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
+label cubieboard-buildroot
+  kernel /boot/zImage
+  devicetree /boot/sun4i-a10-cubieboard.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
