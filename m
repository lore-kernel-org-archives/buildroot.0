Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EE5C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 12:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0060840638;
	Tue, 18 Feb 2025 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYfYhNvI-VS3; Tue, 18 Feb 2025 12:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D2940C5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D2940C5A;
	Tue, 18 Feb 2025 12:37:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07552968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9F5560FCA
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVoi5_2L1paB for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 12:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=tim.gover@raspberrypi.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E2C160FD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2C160FD3
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E2C160FD3
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:37:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1145680f8f.3
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 04:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739882242; x=1740487042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuEGk7+G89HF8K+eYb+aP/11Rerb1K0LrBiW5Ert1go=;
 b=lQ6f+04FwOe/R1hvAstc4beSWRROF0jdpyOIqNAkCYQexPT7heD0FCRMYGx4ZHQIGB
 JRDwkztXqamuO7y0iHzdvnd35es+RTuNSl4GUVdFYa63cOGszHy5AR39jg3ev+HlFYCa
 koQxIU9BHfr3rlyYTFsRrJJ6inbCL48P0ZgP3lq3kU6iT/vgJgeML1Nf2wz+xit8nRI0
 qhF9huX+/86NEkG3kkSqAsjnyJ1UJjDgXDa3oR8rUjzz+x8YckIZIrDEoB8iiAiHlz+9
 Ou9Vu5iBo/OI3i2v/KHfPhJxjPLw/uaGZKuroptKNvD3eVi8xxALtkpploEPS/N/5Vd3
 kREA==
X-Gm-Message-State: AOJu0YyKkSLnEdj/2DLJiI5QitP6u53s4ozGnFpv2CstPm1Pc9J1Cw+R
 axcZBxO+y9hJ1a2QTR5ksLrq/94lVw5hl6p0ICx07IMF6Wgx1W4shmGHk07VhDLfr3vgS062G8f
 T
X-Gm-Gg: ASbGnctudALWQ3tIoBj0cxUKQR1mSQ4aDpqzI6bRHOsN5QCJq448ed529WR7EKcfYTX
 luCDqylCAp2P256vYK3qoNHlu85KWw+7n1vYoj4fHZhziKRSXrQEJiJDvpGc5zw1JXIYkMJ+ugg
 sc+Qqe2E74G3UTfGfehfSbr1V5vVZJ3DNF8cTijsBZRuZb+cuFdi/Tqz6LbmiwLqDwFzuOeZkDr
 yex3nleLcdlKflInyNyH6g7VieC+uByCvJkynNsv3As9/FIwOolqmzXyZUDfoI7NPrE51kkiWT0
 lR0adDkHstHvsdrS7I8uIBTaIFL4QotepKJD
X-Google-Smtp-Source: AGHT+IE1/IpHNPfD896dj3snXot3YOs9+qYx4ULH0ObfHzrt5Zc02URsH3XAIWI8rjAB6RMSEUuMUw==
X-Received: by 2002:adf:fa08:0:b0:38d:df70:23e7 with SMTP id
 ffacd0b85a97d-38f33f34cecmr10462933f8f.31.1739882241592; 
 Tue, 18 Feb 2025 04:37:21 -0800 (PST)
Received: from localhost.localdomain ([147.148.179.43])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5c36sm15079213f8f.67.2025.02.18.04.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 04:37:21 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tim Gover <tim.gover@raspberrypi.com>
Date: Tue, 18 Feb 2025 12:36:47 +0000
Message-Id: <20250218123648.928906-1-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1739882242; x=1740487042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UuEGk7+G89HF8K+eYb+aP/11Rerb1K0LrBiW5Ert1go=;
 b=IKqgSYnEdn/IkRx/9BLY9nXekskyjfHcw3toiSUcn7IIGh2XO09+vl+/LZajow2PhV
 QdzxB2Xt2cpFDrRQj5E0yqDl6RALZc1Y9AP0V4MaIm4MsOyOQBOmTYrXk5GJ0p0+GNJg
 T0SRLTlfC+THsoUhJvtt/y+Hwp4sMP17zTfJc44ZwRqsBTSOmha/O/mh+txMg0acJJCO
 9LlfMZ0qCzSkVEJqwN6MmchB+V9Jj5WN5LbHDsiIx3k0obY+4/xixOgVlfRWXf8HoXRn
 ypM7cKD1rRCLHgNcHJErYHo6sAj41/1V/143sBHPuluQIvaedJCnQq28xTGz+Xdt/F7c
 jhDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=raspberrypi.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=IKqgSYnE
Subject: [Buildroot] [PATCH v2 0/1] package/rpi-eeprom new package
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
From: Tim Gover via buildroot <buildroot@buildroot.org>
Reply-To: Tim Gover <tim.gover@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new package to make it easier to include the Raspberry
Pi bootloader configuration and code signing tools.

Compute Module users often need to enable signed boot in order
to create products covered by the Cyber Resilience Act.
A first step in this direction is to make it easy to include
the Raspberry Pi bootloader via a buildroot package.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
---
V1->V2
Explicit runtime dependency on OpenSSL for rpi-eeprom-digest
Improve help text in Config.in files
Make host dependencies build-time and device side deps runtime.
Add hash of LICENSE file
Update to latest rpi-eeprom release
Update DEVELOPERS file for this new package
---

Tim Gover (1):
  package/rpi-eeprom: New package for RPi bootloader tools

 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/rpi-eeprom/Config.in       | 16 ++++++++++++++++
 package/rpi-eeprom/Config.in.host  | 11 +++++++++++
 package/rpi-eeprom/rpi-eeprom.hash |  3 +++
 package/rpi-eeprom/rpi-eeprom.mk   | 29 +++++++++++++++++++++++++++++
 7 files changed, 64 insertions(+)
 create mode 100644 package/rpi-eeprom/Config.in
 create mode 100644 package/rpi-eeprom/Config.in.host
 create mode 100644 package/rpi-eeprom/rpi-eeprom.hash
 create mode 100644 package/rpi-eeprom/rpi-eeprom.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
