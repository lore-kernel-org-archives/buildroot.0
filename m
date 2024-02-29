Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1107C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 05:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63954416CD;
	Thu, 29 Feb 2024 05:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Spy_BKBzdQZ5; Thu, 29 Feb 2024 05:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642AD41749
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 642AD41749;
	Thu, 29 Feb 2024 05:23:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C93321BF420
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 05:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6372401B2
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 05:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rjDUKENLG9O for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 05:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=nisargjhaveri@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 829C4400FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829C4400FD
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 829C4400FD
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 05:23:45 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1dbd32cff0bso5561295ad.0
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709184224; x=1709789024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csZXN4B2xUo8wkeDSa2t3JCSUGFst1peu+WLpDgwZvM=;
 b=lZSvi5Sncv7pN9bEYuxO8BUF448WPULzoWrHZ2zTNlSPNmbE55NJ2ud+hOWoyStXBx
 3EPdkfUitrHcF1VcefipcXCuhkt7nfypasa6r+SaKucZqzqPdMM3X30dQzFWpcMT+3L3
 65F3IPqghs1babAKyIM9Hz/HPLvnDJRbPZOMsiIwrbs568XCtfhnXTzvjSSQ7n2HxCIN
 RV1ODYubVTvllH1nXbyt5LxF2569gUATxQMJlOQDe0C4yZXMM+kOo9mcGyrPUtlTmd3c
 ziiUNbBKWHLhd8UU7c5/TM3P51BTsOUN50BsH2Gz8OrtNPiv1ddeggqLKWc5fFEY3SN2
 SQ+g==
X-Gm-Message-State: AOJu0YymNzpfagsqMZp/RethMWHHkCeRv1HhUdf7h+hNsXCTNbZWN81d
 9NiVf3+0WneWqrY9cQd32gMjIP4sqD1T0rpQh7r4fS8J0MCzqgRDXtWeVXcTh1g=
X-Google-Smtp-Source: AGHT+IHJdMqUvs33CBRcNi174eajy06AyiRUU1jiKKuk8eH6F0HllbgkqGHXi9GkQ6gVf51LgRDzAQ==
X-Received: by 2002:a17:902:ce8d:b0:1dc:6cda:bcd2 with SMTP id
 f13-20020a170902ce8d00b001dc6cdabcd2mr1098432plg.34.1709184223901; 
 Wed, 28 Feb 2024 21:23:43 -0800 (PST)
Received: from nisarg-macbook.corp.microsoft.com ([49.37.178.42])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170902c3cc00b001dca9a6fdf1sm391488plj.183.2024.02.28.21.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 21:23:43 -0800 (PST)
From: Nisarg Jhaveri <nisargjhaveri@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 10:52:36 +0530
Message-Id: <20240229052236.50171-1-nisargjhaveri@gmail.com>
X-Mailer: git-send-email 2.38.1.vfs.0.0
In-Reply-To: <CANsE+Wd-NkLvVgKnNugSNqTYE8HNkO0yOLjpqKsnFt4t-aZ6LA@mail.gmail.com>
References: <CANsE+Wd-NkLvVgKnNugSNqTYE8HNkO0yOLjpqKsnFt4t-aZ6LA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709184224; x=1709789024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csZXN4B2xUo8wkeDSa2t3JCSUGFst1peu+WLpDgwZvM=;
 b=XzBDzbg2nYVMUSoveXCsXiMoryptpCOfJvc1IA2+kfMuM/mmYpc9In3fzg2ofiPaQC
 QlorMPQV1NaC+hiyyWHQJ6u2iMvVrdIrKkYmQM31rT5av9DfGmzX9RAOYLIukwY7owRB
 TG2vxNX4PZ/3ThARs7nQOTRpd+0OIOT5HuUPiJEclpzrHD4URge0vnr0jiJ4qiUiTJ0Q
 80++oQfp41HmARNs+yJVBzFcOJ0vGuXGjybWSm7EJ2RKU52rS+Hn9Q26lj7ZPLurefpa
 IHRNgH1uG6wbPhRD2yhTPwJDLOhS8ReU4jkwzgWNgAixsO+ON55JcXZHuV9CTCTRvjJt
 TMdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XzBDzbg2
Subject: [Buildroot] [PATCH v3 1/1] package/brcmfmac_sdio-firmware-rpi: bump
 version to 26ff205
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
Cc: Martin Bark <martin@barkynet.com>, Nisarg Jhaveri <nisargjhaveri@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current version is more than 2 years old. Update to the latest.
A lot of the files are symlinked. Instead of individually restoring the links, using `cp --remove-destination --no-dereference` and `chmod` instead of `install`.

Signed-off-by: Nisarg Jhaveri <nisargjhaveri@gmail.com>
---
Changes v2 -> v3:
  - Attempt to fix patch formatting

Changes v1 -> v2:
  - Attempt to fix patch formatting

---
 .../brcmfmac_sdio-firmware-rpi.hash           |  4 +--
 .../brcmfmac_sdio-firmware-rpi.mk             | 27 +++++++------------
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
index a12e92cbac..aa1043518b 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  brcmfmac_sdio-firmware-rpi-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
-sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
+sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
+sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  LICENCE
diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
index 5332bf53d7..7860de3ef7 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -4,33 +4,26 @@
 #
 ################################################################################
 
-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 26ff205b45dc109b498a70aaf182804ad9dbfea5
 BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
 BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
-BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENCE
 
 ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)
 define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
-	$(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $(TARGET_DIR)/lib/firmware/synaptics
+	cp --remove-destination --no-dereference $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+	cp --remove-destination --no-dereference $(@D)/firmware/synaptics/*.hcd $(TARGET_DIR)/lib/firmware/synaptics
+	chmod 644 $(TARGET_DIR)/lib/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/synaptics/*.hcd
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)
 define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
-	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
-	ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
-	ln -sf ../cypress/cyfmac43430-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob
-	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
-	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt
-	ln -sf ../cypress/cyfmac43455-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.bin
-	ln -sf ../cypress/cyfmac43455-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob
-	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
-	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
-	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypress
-	$(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $(TARGET_DIR)/lib/firmware/cypress
+	cp --remove-destination --no-dereference $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
+	cp --remove-destination --no-dereference $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
+	chmod 644 $(TARGET_DIR)/lib/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/cypress/cyfmac*
 endef
 endif
 
-- 
2.38.1.vfs.0.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
