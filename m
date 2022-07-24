Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4571CC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0AF684C60;
	Sun, 24 Jul 2022 13:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0AF684C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRpGgUU44wic; Sun, 24 Jul 2022 13:12:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B60AD84C41;
	Sun, 24 Jul 2022 13:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B60AD84C41
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1041BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21BB084C41
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21BB084C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fzGzupykifJ for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:12:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEBAB84BCD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEBAB84BCD
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:12:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l15so8360728wro.11
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1cFSbDy5Zz4LWm1zWx+fAg7KSowS7P5jb++/UumZsFw=;
 b=x0buqXTgEEN/4TVSaPjM2HcMpCHsAfLMmg9OXf0JwE/Up3bGfaiX+92SaNdd5uHq1E
 XFJnLS3qYSRVQZfaTUJOZWk5T8s8qx+PRXJDCob087V/QnX+A/yWsA7YBKotWkKSYJIS
 JcoTQazOqf63P8wphzPoiU34mD1pc+EGYx5gNTvq674bGsa/h0OKjiEgpCLIKImv3d5Z
 VW4Iw21ino5aaWsUcuAVNQSyai7F4YCTP5Hd02ru9S+EaDw5NeAxWLgBVGODyyNR+/z6
 rbdPw9ECZHmCDMvEZsy1ySxCWBOck8npEtJ9WbOfeNSy4uboQluZPf4+WWXPWL96+bhU
 4lUA==
X-Gm-Message-State: AJIora/3OJCp4LNEWmKN7R8CPOeGhjsGdFlo/8RXhfNr2Fom09i2y2wm
 6NauyxDHU0fWtYYyDXQe6LTILFX/T/w=
X-Google-Smtp-Source: AGRyM1vL6BHVnEk2qejTzGyc68AKQ7bM8arwekThS5o1BIFHLNLc6Xc3KzShattrqTf+sm5WaCg5LQ==
X-Received: by 2002:adf:e193:0:b0:21e:626c:d082 with SMTP id
 az19-20020adfe193000000b0021e626cd082mr5067983wrb.159.1658668323788; 
 Sun, 24 Jul 2022 06:12:03 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600011cd00b0021d6924b777sm9245868wrx.115.2022.07.24.06.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 06:12:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 15:12:02 +0200
Message-Id: <20220724131202.1364133-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1cFSbDy5Zz4LWm1zWx+fAg7KSowS7P5jb++/UumZsFw=;
 b=gCdB+1W0MM1o5CSZeVUIH0Zyiky/zeQuphiA51utJHnq/1Xx0eDDqLFrgjEkl7X8MK
 zuaN53lDIcwEje/JTFlJ3lTy8YFV5XpVKV8gm2vxeDwXvUlWzaPeJgb727s9LZ8P+dpq
 qZb77k/DF5+M2egSVjGHE6zow1CVPlVbqwULAsifJUxqIV6BEe87l3MINMnHXx1STy61
 RKQhnijgrtmckSB8qqanTL3ZpplvW2IFJjFhk/sgPSIkULZiSz5nu5/c6TyYMRFzcTj5
 9q0dEB5lTjuvX528Yye1fhj0CrbMiWd9M3GaGPWUtoPQTZUQqdbkddWbZoZoSj/gP0df
 AKjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gCdB+1W0
Subject: [Buildroot] [PATCH] package/rpi-firmware: add option to use custom
 cmdline.txt
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the cmdline.txt file is installed in $(BINARIES_DIR) by the
rpi-firmware package. Overriding files in there can not be done with an
overlay (which only applies to $(TARGET_DIR)), and thus requires using
either a post-build or post-image script, which is not always very
practical when a custom file must be used.

Like was done in 689b9ac439ab (package/rpi-firmware: rework boot/config
file handling) for config.txt, add an option to allow users to specify
the path to a custom cmdline.txt.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 .../rpi-firmware => board/raspberrypi}/cmdline.txt     |  0
 package/rpi-firmware/Config.in                         |  7 +++++++
 package/rpi-firmware/rpi-firmware.mk                   | 10 +++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)
 rename {package/rpi-firmware => board/raspberrypi}/cmdline.txt (100%)

diff --git a/package/rpi-firmware/cmdline.txt b/board/raspberrypi/cmdline.txt
similarity index 100%
rename from package/rpi-firmware/cmdline.txt
rename to board/raspberrypi/cmdline.txt
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 8070dc3019..a9aeaed745 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -69,6 +69,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	  Path to a file stored as config.txt in the boot partiton
 	  of the generated SD card image.
 
+config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
+	string "Path to a file stored as boot/cmdline.txt"
+	default "board/raspberrypi/cmdline.txt"  # legacy
+	help
+	  Path to a file stored as cmdline.txt in the boot partiton
+	  of the generated SD card image.
+
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
 	default y
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d4d1d07b3f..6f5902fd52 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -35,6 +35,14 @@ define RPI_FIRMWARE_INSTALL_CONFIG
 endef
 endif
 
+RPI_FIRMWARE_CMDLINE_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE))
+ifneq ($(RPI_FIRMWARE_CMDLINE_FILE),)
+define RPI_FIRMWARE_INSTALL_CMDLINE
+	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CMDLINE_FILE) \
+		$(BINARIES_DIR)/rpi-firmware/cmdline.txt
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
@@ -79,9 +87,9 @@ endef
 endif # INSTALL_VCDBG
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)
+	$(RPI_FIRMWARE_INSTALL_CMDLINE)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
