Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490FFE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 20:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B519C414F4;
	Wed, 11 Dec 2024 20:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZ2hUOe0nUIb; Wed, 11 Dec 2024 20:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2BC41505
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2BC41505;
	Wed, 11 Dec 2024 20:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3EC11137
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4955844F3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdzgTThk1TqL for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 20:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0106844F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0106844F2
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0106844F2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:11:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so4507987e87.2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733947913; x=1734552713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=740sMi5OW02d0lhuHq6Sb/CaLjVs0ReWdAFFDBfnchE=;
 b=J0j1az9QFs2NI6wokZJYqIpp27NMJSv8uXobO0q08fSqiGDqUXUeQW2v5UtxLNZDWP
 7l8MJQfxFFJNmP+y5VRWe8Y5Y8n4nyzhfFKGcbjssUhU1x4xhdeBgxmr/CVXhlXEkwQS
 Olcq/2YjcFGdTmkZiDmujUD3rmf5rIkEzLZ0J4m8WvbfGbYkBO2X31bpoyuxKSuivTFt
 E8Zym3ekBhzdm+9fsbAogphC1zGT503w/xQcisv2SdX1xR86WjO7oZQocGX9FTTN/j+h
 77+J5sW74qwMzHtVFMa2qMkrqT9kW/QlHZIarhKFiG4nx7lAqOHXHLWhKJMlxNtQ9uVZ
 CDXQ==
X-Gm-Message-State: AOJu0YzayAl3F/4Jql/1d6wWjmEebnJxhuVqelCoJpBZKmoA9s3V5Ura
 P6cwj0oZAPUGX6AGT8OBoom9XobCTk60X9zlMeAKpRj3yT8NW+i4sqM/hoNX
X-Gm-Gg: ASbGncsNhx10gKyHYjYmg9uOEa2oSSMrcUQTh6BUpGjudTZUNy8YXSHf+dr8txT/oL3
 jHlKiWsCITJO6rWKynbFpLfWmy7W3b3Ekg5wXHjR3TpIzGRWp6wgPCseTaKFXpNTLTQ0c8PtS4F
 HwtSkVPmPRx11I/IiI58eGxaG4nmIT7t+KI0DteXfNU/LQYR5fWNsxOq3/P6Lk+3EV6ESvSYygw
 lWHMVfSuIcgP3rNAEVosW9cSNkaQYod/U7GJ8O/yfti4+wu1SMc+0ykhXnOvQ==
X-Google-Smtp-Source: AGHT+IFeag3ZfQVvHlGwz5Hw8TdioDZv02H3W84thinlVTZFJpo37PToGVymxCpz+y+qjby4xq1TKg==
X-Received: by 2002:a05:6512:1055:b0:540:1dca:52d3 with SMTP id
 2adb3069b0e04-5402f01769cmr321179e87.29.1733947912556; 
 Wed, 11 Dec 2024 12:11:52 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-53e398cbf0dsm1638165e87.213.2024.12.11.12.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 12:11:50 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 23:09:38 +0300
Message-ID: <20241211201146.4057892-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733947913; x=1734552713; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=740sMi5OW02d0lhuHq6Sb/CaLjVs0ReWdAFFDBfnchE=;
 b=U61cpOBrHFl/kdC/lN83XA+iPAW9UnHPG2rr5p2v2rHAtH9eHR7Ee2zcWcxaptK9xU
 wrWj9TRsaAOoFgBmBmXuCaWgAe4krRc6/LmJKe0wPUE0RHLFLjx0MuQP8VpZ5LiawfBJ
 ya4rVKaJu62DFkbt+3XMvnGj4i+adtJ+VGj5mjcAvgAFucb1q0mP3jsKNLW+gc1hYL4y
 jtUE9Wu/syyoDg3/canx/geshQKL0TU56P4g4kY7r+ninZEg/nBeukPMXlZcWVvFxLwv
 5jKdLqjgSxGLkVqgPh24t+zdIQm8s1lz7zqGB1SFof/PAAS0JjKDM+PCcbvzNiO9f3In
 qO0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=U61cpOBr
Subject: [Buildroot] [PATCH 0/3] orangepi: BSP updates, part I
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter and All,

These patches update BSP components for OrangePi Zero and One boards:
- Linux kernel updated to the latest LTS v6.12.3
- U-Boot  updated to 2024.10

Also xradio driver baseline is updated to make it work with new Linux.

Regards,
Sergey

Sergey Matyukevich (3):
  package/xr819-xradio: bump version
  configs/orangepi_zero: bump BSP versions
  configs/orangepi_one: bump BSP versions

 .../patches/linux-headers/linux-headers.hash        |  1 +
 .../orangepi/orangepi-one/patches/linux/linux.hash  |  2 ++
 .../orangepi/orangepi-one/patches/uboot/uboot.hash  |  2 ++
 .../patches/linux-headers/linux-headers.hash        |  1 +
 ...-orange-pi-zero-interrupt-triggering-xr819.patch | 13 ++++++-------
 .../orangepi/orangepi-zero/patches/linux/linux.hash |  2 ++
 .../orangepi/orangepi-zero/patches/uboot/uboot.hash |  2 ++
 configs/orangepi_one_defconfig                      |  7 ++++---
 configs/orangepi_zero_defconfig                     |  7 ++++---
 package/xr819-xradio/xr819-xradio.hash              |  2 +-
 package/xr819-xradio/xr819-xradio.mk                |  2 +-
 11 files changed, 26 insertions(+), 15 deletions(-)
 create mode 120000 board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-one/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-one/patches/uboot/uboot.hash
 create mode 120000 board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-zero/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-zero/patches/uboot/uboot.hash

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
