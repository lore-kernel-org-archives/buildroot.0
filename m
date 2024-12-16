Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27480E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 12:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE36404C0;
	Mon, 16 Dec 2024 12:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faUU1ONT48ad; Mon, 16 Dec 2024 12:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 834484059B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 834484059B;
	Mon, 16 Dec 2024 12:58:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6172ECE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44F3F402A7
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErSwtaRMLOiu for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 12:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=tim.gover@raspberrypi.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3A534000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A534000B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3A534000B
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:58:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso3266016f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 04:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734353884; x=1734958684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=63IX9C6Fxv20CNbH91gahnCeb6qr8Af2gw64iZlOk3Y=;
 b=KLx0UooJU9pgY1Y3YQbb02b6SlLPxwr80iiPuABEY7VfuVzKD+wJg4SzfWIqOaEOzp
 d9fiU3LkwSZvjhuvyThLk0nZxnUqM4X6MpP1i8agJsMR4fUQLP0eirJVvUjEU1npHu+G
 2PDTmGPnCcMTihsCA3ok4nipUzG6wEMpwpKqntyI22WiPd7r/8ByteGESxVtK6ZYnh8k
 qO7kOgK95gRiC57TAXeoJZRvSPJPHmZQmwLWnUJhMjqw4vnywSAy3cwlPwcZAqDXDyp3
 G5z2NjdbLo78jNq7ADsbxd1Fg5QfREYT1rrd+7kAk/SXLOwcx+kuuBA2HOaCEtdmVRda
 fI2g==
X-Gm-Message-State: AOJu0Yyim0SyX0reB6Kwc5z3muAy73kaqoll9k1cmdVI1IVJOy7xQArC
 Re2AWijjJexwdzSTqmovrHQdDTcr8SYjfpAqjJO2RdzbZPkKTf9xgE0fGuJ1UBdBTTDFszERuca
 rEoY=
X-Gm-Gg: ASbGncufNuAbpcTk9r8Mdm7d1PGrJjNZTcuI7m/hPzJbid+w6Lln6s4Ugu9QLI529nQ
 5PU3O3RjwRiBFWgdb+WQH8rncsyxztplO1wl8sXbeen8fugnEN/sJfEwUztRb/TQKBd9eUa9bwF
 0olFt1BSyRx2om2DZHXR058xhVmITGL7qdqvTofQsBL5UFv5Z4T3PtII3aviGAoWIBvY95E9aSY
 hSO2usoLe7Q1pglMjFxzBuUxlpGjOtQvtFZHijt9VYHrvyUBOZoCHHsI7CR3Ay/nWP+1O0RtHcA
 3yLL6PjwAdImxOFsLc321T4FvHvd+P5wKave3MVHknECDaMumMz+4JQCUYk=
X-Google-Smtp-Source: AGHT+IGTnl0JrB6Y0ph20RW5vdHomQVRwz0IbjByUkF8RxRBXwE3BJtvggOF9sNEK0aB3JIL93V/Pg==
X-Received: by 2002:a5d:6da4:0:b0:385:fa33:29ed with SMTP id
 ffacd0b85a97d-3888e0f4553mr9828065f8f.47.1734353884087; 
 Mon, 16 Dec 2024 04:58:04 -0800 (PST)
Received: from TIM-G-DELL.pitowers.org
 (host109-145-9-171.range109-145.btcentralplus.com. [109.145.9.171])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c05sm8228584f8f.73.2024.12.16.04.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:58:03 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tim Gover <tim.gover@raspberrypi.com>
Date: Mon, 16 Dec 2024 12:57:59 +0000
Message-Id: <20241216125800.219227-1-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734353884; x=1734958684; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=63IX9C6Fxv20CNbH91gahnCeb6qr8Af2gw64iZlOk3Y=;
 b=s2seN0y+S88nHZjY+bOtkCuiKhKoCJksItX87yZWHYrQO3l8JM8XpzQE7bMBqZuJF+
 9k9mHrFJ4iDjDYEoigpXY+QGtj5XIcxHEUy5kdxU3AnYtulYhz4tQieUEZi7NOf2kUaa
 P7os8gXOxCkVbNfxOsUOf3zJ35IRltqju1zzxIlVd5d/KkABLK09LbSYdw9E2J/AQFDF
 OwgdNRkJCUod6qam/XpuAQv/WCkyE+aIkKQvFpi5WOgfMN6kpkENAkftxI+7wn3e4wSc
 yK6QsVx+VZfezUsdWPpjZpgsYfVvnOY0AFn3luHl42hoQwIDidbtrtJ5hJaidyGB5WBY
 9B1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=raspberrypi.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=s2seN0y+
Subject: [Buildroot] [PATCH 0/1] package/rpi-eeprom new package
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


Tim Gover (1):
  package/rpi-eeprom: New package for RPi bootloader tools

 configs/raspberrypi5_defconfig     |  1 +
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/rpi-eeprom/Config.in       |  9 +++++++++
 package/rpi-eeprom/Config.in.host  |  9 +++++++++
 package/rpi-eeprom/rpi-eeprom.hash |  1 +
 package/rpi-eeprom/rpi-eeprom.mk   | 27 +++++++++++++++++++++++++++
 7 files changed, 49 insertions(+)
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
