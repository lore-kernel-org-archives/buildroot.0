Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B70C282D2
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B665C605C9;
	Sun,  2 Mar 2025 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCW4eqXRlbPB; Sun,  2 Mar 2025 21:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D98060725
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D98060725;
	Sun,  2 Mar 2025 21:52:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 307A0958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EF44408C3
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sl7SHj3Y6sgg for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D03B4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D03B4022B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D03B4022B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390e9e44807so268385f8f.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952358; x=1741557158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AE3lv+rr2Owb/oqkrDUfeQTRif02tHWEJHG1AWOWFoY=;
 b=MuBS1eAGUHrfu9UNT/kcHGJPWlr4i3xnGdZljjcdYtiq1w3MMRe5vnTEEO8vwXJe1n
 Ibw8SRU76ZCUnK5gCjeJFf5q6R8ii4EEZhH6XpUV7frNc1o4uDutWJqKX4UFoxpoWY7w
 lA5nEaqNO7tfVetT+YXl7gPCnuF+Rrv9v/1DZN0YYoLKQw1raoME8VGNynhm+BaavJ5j
 m0KKS1D/pHhgapPFIKnWEn90a38jUZGA2bRaAjkU9I9ltxJTnRBvezadpWrTv421Kzq9
 /jX9WbB7dx/soc4Hr0I/pKpB7CJKMF7SiJRcG1v8IvVgPZs26yxUdbQzVfGT8ut/ShJT
 5W0Q==
X-Gm-Message-State: AOJu0YyBc6TtRghotCNCpivRxZADFcnUTQ8w2MO40rYkJR6ZDfO5yKsy
 SghZ0dwtfFxaIB12BPSsjb3z8jW3Jfh9eug394aaF4lMJlnxzgWig7BmJ5y6
X-Gm-Gg: ASbGncu1dM/tJRD8KFDghT1RE1s1Z18VjBTw8bK+I+1qaQDQJ0wzyhZdPv6e9A8uNt4
 H/o8IbPoXsSAD8Dc5LTqflOrDEO+UZemtscVyL2+q0XH9yV/wojHLv3YzMDRpcNTMWjKdwWqWZ/
 /OvRidfL0vU+ZnRZk4GMcMmZgdLzM7zz84b5KXR8BCPi45LAfudhO0CmN0CjVDeyvDy+tPJRyaZ
 OseKIrqIVvfQNDwDXXGVUwvT7+RNe/exmbBuo6kUPnwZYZzEwPIAUCaOHsfgEzXeXhX9GPOBfbo
 ly0TjFZTEKWUSq0LeQDUwhK4QCV/dSJXOkHU5Q==
X-Google-Smtp-Source: AGHT+IHG2Qbumzw2TOeML8rkAMwvy+hwxlkc+4ZcK5EPVEAvJrZApYtV5bRCJpMuR8RS1nLPAE8bEg==
X-Received: by 2002:a05:600c:4451:b0:439:94f8:fc74 with SMTP id
 5b1f17b1804b1-43ba665f7dbmr35081895e9.0.1740952357746; 
 Sun, 02 Mar 2025 13:52:37 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:36 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:06 +0200
Message-ID: <20250302215219.1276480-3-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952358; x=1741557158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AE3lv+rr2Owb/oqkrDUfeQTRif02tHWEJHG1AWOWFoY=;
 b=KOZ1wT83aFHd+UTjaPnZB+OykEVngskBAGNKf9JHokXrcFeYOutJJM1YAaqXm2Mker
 dFGPzC9YykdWMtdEqqTaXp2sMW/dVDtWX32YN4+aGTwfzDTQwWNHHfM2c6nQyafvM2/i
 yX96LO+hq17ZpjAR2EZI2qY3NsUk1B9wOjsi7HPqPaPZJZ9oAqjSUMjLjIFDSoiutcYr
 60m99M64gH5Z/uzBjxp+mlE4CSdr+dMGKQamfeFxnNDLDzJbe+ADFA9u12gy1uMWmvFy
 c1/4Z/xfBf9QQ188yNNzJyI8ZdjX5ptrt0idA0sQqzSSdQM84nwhmRPFZuetekIxQnBP
 C6YQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KOZ1wT83
Subject: [Buildroot] [PATCH 02/15] package/qoriq-cadence-dp-firmware: sync
 with NXP Yocto download site
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
Change log:
- Break out DP firmware changes out of larger "[PATCH v2 01/11]
  platform/layerscape: bump Linux Factory tag to lf-6.6.36-2.1.0" patch

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
