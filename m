Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4A8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FE042427;
	Sat, 23 Jul 2022 15:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FE042427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id il8jVAOLuDpC; Sat, 23 Jul 2022 15:40:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36CE41687;
	Sat, 23 Jul 2022 15:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D36CE41687
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E34F1BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBBC284BD5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBC284BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6CoWhhvxnHG for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:40:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD54584BCD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD54584BCD
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BBDBF846A6; Sat, 23 Jul 2022 15:26:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:39:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d159163e40bd99b8f00944e34610eeea04c736da
X-Git-Newrev: 6103d9b5971c61c897ea43e11ee8559c0df04832
X-Patchwork-Hint: ignore
Message-Id: <20220723152633.BBDBF846A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add target
 board options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6103d9b5971c61c897ea43e11ee8559c0df04832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some platforms such as TI's k3 outputs a TARGET_BOARD directory
in their ATF build output paths after PLATFORM.
$(@D)/build/<PLATFORM>/ does not contain the debug or release
directories for these platforms.
They are under $(@D)/build/<PLATFORM>/<TARGET_BOARD>/

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/arm-trusted-firmware/Config.in               |  6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10b..c6c138420f 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -68,6 +68,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
 	help
 	  Target plaform to build for.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD
+	string "ATF target board"
+	help
+	  Target board to build for. In many cases, this can be left
+	  empty.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 998de4b814..30ecb187ae 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -41,18 +41,29 @@ endif
 
 ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
 
+ARM_TRUSTED_FIRMWARE_TARGET_BOARD = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD))
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += DEBUG=1
+ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
+ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/debug
+else
 ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/debug
+endif
+else
+ifneq ($(ARM_TRUSTED_FIRMWARE_TARGET_BOARD),)
+ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)/release
 else
 ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
 endif
+endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	$(if $(BR2_PIC_PIE),CFLAGS="-fno-PIE") \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
-	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
+	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
+	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
 
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
