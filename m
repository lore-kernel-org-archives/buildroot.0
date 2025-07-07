Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F33C83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 22:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D051680CD9;
	Mon,  7 Jul 2025 22:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wV3yFzqtNpR7; Mon,  7 Jul 2025 22:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F29A780C59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F29A780C59;
	Mon,  7 Jul 2025 22:22:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3BD112E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 22:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A52DB60A56
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 22:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZpLG6uQdAsx for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 22:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F7C660703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F7C660703
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F7C660703
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 22:22:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so3596887f8f.3
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 15:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751926955; x=1752531755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qf788C5kqMsMeSd0oDHFNjEPfH6aq5e+6wlIDYMENos=;
 b=ikUy/XmHfZe1RhN7ljoDp35GiandYGicTRQu1JuaHnBOVPWpu+tYA63TJhr4l1wzJS
 BOCfq/SW4IX95O4psX164VVgS+o1WGUDrgN70XHUlfZCMk3oDkuSLaJitQzsbo8eBFBQ
 CzDKWP/4b6zpK+yxFgzaGAZmKti6zmFaWw4A0CbgySEhaLPoUkqNnNiSACZFk5HRyWak
 8wxQlRvSZueZD8J3s8G4bGxrgkNyc9hOD2LrujtKGkAr21AQM9A7qfTSCm0OvJA0Z+qN
 k49MqA/AML9OlVrSQHAUkxGGy45sBjsz+d2nCqhOF4t9fQvMfXSfBqVKH/q0Uo8bm4kr
 NmcQ==
X-Gm-Message-State: AOJu0YzYoKteEhffIN7OlCLf+ONhjD4TFH4kIfs2V7+D4pjFwG7r3G8a
 JGLycWHY4cW7sgFSiNkdNgDy4+ThO/HHde8RI+/3Qx+S5dtWOdRxKcIR0iZTbqQ7rB3esbwoEYm
 DFPAi
X-Gm-Gg: ASbGncsepnIHUNvHh38s1DR2HIrlHQcqBhWQ1/PKs2BSqD2hZL+33/DMy+ZTkIugoPQ
 d2huD/BQ4Y8ygYUn0LG/v03spZej76NbQV9ESGl343AASpqVjd9AZGP4iq/LCX8fTbZOou1PRZW
 tNF965iOBLjiwzublWi0vpwqh24vIUgIDIED+O3IfFlvJlfsF1m/V0xDDIHFVpsif+3S3NhaFTG
 synX/iYbBTqEaaNBmveXjUS3ngPO35+tqexRzP4qPQxmuBi78FHecgOGCrerm59muw4cfUAYo3J
 yDzcDInvyAShLj1jUzURCEjLMpmD0sYm1e00hCyxE7W5Ffod40dNEjk55KoOTxztam6eckOODjp
 pKG62XiuEkyzkWXokx0uhA7Ccdqk=
X-Google-Smtp-Source: AGHT+IFFsoTCsi1QOmQ0VVyryEtyHWe+YOKrynzoqVE3Z6eHYmaKcK+sQArU3AbjPZq1dybnv6VgkA==
X-Received: by 2002:a05:6000:4311:b0:3a5:24a9:a5d3 with SMTP id
 ffacd0b85a97d-3b49700e07fmr10668401f8f.17.1751926955024; 
 Mon, 07 Jul 2025 15:22:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb31d21sm1240095e9.1.2025.07.07.15.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 15:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  8 Jul 2025 00:22:14 +0200
Message-ID: <20250707222215.554181-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1751926955; x=1752531755;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qf788C5kqMsMeSd0oDHFNjEPfH6aq5e+6wlIDYMENos=;
 b=pgg1ARWkoM5yhtFhYxL5TZyR6tr22f3R6jdOYEimGvI7543CWjstlRyDpQw310/O6w
 ThLyTDZ9BqHx0Oy64USu0ri3n5t/Ac1wNRD3ZicNdbAmJf9G11cBCBagRfQEHSoC2sHh
 ZkJJZFcaa0iNWvBsgCZO/xZRlyBFe+kTbwJqQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pgg1ARWk
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.07
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

Release announcement:
https://lists.denx.de/pipermail/u-boot/2025-July/593789.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2025.04...v2025.07

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b774742..52e6050c81f2 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2025.04"
+	bool "2025.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2025.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2025.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -340,7 +340,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2025.04/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2025.07/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 8954e2cf34b0..40c60d60838f 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
