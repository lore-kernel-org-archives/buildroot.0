Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD95C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCFC781F71;
	Tue, 21 Feb 2023 21:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFC781F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nU8vn-PCd--K; Tue, 21 Feb 2023 21:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA4B581F62;
	Tue, 21 Feb 2023 21:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA4B581F62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A816E1BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EB9860DA0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB9860DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3W89WI_HxKEi for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:49:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62E460B3C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E62E460B3C
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:49:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 3F0911BF207;
 Tue, 21 Feb 2023 21:49:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 22:49:03 +0100
Message-Id: <20230221214904.454053-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677016151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oG8QQPP7rjhZIXuMDy0+E58QfPuh+zt+OqAf1z6lXyU=;
 b=XgxzemElfjizMgyc22Y131DkcoRz9blTMFwX9HZeTyAOZy4PUdoYb7zRuyvQ9XGE4uGQUG
 6axIy2jOfQHrWmOsMWLZBHNHJTEj8OgX7Soed/k9CBcuGheJkF7blTap6iQIbmHX40cBjK
 2TWDmJ4fw1eORGgqXnI+NjpTnfC8Iz/De9Q5i0BHH9ANMbpZn6YcN0+sW7oNjCYPX65SGi
 m5ZU3C0xrpdpP8jgQPaQ/wuKhclI2k/rAwg6T8Yq0fS71+Ah3+l00SifdrfRcH/tibGyH6
 baNzEKpI6Jum3S2+vWKhi3LSWuIf8ovLqAA0eVfpu/WPk+AGpe7yZmIvybD8Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XgxzemEl
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: introduce a choice
 to select the BL33 image
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We now have 3 different options to select an image as the BL33 stage
of TF-A: Barebox, U-Boot or EDK2. Technically speaking, they are
mutually exclusive: they all specify a BL33= variable to the TF-A
build, and TF-A can only support a single BL33 stage.

However, as pointed out by Vincent Fazio in [0] there is nothing that
prevents selecting Barebox, U-Boot and EDK2 together, even though it
doesn't make sense.

To address this, this commit introduces a choice...endchoice block,
into which the Barebox, U-Boot and EDK2 options are moved. An
additional "none" option is added, which is the default, and
corresponds to not having any BL33 image.

Since we keep the same name for the options, no legacy handling is
necessary.

[0] https://lore.kernel.org/buildroot/PH1P110MB1603A4AA1638838DA56BAA069FDA9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM/

Reported-by: Vincent Fazio <vfazio@xes-inc.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Casey Reeves <casey@xogium.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in | 57 +++++++++++++++++------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index cb54c6c9d8..a5ac987172 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -129,8 +129,17 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
 endchoice
 
+choice
+	prompt "BL33"
+	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_NONE_AS_BL33
+	help
+	  Select the image to include as BL33.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NONE_AS_BL33
+	bool "None"
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
-	bool "Use Barebox as BL33"
+	bool "Barebox"
 	depends on BR2_TARGET_BAREBOX
 	help
 	  This option allows to embed the Barebox generic BL33 image in
@@ -139,6 +148,30 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
 	  variable pointing to the generic bl33 image is passed
 	  when building ATF.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
+	bool "U-Boot"
+	depends on BR2_TARGET_UBOOT
+	help
+	  This option allows to embed u-boot.bin as the BL33 part of
+	  the ARM Trusted Firmware. It ensures that the u-boot package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to u-boot.bin is passed when building ATF.
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
+	bool "EDK2"
+	depends on BR2_TARGET_EDK2
+	help
+	  This option allows to embed EDK2 as the BL33 part of
+	  the ARM Trusted Firmware. It ensures that the EDK2 package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to the EDK2 is passed when building ATF.
+
+	  Do not choose this option if you intend to build ATF and EDK2
+	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
+	  build system, the dependency between ATF and EDK is reversed.
+
+endchoice
+
 if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
@@ -150,15 +183,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
 
 endif
 
-config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
-	bool "Use U-Boot as BL33"
-	depends on BR2_TARGET_UBOOT
-	help
-	  This option allows to embed u-boot.bin as the BL33 part of
-	  the ARM Trusted Firmware. It ensures that the u-boot package
-	  gets built before ATF, and that the appropriate BL33
-	  variable pointing to u-boot.bin is passed when building ATF.
-
 if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
@@ -170,19 +194,6 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
 
 endif
 
-config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
-	bool "Use EDK2 as BL33"
-	depends on BR2_TARGET_EDK2
-	help
-	  This option allows to embed EDK2 as the BL33 part of
-	  the ARM Trusted Firmware. It ensures that the EDK2 package
-	  gets built before ATF, and that the appropriate BL33
-	  variable pointing to the EDK2 is passed when building ATF.
-
-	  Do not choose this option if you intend to build ATF and EDK2
-	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
-	  build system, the dependency between ATF and EDK is reversed.
-
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
 	bool "Include NXP RCW in BL2"
 	depends on BR2_PACKAGE_HOST_QORIQ_RCW
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
