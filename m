Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA9DC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6765A84DA6;
	Fri, 28 Mar 2025 18:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6I7RSbRAd1X0; Fri, 28 Mar 2025 18:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B334184DB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B334184DB8;
	Fri, 28 Mar 2025 18:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64F541B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 539CB85930
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vV5xWoDdX0bS for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15F4184DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15F4184DA6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15F4184DA6
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43ce4e47a85so2991035e9.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185080; x=1743789880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WSs1vQv5JZZ305qkWFp4dRL0qvYxF7MWsWpe4rgaLVU=;
 b=vSsLwci7IjoKTylz7Tq4BYamzhhoLhOVgRmBa4bDn+3S2Eut+tRKvL192rd0v5PiNw
 ArpqL2ZuMPDvFbzSZLDylrwHGbfVJaQNAngLgEPMsHFPCf9zOHshEEeoIbZTRETXK8LL
 40TbHKPDH8ngcYZTFS4ut6j3KZOGjPEKnIMsMAulw9tQyFAS5c7/r5DQkKvJseK8DTLB
 YKizkz0zQ7MgHGTZE3mGPTtTc6wd278gR1NyOrwTc9vaUMZ+1Gwrqrj5D66AfSbpkT+h
 xX3R56dJ6tSERFNgJ0jSOt4Migm3TIhAXT0rn2/Nz353tAvo7OxFKfljtV4V5Ej+FdqW
 p1QQ==
X-Gm-Message-State: AOJu0YxP/0faPlDfxAp9GOLchhpgTl6hFC7OoG1kGmc8civzIGNIyMli
 CH+7PZDqB7MQWioxRHRiULXQ7kl92vixHCEjCyJ3YI4M/SfgcyhM3pubT2hO
X-Gm-Gg: ASbGncvP77zbVeoCferwmMuzrp4iRXF1GV+XlfV/OoGc0fv/t7Lnb+Gteyid24kP7S6
 iqaOJf+uGrocmHS89TjUX+loF+fPGzLeTbQC/lFf93CIwTDXTQWJzPEv5QJULg8OpaTrjKsEsS9
 +/z6aVyLBhv5l+HIQ4jzMJD53jlPhiO9DDLUZextW1DAlDGadH5S+0qYBxBnoVryOoiAF/kfReF
 r+TF84ZRW79GsAdOsj59WBq/6pGSfzCXy0w8b40QL8BNTevRcMfQ+6kNSJAhAJbbUPX6ywbEmc/
 oYMvUlFyeGAm/23cxF5iqnXgI84KvHWfd4Q6zQ==
X-Google-Smtp-Source: AGHT+IEFTVjysnh+1eD8Kk5JEArAcVdLW+fSgr4L7mD8JMFAzHmpLrFnlozisYaQUvw/yFD0ksB+ng==
X-Received: by 2002:a05:600c:1d8f:b0:439:9a5a:d3bb with SMTP id
 5b1f17b1804b1-43db61d936emr2073425e9.2.1743185080186; 
 Fri, 28 Mar 2025 11:04:40 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:38 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:12 +0200
Message-ID: <20250328180427.3434693-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185080; x=1743789880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WSs1vQv5JZZ305qkWFp4dRL0qvYxF7MWsWpe4rgaLVU=;
 b=QemOSXbe0fDSKMNqSdekQtj8IqQDjtYT7JdTOHNEVcTdPz5JoTCR0GVi3WbTyHM7+Y
 yJOWDOk4Cj4G5ow6wFF8zyVYc9twkCiE8HXdJmEHtyV12g5sicB7QxE31SnR0tMsvRgX
 L3oNcA2FqDhygIo7WfWZNnBSzw+UWO+bWf4hgfbuR6ze+JLxDbn88bRhG8SqUjd+k/uj
 icYmmuYPQ2KXbrLFknygc30Po09plmljDwnmQkNyUPTPjX0TqGY2/BVzBb/HN4NNVtew
 9rOJvUDz74CnW+RrBxqkduqjFxMJuUsQi912tJWwFuPhBFFs4prySqt/dwymBTkcjFuf
 7o3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QemOSXbe
Subject: [Buildroot] [PATCH v2 04/18] package/qoriq-cadence-dp-firmware:
 sync with NXP Yocto download site
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The updated download path was taken from the Yocto BSP at
https://github.com/nxp-qoriq/yocto-sdk.

The recipe is here:
https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/dp-firmware-cadence/dp-firmware-cadence_22.04.bb

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: none

 .../qoriq-cadence-dp-firmware.hash                     |  2 +-
 .../qoriq-cadence-dp-firmware.mk                       | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index 6e5c761463d9..eb6579b919c9 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e267655a47fbe118f6960bca7994bd6b8986ef955344fe006a424be96f868602  firmware-cadence-lsdk2012.bin
+sha256  65f829a9e2597bffc58a680aaefa638122144a083633d1ae09b3aec1d9f8ab84  firmware-imx-8.16.bin
 sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
 sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
 sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 4f75287269a3..04e3a2a6d9ee 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk2012
-QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
-QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = 8.16
+QORIQ_CADENCE_DP_FIRMWARE_SITE = https://www.nxp.com/lgfiles/NMG/MAD/YOCTO
+QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-imx-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING EULA EULA.txt
 QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
@@ -20,11 +20,11 @@ define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/hdmi/cadence/dp_ls1028a.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
 endef
 
 define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/firmware/hdmi/cadence/dp_ls1028a.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
