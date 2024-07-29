Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55408C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 13:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016B460654;
	Mon, 29 Jul 2024 13:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkmlUGJ598Nf; Mon, 29 Jul 2024 13:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02BC86075A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02BC86075A;
	Mon, 29 Jul 2024 13:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1871BF47F
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 13:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D46B6075A
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 13:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDC9RH_cOy7N for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 13:18:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=boerge.struempfel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33E2160654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E2160654
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33E2160654
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 13:18:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so891251f8f.3
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 06:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722259123; x=1722863923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUwDv6xRORfuX+oilNEGWavWtx4vVn9jr0RsHSDyQzk=;
 b=HQvI2Mx8r9wZTjrKVjpYHxMN4ev/zANe8gFpW4yDiDcnGM/tXjAQBLo8EdROc+3CKW
 SGs14XigZfIEheW1zQTB8IiFZI0P/TzrkBtZs4fUe8Ny1MFvp4o4+1BCXxG7NneNHrex
 kxLe+pVwS1YODaMsIFcprssxwuf7CFSwQ+kSar2W6zjq0VuF/EOEQGt++vdAwLXpqpyF
 Lt2H5z0VRWtB9pP0BBhoSRbEL1yeFple2/3Y+9hbxtahhttqOz2OQfDmBvVxOqbJVepJ
 ZuW+kB5MVem/9pAdXbuo3LuAyDI6CK06oR6BvVzYjRVDp3GsndGm6o0ZNZd/Vh9j2pkF
 9G6g==
X-Gm-Message-State: AOJu0Yx2cPQKnhU3BprBTf2KQVt84bOou4fzWs05mnayOGUzx63oqRQU
 KAnR0L9B1iU+Xc8Ag5huur7MpUYT50XA9AkXYZNIBImDLhkp/axnyyWpBdQU
X-Google-Smtp-Source: AGHT+IEiJgRiVXWNwdFIzLOXJJda3o5jedNlwGx9/V442l6v3VRsHgNJPckannx+UTDOLhY80pY/rw==
X-Received: by 2002:adf:f945:0:b0:369:b849:61b0 with SMTP id
 ffacd0b85a97d-36b5d090a1bmr5202974f8f.43.1722259122703; 
 Mon, 29 Jul 2024 06:18:42 -0700 (PDT)
Received: from wslxew228..
 (p200300c787333700a23ff384f499fcc8.dip0.t-ipconnect.de.
 [2003:c7:8733:3700:a23f:f384:f499:fcc8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42805730d92sm179289065e9.3.2024.07.29.06.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 06:18:42 -0700 (PDT)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 15:14:01 +0200
Message-Id: <20240729131401.148536-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722259123; x=1722863923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UUwDv6xRORfuX+oilNEGWavWtx4vVn9jr0RsHSDyQzk=;
 b=l5JooaDRW7Vu0szSBJ5P0Q5G4688ef0a1VARN+IQ0aQV3Et/gRunmLJHZsJpWOp+gw
 4vNWpM2jIAQkR8Gf6/ZsyM7VpQfcs4Bff+3M9bjJkaqOTPbl8DIb1rKOXrIebemGuRl3
 hsRCwjManYnwNksIEDc0NjZgtgvGEX8DmWSMkYUMylnN73/W+qE/bUY1m6uOo7Im2NH5
 MjKQ6AeMvt3NafxHaJfFoLT0qk33KHdiIEYmAzFMrBHyvaBdC8PuvvV2M53uzPa0CGQF
 +necCGan+QkNQhoLkXFwF7vVwYAaM2SbCoHXR6son9nkc9zFeBl++W/U0CTsCZSOXTEb
 RB3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l5JooaDR
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: Add Redpine RS9116
 firmware
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
Cc: Boerge Struempfel <bstruempfel@ultratronik.de>,
 Bernd Kuhls <bernd@kuhls.net>, Boerge Struempfel <boerge.struempfel@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Redpine RS9116 firmware. This firmware is required for the
rsi9116 wifi and bluetooth module which is driven by the rsi_91x
kernel driver.

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 265b72e562..651ca45087 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -506,6 +506,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	help
 	  Firmware files for WLAN and Bluetooth modules rs9113
 
+config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9116
+	bool "Redpine rs9116"
+	help
+	  Firmware files for WLAN and Bluetooth modules rs9116
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 75f721d147..e40eab8dc8 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -854,6 +854,14 @@ LINUX_FIRMWARE_FILES += \
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9116),y)
+LINUX_FIRMWARE_FILES += \
+	rsi/rs9116_wlan.rps \
+	rsi/rs9116_wlan_bt_classic.rps
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
 LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
