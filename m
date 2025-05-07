Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08175C3ABC5
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A8D6110C;
	Wed,  7 May 2025 16:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKxZ7JgH-UTV; Wed,  7 May 2025 16:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B797961004
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B797961004;
	Wed,  7 May 2025 16:41:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38CC9EDF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EE0C60B64
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AM6wmbdJaWPJ for <buildroot@buildroot.org>;
 Wed,  7 May 2025 16:41:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2DA860B06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DA860B06
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2DA860B06
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:41:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id F35F2580B7A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:09:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A59843A3B;
 Wed,  7 May 2025 16:09:12 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed,  7 May 2025 18:09:10 +0200
Message-ID: <20250507160910.121249-1-olivier.benjamin@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfekledugfehveekveeiledvgeetjefgledtgeegueeuhedvhfeukeduhfeludehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghlohepfhgvughorhgrrddrpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrghhhigrrhdrkhhoshhhkhhouhgvihesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrt
 hhinhessggrrhhkhihnvghtrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746634153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qIbQQERFhmkOkCnC6gFU13AO4feul2d1uAJLl+z/b0c=;
 b=XFZnsTCxRZI38KB/GzYmL8HRdUOTdRMMnjSoyWVLLXWp2bybd4jH3LqZ9S8tfvbhwiyS/9
 BSPMuAAqrETw74ewct9FinHP/nbuoxVyNh8ScZY7ZeNUUXy+BKh+PTjoR1/nmwjqw9KTzl
 vSU75usJ/srEQgzgZMMnWMGMSRLZ7qGOKGWIhaO1wno9rAlh2P8hDVQDDmQu3+MntpP/wd
 LfDgbgJC/tmSfriswqmpvsau6Gwp8FrUXE/6jT8DjaTJuTl5yIA+49xPr+UApbUasGBMQZ
 7mbdUGMgqQE70wNTzUhjJ3eSuopld05czY2wrJUVOUOjaXpCevVGYSh5GQNPKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XFZnsTCx
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: support multiple cmdline.txt
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
From: Olivier Benjamin via buildroot <buildroot@buildroot.org>
Reply-To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option in rpi-firmware to support deploying multiple
cmdline files.
This is usefule in the context of a new [boot_partition]
conditional filter introduced in config.txt in this commit:
https://github.com/raspberrypi/rpi-eeprom/commit/d50b2b32f162292ab6e235932075ce00bddda4ae

This is useful for A/B systems to have identical BootFS partitions
on both slots, and not have to edit the kernel command line to
ensure the kernel will load the right rootFS after update of the
BootFS.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 package/rpi-firmware/Config.in       |  9 +++++++++
 package/rpi-firmware/rpi-firmware.mk | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 42982514f8..e21af594ed 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -76,6 +76,15 @@ config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
 	  Path to a file stored as cmdline.txt in the boot partition
 	  of the generated SD card image.
 
+config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILES
+	string "List of path(s) to file(s) containing cmdline configuration."
+	help
+	  Space-separated path(s) to file(s) that should be stored
+	  in the boot partition. They will be stored under their own
+	  name in rpi-firmware. Useful for A/B setups.
+	  If a path has the same filename as the one in
+	  BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE, this will override.
+
 config BR2_PACKAGE_RPI_FIRMWARE_AUTOBOOT_FILES
 	string "List of path(s) to file(s) containing autoboot configuration."
 	help
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 17b7c0cbca..84aa69540f 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -44,6 +44,15 @@ define RPI_FIRMWARE_INSTALL_CMDLINE
 endef
 endif
 
+RPI_FIRMWARE_CMDLINE_FILES = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILES))
+ifneq ($(RPI_FIRMWARE_CMDLINE_FILES),)
+define RPI_FIRMWARE_INSTALL_CMDLINES
+	$(foreach f,$(RPI_FIRMWARE_CMDLINE_FILES), \
+		$(INSTALL) -D -m 0644 $(f) $(BINARIES_DIR)/rpi-firmware/$(notdir $(f))
+	)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
@@ -95,6 +104,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)
 	$(RPI_FIRMWARE_INSTALL_CMDLINE)
+	$(RPI_FIRMWARE_INSTALL_CMDLINES)
 	$(RPI_FIRMWARE_INSTALL_AUTOBOOTS)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
