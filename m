Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF71E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 20:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0145740706;
	Mon,  6 Jan 2025 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nou2qBwmeJ9r; Mon,  6 Jan 2025 20:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C626340709
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C626340709;
	Mon,  6 Jan 2025 20:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C67EF1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04E2C60A46
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIlTTYrmMR_J for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 20:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0136608C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0136608C5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0136608C5
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:17:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43623f0c574so101898335e9.2
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 12:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736194642; x=1736799442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AfotB3bmO3rw0afvYesHGsmXyWBzTVVq9gKDKbCJc3Q=;
 b=g2Nf+PSNxEYi8hf/caLNQ9O1h3dg2Nimx1q35uKIA6pZ5fw9Gd8+MecdCVhXhswN2q
 s9IJ4SkTPpP8KUshu2k7YeI9S7K3d9Cumw0+BsQNpD6ZLtMIxH34itVudiptqJl9Ics9
 eRFH/lqTy2GHTP5E5Uf9YAqSFrLM9+ROQHaZU4EpyZY7LGP1izGtHKGsXVcAKTgzdTYi
 BBMaoETWgj6Km1szPTfshgcwxhhM26khCcqekDmpd9TXCJcrb8SBiJ/YuE5OGWYaPrL8
 +apdoXc+lzGV8c+ixZsQRoY18rj5f7GzWEYnZINLW8cmmWxNvQFL0bJhUT3bQuWXIoVr
 +OHw==
X-Gm-Message-State: AOJu0Yza+dpaGHbOkLeNmj2+20opafqBEVsaGtnQUU6v/aQONcnwhMPZ
 KXzQryIFo55AmZWqs/UDf/6qlXZif78DkNMSbMmKdOaBvBm2Ra3giK7N/Q==
X-Gm-Gg: ASbGncvknyFZxbSd4xHRX9e/FyyhWiDflh4JcmNhIXwtWALXrDeP2PB9nadok1124L0
 Xufk9bw3eDOJya2zYy4XF3gcuDu75whAvExUjxknPYC/8fTTD+vnsu0DDNGLu8ehmTd1qqfiLVE
 9+XtrxKRobYqZ7U8FJJCLnOoqriTcVUIHTTHIPL2dC/6ohy0l9uYlkVmHMvJ9cboa50XZBwF602
 9wQoCZU1wQHIWZetksoLg+w86tbcDh+Z6JA0IkVLIm9Vyy0OIQr1N0L3a5kYOA5+pU=
X-Google-Smtp-Source: AGHT+IGO5Ypl29/v8vNSmDhHqtzAYdUT//9A/Cr/GbE+o5mNAE7JWNiHDTfz8xI4fkTZHcv3R4cHQw==
X-Received: by 2002:a7b:cbd6:0:b0:434:9d62:aa23 with SMTP id
 5b1f17b1804b1-43668b4996bmr444595375e9.20.1736194641536; 
 Mon, 06 Jan 2025 12:17:21 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847513sm48944954f8f.49.2025.01.06.12.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 12:17:21 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Bryce Johnson <bryce@redpinelabs.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Date: Mon,  6 Jan 2025 21:17:20 +0100
Message-ID: <20250106201720.3134534-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736194642; x=1736799442; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=AfotB3bmO3rw0afvYesHGsmXyWBzTVVq9gKDKbCJc3Q=;
 b=KiqoBtoWdeHGgoadEI/Np5fwqDQP2jhASDnuHUMkAjdkIXJyauQB9LGv5Rp/JKuRWW
 abQTUi9ebmkaXQKwIPc/5cYoE9GiUdR7gCeLZDupDCzQeGVe+yQeFEU7wqMbw4IaFsgj
 s+p6MJfciD2mjH5rBFpTtNPlW3/8oUvJuLCsIyJ/3avKm71kwCDqQG7ROLXcmynpdvAx
 BmoZSw6PxtivcX9e007uxjB9EwgKD14DnK5hhf4ojPjLkLfApyHojfKszpLzWhwTvmA8
 lNUmfq1F7mlqgZ8CGFFXO6UCTkJh4m5WcwERw5IXzUfoGKfgs/TTsVAfhLLYT1FPA2uV
 OxBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KiqoBtoW
Subject: [Buildroot] [PATCH] package/arm-gnu-toolchain: drop prompt for
 _SUPPORTS option
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

The _SUPPORTS option should be blind: it represents a restriction that
we certainly do not want to allow the user to lift by manually enabling
that option...

Fixes: 65f268e21cbe (package/arm-gnu-toolchain: add
       BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bryce Johnson <bryce@redpinelabs.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
---
 package/arm-gnu-toolchain/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
index dfd30e5223..de8ff8c005 100644
--- a/package/arm-gnu-toolchain/Config.in.host
+++ b/package/arm-gnu-toolchain/Config.in.host
@@ -1,4 +1,4 @@
 config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
-	bool "host arm-gnu-toolchain"
+	bool
 	default y if BR2_HOSTARCH = "aarch64"
 	default y if BR2_HOSTARCH = "x86_64"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
