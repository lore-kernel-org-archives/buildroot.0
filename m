Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33499C46467
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 18:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7144141CD4;
	Thu, 19 Jan 2023 18:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7144141CD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rg43INr_uwyr; Thu, 19 Jan 2023 18:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B0541C96;
	Thu, 19 Jan 2023 18:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B0541C96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2DD51BF33E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAFF260F47
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAFF260F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlrbP4DBe5Fb for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 18:30:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E0860A70
Received: from mail.xogium.me (mail.xogium.me [IPv6:2604:6280:10e::3])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E0860A70
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:30:34 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id 51B96F40214;
 Thu, 19 Jan 2023 13:30:32 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 19:30:25 +0100
Message-Id: <20230119183026.3428277-1-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1674153033;
 bh=+HoVc24fDM9Ki42YWaxAiDQm453epCGSxprMI5LQ0tA=;
 h=From:To:Cc:Subject:Date;
 b=rO6cEFB40m2+HHOPvrEd1gwEQyMOQON8SSIY4oFZrIYZgt+l8pMSOhAS9FuxD/1U/
 iycChJAe+3KYhUPG3djB4u00pkiLrmUBWbEWADyOArkcAaI75Qz0lRc+RP0y0xrPIO
 W+YKxrWkqAhSluE8XkXUG1j7HF4B5SslLm7mTgkqo9c/fjbaiLO0JQnCRBhYdErEoU
 ETlF3iJbkQpdisaGf3lQ0EciZ85yKhEzmcfyM5ndRpyzdv4z894VOoyN1ka7Mr1L3N
 CSNqMjrkJURbRj3q7LpeVfkISTO9+ku2yJmRbf3AMjX+SaX1ZyQ+bnuRf/gs8b0/sI
 JrLgMw8v7okBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=rO6cEFB4
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: make Barebox
 available as BL33
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 2022.04.0, Barebox now support a generic image built for
platforms, to be used as BL33 to generate FIP images. This patch makes
it available as choice of BL33 to be used with ATF and is based on the
similar work put into U-Boot as BL33.

Signed-off-by: Casey Reeves <casey@xogium.me>
---
 boot/arm-trusted-firmware/Config.in           | 21 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   |  6 ++++++
 2 files changed, 27 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index a9b9bbcc5a..0ed0fd48ff 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -129,6 +129,27 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
 endchoice
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
+	bool "Use Barebox as BL33"
+	depends on BR2_TARGET_BAREBOX
+	help
+	  This option allows to embed the Barebox generic BL33 image in
+	  the ARM Trusted Firmware. It ensures that the Barebox package
+	  gets built before ATF, and that the appropriate BL33
+	  variable pointing to the generic bl33 image is passed
+	  when building ATF.
+
+if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE
+	string "Barebox BL33 image name"
+	default *-generic-bl33.img""
+	help
+	  Name of the Barebox BL33 image to include in ATF, it must
+	  have been installed to BINARIES_DIR by the Barebox package.
+
+endif
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
 	bool "Use U-Boot as BL33"
 	depends on BR2_TARGET_UBOOT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1164c81410..648f62ed85 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -105,6 +105,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
 endif
 endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_BAREBOX_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_BL33_IMAGE))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_BAREBOX_BIN)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += barebox
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
 # Since the flash device name vary between platforms, we use the variable
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
