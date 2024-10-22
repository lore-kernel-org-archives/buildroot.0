Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2ADCDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F8B60671;
	Tue, 22 Oct 2024 21:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bbafy8ENE57r; Tue, 22 Oct 2024 21:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B7C606F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B7C606F5;
	Tue, 22 Oct 2024 21:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB602072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87749405BE
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UL7bVdLopzXp for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.44;
 helo=mail-io1-f44.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CDBE405B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CDBE405B4
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CDBE405B4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:06:11 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-83aad4a05eeso244489139f.1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 14:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729631170; x=1730235970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nOcnSWkJabHP32typKJ9/ZXZWdkoEDI/I+Zhaa6sPZI=;
 b=UL0rU2ELRLnl7gyqQcxp3EE7OLPE/E5MCn9LApUOcbHEZwbYI4Jm03yTLKFMV3Oqku
 nh3NAtgmApIOnJJ3eKG97Cy5SZMIqRLgXI+jfExOp5kaIo+8ee/hiqq7ZDejk1Fe6n9+
 vmP60DxGBtlUgx2b0xY7+KbTf43BLBqQCm05ZyizgLlTFkHxBEfzbUq7ztZaI7q5mVz1
 XgDW25ypXAsm80NmQYgERPfDvf3Q4KwuMC0D6jQfcIINn15U4r4dX9ziSzGbYoOUMod4
 q7MTYjiA68GtfJFrvY+1C1O154yBFlFh1vw1ffslszENKxj35FOo5iccgmraqblF/iK0
 00mQ==
X-Gm-Message-State: AOJu0YxW3uzhIXI3C3vtjwy1+M0N+UNtZ4xV74eeVEVIzy8H7Q02qUJv
 m/djBmjlm3Oycb2XjJ/1aiVZSIYz/mdUC8g/TV+imTlKrk/PuOU0YtoiuA==
X-Google-Smtp-Source: AGHT+IEMiGYQUbK0pBMHL28o2cMZ3KwzV/tnXBd6RXU+s6WSm3v3ATC/u3eu4eVGMP2b0AQhIsTbBA==
X-Received: by 2002:a05:6602:29ce:b0:83a:f447:f0b9 with SMTP id
 ca18e2360f4ac-83af619d094mr56017539f.9.1729631170044; 
 Tue, 22 Oct 2024 14:06:10 -0700 (PDT)
Received: from USATL1PC00222.am.bm.net ([149.106.100.80])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a631f1fsm1741904173.144.2024.10.22.14.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 14:06:08 -0700 (PDT)
From: Bryce Johnson <bryce@redpinelabs.com>
To: buildroot@buildroot.org
Cc: Bryce Johnson <bryce@redpinelabs.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Date: Tue, 22 Oct 2024 15:03:34 -0600
Message-Id: <20241022210334.261117-1-bryce@redpinelabs.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH) so
 can be built with aarch64
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

Was testing building with arm64 build server and failed because it
was downloading the x86_64 version.

Use $(HOSTARCH) instead so it can also downloaded

Tested with building configs/ti_am62x_sk_defconfig on arm64 that it
uses to build the 32bit R5 MCU.

Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
---
 package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 2 ++
 package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
index 0800fa2168..110ec40c09 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -1,2 +1,4 @@
 # taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz.sha256asc
 sha256  6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz
+# taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz.sha256asc
+sha256  8fd8b4a0a8d44ab2e195ccfbeef42223dfb3ede29d80f14dcf2183c34b8d199a  arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
index 03bb4dc5da..fce80f2f3a 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -6,7 +6,7 @@
 
 ARM_GNU_TOOLCHAIN_VERSION = 13.2.rel1
 ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel
-ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-$(HOSTARCH)-arm-none-eabi.tar.xz
 ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
 
 HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
