Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996C3E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 10:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3863E60701;
	Sun, 15 Dec 2024 10:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfbbL4uDBpd7; Sun, 15 Dec 2024 10:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7AA607EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7AA607EF;
	Sun, 15 Dec 2024 10:14:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B063869
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7B2340263
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lib9A14eIazR for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 10:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92B3A40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B3A40108
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92B3A40108
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 10:14:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so4462518e87.0
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 02:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734257640; x=1734862440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CDGKK2ynAH7FNL9wzUtP/+05N1zGjlOfJ/nS9X7HpAg=;
 b=lGh3NGmZ/+pFrwlKyxX0IIIqhYj5X62rppQquyPTvx2KsF6hJfHAU1XK8YRm6ESg4e
 +NeKy7vao7WymeilaUaapRJzT3k9dEUs33Hc9wYQHph/6yrOQIQDzF0Lp0yHuQpc3foz
 Urxevld29Df7uRF4YBYUwzJMANDKp/RL3r/v6vMrybECdr4wBlGU1nFriYd6tCDmqZTr
 y62arRp1hyv9chdQZ67uRzlqJe2AmXuQ0w5w5u9Fhha2Dbu/T38gbPE93PHcCQg7R++2
 ZskqR3/9y3Z6d3vgLrn7e8dlz3CXg78pTfeVoALxn5McRHNJckvZoPIrH014Rv3EFSz8
 Irww==
X-Gm-Message-State: AOJu0YwlcbcTlPIVp7PaJDEIlpzRtit7dXZJjdlnIWszeC9a9CbKXvED
 JnNMJ5xHTkMI8Qk+ZjPs3i9O8u6/rXu6yvVRpC+I0K5MdDkI44Bh9Q58sPtco7k=
X-Gm-Gg: ASbGncusJaWc3YKlKtrqoQGwlr8AF0lIYGQ3umRhJiKVHtnPeTSY0M0a9l4OVlqEf+R
 wbnYeQksKRWAyQXtZeH7nlbFAXyCBZHDis4pQNIMFwIoB97a8thV5aybt9/n+hR9+yXP3rej0WL
 yGR++SF1w+s9ltraM0JlzRFNNhkfR0rEByO43MjN3+T+INXBPBn5n16N/DSfE+1rIi9gOtinNoS
 vdRiCjqc0j3Plj7OhqH0aar5k+NQXOGAQWH71jd4rLT66VT7awc0fDTCNAsALAA
X-Google-Smtp-Source: AGHT+IG5QTBCI6XPEORgK4E8myTcNCgT06s8AwITBzhux7npIfWwRTVAsDXJ9eMQan+rx87C+e//Fw==
X-Received: by 2002:a05:6512:1255:b0:53e:94f8:bb30 with SMTP id
 2adb3069b0e04-5409055bffdmr2769270e87.24.1734257640245; 
 Sun, 15 Dec 2024 02:14:00 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54120c13d69sm462646e87.217.2024.12.15.02.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 02:13:58 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 13:12:54 +0300
Message-ID: <20241215101353.3214256-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734257640; x=1734862440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CDGKK2ynAH7FNL9wzUtP/+05N1zGjlOfJ/nS9X7HpAg=;
 b=XZaMyNfFQmZqzxL/1+q5tFbuJjudwUsGf/IaiQY0hCOwCHi5Fe/xx3ZvLnGiZOfjX4
 NLpRDFshVHwdZseFxg60/X7iRn/vFjGIQ8HC/7oGG5r5gCA2/ZwsLH/nUrlKDN/u9A7w
 bfUG3UmT0882u7KyBs45f0rPTaF2WAX2sNtWwadW3Gu03+V6Gii1fc477jzFnhCccKeP
 e48/74j6o/uRE5GWGkecgnr0w6nYGVZgbqRX28kqW1A3Jt+NFDwgMjqv570V2tunmBo4
 X80zPCYICKpvkBTfYZMCvy/RevpDH/U04DRMg0qu8nb1CWuIUKsMBb77/A07QzuZ3QwB
 EGKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XZaMyNfF
Subject: [Buildroot] [PATCH 0/4] orangepi/linksprite: bsp updates, part II
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

These patches update BSP components for the following boards:
- OrangePi PC Plus
- OrangePi Zero Plus2
- OrangePi Zero 2W
- Linksprite pcDuino

For all the boards the following updates have been applied:
- Linux v6.12.3
- U-Boot 2024.10
- ATF 2024.11 (for arm64 only)

Besides, forced check of hashes for BSP components has been enabled.

Regards,
Sergey


Sergey Matyukevich (4):
  configs/orangepi_pc_plus: bump BSP versions
  configs/linksprite_pcduino: bump BSP versions
  configs/orangepi_zero_plus2: update BSP versions
  configs/orangepi_zero2w: update BSP versions

 .checkpackageignore                                 |  3 ---
 .../patches/linux-headers/linux-headers.hash        |  1 +
 board/linksprite/pcduino/patches/linux/linux.hash   |  2 ++
 board/linksprite/pcduino/patches/uboot/uboot.hash   |  2 ++
 .../patches/linux-headers/linux-headers.hash        |  1 +
 .../orangepi-pc-plus/patches/linux/linux.hash       |  2 ++
 .../orangepi-pc-plus/patches/uboot/uboot.hash       |  2 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash  |  2 ++
 .../patches/linux-headers/linux-headers.hash        |  1 +
 .../orangepi-zero-plus2/patches/linux/linux.hash    |  2 ++
 .../orangepi-zero-plus2/patches/uboot/uboot.hash    |  2 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash  |  4 ++--
 .../orangepi-zero2w/patches/linux/linux.hash        |  4 ++--
 .../orangepi-zero2w/patches/uboot/uboot.hash        |  2 +-
 configs/linksprite_pcduino_defconfig                |  9 ++++++---
 configs/orangepi_pc_plus_defconfig                  |  9 ++++++---
 configs/orangepi_zero2w_defconfig                   |  9 +++++----
 configs/orangepi_zero_plus2_defconfig               | 13 ++++++++-----
 18 files changed, 47 insertions(+), 23 deletions(-)
 create mode 120000 board/linksprite/pcduino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/linksprite/pcduino/patches/linux/linux.hash
 create mode 100644 board/linksprite/pcduino/patches/uboot/uboot.hash
 create mode 120000 board/orangepi/orangepi-pc-plus/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-pc-plus/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-pc-plus/patches/uboot/uboot.hash
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/orangepi/orangepi-zero-plus2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/uboot/uboot.hash

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
