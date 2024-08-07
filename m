Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92FBC52D73
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 17:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B60640679;
	Wed,  7 Aug 2024 17:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OH-E0HAQl6Y; Wed,  7 Aug 2024 17:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29E240670
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29E240670;
	Wed,  7 Aug 2024 17:48:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5F411BF30E
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D088B4013C
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9j6AjTzwEKUH for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4242740298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4242740298
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4242740298
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 17:48:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 477HmSk1009002;
 Wed, 7 Aug 2024 12:48:28 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 477HmR6I034686
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Aug 2024 12:48:28 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Aug 2024 12:48:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Aug 2024 12:48:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 477HmRbr055173;
 Wed, 7 Aug 2024 12:48:27 -0500
Date: Wed, 7 Aug 2024 12:48:19 -0500
MIME-Version: 1.0
Message-ID: <20240807-tfa-src-update-v2-1-f2cd6166db5f@ti.com>
References: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
In-Reply-To: <20240807-tfa-src-update-v2-0-f2cd6166db5f@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10424; i=bb@ti.com;
 h=from:subject:message-id; bh=EfyAKh/dQ+O/L55DSEfULLtO8QDHpyNeDFjVcYEEpuA=;
 b=owNCWmg5MUFZJlNZ6HAAPAAAaf/////56/Xu6+6N1X//P/b/2M0ue7/pjP79/Lpvj5/t/X+wA
 RmYHagGQ0AAAAADQANDQAaaGgNAGjQADQaNDQAAGmjQaaAeo9T0m0jT1PUzE1DiNGgDQ0aGho0a
 NBk0aAGmgaA0A0BhAMQGTQ0PU2oaaaaDTRoyDIAaAZAZGEyGSG0mj1GhkA0GjagNGgaGQ0AyA0N
 AaGQA9JkBkAAA0YmEaAA0NAMRphAAWLrQjgQxCrBe8loOISYYwQ56oKtCE891HAkANOyJdYpK9f
 fUUDhktTpd/gKLLT4hQidz6iCO0SNhNzRPV2kC8qo+N+D3s5IDhdroAV91fjjSg72UNywOaHF9B
 9pm7l4BrGKGDSGRIruAPus5T1q7Id70WryISBeGtAbNuz8gO82zDcaLdXJHaqAh8pKhoDNspYhG
 5HpaLVnLr4itivvvuatVyyc6kSW74uDa3gS+w7FLZ+NkSANSOOp/fxWwt5tud+Pw+Q6htOWfEJI
 uuszgmvTu8M40iBTsBUZlWYB9jIakubAWk0KAUg49nSwZb8L2FPNR2YIlHUIUqwoJZ8ZuuFpB/O
 Dywh5cfbuZmw+3+Glj0NaASq+YXAMUhterNCilLBlQASpM/qQhjDBEneSMZjA9/qQyP1yaXRpCQ
 ENjgIBCR2RQ/+LuSKcKEh0OAAeA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723052908;
 bh=dhAJ+cMacoUGa0XqMvNR3QUV13FcOeQnFn4YFDLnwlY=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=Ig4dQueb3ULa0l71r/LnvaY+o+XSISabPsvSYF5GfIUfrtux7qXxNBEB9Dj23tDje
 Do8LBTbPdtGJfhVcKkB4omMEv3V2xhaiXpLKFkz2Vl746382EWNrbMNx7eRm6ylO5t
 ROxYCCnhY05CM9WGJFRv06MQmq+YIc5kRjC5b4e4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Ig4dQueb
Subject: [Buildroot] [PATCH v2 1/4] boot/arm-trusted-firmware: move to
 official source for tf-a
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARM_TRUSTED_FIRMWARE_SITE is currently pointing to the deprecated
ARM-software github read-only mirror[0] which is no longer publishing
new tags. They do have a newer github mirror under the TrustedFirmware-A
organization[1] which continues to receive tag updates we could use
however because of the way github generates tarballs changing the SITE
to point to TrustedFormware-A changes the pre-calculated hash values
for every version for everyone.

Without much way around changing all hash values if we want these latest
tags, lets drop the github mirrors and move to the official git
source[2] so we can download real tarballs which shouldn't change even
if the ARM_TRUSTED_FIRMWARE_SITE moves again and hopefully preventing
this from ever happening again.

[2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/
[1] https://github.com/TrustedFirmware-A/trusted-firmware-a
[0] https://github.com/ARM-software/arm-trusted-firmware

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 .../beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 2 +-
 .../stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 3 ++-
 12 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a09c0..6f02bfbb22efc 100644
--- a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a09c0..6f02bfbb22efc 100644
--- a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a09c0..6f02bfbb22efc 100644
--- a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 80e592dab6065..90060567d6c93 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fc4cdac7c08fc398b6d4b705285dc13ac2d2b30a7449c6f07e9ccd81207241df  arm-trusted-firmware-v2.5.tar.gz
+sha256  df46a00a7f4d5c30ca1b9b6dc736de6b7bf13fef527d1640c49d18d74875a28e  arm-trusted-firmware-v2.5-git4.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c9d043c46f129..8b3df439a0539 100644
--- a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 74fe35c9bc733..0b99949745e7a 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
+sha256  c9f0d0bf967d690edbf34b621728a6271856f2e26ed46081a285b6d627a358c5  arm-trusted-firmware-v2.7-git4.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b69a5a96453b..2bc5030cf2ff0 100644
--- a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  06d32acf42808b682859008292f0591d2d872f19aa1a8021bfcd1c1c626285e6  arm-trusted-firmware-v2.9.tar.gz
+sha256  72df0928138de111bf5e75fae47f88a4d1b4930ad52b7902e2b53e117be650c8  arm-trusted-firmware-v2.9-git4.tar.gz
diff --git a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8f60864fbf67f..f0635a6652605 100644
--- a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7494e04ead5d0..d68ac4bd30db3 100644
--- a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7494e04ead5d0..d68ac4bd30db3 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 73ab431b9fc97..660edb121edcc 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
-sha256  e55ae7105c996b60f748b2eb6adeaf5ac8946425e1d4294ecc1c56aebf435274  arm-trusted-firmware-lts-v2.8.13.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+sha256  695ae232fef6da931157e032b520f145b2c4cbe675d92b6a12222a332e960e89  arm-trusted-firmware-lts-v2.8.13-git4.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index abf917948eeee..1b2cc3a236e0a 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -16,7 +16,8 @@ ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUST
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 else
 # Handle stable official ATF versions
-ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_SITE = https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
+ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
