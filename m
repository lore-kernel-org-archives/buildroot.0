Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46B5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75CDC60F5A
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75CDC60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 242D440423;
	Wed, 27 Oct 2021 19:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhxD-ZGBFy9A; Wed, 27 Oct 2021 19:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E7AF4015E;
	Wed, 27 Oct 2021 19:23:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E67BA1BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA9B76063B
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbS52BLT8bjU for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:23:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1936605EF
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:23:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso6289976wmc.4
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5yOUdo/TW95lknRFoPaQFw7qnI8nIPsImEdjJHeXf/4=;
 b=bczqrs0J3vDHYkl6LuVtKp+jwNq8pcJQ4zlALrAtiyfvSfwqO54R3Eybxmvp/DkJbN
 8z8V5qfytPj+drOXnPAJXijL8Yw8DEmrUg/+pqPzdeylc3oSxfHcqN56tTgZH4trfMnv
 ZnojGe9WLI6O3BqLt8bV11TvlQT88vgwmH/xO8auJzskZo3ghnHAenOyAusl+8D51HxD
 h/XI+P8Z/oSFNXySSFxS4tLqKN2T3Rtn3W+TXgTvgKjh51TX+WNjtEYoDEcuABiSDuv3
 NCHbUim4swkN4t/Zbx8fduWANOHmF9vC3deHazFtvQcy7ZR5p8bFSzbHgFzymrlyN/Qd
 eu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5yOUdo/TW95lknRFoPaQFw7qnI8nIPsImEdjJHeXf/4=;
 b=hg8gS7w7zKbhJzsWqcR9pgP5HUSe0ZFkOt6b8baNIgiZNgBrwb2skoatM/vD3zB2M+
 F9tftOTM+lJhqkD3LTyTyIrGxf40vs+I1WFsQHVugQktHsSNNqZIGko/3IeDVc7w7XID
 Grtd5SCPKeGhVEo0IMdxnj4SYbFVHuqly81u5OkUj25hey2k1QZxGRoBeyKdVhXAw1EP
 2TKee5tP1VNISE6h3CiRKjPxfpXclHZkWpYsMLeB4/xeZ7KYwvm1/r0WzfSu+QzPk1aO
 6w+MjuEBWU7Mg0hOxyOPfcia9vLXQArMQEVqcxRE1RYD50hhs/lXc8XPOEFR1iFMh7Eb
 qKsQ==
X-Gm-Message-State: AOAM532VY2df7KrQQPRmjqDMGPbUITcsXrZtq9UtH9duF0t6E9hXamoJ
 YlaRu2o2qOPAxLgphAKXB+Tmq6yutmU=
X-Google-Smtp-Source: ABdhPJx2GKK/w5c3ep8M9A/51PNYSnBFwamK7Dcuk887fefVt3ze1VTTECjWuei4ydDCuSLKmfqpLA==
X-Received: by 2002:a05:600c:5117:: with SMTP id
 o23mr7548860wms.81.1635362607915; 
 Wed, 27 Oct 2021 12:23:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c7sm742966wrp.51.2021.10.27.12.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 12:23:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:21:53 +0200
Message-Id: <20211027192153.415049-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: fix
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the rework of boot/config
file handling in commit 689b9ac439ab7b507c8982b6102bddf59d03efbf (fix
made in b8c8fcee7a38558a7247ef772ac9d93ff87bd943 was incomplete):

/usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-0/output-1/build/rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342/boot/fixupx.dat': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/c91224af44327a301f87f239a73721173b81ce16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 9d73d5300c..3a4741a0ff 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -13,7 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
 RPI_FIRMWARE_FILES = \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
-	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixupx.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), start_x.elf fixup_x.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
