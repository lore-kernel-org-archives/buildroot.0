Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB7C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A613E83EE5;
	Sun, 24 Jul 2022 23:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A613E83EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLRyOxsvGVIA; Sun, 24 Jul 2022 23:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1DC383E32;
	Sun, 24 Jul 2022 23:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DC383E32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E97291BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA95611E3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA95611E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgQXek16c8sr for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E1D1611C3
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E1D1611C3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:50:26 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d10so8966146pfd.9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Ht2Zbh+wJeHpjadMrn3Q7kYsEr47PmqQDyCwEcl1og=;
 b=meB1BiO1dtZbH8tYjhb7Hpyrsct6C8bTypWEzOkLXQaAjKFBK45cNOtAZyiptHEvg4
 O5WVfSO/FPaOk78GtzvWPTsJpMqR4zqCsxEXMsixKCtshWQZjB67Hhh8vGQJojmYsRAX
 VV9lVnC+oXxHTrKwFj6tkfPtmAgCNLCAwyNlVAMvnOVe4Z3vtGn84jHaeKgm3ZHe6V7y
 9/Pz2ZxTlewU7LQvkv1Dy0Aq5zlDpcLA+ScpSCInpUCKu877aBbE5Hb+mekPnc65Y1po
 8SxLP3MtUMOdi2/Vz8tJKdre8unO5mUj+z0w+/RiiQOFMB8JGSW+MT1++RaqUjbAnIaM
 hZlQ==
X-Gm-Message-State: AJIora8zFeEcr+S/fp5NUyulf9OmKxuChIj6OL0ejZsNF/5dr24I07om
 M8Uf2wTIpcHqQcHXALDsIvE+npZMZ4UOTQ==
X-Google-Smtp-Source: AGRyM1ucuRsNlSqoC0HV2Yy3IzfUQHmInhTYiPbfUjfOBNabqoHOEUQmdV4FSBZapwxzFACe4rRiiQ==
X-Received: by 2002:a63:1f61:0:b0:41a:8b08:2a1d with SMTP id
 q33-20020a631f61000000b0041a8b082a1dmr8714115pgm.301.1658706625513; 
 Sun, 24 Jul 2022 16:50:25 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 h13-20020a170902680d00b00168c52319c3sm7810046plk.149.2022.07.24.16.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:50:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 16:50:23 -0700
Message-Id: <20220724235023.677747-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/brfmcmac_sdio-firmware-rpi: support
 riscv architecture
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These firmware files are also applicable to some Riscv hosts.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/brcmfmac_sdio-firmware-rpi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/brcmfmac_sdio-firmware-rpi/Config.in b/package/brcmfmac_sdio-firmware-rpi/Config.in
index 73f400a2b7..a408c19601 100644
--- a/package/brcmfmac_sdio-firmware-rpi/Config.in
+++ b/package/brcmfmac_sdio-firmware-rpi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
 	bool "brcmfmac-sdio-firmware-rpi"
-	depends on BR2_arm || BR2_aarch64
+	depends on BR2_arm || BR2_aarch64 || BR2_riscv
 	help
 	  Raspberry Broadcom Bluetooth and Wifi firmware.
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
