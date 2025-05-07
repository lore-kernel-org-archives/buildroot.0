Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6DDC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 16:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DB9B40D89;
	Wed,  7 May 2025 16:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kasBYfxI9Cqy; Wed,  7 May 2025 16:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8924098B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C8924098B;
	Wed,  7 May 2025 16:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED5D9950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA59404A2
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2A_Z6-UsCzT for <buildroot@buildroot.org>;
 Wed,  7 May 2025 16:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=olivier.benjamin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA940402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA940402EF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA940402EF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:08:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35F044397D;
 Wed,  7 May 2025 16:08:45 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Wed,  7 May 2025 18:08:32 +0200
Message-ID: <20250507160832.121159-1-olivier.benjamin@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeefueekteejteeifeeigfeukeffhfehgfeuhedvuefhhefhgfduleevfeeileeunecuffhomhgrihhnpehrrghsphgsvghrrhihphhirdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopehfvgguohhrrgdrrddpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhgrhhihrghrrdhkohhshhhkohhuvghisehgmhgrihhlrdgtohhmpdhrtghpthhto
 hepmhgrrhhtihhnsegsrghrkhihnhgvthdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746634125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pQ1rcYd3Ic0HfZnz7ncyL3v8Ru8x+LZEDER0eRqQgDU=;
 b=M7DUzLDqAsoFbJA09uZ3B70zjlyTft+D3hjM5gjafbILqHaFOhNTg5pzUkeEnp/vGczRLx
 kMl8aiZmT1EYlfPr97RGx7l6FOL0coO+Jtwr1KMk647rHT+2S3nDKEcAd17tZGkMfdKBub
 0S2IZ966z9BIo1icpGVH3xm/YKeKjFNy6d80XAEgi2eyA0nyQFq1jBmPLpACYCpgI96jyf
 r4b9/4kn2+fGGfBDPKaaoInm6xkbTwH9J51P/aSaX3oKEGllYWBkKUgi5xlIndBg2ZCKUP
 XlGzIcxrZHs6F7jx9YxRAq+0l8zkA5eQXFbT9vSfZ5mYVeCFF8S5LERNbrWStQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M7DUzLDq
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: support installing autoobot
 configurations
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

autoboot.txt is an optional configuration file for the RPi firmware:
https://www.raspberrypi.com/documentation/computers/config_txt.html#autoboot-txt

Supporting several autoboot files will enable A/B setups, as using
the renameat2() system call with the RENAME_EXCHANGE flag will let users
atomically replace one autoboot configuratin file with the other.
This improves reliability in the case of an update which could
potentially be interrupted.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 package/rpi-firmware/Config.in       |  7 +++++++
 package/rpi-firmware/rpi-firmware.mk | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f99c116ca2..42982514f8 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -76,6 +76,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
 	  Path to a file stored as cmdline.txt in the boot partition
 	  of the generated SD card image.
 
+config BR2_PACKAGE_RPI_FIRMWARE_AUTOBOOT_FILES
+	string "List of path(s) to file(s) containing autoboot configuration."
+	help
+	  Space-separated path(s) to file(s) that should be stored
+	  in the boot partition. They will be stored under their own
+	  name in rpi-firmware.
+
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
 	default y
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2577d16a01..17b7c0cbca 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -62,6 +62,15 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
+RPI_FIRMWARE_AUTOBOOT_FILES = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_AUTOBOOT_FILES))
+ifneq ($(RPI_FIRMWARE_AUTOBOOT_FILES),)
+define RPI_FIRMWARE_INSTALL_AUTOBOOTS
+	$(foreach f,$(RPI_FIRMWARE_AUTOBOOT_FILES), \
+		$(INSTALL) -D -m 0644 $(f) $(BINARIES_DIR)/rpi-firmware/$(notdir $(f))
+	)
+endef
+endif
+
 # Install prebuilt libraries if RPI_USERLAND not enabled
 ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
 define RPI_FIRMWARE_INSTALL_TARGET_LIB
@@ -86,6 +95,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)
 	$(RPI_FIRMWARE_INSTALL_CMDLINE)
+	$(RPI_FIRMWARE_INSTALL_AUTOBOOTS)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
