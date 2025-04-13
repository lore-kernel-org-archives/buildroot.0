Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA6DC369AE
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C186059C;
	Sun, 13 Apr 2025 21:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSLzeOfQeK21; Sun, 13 Apr 2025 21:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1E656065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E656065C;
	Sun, 13 Apr 2025 21:46:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C111CD4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 21:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB3060693
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 21:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOfw_9gl2rrI for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 21:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AF6E6059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF6E6059C
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AF6E6059C
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 21:46:30 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-73bb647eb23so3187876b3a.0
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 14:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744580790; x=1745185590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9P+6+CE3xLGl4aOS+/gjtYf+MdoMNQr8E+AR8vbfGJM=;
 b=b94oU0Ry0lyFtx177AO9tWQAoxqSEyQdVhh/ZsjGQR25cgpG9AnYIH+wdFHUzoVk/4
 d2na+z6z09QFPCK9aP0W4VfgO0EpWXVazIL8y867WONZIrXbBPGHlVdijk8eOX9p9wwP
 YpXhrzNtfjr5da08G7JA3HnNt2dhBUMXt+9kdm387Kigs2/M+gnpYswRw2/Jivawoird
 q5SlYgXESjdk/8c8fBWMXEpGIbVn0IuUl2mQV30nHWFP7HBshN/esVCk275P2qJoq49q
 FcWz7Nv3Oq8F6sGc0VDgVxCmnZmO8pPBq/o9kkJ2C2vgqE6n+qPxsfxSkWCrTCv3vBkZ
 sXAw==
X-Gm-Message-State: AOJu0YwbnOv3O9t5F32QOtfp1jA8SP1zhseHn9Q2ZrIicW3gy3iW4loa
 ZIeXupEbqPkw5Tm3FsxiNnoxH+HwyqzTey2uMg8egOy7XWcX0w26y2v5cRqAgnGZHEgackGcN68
 Z
X-Gm-Gg: ASbGncsiWvcTW5YPLy99wLM0k4opr8ALrB06luKep3p7+7yotQEz/uW5ofM1/ONbd6F
 W9njZYU6jSZx9xO4ChHxOjsYtkhh695w7PNHsLoaL3qBMXedb/otbWK8FbPQ5tTi5HyPzJOLXnN
 lh2kdoeZBfqCYDW+oDYl5YrZgFJXwFgWx0rm6nw0suFVvUCqht5OEhP3F/Urp1clImgPc9nsbTv
 /N4wzKAp3HMR4L0tQuOf2dPg/EB3yDCoCUx8ZLUnvgqmMfMmxSRQ/gjmMZjQc9OS5HAsLCj/njz
 UU7Sm9oNo6HUh6Fm/YgUqqY54LylqR6Ne62/yyUgq7l4S2bn9Nnxqt4tXH+DkVGUQw==
X-Google-Smtp-Source: AGHT+IFbHKeCEIshPdMj5BdSN6sxrO4Wm2LYXIhqtfDpGO88BoexX3imknaAVtjZiKIuEphdsE93uA==
X-Received: by 2002:a05:6a00:3a0e:b0:737:5edd:9805 with SMTP id
 d2e1a72fcca58-73bd129b3a6mr12989110b3a.19.1744580790288; 
 Sun, 13 Apr 2025 14:46:30 -0700 (PDT)
Received: from localhost.localdomain ([185.228.19.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd21c63f8sm5559106b3a.68.2025.04.13.14.46.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 13 Apr 2025 14:46:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Sun, 13 Apr 2025 14:46:27 -0700
Message-ID: <20250413214627.1942-1-christian@aperture.us>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1744580790; x=1745185590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9P+6+CE3xLGl4aOS+/gjtYf+MdoMNQr8E+AR8vbfGJM=;
 b=lkziPlZBmEcHSbshTh6sOvrzegqGnGdbBAKTZQLqEO1T9spq4FqcMEQe9Al3o7cmzK
 KTM2ZBp9J+JlN9niCT4bJ2jLrCYns8uPNqdFPZDzbRnpkyC3VUxi/1vEPlTgS8UnWqZY
 j4S2qR9RSEG0YrxBaExIWn2470uEUYpAlWd8b3UwDk5Qun0dKORl9TGJZi9OVlZBn6rF
 4MDt6Omo+KWv+dOanIwvF+ddQJCnI2MBTmma5teTKEpMLNTnOtHJJThFRgdWaMTPlgvQ
 u99jGEqYkUj8+o/7wO327XvhQyHGLknMaeoKhcY0FlXkob2fdldOoKeHOz0q/rrAgKR0
 3Isw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=lkziPlZB
Subject: [Buildroot] [PATCH v1 1/1] package/linux-firmware: add support for
 amd-ucode
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/linux-firmware/Config.in           | 9 +++++++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 83da3676db..34f3fb7691 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -17,6 +17,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
 
 endmenu # Audio
 
+menu "CPU Microcode"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_AMD_UCODE
+	bool "amd-ucode"
+	help
+	  Firmware blobs for AMD CPUs (amd-ucode).
+
+endmenu # CPU Microcode
+
 menu "Video firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index df0888618c..eb86aec00b 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -3,6 +3,7 @@ sha256  b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d  linux-
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
+sha256  27907ae1d74b94fd6f1159971158ed3199e472f129ea1ff748ea13aded2a59d5  LICENSE.amd-ucode
 sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3d6c2b624c..cfce1707d7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -15,6 +15,11 @@ LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMD_UCODE),y)
+LINUX_FIRMWARE_DIRS += amd-ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amd-ucode
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU),y)
 LINUX_FIRMWARE_DIRS += amdgpu
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
