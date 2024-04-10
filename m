Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F0ACD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBED560EC8;
	Wed, 10 Apr 2024 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgNjeKOoe2Zd; Wed, 10 Apr 2024 22:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4EAC60ECD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EAC60ECD;
	Wed, 10 Apr 2024 22:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B29CB1BF40A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC27D4021E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_YEIjXdr6tb for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 22:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 738214068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 738214068F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 738214068F
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 22:18:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-417d58cc845so623005e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 15:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712787489; x=1713392289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzKbmM9EYLR677wo46i9YsH2Ym/j6BYN/o5383vZCmA=;
 b=tev3vPeAiQrFNCHbbwtkbYBeWgeKitXVcvi+0HwBve1IvRJn97di5Ea3FKgJ6lRP2v
 ZbHq+xWwUPerHeUqHTxlivJNJSoC5sUj6RWzfxSnafGQzVMBOQbf7dLVGBevCIGtJUYl
 r//cSQegGTrIlUhTd45H9Agz+IVzinUjIGMw+VGDjZSt/S7YTf8HxUsdzVy+b1hrTQX9
 9CU4J7SmPblElLFMwBLwKeIXRw8+v9CdYec8acYEZT+/U1LhieZlLeHEDRh83Op/bnpe
 RmHCEIlSBND2/livwC9NbrgHK2TAnRtRFixOg3gFLu++zvCQQwQYeawXhfNmdU+mPWl+
 yXfg==
X-Gm-Message-State: AOJu0YztrjmyU2GRwfhqQ82vM31J5Us8xdZc2EXEQ7dbftvmxtwoEz9Q
 i62kuE+JLfhPxudV2YGIXu8Nwd8noyAusw19x1S7+dl8NPgKPd/IC0312n8hnBGgeomqvjVUsim
 A
X-Google-Smtp-Source: AGHT+IFZL2J8mL5if6zy79hc2DEX2w7xJ3F/tj6weg/Lq3besLfbDVZ38KklSz7ppON+75Tm7yWdPA==
X-Received: by 2002:a05:600c:3d9a:b0:417:d73d:f22a with SMTP id
 bi26-20020a05600c3d9a00b00417d73df22amr37727wmb.9.1712787489344; 
 Wed, 10 Apr 2024 15:18:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b00416928e239csm354025wms.35.2024.04.10.15.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 15:18:09 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 00:18:05 +0200
Message-ID: <20240410221806.89203-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410221806.89203-1-romain.naour@smile.fr>
References: <20240410221806.89203-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712787489; x=1713392289;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzKbmM9EYLR677wo46i9YsH2Ym/j6BYN/o5383vZCmA=;
 b=0L6kdEmqx82OAyUFB1rLRY0OHByQwdzMAE/yRL2hK+4d2hAYhqZYTR76m1L+s+khm3
 O2cQpwidZbD8aloSVCwyisMEFrOdGrxrPpX5UFPCcjiLcy+Do6+B9t8KRmoQYEjFabEf
 tAQe2d0ssKwju4BrS5mr81KbwjMrFBkkhoyioIH/tXzgNPSTNekVE3MDJE6twvGX6ifx
 tw5a5SJr4MwlcoPBVSjAwKxpLNhOh+XJbtWGhvp8MFptco92IoRH/VNJmTwzJYkw5+7g
 WDM7IXhkXjSqlh+40EM3xlCuUqvDRi3g8VLSWsHIOwEzqdK3mkTbRwgWw9Bl6yzN9pLB
 Uqcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0L6kdEmq
Subject: [Buildroot] [PATCH] support/testing: remove TestATFVexpress
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TestATFVexpress is using vexpress_aemv8a_juno as as u-boot defconfig
but the Buildroot defconfig of this board was removed in 2022.11 [1]

Since both TestATFVexpress and TestATFAllwinner are now using mainline
ATF, we don't really need several ATF test anymore. Initially [2],
several runtime test were added to test ATF/U-Boot combinations when
ATF was provided by a vendor: vexpress (mainline), Allwinner and
Marvell.

Keep TestATFAllwinner as ATF mainline test.

[1] 347c1087388d7782e6865f112f195e6780d473a7
[2] 8cf3ce04e9c4a4c4685b80edd9e8e873fe44d8e8

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_atf.py | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 1995f83a54..352725e721 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,31 +1,6 @@
 import infra.basetest
 
 
-class TestATFVexpress(infra.basetest.BRTest):
-    config = \
-        """
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.5"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
-        BR2_TARGET_UBOOT=y
-        BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
-        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
-        BR2_TARGET_VEXPRESS_FIRMWARE=y
-        """
-
-    def test_run(self):
-        pass
-
-
 class TestATFAllwinner(infra.basetest.BRTest):
     config = \
         """
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
